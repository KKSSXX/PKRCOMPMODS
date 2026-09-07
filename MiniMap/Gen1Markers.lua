return function(mod, api)
  if mod._mm_gen1_markers then return end
  mod._mm_gen1_markers = true
  if not api then return end

  api.registerProvider(function(game, mapId)
    if not game or not mapId then return {} end
    if game.world and type(game.world.startBattle) == "function" then return {} end
    local ow = game.overworld
    local def = ow and ow.map and ow.map.def
    if type(def) ~= "table" or type(def.objects) ~= "table" then return {} end
    local out = {}
    for i, o in ipairs(def.objects) do
      if type(o) == "table" and o.x ~= nil and o.y ~= nil then
        local kind = "npc"
        if o.item or o.itemId then kind = "item" end
        if o.trainer or o.trainerClass or o.class then kind = "trainer" end
        if o.hidden or o.hiddenItem then kind = "hidden" end
        out[#out + 1] = {
          id = "gen1:def:" .. tostring(mapId) .. ":" .. tostring(o.index or i),
          mapId = mapId, x = o.x, y = o.y, kind = kind, gen = 1,
          source = "gen1.def.objects",
        }
      end
    end
    return out
  end)

  api.registerProvider(function(game, mapId)
    if not game or not mapId then return {} end
    if game.world and type(game.world.startBattle) == "function" then return {} end
    local ow = game.overworld
    if not ow then return {} end
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
        id = "gen1:live:" .. key,
        mapId = mapId, x = x, y = y, kind = kind, gen = 1, source = "gen1.live",
      }
    end
    if type(ow.npcs) == "table" then
      for _, n in ipairs(ow.npcs) do consider(n, "npc") end
    end
    if type(ow.entities) == "table" then
      for _, e in ipairs(ow.entities) do consider(e, "ent") end
    end
    return out
  end)
end
