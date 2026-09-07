return function(mod, api)
  if mod._mm_gen2_markers then return end
  mod._mm_gen2_markers = true
  if not api then return end

  api.registerProvider(function(game, mapId)
    if not game or not mapId then return {} end
    if not (game.world and type(game.world.startBattle) == "function") then return {} end
    local world = game.world
    local def = world.map and world.map.def
    if type(def) ~= "table" or type(def.objects) ~= "table" then return {} end
    local out = {}
    for i, o in ipairs(def.objects) do
      if type(o) == "table" and o.x ~= nil and o.y ~= nil then
        local kind = "npc"
        if o.item or o.itemId then kind = "item" end
        if o.trainer or o.trainerClass or o.class then kind = "trainer" end
        if o.hidden or o.hiddenItem then kind = "hidden" end
        if o.fruit or o.fruitTree or o.berry then kind = "item" end
        out[#out + 1] = {
          id = "gen2:def:" .. tostring(mapId) .. ":" .. tostring(o.index or i),
          mapId = mapId, x = o.x, y = o.y, kind = kind, gen = 2,
          source = "gen2.def.objects",
        }
      end
    end
    return out
  end)

  api.registerProvider(function(game, mapId)
    if not game or not mapId then return {} end
    if not (game.world and type(game.world.startBattle) == "function") then return {} end
    local world = game.world
    local out, seen = {}, {}
    local function consider(e, prefix)
      if type(e) ~= "table" then return end
      if e.hidden or e.removed or e.despawned then return end
      local x, y = tonumber(e.cellX), tonumber(e.cellY)
      if not x or not y then
        if type(e.def) == "table" then
          x, y = tonumber(e.def.x), tonumber(e.def.y)
        end
      end
      if not x or not y then return end
      local id = e.id or (e.def and e.def.index) or (x .. ":" .. y)
      local key = prefix .. ":" .. tostring(id)
      if seen[key] then return end
      seen[key] = true
      local kind = "npc"
      if e.item or (e.def and e.def.item) then kind = "item" end
      if e.trainer or e.trainerClass or (e.def and (e.def.trainer or e.def.class)) then
        kind = "trainer"
      end
      out[#out + 1] = {
        id = "gen2:live:" .. key,
        mapId = mapId, x = x, y = y, kind = kind, gen = 2, source = "gen2.live",
      }
    end
    for _, key in ipairs({ "npcs", "objects", "people", "entities" }) do
      local t = world[key]
      if type(t) == "table" then
        for _, e in ipairs(t) do consider(e, key) end
      end
    end
    return out
  end)

  api.registerProvider(function(game, mapId)
    if not game or not mapId then return {} end
    if not (game.world and type(game.world.startBattle) == "function") then return {} end
    local world = game.world
    local out = {}
    local def = world.map and world.map.def
    if type(def) == "table" and type(def.fruitTrees) == "table" then
      for i, t in ipairs(def.fruitTrees) do
        if type(t) == "table" then
          local x = tonumber(t.x or t[1])
          local y = tonumber(t.y or t[2])
          if x and y then
            out[#out + 1] = {
              id = "gen2:fruit:" .. tostring(mapId) .. ":" .. tostring(t.id or i),
              mapId = mapId, x = x, y = y, kind = "item", gen = 2, source = "gen2.fruit",
            }
          end
        end
      end
    end
    return out
  end)
end
