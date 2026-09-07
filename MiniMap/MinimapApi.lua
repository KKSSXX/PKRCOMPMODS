return function(mod)
  if mod._minimap_api_v1 then return mod.minimapApi end
  mod._minimap_api_v1 = true

  local static = {}
  local providers = {}

  local function norm_map(id)
    if id == nil then return nil end
    return tostring(id):upper():gsub("%s+", "_")
  end

  local function valid_kind(k)
    k = tostring(k or "npc"):lower()
    if k == "item" or k == "hidden" or k == "trainer" or k == "gift_npc"
        or k == "npc" or k == "object" or k == "cut" then
      return k
    end
    return "npc"
  end

  local function normalize(m)
    if type(m) ~= "table" then return nil end
    local x = tonumber(m.x or m.cellX or m.cx)
    local y = tonumber(m.y or m.cellY or m.cy)
    if not x or not y then return nil end
    local id = m.id or m.key
    if id == nil then
      id = string.format("mm:%s:%s:%s", tostring(m.mapId or "?"), x, y)
    end
    return {
      id = tostring(id),
      mapId = norm_map(m.mapId or m.map),
      x = x,
      y = y,
      kind = valid_kind(m.kind or m.type or m.kindHint),
      color = m.color,
      label = m.label or m.name,
      gen = m.gen,
      source = m.source or "minimap_api",
    }
  end

  local api = {}

  function api.registerMarker(marker)
    local m = normalize(marker)
    if not m then return false end
    static[m.id] = m
    return true
  end

  function api.unregisterMarker(id)
    if id == nil then return false end
    static[tostring(id)] = nil
    return true
  end

  function api.clearMarkers(prefix)
    if prefix then
      prefix = tostring(prefix)
      for id in pairs(static) do
        if id:sub(1, #prefix) == prefix then static[id] = nil end
      end
    else
      static = {}
    end
  end

  function api.registerProvider(fn)
    if type(fn) ~= "function" then return nil end
    providers[#providers + 1] = fn
    return #providers
  end

  function api.unregisterProvider(index)
    if type(index) == "number" and providers[index] then
      table.remove(providers, index)
      return true
    end
    return false
  end

  function api.invalidate()
    if mod._minimapMarkerCache then mod._minimapMarkerCache = {} end
  end

  function api.toObject(m)
    return {
      cellX = m.x,
      cellY = m.y,
      id = m.id,
      kindHint = m.kind,
      isHiddenItem = (m.kind == "hidden"),
      apiMarker = true,
      minimapKind = m.kind,
      minimapColor = m.color,
      minimapLabel = m.label,
      def = {
        x = m.x,
        y = m.y,
        index = m.id,
        sprite = (m.kind == "item" or m.kind == "hidden") and "SPRITE_POKE_BALL" or nil,
      },
      source = m.source,
    }
  end

  function api.collect(game, mapId)
    mapId = norm_map(mapId)
    if not mapId then return {} end
    local gen = 1
    if game and game.world and type(game.world.startBattle) == "function" then
      gen = 2
    else
      local v = game and (game.version or game.gameVersion)
      if type(v) == "string" then
        local l = v:lower()
        if l:find("gold") or l:find("silver") or l:find("crystal") then gen = 2 end
      end
    end

    local out, seen = {}, {}
    local function add(m)
      m = normalize(m)
      if not m then return end
      if m.mapId and m.mapId ~= mapId then return end
      if m.gen and m.gen ~= gen then return end
      if seen[m.id] then return end
      seen[m.id] = true
      out[#out + 1] = api.toObject(m)
    end

    for _, m in pairs(static) do add(m) end
    for _, fn in ipairs(providers) do
      local ok, list = pcall(fn, game, mapId)
      if ok and type(list) == "table" then
        for i = 1, #list do add(list[i]) end
      end
    end
    return out
  end

  pcall(function()
    local Runtime = require("src.mods.Runtime")
    local function bump()
      api.invalidate()
    end
    if type(Runtime.on) == "function" then
      pcall(function() Runtime.on("world.npc_spawned", bump) end)
      pcall(function() Runtime.on("flag.changed", bump) end)
      pcall(function() Runtime.on("world.map_changed", bump) end)
      pcall(function() Runtime.on("world.map_entered", bump) end)
    end
  end)

  mod.minimapApi = api
  if type(mod.exports) == "table" then
    mod.exports.minimapApi = api
  end
  return api
end
