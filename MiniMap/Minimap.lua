-- MiniMap for gen1recomp / gen2recomp
-- blue = trades & gift npcs (LOLA, DUX, Berry Man, Bike Shop…), green = balls/berries, red = trainers
-- tested on Cherrygrove nite + Route 30 berry house; keep GSC imageFor for TOD colors
return function(mod)
  mod.options:define({
    {
      key = "minimap",
      label = "MINIMAP",
      type = "choice",
      default = "top_left",
      choices = {
        { "OFF", "off" },
        { "TOP LEFT", "top_left" },
        { "TOP RIGHT", "top_right" },
        { "BOTTOM LEFT", "bottom_left" },
        { "BOTTOM RIGHT", "bottom_right" },
      },
    },
    {
      key = "minimap_zoom",
      label = "MAP ZOOM",
      type = "choice",
      default = "0",
      choices = {
        { "-10", "-10" }, { "-9", "-9" }, { "-8", "-8" }, { "-7", "-7" },
        { "-6", "-6" }, { "-5", "-5" }, { "-4", "-4" }, { "-3", "-3" },
        { "-2", "-2" }, { "-1", "-1" }, { "0", "0" },
        { "1", "1" }, { "2", "2" }, { "3", "3" }, { "4", "4" }, { "5", "5" },
        { "6", "6" }, { "7", "7" }, { "8", "8" }, { "9", "9" }, { "10", "10" },
      },
    },
    {
      key = "show_markers",
      label = "MARKERS",
      type = "choice",
      default = "all",
      choices = {
        { "NONE", "off" },
        { "ITEMS", "items" },
        { "HIDDEN ITEMS", "hidden" },
        { "ITEMS AND HIDDEN ITEMS", "items_hidden" },
        { "NPC ITEMS", "npc_items" },
        { "NPC EXTRA", "npc_extra" },
        { "NPC ALL", "npc_all" },
        { "TRAINERS", "trainers" },
        { "ALL", "all" },
      },
    },
    {
      key = "color_items",
      label = "COLOR ITEMS",
      type = "choice",
      default = "green",
      choices = {
        { "GREEN", "green" }, { "LIME", "lime" }, { "CYAN", "cyan" },
        { "BLUE", "blue" }, { "PURPLE", "purple" }, { "MAGENTA", "magenta" },
        { "RED", "red" }, { "ORANGE", "orange" }, { "YELLOW", "yellow" },
        { "WHITE", "white" },
      },
    },
    {
      key = "color_hidden",
      label = "COLOR HIDDEN",
      type = "choice",
      default = "lime",
      choices = {
        { "GREEN", "green" }, { "LIME", "lime" }, { "CYAN", "cyan" },
        { "BLUE", "blue" }, { "PURPLE", "purple" }, { "MAGENTA", "magenta" },
        { "RED", "red" }, { "ORANGE", "orange" }, { "YELLOW", "yellow" },
        { "WHITE", "white" },
      },
    },
    {
      key = "color_npc_items",
      label = "COLOR NPC ITEMS",
      type = "choice",
      default = "cyan",
      choices = {
        { "GREEN", "green" }, { "LIME", "lime" }, { "CYAN", "cyan" },
        { "BLUE", "blue" }, { "PURPLE", "purple" }, { "MAGENTA", "magenta" },
        { "RED", "red" }, { "ORANGE", "orange" }, { "YELLOW", "yellow" },
        { "WHITE", "white" },
      },
    },
    {
      key = "color_npc_extra",
      label = "COLOR NPC EXTRA",
      type = "choice",
      default = "blue",
      choices = {
        { "GREEN", "green" }, { "LIME", "lime" }, { "CYAN", "cyan" },
        { "BLUE", "blue" }, { "PURPLE", "purple" }, { "MAGENTA", "magenta" },
        { "RED", "red" }, { "ORANGE", "orange" }, { "YELLOW", "yellow" },
        { "WHITE", "white" },
      },
    },
    {
      key = "color_trainers",
      label = "COLOR TRAINERS",
      type = "choice",
      default = "red",
      choices = {
        { "GREEN", "green" }, { "LIME", "lime" }, { "CYAN", "cyan" },
        { "BLUE", "blue" }, { "PURPLE", "purple" }, { "MAGENTA", "magenta" },
        { "RED", "red" }, { "ORANGE", "orange" }, { "YELLOW", "yellow" },
        { "WHITE", "white" },
      },
    },
    {
      key = "color_pokemon",
      label = "COLOR POKEMON",
      type = "choice",
      default = "purple",
      choices = {
        { "GREEN", "green" }, { "LIME", "lime" }, { "CYAN", "cyan" },
        { "BLUE", "blue" }, { "PURPLE", "purple" }, { "MAGENTA", "magenta" },
        { "RED", "red" }, { "ORANGE", "orange" }, { "YELLOW", "yellow" },
        { "WHITE", "white" },
      },
    },
    {
      key = "color_berry",
      label = "COLOR BERRY",
      type = "choice",
      default = "green",
      choices = {
        { "GREEN", "green" }, { "LIME", "lime" }, { "CYAN", "cyan" },
        { "BLUE", "blue" }, { "PURPLE", "purple" }, { "MAGENTA", "magenta" },
        { "RED", "red" }, { "ORANGE", "orange" }, { "YELLOW", "yellow" },
        { "WHITE", "white" },
      },
    },
    {
      key = "minimap_bg_size",
      label = "MAP SIZE",
      type = "choice",
      default = "5",
      choices = {
        { "0", "0" }, { "1", "1" }, { "2", "2" }, { "3", "3" }, { "4", "4" },
        { "5", "5" }, { "6", "6" }, { "7", "7" }, { "8", "8" }, { "9", "9" },
        { "10", "10" },
      },
    },
    {
      key = "minimap_map_color",
      label = "MAP COLOR",
      type = "choice",
      default = "recomp",
      choices = {
        { "OG", "og" },
        { "GBC", "gbc" },
        { "RECOMP", "recomp" },
      },
    },
    {
      key = "minimap_colorblind",
      label = "COLORBLIND",
      type = "choice",
      default = "off",
      choices = {
        { "OFF", "off" },
        { "PROTAN", "protanopia" },
        { "DEUTAN", "deuteranopia" },
        { "TRITAN", "tritanopia" },
      },
    },
      {
      key = "show_info",
      label = "SHOW INFO",
      type = "choice",
      default = "both",
      choices = {
        { "OFF", "off" },
        { "LOCATION", "location" },
        { "POSITION", "position" },
        { "BOTH", "both" },
      },
    },
    {
      key = "hud_position",
      label = "HUD POSITION",
      type = "choice",
      default = "top_right",
      choices = {
        { "TOP LEFT", "top_left" },
        { "TOP RIGHT", "top_right" },
        { "BOTTOM LEFT", "bottom_left" },
        { "BOTTOM RIGHT", "bottom_right" },
      },
    },
  })
  mod._minimapOptionsDefined = true
  local MINIMAP_MODES = {
    { "off", "OFF" },
    { "top_left", "TOP LEFT" },
    { "top_right", "TOP RIGHT" },
    { "bottom_left", "BOTTOM LEFT" },
    { "bottom_right", "BOTTOM RIGHT" },
  }
  local function parseCorner(v)
    if v == "on" or v == true or v == "true" then
      return "top_left"
    end
    if v == "off" or v == false or v == "false" or v == nil then
      return v == "off" and "off" or nil
    end
    if v == "top_left" or v == "top_right" or v == "bottom_left" or v == "bottom_right" then
      return v
    end
    return "top_left"
  end
  local MINIMAP_ZOOMS = {
    { "-10", "-10" }, { "-9", "-9" }, { "-8", "-8" }, { "-7", "-7" },
    { "-6", "-6" }, { "-5", "-5" }, { "-4", "-4" }, { "-3", "-3" },
    { "-2", "-2" }, { "-1", "-1" }, { "0", "0" },
    { "1", "1" }, { "2", "2" }, { "3", "3" }, { "4", "4" }, { "5", "5" },
    { "6", "6" }, { "7", "7" }, { "8", "8" }, { "9", "9" }, { "10", "10" },
  }
  local MARKER_MODES = {
    { "off", "NONE" },
    { "items", "ITEMS" },
    { "hidden", "HIDDEN ITEMS" },
    { "items_hidden", "ITEMS AND HIDDEN ITEMS" },
    { "npc_items", "NPC ITEMS" },
    { "npc_extra", "NPC EXTRA" },
    { "npc_all", "NPC ALL" },
    { "trainers", "TRAINERS" },
    { "all", "ALL" },
  }
  local MARKER_MODES_GSC = {
    { "off", "NONE" },
    { "items", "ITEMS" },
    { "hidden", "HIDDEN ITEMS" },
    { "items_hidden", "ITEMS AND HIDDEN ITEMS" },
    { "npc_items", "NPC ITEMS" },
    { "npc_extra", "NPC EXTRA" },
    { "npc_all", "NPC ALL" },
    { "trainers", "TRAINERS" },
    { "berry", "BERRY BUSH" },
    { "all", "ALL" },
  }

  local MARKER_COLOR_LIST = {
    { "green", "GREEN" },
    { "lime", "LIME" },
    { "cyan", "CYAN" },
    { "blue", "BLUE" },
    { "purple", "PURPLE" },
    { "magenta", "MAGENTA" },
    { "red", "RED" },
    { "orange", "ORANGE" },
    { "yellow", "YELLOW" },
    { "white", "WHITE" },
  }
  -- FIX: markerRgb() (below) calls opt(), but opt() used to be declared
  -- ~117 lines further down. Lua resolves a name as an upvalue only if the
  -- local already exists earlier in the source -- since it didn't yet at
  -- this point, `opt` inside markerRgb was resolving to the GLOBAL `opt`
  -- (never set, so nil), throwing "attempt to call global 'opt' (a nil
  -- value)" every time markerRgb ran. That's why every "ALL" glow ring for
  -- items/trainers/npc items/trade/hidden items silently never drew: the
  -- draw pcall aborted before reaching drawGlow(). Forward-declaring it here
  -- and dropping the "local" on the real definition further down (so it
  -- assigns into this same upvalue instead of shadowing it) fixes that.
  local opt
  local setOpt
  local MARKER_RGB = {
    green = { 0.20, 0.95, 0.30 },
    lime = { 0.55, 1.0, 0.20 },
    cyan = { 0.15, 0.90, 1.0 },
    blue = { 0.15, 0.45, 1.0 },
    purple = { 0.70, 0.30, 1.0 },
    magenta = { 1.0, 0.25, 0.85 },
    red = { 1.0, 0.15, 0.15 },
    orange = { 1.0, 0.55, 0.12 },
    yellow = { 1.0, 0.90, 0.20 },
    white = { 0.95, 0.95, 0.98 },
  }
  local function markerRgb(game, key, fallbackName)
    local fb = fallbackName or "green"
    local name = fb
    local v = opt(game, key, fb)
    if type(v) == "string" then
      v = v:lower():gsub("%s+", "")
      if MARKER_RGB[v] then name = v end
    end
    local c = MARKER_RGB[name] or MARKER_RGB.green
    return c[1], c[2], c[3]
  end

  local MINIMAP_BG_SIZES = {
    { "0", "0" }, { "1", "1" }, { "2", "2" }, { "3", "3" }, { "4", "4" },
    { "5", "5" }, { "6", "6" }, { "7", "7" }, { "8", "8" }, { "9", "9" },
    { "10", "10" },
  }
  local MINIMAP_MAP_COLOR_MODES = {
    { "og", "OG" },
    { "gbc", "GBC" },
    { "recomp", "RECOMP" },
  }
  local MINIMAP_COLORBLIND_MODES = {
    { "off", "OFF" },
    { "protanopia", "PROTAN" },
    { "deuteranopia", "DEUTAN" },
    { "tritanopia", "TRITAN" },
  }
  -- 224 matches the old hud chrome width we used in v1
  local MINIMAP_BOX = 224
  local ZOOM_BASE_RADIUS = 12
  local function zoomCells(z, baseRadius)
    if type(z) == "string" then
      z = z:gsub("^%+", "")
      z = z:gsub("%s+", "")
    end
    z = tonumber(z) or 0
    if z > 10 then z = 10 end
    if z < -10 then z = -10 end
    local base = tonumber(baseRadius) or ZOOM_BASE_RADIUS
    if z == 0 then return base end
    if z > 0 then
      -- tighter
      return base + (1.0 - base) * (z / 10)
    end
    -- wider
    return base + (28.0 - base) * ((-z) / 10)
  end
  -- pret block = 2x2 metatiles; cell is one 16px step the player walks
  local BLOCK_PX = 32
  local TILE_PX = 8
  local CELL_PX = 16

  local function pal4(pal)
    if type(pal) ~= "table" then return nil end
    if type(pal.colors) == "table" then pal = pal.colors end
    local out = {}
    for i = 1, 4 do
      local c = pal[i]
      if type(c) ~= "table" then return nil end
      local r = tonumber(c[1] or c.r)
      local g = tonumber(c[2] or c.g)
      local b = tonumber(c[3] or c.b)
      if not (r and g and b) then return nil end
      local mx = math.max(r, g, b)
      if mx <= 1.001 then
        r = r * 255
        g = g * 255
        b = b * 255
      elseif mx <= 31.5 then
        local scale = 255 / 31
        r, g, b = r * scale, g * scale, b * scale
      end
      if r < 0 then r = 0 elseif r > 255 then r = 255 end
      if g < 0 then g = 0 elseif g > 255 then g = 255 end
      if b < 0 then b = 0 elseif b > 255 then b = 255 end
      out[i] = { r, g, b }
    end
    return out
  end

  -- "gold" here means any GSC build the recomp boots into
  local function genOf(game)
    local v
    if game and game.save then
      local s = game.save
      v = s.version or s.gameVersion or s.game
      if not v and s.meta then v = s.meta.version end
    end
    if not v and game then
      v = game.version or game.gameVersion or game.gameId
    end
    if not v and mod.world and type(mod.world.version) == "function" then
      local ok, vv = pcall(mod.world.version, mod.world)
      if ok then v = vv end
    end
    local s = tostring(v or ""):lower()
    if s:find("gold", 1, true) or s:find("silver", 1, true) or s:find("crystal", 1, true)
        or s == "gen2" or s == "gsc" then
      return "gold"
    end
    if s:find("yellow", 1, true) or s == "y" then return "yellow" end
    if s:find("blue", 1, true) or s == "b" then return "blue" end
    return "red"
  end
  -- Global mod preferences live in options.lua via mod.options (NOT the
  -- playthrough save). Keep a small in-memory fallback so F12 works before
  -- the options subsystem is ready, and mirror into game.save only as a
  -- secondary cache so older builds still pick the value up.
  local function bucket(game)
    if not game then return nil end
    game.save = game.save or {}
    local o = game.save.options
    if type(o) ~= "table" then
      o = {}
      game.save.options = o
    end
    o.modOptions = o.modOptions or {}
    o.modOptions[mod.id] = o.modOptions[mod.id] or {}
    return o.modOptions[mod.id]
  end
  function opt(game, key, fallback)
    local v = nil
    -- 1) live session value first (what F12/setOpt just wrote) so the menu
    --    updates immediately even if options.get still returns the old default
    if mod._mmOpts and mod._mmOpts[key] ~= nil then
      v = mod._mmOpts[key]
    end
    -- 2) official persisted options (options.lua)
    if v == nil and mod.options then
      if type(mod.options.get) == "function" then
        local ok, got = pcall(mod.options.get, mod.options, key)
        if ok and got ~= nil then v = got end
      end
      if v == nil and type(mod.options) == "table" and mod.options[key] ~= nil then
        v = mod.options[key]
      end
    end
    -- 3) legacy cache inside the playthrough save
    if v == nil then
      local b = bucket(game)
      if b and b[key] ~= nil then v = b[key] end
    end
    if key == "minimap_map_color" and genOf(game) == "gold" and v == "gbc" then
      v = "recomp"
      setOpt(game, key, v)
    end
    if v == nil then v = fallback end
    return v
  end
  function setOpt(game, key, value)
    mod._mmOpts = mod._mmOpts or {}
    mod._mmOpts[key] = value
    -- Persist into options.lua (several API shapes across engine builds)
    if mod.options then
      if type(mod.options.set) == "function" then
        pcall(mod.options.set, mod.options, key, value)
      end
      if type(mod.options) == "table" then
        pcall(function() mod.options[key] = value end)
      end
    end
    -- Mirror on the playthrough save
    local b = bucket(game)
    if b then
      b[key] = value
    end
  end

  local function mmBox(game)
    local v = tonumber(opt(game, "minimap_bg_size", "5")) or 5
    if v < 0 then v = 0 elseif v > 10 then v = 10 end
    -- 144..304 px
    return 144 + v * 16
  end

  local colorblindShader = nil
  local colorblindShaderTried = false
  local COLORBLIND_MODE_ID = { off = 0, protanopia = 1, deuteranopia = 2, tritanopia = 3 }
  local function loadCbShader()
    if colorblindShaderTried then return colorblindShader end
    colorblindShaderTried = true
    if not (love.graphics and love.graphics.newShader) then return nil end
    local ok, shader = pcall(love.graphics.newShader, [[
      extern int u_mode;
      vec4 effect(vec4 color, Image tex, vec2 texcoord, vec2 pixcoord) {
        vec4 px = Texel(tex, texcoord) * color;
        float r = px.r, g = px.g, b = px.b;
        vec3 outc = vec3(r, g, b);
        if (u_mode == 1) {
          // Protanopia
          outc = vec3(0.567*r + 0.433*g, 0.558*r + 0.442*g, 0.242*g + 0.758*b);
        } else if (u_mode == 2) {
          // Deuteranopia
          outc = vec3(0.625*r + 0.375*g, 0.70*r + 0.30*g, 0.30*g + 0.70*b);
        } else if (u_mode == 3) {
          // Tritanopia
          outc = vec3(0.95*r + 0.05*g, 0.433*g + 0.567*b, 0.475*g + 0.525*b);
        }
        return vec4(clamp(outc, 0.0, 1.0), px.a);
      }
    ]])
    if ok and shader then
      colorblindShader = shader
    else
      colorblindShader = nil
    end
    return colorblindShader
  end

  local function cbBegin(game)
    local mode = opt(game, "minimap_colorblind", "off")
    local modeId = COLORBLIND_MODE_ID[mode] or 0

    if modeId == 0 then
      return function() end
    end
    local shader = loadCbShader()
    if not shader then
      return function() end
    end
    local prevShader = love.graphics.getShader()
    pcall(function() shader:send("u_mode", modeId) end)
    love.graphics.setShader(shader)
    return function()
      love.graphics.setShader(prevShader)
    end
  end
  local function idxOf(list, value)
    if type(list) ~= "table" or #list < 1 then return 1 end
    local want = value
    if type(want) == "string" then want = want:lower():gsub("%s+", "") end
    for i, m in ipairs(list) do
      local a = m[1]
      if a == value then return i end
      if type(a) == "string" and type(want) == "string" then
        if a:lower():gsub("%s+", "") == want then return i end
      end
      if tostring(a) == tostring(value) then return i end
    end
    return 1
  end
  local function cycle(game, key, list, dir, fallback)
    if type(list) ~= "table" or #list < 1 then return false end
    local cur = idxOf(list, opt(game, key, fallback))
    local nextIdx = ((cur - 1 + (dir or 1)) % #list) + 1
    local entry = list[nextIdx]
    if type(entry) ~= "table" or entry[1] == nil then return false end
    setOpt(game, key, entry[1])
    return true
  end
  local function lbl(list, value, fallbackLabel)
    for _, m in ipairs(list) do
      if m[1] == value then
        return m[2]
      end
    end
    return fallbackLabel
  end
  local function isCancel(row)
    if not row then
      return false
    end
    if row.cancel == true or row.id == "cancel" then
      return true
    end
    local label = row.label
    return type(label) == "string" and label:upper() == "CANCEL"
  end
  local function isAnchor(row)
    if not row then
      return false
    end
    local id = row.id or row.key
    if id == "speedMenu" or id == "speedBattle" or id == "speedOverworld"
        or id == "speed" then
      return true
    end
    local label = row.label
    if type(label) == "string" then
      local u = label:upper()
      if u == "MENU SPEED" or u == "GAME SPEED" or u == "BATTLE SPEED"
          or u == "OVERWORLD SPEED" then
        return true
      end
    end
    return false
  end
  local function menuRow(id, label, key, list, fallback, game)
    return {
      id = id,
      label = label,
      value = function(g)
        return lbl(list, opt(g, key, fallback), list[1][2])
      end,
      step = function(g, dir)
        return cycle(g, key, list, dir, fallback)
      end,
      text = function()
        return lbl(list, opt(game, key, fallback), list[1][2])
      end,
      cycle = function(_options, delta, g)
        return cycle(g or game, key, list, delta, fallback)
      end,
    }
  end
  local function menuRows(game)
    local colorModes = MINIMAP_MAP_COLOR_MODES
    if genOf(game) == "gold" then
      colorModes = {
        { "og", "OG" },
        { "recomp", "RECOMP" },
      }
    end
    return {
      { id = "player_pos_hud_minimap", label = "MINIMAP", key = "minimap", list = MINIMAP_MODES, fallback = "top_left" },
      { id = "player_pos_hud_minimap_zoom", label = "MAP ZOOM", key = "minimap_zoom", list = MINIMAP_ZOOMS, fallback = "0" },
      { id = "player_pos_hud_bg_size", label = "MAP SIZE", key = "minimap_bg_size", list = MINIMAP_BG_SIZES, fallback = "5" },
      { id = "player_pos_hud_color_mode", label = "MAP COLOR", key = "minimap_map_color", list = colorModes, fallback = "recomp" },
      { id = "player_pos_hud_blindness", label = "COLORBLIND", key = "minimap_colorblind", list = MINIMAP_COLORBLIND_MODES, fallback = "off" },
      { id = "player_pos_hud_markers", label = "MARKERS", key = "show_markers",
        list = (genOf(game) == "gold") and MARKER_MODES_GSC or MARKER_MODES, fallback = "all" },
    }
  end
  -- Previously all minimap rows (including the newer color_* entries) were
  -- stripped out of the native options menu and only reachable via the F12
  -- overlay. That's what made the menu look out of sync with what F12 could
  -- actually do (e.g. "ITEMS AND HIDDEN ITEMS" plus its per-category colors
  -- had no matching entries in the real menu). Nothing is stripped anymore,
  -- so every option -- including the marker/glow-ring colors -- shows up in
  -- the game's normal Options screen.
  local STRIP_OPT_IDS = {}
  mod.hooks:wrap("ui.options.rows", function(nextFn, game, rows)
    rows = nextFn(game, rows)
    if type(rows) ~= "table" then return rows end
    local out = {}
    for _, row in ipairs(rows) do
      if not (row and row.id and STRIP_OPT_IDS[row.id]) then
        out[#out + 1] = row
      end
    end
    return out
  end)
  local function whereAmI(game)
    -- prefer mod.world:current when the recomp exposes it
    if mod.world and type(mod.world.current) == "function" then
      local ok, cur = pcall(function()
        return mod.world:current()
      end)
      if ok and type(cur) == "table" and cur.mapId then
        return cur.mapId, tonumber(cur.x) or 0, tonumber(cur.y) or 0
      end
    end
    local world = game and game.world
    if world and world.map and world.player then
      local p = world.player
      local map = world.map
      local mapId = map.id or map.mapId or (map.def and map.def.id)
      if mapId then
        return mapId, tonumber(p.cellX or p.x) or 0, tonumber(p.cellY or p.y) or 0
      end
    end
    local ow = game and game.overworld
    if ow and ow.map and ow.player then
      local p = ow.player
      local cx, cy
      if type(p.position) == "function" then
        cx, cy = p:position()
      else
        cx = p.cellX or p.x
        cy = p.cellY or p.y
      end
      local mapId = ow.map.id or ow.map.mapId
      if mapId then
        return mapId, tonumber(cx) or 0, tonumber(cy) or 0
      end
    end
    return nil, nil, nil
  end
  local FACING_TO_NESW = {
    up = "N",
    north = "N",
    down = "S",
    south = "S",
    left = "W",
    west = "W",
    right = "E",
    east = "E",
    [0] = "S",
    [1] = "N",
    [2] = "W",
    [3] = "E",
    [4] = "S",
  }
  local function facingNESW(game)
    local player = nil
    local world = game and game.world
    if world and world.player then
      player = world.player
    else
      local ow = game and game.overworld
      if ow and ow.player then
        player = ow.player
      end
    end
    if not player or type(player) ~= "table" then
      return nil
    end
    local facing = player.facing or player.direction or player.dir or player.face
    if facing == nil and type(player.getFacing) == "function" then
      local ok, f = pcall(player.getFacing, player)
      if ok then
        facing = f
      end
    end
    if facing == nil then
      return nil
    end
    if type(facing) == "string" then
      local key = facing:lower()
      return FACING_TO_NESW[key]
    end
    if type(facing) == "number" then
      return FACING_TO_NESW[facing] or FACING_TO_NESW[facing % 4]
    end
    return nil
  end
  local function playerEnt(game)
    if not game then return nil end
    if game.overworld and game.overworld.player then
      return game.overworld.player
    end
    local stack = game.stack
    if stack and type(stack.states) == "table" then
      for i = #stack.states, 1, -1 do
        local s = stack.states[i]
        if s and s.isOverworld and s.player then
          return s.player
        end
      end
    end
    local world = game.world
    if world and world.player then
      return world.player
    end
    return nil
  end
  local function owState(game)
    if not game then return nil end
    if mod.world and type(mod.world.overworld) == "function" then
      local ok, ow = pcall(function() return mod.world:overworld() end)
      if ok and type(ow) == "table" and ow.map then
        return ow
      end
    end
    if type(game.overworld) == "table" and game.overworld.map then
      return game.overworld
    end
    if type(game.world) == "table" and game.world.map then
      return game.world
    end
    local stack = game.stack
    if stack then
      if type(stack.top) == "function" then
        local ok, top = pcall(function() return stack:top() end)
        if ok and type(top) == "table" and top.isOverworld and top.map then
          return top
        end
      end
      for _, key in ipairs({ "states", "stack", "_states" }) do
        local states = stack[key]
        if type(states) == "table" then
          for i = #states, 1, -1 do
            local s = states[i]
            if type(s) == "table" and s.isOverworld and s.map then
              return s
            end
          end
        end
      end
    end
    return nil
  end
  local function sprId(obj)
    if not obj then return nil end
    if type(obj.def) == "table" and type(obj.def.sprite) == "string" then
      return obj.def.sprite
    end
    if type(obj.sprite) == "string" then return obj.sprite end
    if type(obj.sprite) == "table" then
      local d = obj.sprite.def
      if type(d) == "table" then
        return d.id or d.name or d.sprite
      end
    end

    if type(obj.spriteDef) == "table" then
      return obj.spriteDef.id or obj.spriteDef.name or obj.spriteDef.sprite
    end
    return nil
  end
  local function listMapStuff(game)
    local list = {}
    local seen = {}
    local player = playerEnt(game)
    local function add(obj)
      if type(obj) ~= "table" or obj == player then return end
      local ox = tonumber(obj.cellX)
      local oy = tonumber(obj.cellY)
      if not ox or not oy then
        if type(obj.def) == "table" then
          ox = tonumber(obj.def.x)
          oy = tonumber(obj.def.y)
        end
      end
      if not ox or not oy then return end
      local idx = (obj.def and obj.def.index) or obj.index
      local k = idx ~= nil and ("idx:" .. tostring(idx))
          or (obj.id and ("id:" .. tostring(obj.id)))
          or string.format("xy:%s:%s", ox, oy)
      if seen[k] then return end
      seen[k] = true
      list[#list + 1] = obj
    end

    local ow = owState(game)
    local liveIndices = {}
    local liveCount = 0
    local function looksLikePersonSprite(spr)
      if type(spr) ~= "string" then return false end
      local u = spr:upper()
      if u:find("BALL", 1, true) or u:find("FOSSIL", 1, true)
          or u:find("BOULDER", 1, true) or u:find("ROCK", 1, true)
          or u:find("TREE", 1, true) or u:find("BUSH", 1, true)
          or u:find("CUT", 1, true) or u:find("SIGN", 1, true)
          or u:find("SNORLAX", 1, true) then
        return false
      end
      return u:find("SPRITE_", 1, true) ~= nil or u:find("NPC", 1, true) ~= nil
    end
    local function noteLive(npc)
      if type(npc) ~= "table" then return end
      -- Skip only permanently gone NPCs. visible==false is used by Gen2
      -- while dialog/speech is up and must not drop minimap markers.
      if npc.hidden == true or npc.removed == true or npc.despawned == true then
        return
      end
      local idx = (npc.def and npc.def.index) or npc.index
      if idx ~= nil then liveIndices[tonumber(idx) or idx] = true end
      liveCount = liveCount + 1
      add(npc)
    end
    if ow and type(ow.npcs) == "table" then
      for _, npc in ipairs(ow.npcs) do
        noteLive(npc)
      end
      if liveCount == 0 then
        for _, npc in pairs(ow.npcs) do
          noteLive(npc)
        end
      end
    end
    if ow and type(ow.entities) == "table" then
      for _, e in ipairs(ow.entities) do
        noteLive(e)
      end
    end
    local def = ow and ow.map and ow.map.def
    if type(def) == "table" and type(def.objects) == "table" then
      for _, o in ipairs(def.objects) do
        if type(o) == "table" and o.x ~= nil and o.y ~= nil then
          local person = looksLikePersonSprite(o.sprite)
          local idx = o.index
          local stillLive = (idx ~= nil and liveIndices[tonumber(idx) or idx])
          if person and liveCount > 0 and not stillLive then
          else
            add({
              def = o,
              cellX = o.x,
              cellY = o.y,
              index = o.index,
              id = o.name,
              sprite = o.sprite,
              item = o.item or (o.itemball and o.itemball.item),
              pokemon = o.pokemon,
              text = o.text,
              trainerClass = o.trainerClass,
              trainerParty = o.trainerParty,
              trainer = o.trainer,
              sight = o.sight or o.sightRange,
              movement = o.movement,
              range = o.range,
              eventFlag = o.eventFlag or o.event_flag,
              fruitTree = o.fruitTree or o.fruittree or o.tree,
              itemball = o.itemball,
              script = o.script or o.scriptKey,
              type = o.type or o.objectType,
            })
          end
        end
      end
    end
    return list
  end

  -- Keep last good marker set per map so Gen2 script dialogs (Mom talking,
  -- etc.) that temporarily clear / hide live NPCs do not wipe the minimap.
  local lastMapStuff = {} -- mapId -> { list = {...}, t = frame }
  local function listMapStuffStable(game, mapId)
    local list = listMapStuff(game)
    local n = type(list) == "table" and #list or 0
    if mapId and n > 0 then
      -- shallow-copy the array so later mutations do not empty the cache
      local copy = {}
      for i = 1, n do copy[i] = list[i] end
      lastMapStuff[mapId] = { list = copy }
      return copy
    end
    if mapId and lastMapStuff[mapId] and type(lastMapStuff[mapId].list) == "table" then
      return lastMapStuff[mapId].list
    end
    return list or {}
  end

  local function xyOf(obj)
    if type(obj) ~= "table" then return nil, nil end
    local ox = tonumber(obj.cellX)
    local oy = tonumber(obj.cellY)
    if ox and oy then
      return math.floor(ox + 0.5), math.floor(oy + 0.5)
    end
    if type(obj.def) == "table" then
      ox = tonumber(obj.def.x)
      oy = tonumber(obj.def.y)
      if ox and oy then
        return math.floor(ox + 0.5), math.floor(oy + 0.5)
      end
    end
    return nil, nil
  end
  local function isRedMarker(obj)
    if not obj then return false end
    local def = type(obj.def) == "table" and obj.def or nil
    local function hasTrainerClass(t)
      if type(t) ~= "table" then return false end
      local tc = t.trainerClass
      if tc ~= nil and tc ~= 0 and tc ~= "" and tc ~= false then return true end
      local tp = t.trainerParty
      if tp ~= nil and tp ~= 0 and tp ~= "" then return true end
      if t.trainer ~= nil and t.trainer ~= false and t.trainer ~= 0 then
        return true
      end
      local ty = t.type or t.objectType or t.kind
      if type(ty) == "string" then
        local u = ty:upper()
        if u == "TRAINER" or u:find("TRAINER", 1, true) then return true end
      end
      if ty == 2 then return true end -- OBJECTTYPE_TRAINER enum in some extracts
      if t.sight ~= nil or t.sightRange ~= nil or t.range ~= nil then
        if t.trainer or t.trainerClass or t.trainerParty then return true end
      end
      return false
    end
    if hasTrainerClass(obj) or hasTrainerClass(def) then return true end
    local spr = (def and type(def.sprite) == "string" and def.sprite)
        or (type(obj.sprite) == "string" and obj.sprite) or nil
    if type(spr) == "string" then
      local u = spr:upper()
      if u:find("RIVAL", 1, true) or u == "SPRITE_BLUE" or u:find("SPRITE_BLUE", 1, true) then
        return true
      end
    end
    local name = tostring(obj.name or (def and def.name) or obj.id or ""):upper()
    if name:find("RIVAL", 1, true) or name:find("GARY", 1, true) then return true end
    local text = tostring(obj.text or (def and def.text) or ""):upper()
    if text:find("RIVAL", 1, true) then return true end
    return false
  end
  local function itemIdOf(obj)
    if not obj then return nil end
    if obj.item and obj.item ~= 0 and obj.item ~= "0" then return obj.item end
    if type(obj.def) == "table" and obj.def.item and obj.def.item ~= 0 and obj.def.item ~= "0" then
      return obj.def.item
    end
    return nil
  end
  local function textIdOf(obj)
    if not obj then return nil end
    local function asText(t)
      if type(t) == "string" and t ~= "" then return t end
      if type(t) == "number" then return tostring(t) end
      return nil
    end
    local t = asText(obj.text or obj.textId or obj.talk)
    if t then return t end
    if type(obj.def) == "table" then
      t = asText(obj.def.text or obj.def.textId or obj.def.talk)
      if t then return t end
    end
    return nil
  end
  local giftTextCache = {}
  local GIFT_VERBS = {
    give_item = true,
    giveitem = true,
    verbosegiveitem = true,
    verbose_give_item = true,
    give_key_item = true,
    givekeyitem = true,
    give_pokemon = true,
    givepokemon = true,
    givepoke = true,
    give_tm = true,
    givettm = true,
    give_hm = true,
    trade = true,
    trade_pokemon = true,
    tradepokemon = true,
    do_trade = true,
    in_game_trade = true,
    start_trade = true,
    give_badge = true,
    give_berry = true,
    giveberry = true,
    giveegg = true,
    give_egg = true,
  }
  -- RBY trade houses from pret TradeMons + GSC berry/bike/squirtbottle
  -- indices follow object_const_def order in the map asm (1-based)
  local GIFT_EVENT_DEFS = {
  { event = "EVENT_TRADED_POLIWHIRL_FOR_JYNX",
    maps = { "CERULEAN_TRADE_HOUSE", "CERULEANTRADEHOUSE" },
    indices = { 2 },
    hints = { "LOLA", "TEXT_CERULEANTRADEHOUSE_GAMBLER", "TEXT_CERULEANTRADEHOUSE_LOLA",
              "TRADE_FOR_LOLA" } },
  { event = "EVENT_TRADED_ABRA_FOR_MR_MIME",
    maps = { "ROUTE_2_TRADE_HOUSE", "ROUTE2TRADEHOUSE" },
    indices = { 2 },
    hints = { "MARCEL", "MILES", "TEXT_ROUTE2TRADEHOUSE_GAMEBOY_KID", "TRADE_FOR_MARCEL" } },
  { event = "EVENT_TRADED_NIDORAN_FOR_NIDORAN",
    maps = { "UNDERGROUND_PATH_ROUTE_5", "UNDERGROUNDPATHROUTE5" },
    indices = { 1 },
    hints = { "SPOT", "RICKY", "TEXT_UNDERGROUNDPATHROUTE5_LITTLE_GIRL", "TRADE_FOR_SPOT" } },
  { event = "EVENT_TRADED_SPEAROW_FOR_FARFETCHD",
    maps = { "VERMILION_TRADE_HOUSE", "VERMILIONTRADEHOUSE" },
    indices = { 1 },
    hints = { "DUX", "TEXT_VERMILIONTRADEHOUSE_LITTLE_GIRL", "TRADE_FOR_DUX" } },
  { event = "EVENT_TRADED_NIDORINO_FOR_NIDORINA",
    maps = { "ROUTE_11_GATE_2F", "ROUTE11GATE2F", "ROUTE_12_GATE_2F", "ROUTE12GATE2F" },
    indices = { 1 },
    hints = { "TERRY", "GURIO", "TEXT_ROUTE11GATE2F_YOUNGSTER", "TRADE_FOR_TERRY" } },
  { event = "EVENT_TRADED_SLOWBRO_FOR_LICKITUNG",
    maps = { "ROUTE_18_GATE_2F", "ROUTE18GATE2F" },
    indices = { 1 },
    hints = { "MARC", "SPIKE", "TEXT_ROUTE18GATE2F_YOUNGSTER", "TRADE_FOR_MARC" } },
  { event = "EVENT_TRADED_PONYTA_FOR_SEEL",
    maps = { "CINNABAR_LAB_FOSSIL_ROOM", "CINNABARLABFOSSILROOM" },
    indices = { 2 },
    hints = { "SAILOR", "CEZANNE", "TEXT_CINNABARLABFOSSILROOM_SCIENTIST2", "TRADE_FOR_SAILOR" } },
  { event = "EVENT_TRADED_RAICHU_FOR_ELECTRODE",
    maps = { "CINNABAR_LAB_TRADE_ROOM", "CINNABARLABTRADEROOM" },
    indices = { 2 },
    hints = { "DORIS", "BUFFY", "TEXT_CINNABARLABTRADEROOM_GRAMPS", "TRADE_FOR_DORIS" } },
  { event = "EVENT_TRADED_VENONAT_FOR_TANGELA",
    maps = { "CINNABAR_LAB_TRADE_ROOM", "CINNABARLABTRADEROOM" },
    indices = { 3 },
    hints = { "CRINKLES", "STICKY", "TEXT_CINNABARLABTRADEROOM_BEAUTY", "TRADE_FOR_CRINKLES" } },
  { gen = 2, event = "EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE",
    eventId = 39,
    maps = { "ROUTE_30_BERRY_HOUSE", "ROUTE30BERRYHOUSE", "ROUTE_30_BERRY_SPEECH_HOUSE" },
    indices = { 1 },
    hints = { "BERRY", "POKEFAN", "ROUTE30BERRYHOUSE", "TEXT_ROUTE30BERRYHOUSE" } },
  { gen = 2, event = "EVENT_GOT_BICYCLE",
    eventId = 91,
    maps = { "GOLDENROD_BIKE_SHOP", "GOLDENRODBIKESHOP" },
    indices = { 1 },
    hints = { "BICYCLE", "BIKE", "CLERK", "GOLDENRODBIKESHOP" } },
  { gen = 2, event = "EVENT_GOT_SQUIRTBOTTLE",
    eventId = 92,
    maps = { "GOLDENROD_FLOWER_SHOP", "GOLDENRODFLOWERSHOP" },
    indices = { 1 },
    hints = { "SQUIRTBOTTLE", "SQUIRT", "TEACHER", "FLORIA", "FLOWER" } },
  { gen = 2, event = "EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON",
    eventId = 30,
    maps = { "MR_POKEMONS_HOUSE", "MRPOKEMONSHOUSE", "MR_POKEMON_HOUSE", "MRPOKEMONHOUSE" },
    indices = { 1 },
    hints = { "MYSTERY_EGG", "MR_POKEMON", "MRPOKEMON" } },
  { gen = 2, event = "EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE",
    eventId = 45,
    maps = { "ELMS_LAB", "ELMSLAB", "VIOLET_POKEMON_CENTER_1F", "VIOLETPOKEMONCENTER1F" },
    indices = {},
    hints = { "TOGEPI", "AIDE", "ELMS_AIDE", "EGG" } },
  { gen = 2, event = "EVENT_GOT_SHUCKIE",
    eventId = 69,
    maps = { "MANIAS_HOUSE", "MANIASHOUSE", "CIANWOOD_MANIA_HOUSE" },
    indices = { 1 },
    hints = { "SHUCKIE", "SHUCKLE", "MANIA" } },
  { gen = 2, event = "EVENT_TRADE_KYLE_ONIX",
    maps = { "VIOLET_KYLES_HOUSE", "VIOLETKYLESHOUSE" },
    indices = { 2 },
    hints = { "KYLE", "ONIX", "ROCKY", "NPC_TRADE_KYLE", "TRADE" },
    trade = true, tradeId = 1 },
  { gen = 2, event = "EVENT_TRADE_MIKE_MACHOP",
    maps = { "GOLDENROD_DEPT_STORE_5F", "GOLDENRODDEPTSTORE5F", "GOLDENROD_DEPTSTORE_5F" },
    indices = { 3 },
    hints = { "MIKE", "MACHOP", "MUSCLE", "NPC_TRADE_MIKE", "TRADE" },
    trade = true, tradeId = 0 },
  { gen = 2, event = "EVENT_TRADE_TIM_VOLTORB",
    maps = { "OLIVINE_TIMS_HOUSE", "OLIVINETIMSHOUSE" },
    indices = { 1 },
    hints = { "TIM", "VOLTORB", "VOLTY", "NPC_TRADE_TIM", "TRADE" },
    trade = true, tradeId = 2 },
  { gen = 2, event = "EVENT_TRADE_KIM_AERODACTYL",
    maps = { "ROUTE_14", "ROUTE14" },
    indices = {},
    hints = { "KIM", "AERODACTYL", "AEROY", "NPC_TRADE_KIM", "TRADE" },
    trade = true, tradeId = 5 },
  { gen = 2, event = "EVENT_TRADE_FOREST_MAGNETON",
    maps = { "POWER_PLANT", "POWERPLANT" },
    indices = {},
    hints = { "FOREST", "MAGNETON", "MAGGIE", "NPC_TRADE_FOREST", "TRADE" },
    trade = true, tradeId = 6 },
  -- --- Gen2 completion gifts / key items / HMs / rods / gym TMs / trades ---
  -- Pokégear / cards
  { gen = 2, event = "EVENT_GOT_POKEGEAR",
    maps = { "PLAYERS_HOUSE_1F", "PLAYERSHOUSE1F", "PLAYERS_HOUSE" },
    indices = { 1 },
    hints = { "POKEGEAR", "MOM", "MUM", "PHONE", "GEAR" } },
  { gen = 2, event = "EVENT_GOT_MAP_CARD",
    maps = { "CHERRYGROVE_CITY", "CHERRYGROVECITY", "CHERRYGROVE_POKECENTER_1F" },
    indices = {},
    hints = { "MAP_CARD", "GUIDE_GENT", "GUIDEGENT", "MAPCARD" } },
  { gen = 2, event = "EVENT_GOT_RADIO_CARD",
    maps = { "RADIO_TOWER_1F", "RADIOTOWER1F", "GOLDENROD_RADIO_TOWER_1F" },
    indices = {},
    hints = { "RADIO_CARD", "RADIOCARD", "RECEPTIONIST" } },
  { gen = 2, event = "EVENT_GOT_EXPN_CARD",
    maps = { "LAV_RADIO_TOWER_1F", "LAVRADIOTOWER1F", "LAVENDER_RADIO_TOWER", "RADIO_TOWER" },
    indices = {},
    hints = { "EXPN_CARD", "EXPNCARD", "EXPANSION" } },
  -- HMs
  { gen = 2, event = "EVENT_GOT_HM01_CUT",
    maps = { "ILEX_FOREST", "ILEXFOREST" },
    indices = {},
    hints = { "HM01", "CUT", "CHARCOAL", "ILEX" } },
  { gen = 2, event = "EVENT_GOT_HM02_FLY",
    maps = { "CIANWOOD_CITY", "CIANWOODCITY", "CIANWOOD_PHARMACY" },
    indices = {},
    hints = { "HM02", "FLY", "CHUCK", "WIFE" } },
  { gen = 2, event = "EVENT_GOT_HM03_SURF",
    maps = { "ECRUTEAK_CITY", "ECRUTEAKCITY", "ECRUTEAK_DANCE_THEATER", "ECRUTEAKDANCETHEATER" },
    indices = {},
    hints = { "HM03", "SURF", "KIMONO", "DANCE" } },
  { gen = 2, event = "EVENT_GOT_HM04_STRENGTH",
    maps = { "OLIVINE_CITY", "OLIVINECITY", "OLIVINE_CAFE", "OLIVINECAFE" },
    indices = {},
    hints = { "HM04", "STRENGTH", "SAILOR" } },
  { gen = 2, event = "EVENT_GOT_HM05_FLASH",
    maps = { "SPROUT_TOWER_3F", "SPROUTTOWER3F", "SPROUT_TOWER", "SPROUTTOWER" },
    indices = {},
    hints = { "HM05", "FLASH", "SAGE", "LI" } },
  { gen = 2, event = "EVENT_GOT_HM06_WHIRLPOOL",
    maps = { "TEAM_ROCKET_BASE_B2F", "TEAMROCKETBASEB2F", "TEAM_ROCKET_BASE_B3F", "TEAMROCKETBASEB3F" },
    indices = {},
    hints = { "HM06", "WHIRLPOOL", "LANCE", "ROCKET" } },
  { gen = 2, event = "EVENT_GOT_HM07_WATERFALL",
    maps = { "ICE_PATH_1F", "ICEPATH1F", "ICE_PATH_B1F", "ICEPATHB1F" },
    indices = {},
    hints = { "HM07", "WATERFALL" } },
  -- Rods
  { gen = 2, event = "EVENT_GOT_OLD_ROD",
    maps = { "ROUTE_32", "ROUTE32", "ROUTE_32_POKECENTER_1F" },
    indices = {},
    hints = { "OLD_ROD", "FISHING_GURU", "FISHINGGURU" } },
  { gen = 2, event = "EVENT_GOT_GOOD_ROD",
    maps = { "OLIVINE_CITY", "OLIVINECITY", "ROUTE_44", "ROUTE44" },
    indices = {},
    hints = { "GOOD_ROD", "FISHING_GURU", "FISHINGGURU" } },
  { gen = 2, event = "EVENT_GOT_SUPER_ROD",
    maps = { "ROUTE_12", "ROUTE12", "LAKE_OF_RAGE", "LAKEOFRAGE" },
    indices = {},
    hints = { "SUPER_ROD", "FISHING_GURU", "FISHINGGURU" } },
  -- Key items / story gifts
  { gen = 2, event = "EVENT_GOT_ITEMFINDER",
    maps = { "ECRUTEAK_ITEMFINDER_HOUSE", "ECRUTEAKITEMFINDERHOUSE", "ECRUTEAK_CITY" },
    indices = {},
    hints = { "ITEMFINDER", "ITEM_FINDER", "DOWSING" } },
  { gen = 2, event = "EVENT_GOT_SECRETPOTION_FROM_PHARMACY",
    maps = { "CIANWOOD_PHARMACY", "CIANWOODPHARMACY" },
    indices = {},
    hints = { "SECRETPOTION", "SECRET_POTION", "PHARMACY" } },
  { gen = 2, event = "EVENT_GOT_SS_TICKET_FROM_ELM",
    maps = { "ELMS_LAB", "ELMSLAB" },
    indices = {},
    hints = { "SS_TICKET", "S.S.TICKET", "ELM" } },
  { gen = 2, event = "EVENT_GOT_CLEAR_BELL",
    maps = { "RADIO_TOWER_5F", "RADIOTOWER5F", "GOLDENROD_RADIO_TOWER_5F" },
    indices = {},
    hints = { "CLEAR_BELL", "CLEARBELL", "DIRECTOR" } },
  { gen = 2, event = "EVENT_GOT_SILVER_WING",
    maps = { "PEWTER_CITY", "PEWTERCITY", "PEWTER_MUSEUM_1F" },
    indices = {},
    hints = { "SILVER_WING", "SILVERWING" } },
  { gen = 2, event = "EVENT_GOT_RAINBOW_WING",
    maps = { "TIN_TOWER_1F", "TINTOWER1F", "ECRUTEAK_CITY" },
    indices = {},
    hints = { "RAINBOW_WING", "RAINBOWWING" } },
  { gen = 2, event = "EVENT_GOT_MASTER_BALL_FROM_ELM",
    maps = { "ELMS_LAB", "ELMSLAB" },
    indices = {},
    hints = { "MASTER_BALL", "MASTERBALL", "ELM" } },
  { gen = 2, event = "EVENT_RECEIVED_CARD_KEY",
    maps = { "GOLDENROD_UNDERGROUND_WAREHOUSE", "GOLDENRODUNDERGROUNDWAREHOUSE", "RADIO_TOWER_3F" },
    indices = {},
    hints = { "CARD_KEY", "CARDKEY" } },
  { gen = 2, event = "EVENT_GOT_BASEMENT_KEY",
    maps = { "RADIO_TOWER_3F", "RADIOTOWER3F", "GOLDENROD_UNDERGROUND" },
    indices = {},
    hints = { "BASEMENT_KEY", "BASEMENTKEY" } },
  { gen = 2, event = "EVENT_GOT_COIN_CASE",
    maps = { "GOLDENROD_UNDERGROUND", "GOLDENRODUNDERGROUND", "GOLDENROD_UNDERGROUND_COIN_CASE" },
    indices = {},
    hints = { "COIN_CASE", "COINCASE" } },
  { gen = 2, event = "EVENT_GOT_PASS_FROM_COPYCAT",
    maps = { "COPYCATS_HOUSE_2F", "COPYCATSHOUSE2F", "SAFFRON_CITY" },
    indices = {},
    hints = { "PASS", "COPYCAT", "MAGNET_TRAIN" } },
  { gen = 2, event = "EVENT_GOT_UP_GRADE",
    maps = { "SILPH_CO_1F", "SILPHCO1F", "SAFFRON_CITY" },
    indices = {},
    hints = { "UP_GRADE", "UPGRADE", "SILPH" } },
  -- Gift Pokémon
  { gen = 2, event = "EVENT_GOT_A_POKEMON_FROM_ELM",
    maps = { "ELMS_LAB", "ELMSLAB" },
    indices = { 1 },
    hints = { "STARTER", "CHIKORITA", "CYNDAQUIL", "TOTODILE", "ELM", "PROF_ELM" } },
  -- Elm's Aide (object index 2): gives Potion on the way out after the starter,
  -- then later 5 Poké Balls. No dedicated event flag for the Potion — the
  -- starter flag is the closest proxy (scene SCENE_ELMSLAB_AIDE_GIVES_POTION).
  { gen = 2, event = "EVENT_GOT_A_POKEMON_FROM_ELM",
    maps = { "ELMS_LAB", "ELMSLAB" },
    indices = { 2 },
    hints = { "AIDE", "ELMS_AIDE", "ELMSAIDE", "POTION", "GIVE_POTION",
              "POKE_BALL", "POKEBALL", "POKE_BALLS" } },
  { gen = 2, event = "EVENT_GOT_EEVEE",
    maps = { "BILLS_FAMILY_HOUSE", "BILLSFAMILYHOUSE", "GOLDENROD_BILLS_HOUSE" },
    indices = {},
    hints = { "EEVEE", "BILL" } },
  { gen = 2, event = "EVENT_GOT_KENYA",
    maps = { "ROUTE_31", "ROUTE31", "ROUTE_35", "ROUTE35", "GOLDENROD_CITY" },
    indices = {},
    hints = { "KENYA", "SPEAROW", "RANDY", "MAIL" } },
  { gen = 2, event = "EVENT_GOT_TYROGUE_FROM_KIYO",
    maps = { "MOUNT_MORTAR_1F_INSIDE", "MOUNTMORTAR1FINSIDE", "MT_MORTAR", "MOUNT_MORTAR" },
    indices = {},
    hints = { "TYROGUE", "KIYO", "KARATE" } },
  { gen = 2, event = "EVENT_GOT_DRATINI",
    maps = { "DRAGONS_DEN_B1F", "DRAGONSDENB1F", "DRAGON_SHRINE", "DRAGONSHRINE" },
    indices = {},
    hints = { "DRATINI", "CLAIR", "ELDER", "DRAGON" } },
  { gen = 2, event = "EVENT_GOT_ODD_EGG",
    maps = { "ROUTE_34_ILEX_FOREST_GATE", "DAY_CARE", "DAYCARE", "ROUTE_34" },
    indices = {},
    hints = { "ODD_EGG", "ODDEGG", "DAY_CARE", "DAYCARE" } },
  -- Gym leader TMs
  { gen = 2, event = "EVENT_GOT_TM31_MUD_SLAP",
    maps = { "VIOLET_GYM", "VIOLETGYM" },
    indices = {},
    hints = { "TM31", "MUD_SLAP", "FALKNER" } },
  { gen = 2, event = "EVENT_GOT_TM49_FURY_CUTTER",
    maps = { "AZALEA_GYM", "AZALEAGYM" },
    indices = {},
    hints = { "TM49", "FURY_CUTTER", "BUGSY" } },
  { gen = 2, event = "EVENT_GOT_TM45_ATTRACT",
    maps = { "GOLDENROD_GYM", "GOLDENRODGYM" },
    indices = {},
    hints = { "TM45", "ATTRACT", "WHITNEY" } },
  { gen = 2, event = "EVENT_GOT_TM30_SHADOW_BALL",
    maps = { "ECRUTEAK_GYM", "ECRUTEAKGYM" },
    indices = {},
    hints = { "TM30", "SHADOW_BALL", "MORTY" } },
  { gen = 2, event = "EVENT_GOT_TM23_IRON_TAIL",
    maps = { "OLIVINE_GYM", "OLIVINEGYM" },
    indices = {},
    hints = { "TM23", "IRON_TAIL", "JASMINE" } },
  { gen = 2, event = "EVENT_GOT_TM01_DYNAMICPUNCH",
    maps = { "CIANWOOD_GYM", "CIANWOODGYM" },
    indices = {},
    hints = { "TM01", "DYNAMICPUNCH", "CHUCK" } },
  { gen = 2, event = "EVENT_GOT_TM16_ICY_WIND",
    maps = { "MAHOGANY_GYM", "MAHOGANYGYM" },
    indices = {},
    hints = { "TM16", "ICY_WIND", "PRYCE" } },
  { gen = 2, event = "EVENT_GOT_TM24_DRAGONBREATH",
    maps = { "BLACKTHORN_GYM_1F", "BLACKTHORNGYM1F", "BLACKTHORN_GYM" },
    indices = {},
    hints = { "TM24", "DRAGONBREATH", "CLAIR" } },
  -- Common NPC gifts
  { gen = 2, event = "EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE",
    maps = { "CHERRYGROVE_CITY", "CHERRYGROVECITY" },
    indices = {},
    hints = { "MYSTIC_WATER", "MYSTICWATER" } },
  { gen = 2, event = "EVENT_GOT_QUICK_CLAW",
    maps = { "NATIONAL_PARK", "NATIONALPARK" },
    indices = {},
    hints = { "QUICK_CLAW", "QUICKCLAW", "PERSIAN" } },
  { gen = 2, event = "EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32",
    maps = { "ROUTE_32", "ROUTE32" },
    indices = {},
    hints = { "MIRACLE_SEED", "MIRACLESEED" } },
  { gen = 2, event = "EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN",
    maps = { "CHARCOAL_KILN", "CHARCOALKILN", "AZALEA_TOWN" },
    indices = {},
    hints = { "CHARCOAL", "KILN" } },
  { gen = 2, event = "EVENT_GOT_TM02_HEADBUTT",
    maps = { "ILEX_FOREST", "ILEXFOREST", "AZALEA_TOWN" },
    indices = {},
    hints = { "TM02", "HEADBUTT" } },
  { gen = 2, event = "EVENT_GOT_SOFT_SAND_FROM_KATE",
    maps = { "ROUTE_34", "ROUTE34" },
    indices = {},
    hints = { "SOFT_SAND", "SOFTSAND", "KATE" } },
  { gen = 2, event = "EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE",
    maps = { "DARK_CAVE_VIOLET_ENTRANCE", "DARKCAVEVIOLETENTRANCE", "DARK_CAVE" },
    indices = {},
    hints = { "BLACKGLASSES", "BLACK_GLASSES" } },
  { gen = 2, event = "EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL",
    maps = { "SLOWPOKE_WELL_B2F", "SLOWPOKEWELLB2F", "SLOWPOKE_WELL" },
    indices = {},
    hints = { "KINGS_ROCK", "KINGSROCK" } },
  { gen = 2, event = "EVENT_GOT_TM50_NIGHTMARE",
    maps = { "ROUTE_31", "ROUTE31" },
    indices = {},
    hints = { "TM50", "NIGHTMARE", "KENYA" } },
  { gen = 2, event = "EVENT_GOT_TM10_HIDDEN_POWER",
    maps = { "CELADON_CITY", "CELADONCITY", "CELADON_DEPT_STORE_2F" },
    indices = {},
    hints = { "TM10", "HIDDEN_POWER" } },
  { gen = 2, event = "EVENT_GOT_TM36_SLUDGE_BOMB",
    maps = { "ROUTE_43_GATE", "ROUTE43GATE", "LAKE_OF_RAGE" },
    indices = {},
    hints = { "TM36", "SLUDGE_BOMB" } },
  { gen = 2, event = "EVENT_GOT_TM08_ROCK_SMASH",
    maps = { "ROUTE_36", "ROUTE36" },
    indices = {},
    hints = { "TM08", "ROCK_SMASH" } },
  { gen = 2, event = "EVENT_GOT_TM05_ROAR",
    maps = { "ROUTE_32", "ROUTE32" },
    indices = {},
    hints = { "TM05", "ROAR" } },
  { gen = 2, event = "EVENT_GOT_EVERSTONE_FROM_ELM",
    maps = { "ELMS_LAB", "ELMSLAB" },
    indices = {},
    hints = { "EVERSTONE", "ELM" } },
  -- Day-of-week siblings
  { gen = 2, event = "EVENT_GOT_POISON_BARB_FROM_FRIEDA",
    maps = { "ROUTE_32", "ROUTE32" },
    indices = {},
    hints = { "POISON_BARB", "FRIEDA", "FRIDAY" } },
  { gen = 2, event = "EVENT_GOT_PINK_BOW_FROM_TUSCANY",
    maps = { "ROUTE_29", "ROUTE29" },
    indices = {},
    hints = { "PINK_BOW", "TUSCANY", "TUESDAY" } },
  { gen = 2, event = "EVENT_GOT_HARD_STONE_FROM_ARTHUR",
    maps = { "ROUTE_36", "ROUTE36" },
    indices = {},
    hints = { "HARD_STONE", "ARTHUR", "THURSDAY" } },
  { gen = 2, event = "EVENT_GOT_MAGNET_FROM_SUNNY",
    maps = { "ROUTE_37", "ROUTE37" },
    indices = {},
    hints = { "MAGNET", "SUNNY", "SUNDAY" } },
  { gen = 2, event = "EVENT_GOT_BLACKBELT_FROM_WESLEY",
    maps = { "MAHOGANY_TOWN", "MAHOGANYTOWN" },
    indices = {},
    hints = { "BLACKBELT", "WESLEY", "WEDNESDAY" } },
  { gen = 2, event = "EVENT_GOT_SPELL_TAG_FROM_SANTOS",
    maps = { "CIANWOOD_CITY", "CIANWOODCITY" },
    indices = {},
    hints = { "SPELL_TAG", "SANTOS", "SATURDAY" } },
  { gen = 2, event = "EVENT_GOT_SHARP_BEAK_FROM_MONICA",
    maps = { "ROUTE_40", "ROUTE40" },
    indices = {},
    hints = { "SHARP_BEAK", "MONICA", "MONDAY" } },
  -- Extra trade (Blackthorn Emy — GS Rhydon / Crystal Dodrio)
  { gen = 2, event = "EVENT_TRADE_EMY_DODRIO",
    maps = { "BLACKTHORN_EMY_HOUSE", "BLACKTHORNEMYHOUSE", "BLACKTHORN_CITY" },
    indices = {},
    hints = { "EMY", "DODRIO", "DORIS", "RHYDON", "DON", "TRADE", "DRAGONAIR" },
    trade = true, tradeId = 3 },
  { gen = 2, event = "EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM",
    maps = { "ROUTE_39_FARMHOUSE", "ROUTE39FARMHOUSE", "ROUTE_39", "MOOMOO_FARM" },
    indices = {},
    hints = { "TM13", "SNORE", "MOOMOO", "FARM" } },
  { gen = 2, event = "EVENT_GOT_PINK_BOW_FROM_MARY",
    maps = { "RADIO_TOWER_5F", "RADIOTOWER5F", "GOLDENROD_RADIO_TOWER" },
    indices = {},
    hints = { "PINK_BOW", "MARY" } },
  { gen = 2, event = "EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA",
    maps = { "FAST_SHIP_1F", "FASTSHIP1F", "FAST_SHIP_CABINS_NNW_NNE_NE", "SS_AQUA" },
    indices = {},
    hints = { "METAL_COAT", "METALCOAT", "GRANDPA" } },
    { event = "EVENT_GOT_POTION_SAMPLE",
      maps = { "ROUTE_1", "ROUTE 1" },
      indices = { 1 },
      hints = { "SAMPLE", "POTION_SAMPLE", "MART_SAMPLE", "VIRIDIANMARTSAMPLE",
                "ROUTE1_YOUNGSTER1", "TEXT_ROUTE1_YOUNGSTER1" } },
    { event = "EVENT_GOT_TM42",
      maps = { "VIRIDIAN_CITY", "VIRIDIANCITY" },
      indices = { 6 },
      hints = { "TM42", "DREAM_EATER", "DREAMEATER", "FISHER",
                "VIRIDIANCITY_FISHER", "TEXT_VIRIDIANCITY_FISHER" } },
    { event = "EVENT_GOT_POKEBALLS_FROM_OAK",
      maps = { "OAKS_LAB", "OAKSLAB" },
      indices = { 1, 2, 3, 4, 5 },
      hints = { "OAKSLAB_OAK", "TEXT_OAKSLAB_OAK1", "TEXT_OAKSLAB_OAK" } },
    { event = "EVENT_GOT_STARTER",
      maps = { "OAKS_LAB", "OAKSLAB" },
      indices = {},
      hints = { "CHARMANDER", "SQUIRTLE", "BULBASAUR", "STARTER" } },
    { event = "EVENT_GOT_TOWN_MAP",
      maps = { "BLUES_HOUSE", "BLUE_S_HOUSE" },
      indices = {},
      hints = { "TOWN_MAP", "DAISY" } },
    { event = "EVENT_GOT_OAKS_PARCEL",
      maps = { "VIRIDIAN_MART", "VIRIDIANMART" },
      indices = {},
      hints = { "PARCEL", "OAKS_PARCEL" } },
    { event = "EVENT_GOT_HM05",
      maps = { "ROUTE_2", "ROUTE 2", "ROUTE2_GATE", "ROUTE_2_GATE", "ROUTE_2_GATE_1F" },
      indices = {},
      hints = { "OAKS_AIDE", "OAKSAIDE", "HM05", "AIDE" } },
    { event = "EVENT_GOT_ITEMFINDER",
      maps = { "ROUTE_11", "ROUTE11", "ROUTE_11_GATE", "ROUTE11GATE", "ROUTE_11_GATE_UPSTAIRS" },
      indices = {},
      hints = { "OAKS_AIDE", "OAKSAIDE", "ITEMFINDER", "AIDE" } },
    { event = "EVENT_GOT_EXP_ALL",
      maps = { "ROUTE_15", "ROUTE15", "ROUTE_15_GATE" },
      indices = {},
      hints = { "OAKS_AIDE", "OAKSAIDE", "EXP_ALL", "EXPALL", "AIDE" } },
    { event = "EVENT_GOT_HM04",
      maps = { "FUCHSIA_CITY", "WARDENS_HOUSE", "FUCHSIA", "SAFARI_ZONE_WARDENS_HOME" },
      indices = {},
      hints = { "WARDEN", "HM04" } },
    { event = "EVENT_GOT_HM02",
      maps = { "ROUTE_16", "ROUTE16", "ROUTE_16_HOUSE", "ROUTE16_HOUSE" },
      indices = {},
      hints = { "HM02", "FLY" } },
    { event = "EVENT_GOT_POKE_FLUTE",
      maps = { "LAVENDER_TOWN", "MR_FUJIS_HOUSE", "LAVENDER" },
      indices = {},
      hints = { "FUJI", "FLUTE", "POKE_FLUTE" } },
    { event = "EVENT_GOT_OLD_ROD",
      maps = { "VERMILION_CITY", "VERMILION", "VERMILION_OLD_ROD_HOUSE" },
      indices = {},
      hints = { "OLD_ROD", "FISHING_GURU", "FISHINGGURU" } },
    { event = "EVENT_GOT_GOOD_ROD",
      maps = { "FUCHSIA_CITY", "FUCHSIA", "FUCHSIA_GOOD_ROD_HOUSE" },
      indices = {},
      hints = { "GOOD_ROD", "FISHING_GURU", "FISHINGGURU" } },
    { event = "EVENT_GOT_SUPER_ROD",
      maps = { "ROUTE_12", "ROUTE12", "ROUTE_12_SUPER_ROD_HOUSE" },
      indices = {},
      hints = { "SUPER_ROD", "FISHING_GURU", "FISHINGGURU" } },
    { event = "EVENT_GOT_BICYCLE",
      maps = { "CERULEAN_CITY", "BIKE_SHOP", "CERULEAN" },
      indices = {},
      hints = { "BICYCLE", "BIKE_SHOP" } },
    { event = "EVENT_GOT_BIKE_VOUCHER",
      maps = { "VERMILION_CITY", "POKEMON_FAN_CLUB", "FAN_CLUB" },
      indices = {},
      hints = { "VOUCHER", "BIKE_VOUCHER" } },
    { event = "EVENT_GOT_TM34", maps = { "PEWTER_GYM" }, indices = {}, hints = { "TM34" } },
    { event = "EVENT_GOT_TM11", maps = { "CERULEAN_GYM" }, indices = {}, hints = { "TM11" } },
    { event = "EVENT_GOT_TM24", maps = { "VERMILION_GYM" }, indices = {}, hints = { "TM24" } },
    { event = "EVENT_GOT_TM21", maps = { "CELADON_GYM" }, indices = {}, hints = { "TM21" } },
    { event = "EVENT_GOT_TM06", maps = { "FUCHSIA_GYM" }, indices = {}, hints = { "TM06" } },
    { event = "EVENT_GOT_TM46", maps = { "SAFFRON_GYM" }, indices = {}, hints = { "TM46" } },
    { event = "EVENT_GOT_TM38", maps = { "CINNABAR_GYM" }, indices = {}, hints = { "TM38" } },
    { event = "EVENT_GOT_TM27", maps = { "VIRIDIAN_GYM" }, indices = {}, hints = { "TM27" } },
    { event = "EVENT_GOT_OLD_AMBER",
      maps = { "PEWTER_MUSEUM", "MUSEUM_1F", "PEWTER_MUSEUM_1F" },
      indices = {},
      hints = { "AMBER", "OLD_AMBER" } },
    { event = "EVENT_GOT_COIN_CASE",
      maps = { "CELADON_CITY", "ROCKET_HIDEOUT", "ROCKET_HIDEOUT_B1F" },
      indices = {},
      hints = { "COIN_CASE", "COINCASE" } },
    { event = "EVENT_GOT_HITMONLEE",
      maps = { "FIGHTING_DOJO" },
      indices = {},
      hints = { "HITMONLEE" } },
    { event = "EVENT_GOT_HITMONCHAN",
      maps = { "FIGHTING_DOJO" },
      indices = {},
      hints = { "HITMONCHAN" } },
  }
  for _, def in ipairs(GIFT_EVENT_DEFS) do
    if def.gen == nil then def.gen = 1 end
  end
  local GIFT_BY_MAP = {}
  for _, def in ipairs(GIFT_EVENT_DEFS) do
    for _, m in ipairs(def.maps) do
      local key = tostring(m):upper():gsub("%s+", "_")
      GIFT_BY_MAP[key] = GIFT_BY_MAP[key] or {}
      GIFT_BY_MAP[key][#GIFT_BY_MAP[key] + 1] = def
    end
  end
  local activeGame = nil
  -- Only return gift defs that match the running generation so Gen1/Gen2
  local function defsForMap(mapId, game)
    if not mapId then return nil end
    game = game or activeGame
    local key = tostring(mapId):upper():gsub("%s+", "_")
    local all = GIFT_BY_MAP[key] or GIFT_BY_MAP[key:gsub("_", "")]
    if not all then return nil end
    local gen = 1
    if genOf(game) == "gold" then gen = 2 end
    local out = {}
    for i = 1, #all do
      local def = all[i]
      if (def.gen or 1) == gen then
        out[#out + 1] = def
      end
    end
    if #out == 0 then return nil end
    return out
  end
  local KNOWN_GIFTS = {}
  for _, def in ipairs(GIFT_EVENT_DEFS) do
    for _, m in ipairs(def.maps) do
      local key = tostring(m):upper():gsub("%s+", "_")
      KNOWN_GIFTS[key] = KNOWN_GIFTS[key] or { texts = {}, events = {}, gens = {} }
      local g = KNOWN_GIFTS[key]
      g.events[#g.events + 1] = def.event
      g.gens[#g.gens + 1] = def.gen or 1
      for _, h in ipairs(def.hints) do
        g.texts[#g.texts + 1] = h
      end
    end
  end
  local KNOWN_GIFT_TEXT_PATTERNS = {
    "OAKS_AIDE",
    "BILL",
    "KURT",
    "CHUCK",
    "COPYCAT",
    "WARDEN",
    "CHAIRMAN",
    "KIMONO",
    "SAILOR",
    "ELDER",
    "PHARMACY",
    "FISHING_GURU", "FISHINGGURU",
    "GUIDE_GENT", "GUIDEGENT",
    "OLD_MAN", "OLDMAN",
    "POKEGEAR", "MOM", "MAP_CARD", "RADIO_CARD", "EXPN_CARD",
    "ITEMFINDER", "SECRETPOTION", "SS_TICKET", "CLEAR_BELL",
    "SILVER_WING", "RAINBOW_WING", "MASTER_BALL", "CARD_KEY",
    "BASEMENT_KEY", "COIN_CASE", "UP_GRADE", "EEVEE", "KENYA",
    "TYROGUE", "DRATINI", "ODD_EGG", "SHUCKIE", "SQUIRTBOTTLE",
    "HM01", "HM02", "HM03", "HM04", "HM05", "HM06", "HM07",
    "CUT", "FLY", "SURF", "STRENGTH", "FLASH", "WHIRLPOOL", "WATERFALL",
    "OLD_ROD", "GOOD_ROD", "SUPER_ROD", "BICYCLE", "MYSTERY_EGG",
    "FALKNER", "BUGSY", "WHITNEY", "MORTY", "JASMINE", "PRYCE", "CLAIR",
    "FRIEDA", "TUSCANY", "ARTHUR", "SUNNY", "WESLEY", "SANTOS", "MONICA",
    "KIYO", "RANDY", "MARY", "FLORIA", "ELM", "AIDE", "ELMS_AIDE", "POTION",
  }
  local function isCommandRowList(t)
    if type(t) ~= "table" then
      return false
    end
    if type(t[1]) == "table" or type(t[1]) == "string" then
      return true
    end
    return false
  end
  local function scriptRowsGiveGift(rows, depth, acc)
    depth = depth or 0
    acc = acc or { gift = false, events = {}, primary = nil }
    if depth > 10 or type(rows) ~= "table" then
      return acc.gift, acc.primary, acc.events
    end
    if not isCommandRowList(rows) and depth == 0 then
      return false, nil, {}
    end
    local function rememberEvent(en)
      if type(en) ~= "string" or en == "" then return end
      local u = en:upper()
      local isProgress = u:find("GOT_", 1, true) or u:find("RECEIVED_", 1, true)
          or u:find("GOTTEN_", 1, true) or u:find("GAVE_", 1, true)
          or u:find("BEAT_", 1, true) or u:find("DONE", 1, true)
          or u:find("FINISHED", 1, true)
      if not acc.events[en] then
        acc.events[en] = true
        acc.events[#acc.events + 1] = en
      end
      if isProgress and not acc.primary then
        acc.primary = en
      end
    end

    for _, row in ipairs(rows) do
      if type(row) == "table" then
        local verb = row[1] or row.verb or row.cmd or row.command
        if type(verb) == "string" then
          local v = verb:lower()
          if GIFT_VERBS[v] then
            acc.gift = true
            -- trade tradeIndex, doneFlag  (doneFlag is often arg 3)
            if v == "trade" or v == "trade_pokemon" or v == "do_trade"
                or v == "in_game_trade" or v == "start_trade" then
              acc.trade = true
              for i = 2, 5 do
                if type(row[i]) == "string" then
                  local s = row[i]
                  local u = s:upper()
                  if u:find("EVENT", 1, true) or u:find("GOT_", 1, true)
                      or u:find("TRADE", 1, true) or u:find("DONE", 1, true) then
                    rememberEvent(s)
                  end
                end
              end
            end
          end
          -- static_battle species, level, beatFlag — freestanding mon scripts
          if v == "static_battle" then
            acc.staticMon = true
            if type(row[4]) == "string" then rememberEvent(row[4]) end
            if type(row[3]) == "string" and row[3]:upper():find("EVENT", 1, true) then
              rememberEvent(row[3])
            end
          end
          if (v == "check_flag" or v == "set_flag" or v == "clear_flag"
                or v == "check_event" or v == "set_event" or v == "checkandsetevent"
                or v == "check_and_set_event")
              and type(row[2]) == "string" then
            rememberEvent(row[2])
          end
        end
        scriptRowsGiveGift(row, depth + 1, acc)
      end
    end
    if acc.gift and not acc.primary and acc.events[1] then
      acc.primary = acc.events[1]
    end
    return acc.gift, acc.primary, acc.events
  end
  local function normalizeTextKey(id)
    if type(id) ~= "string" then
      return ""
    end
    return id:upper():gsub("^TEXT_", ""):gsub("[^A-Z0-9]", "")
  end
  local function scanTalkTableInto(set, talk)
    if type(talk) ~= "table" then
      return
    end
    for textId, rows in pairs(talk) do
      if type(textId) == "string" and isCommandRowList(rows) then
        local ok, primary, events = scriptRowsGiveGift(rows)
        if ok then
          local info = { event = primary, events = events }
          set[textId] = info
          set[textId:upper()] = info
          set[normalizeTextKey(textId)] = info
        end
      end
    end
  end
  local function getGiftTextSet(mapId)
    if not mapId then
      return nil
    end
    local cached = giftTextCache[mapId]
    if cached ~= nil then
      return cached or nil
    end
    local set = {}
    if mod.content and mod.content.map_scripts and type(mod.content.map_scripts.get) == "function" then
      local ok, rec = pcall(function()
        return mod.content.map_scripts:get(mapId)
      end)
      if ok and type(rec) == "table" then
        scanTalkTableInto(set, rec.talk)
        if type(rec.scripts) == "table" and type(rec.scripts.talk) == "table" then
          scanTalkTableInto(set, rec.scripts.talk)
        elseif type(rec.scripts) == "table" then
          scanTalkTableInto(set, rec.scripts)
        end
      end
    end
    if mod.content and mod.content.maps and type(mod.content.maps.get) == "function" then
      local ok, mapDef = pcall(function()
        return mod.content.maps:get(mapId)
      end)
      if ok and type(mapDef) == "table" then
        scanTalkTableInto(set, mapDef.talk)
        if type(mapDef.scripts) == "table" then
          scanTalkTableInto(set, mapDef.scripts.talk or mapDef.scripts)
        end
      end
    end
    local known = KNOWN_GIFTS[mapId] or KNOWN_GIFTS[tostring(mapId):upper()]
    if known and known.texts then
      for _, tid in ipairs(known.texts) do
        local info = { event = known.events and known.events[1] or nil }
        set[tid] = info
        set[tid:upper()] = info
        set[normalizeTextKey(tid)] = info
      end
    end
    local has = false
    for _ in pairs(set) do has = true break end
    giftTextCache[mapId] = has and set or false
    return has and set or nil
  end
  local function enrichGiftTextFromGame(game, mapId)
    if not game or not mapId then return end
    local set = giftTextCache[mapId]
    if set == false or set == nil then set = {} end
    if type(set) ~= "table" then set = {} end
    local mapKeys = {
      mapId,
      tostring(mapId):upper(),
      tostring(mapId):lower(),
      tostring(mapId):gsub("%s+", "_"):upper(),
      tostring(mapId):gsub("_", ""):upper(),
    }
    local function pull(root)
      if type(root) ~= "table" then return end
      for _, key in ipairs(mapKeys) do
        local rec = root[key]
        if type(rec) == "table" then
          scanTalkTableInto(set, rec.talk)
          if type(rec.scripts) == "table" then
            scanTalkTableInto(set, rec.scripts.talk or rec.scripts)
          end
          if type(rec[1]) == "table" or type(rec[1]) == "string" then
          else
            for k, v in pairs(rec) do
              if type(k) == "string" and type(v) == "table" and isCommandRowList(v) then
                local ok, primary, events = scriptRowsGiveGift(v)
                if ok then
                  local info = { event = primary, events = events }
                  set[k] = info
                  set[k:upper()] = info
                  set[normalizeTextKey(k)] = info
                end
              end
            end
          end
        end
      end
      if type(root.talk) == "table" then
        scanTalkTableInto(set, root.talk)
      end
    end
    local data = game.data
    if type(data) == "table" then
      pull(data.map_scripts or data.mapScripts)
      pull(data.scripts)
      pull(data.mapScripts)
      pull(data.generated and data.generated.map_scripts)
      pull(data.imported and data.imported.map_scripts)
    end
    if mod.content and mod.content.map_scripts and type(mod.content.map_scripts.get) == "function" then
      for _, key in ipairs(mapKeys) do
        local ok, rec = pcall(function() return mod.content.map_scripts:get(key) end)
        if ok and type(rec) == "table" then
          scanTalkTableInto(set, rec.talk)
          if type(rec.scripts) == "table" then
            scanTalkTableInto(set, rec.scripts.talk or rec.scripts)
          end
        end
      end
    end
    local known = KNOWN_GIFTS[mapId] or KNOWN_GIFTS[tostring(mapId):upper()]
        or KNOWN_GIFTS[tostring(mapId):gsub("%s+", "_"):upper()]
        or KNOWN_GIFTS[tostring(mapId):gsub("_", ""):upper()]
    if known and known.texts then
      for _, tid in ipairs(known.texts) do
        local info = { event = known.events and known.events[1] or nil }
        set[tid] = info
        set[tid:upper()] = info
        set[normalizeTextKey(tid)] = info
      end
    end
    local has = false
    for _ in pairs(set) do has = true break end
    giftTextCache[mapId] = has and set or false
  end
  local function giftInfoForText(mapId, textId)
    if not mapId or not textId then return nil end
    local set = getGiftTextSet(mapId)
    if not set then return nil end
    local hit = set[textId] or set[textId:upper()] or set[normalizeTextKey(textId)]
    if hit then return hit end
    return nil
  end
  local function objIdx(obj)
    if type(obj) ~= "table" then return nil end
    if type(obj.def) == "table" and obj.def.index ~= nil then
      return tonumber(obj.def.index)
    end
    return tonumber(obj.index)
  end
  local function flagSet(save, name)
    if not save or name == nil or name == "" then return false end
    local function truthy(v)
      return v == true or v == 1 or v == "1"
    end
    -- Gen2: numeric event bitfield (wEventFlags) via Events or Apricorns.event
    if type(name) == "number" then
      local okE, on = pcall(function()
        local Events = require("src.world.gen2.Events")
        if type(Events) == "table" and type(Events.new) == "function" then
          local ev = Events.new()
          if type(save.events) == "table" and save.events.flags then
            ev.flags = save.events.flags
          elseif type(save.events) == "table" then
            ev.flags = save.events
          end
          return ev:get(name)
        end
        return false
      end)
      if okE and on then return true end
      local okA, on2 = pcall(function()
        local Apricorns = require("src.core.gen2.Apricorns")
        return Apricorns.event(save, name)
      end)
      if okA and on2 then return true end
      -- Bitfield: save.events[byte] with bit name%8
      if type(save.events) == "table" then
        local byte = math.floor(name / 8)
        local bitn = name % 8
        local row = save.events[byte] or save.events[tostring(byte)] or 0
        if type(row) == "number" and math.floor(row / (2 ^ bitn)) % 2 == 1 then
          return true
        end
      end
      return false
    end
    if type(name) ~= "string" then return false end
    local candidates = {
      save.flags, save.events, save.eventFlags, save.event,
      save.storyFlags, save.eventSet,
    }
    local keys = { name, name:upper(), name:lower() }
    local short = name:gsub("^EVENT_", "")
    if short ~= name then
      keys[#keys + 1] = short
      keys[#keys + 1] = short:upper()
      keys[#keys + 1] = "EVENT_" .. short
      keys[#keys + 1] = "EVENT_" .. short:upper()
    elseif not name:upper():find("^EVENT_", 1) then
      keys[#keys + 1] = "EVENT_" .. name
      keys[#keys + 1] = "EVENT_" .. name:upper()
    end
    for _, flags in ipairs(candidates) do
      if type(flags) == "table" then
        for _, k in ipairs(keys) do
          if truthy(flags[k]) then
            return true
          end
        end
      end
    end
    return false
  end
  -- Gen2: game.overworld is a facade without .events/.daytime/.fruitTree*.
  local function gscWorld(game)
    if not game then return nil end
    -- gen2 puts the real world at game.world
    if game.world and game.world.events then return game.world end
    if game.overworld and game.overworld.events then return game.overworld end
    return game.world or game.overworld
  end
  -- Gen2: event bit set in live world.events or serialized save.events
  local function gscFlag(game, flagId)
    if flagId == nil or flagId == 0xFFFF or flagId == -1 then return false end
    local id = tonumber(flagId)
    if not id then return false end
    local world = gscWorld(game)
    if world then
      local ev = world.events
      if type(ev) == "table" and type(ev.get) == "function" then
        local ok, on = pcall(function() return ev:get(id) end)
        if ok and on then return true end
      end
      if type(world.getFlag) == "function" then
        local ok, on = pcall(function() return world:getFlag(id) end)
        if ok and on then return true end
      end
    end
    local save = game and game.save
    if save and type(save.events) == "table" then
      local flags = save.events.flags or save.events
      if type(flags) == "table" then
        local byte = math.floor(id / 8)
        local bitn = id % 8
        local row = flags[byte] or flags[tostring(byte)] or 0
        if type(row) == "number" and math.floor(row / (2 ^ bitn)) % 2 == 1 then
          return true
        end
      end
    end
    return false
  end
  local giftMapKey, giftEventsForObject
  local function alreadyGot(game, obj, mapId, index)
    local save = game and game.save
    if not save then return false end
    local events = giftEventsForObject(obj, mapId)
    for _, ev in ipairs(events) do
      if type(ev) == "number" then
        if gscFlag(game, ev) then return true end
      elseif flagSet(save, ev) then
        return true
      end
    end
    local isGen2 = genOf(game) == "gold"
    local defs = defsForMap(mapId, game)
    local idx = objIdx(obj) or index
    if defs then
      for _, gdef in ipairs(defs) do
        local match = false
        if type(gdef.indices) == "table" and idx ~= nil then
          for _, gi in ipairs(gdef.indices) do
            if tonumber(idx) == tonumber(gi) then match = true break end
          end
        end
        if not match and gdef.eventId then
          match = true
        end
        if match and isGen2 and gdef.eventId and gscFlag(game, gdef.eventId) then
          return true
        end
        if match and gdef.event and flagSet(save, gdef.event) then
          return true
        end
      end
    end
    if isGen2 and gscFlag(game, 39) then
      local mk = giftMapKey(mapId)
      if mk and (mk:find("BERRY_HOUSE", 1, true) or mk:find("BERRYHOUSE", 1, true)) then
        return true
      end
    end
    local textId = textIdOf(obj)
    local info = giftInfoForText(mapId, textId)
    if info then
      if info.event and flagSet(save, info.event) then return true end
      if type(info.events) == "table" then
        for _, ev in ipairs(info.events) do
          if type(ev) == "number" and gscFlag(game, ev) then return true end
          if flagSet(save, ev) then return true end
        end
      end
    end
    local def = obj.def or obj
    if def.giftTaken or obj.giftTaken or obj.itemGiven then
      return true
    end
    -- Gen2 gift NPCs sometimes only have eventFlag on the object itself
    local ef = obj.eventFlag or def.eventFlag
    if isGen2 and ef and ef ~= 0xFFFF and ef ~= -1 and type(ef) == "number"
        and gscFlag(game, ef) then
      return true
    end
    if not isGen2 and type(ef) == "string" and flagSet(save, ef) then
      return true
    end
    -- keine Zahl — direkt über den normalisierten Kartennamen prüfen.
    local bikeKey = giftMapKey(mapId)
    if bikeKey and bikeKey:find("BIKE_SHOP", 1, true) and flagSet(save, "EVENT_GOT_BICYCLE") then
      return true
    end
    -- einzelnes benanntes "EVENT_..."-Flag (auch im Originalspiel nicht —
    -- Tausche werden über einen Index/Bitmask-Zustand verfolgt, nicht über
    local okGiver, isGiver, reason = pcall(isBlueMarker, obj, mapId, index)
    if okGiver and isGiver and reason == "trade" then
      if def.traded == true or obj.traded == true then return true end
      local tradeIndex = obj.tradeIndex or def.tradeIndex
      local idx = objIdx(obj) or obj.index or def.index
      local candidateTables = {
        save.tradesCompleted, save.completedTrades, save.tradedPokes,
        save.trades, save.tradeFlags,
      }
      for _, tab in ipairs(candidateTables) do
        if type(tab) == "table" then
          local keys = {}
          if tradeIndex ~= nil then
            keys[#keys + 1] = tradeIndex
            keys[#keys + 1] = tostring(tradeIndex)
          end
          if mapId and idx ~= nil then
            keys[#keys + 1] = tostring(mapId) .. "_obj_" .. tostring(idx)
            keys[#keys + 1] = tostring(mapId) .. "_" .. tostring(idx)
            keys[#keys + 1] = tostring(idx)
          end
          for _, k in ipairs(keys) do
            local v = tab[k]
            if v == true or v == 1 or v == "1" then return true end
          end
        end
      end
    end
    return false
  end
  giftMapKey = function(mapId)
    if not mapId then return nil end
    return tostring(mapId):upper():gsub("%s+", "_")
  end
  local TRADE_MAPS = {
    CERULEAN_TRADE_HOUSE = true, CERULEANTRADEHOUSE = true,
    ROUTE_2_TRADE_HOUSE = true, ROUTE2TRADEHOUSE = true,
    VERMILION_TRADE_HOUSE = true, VERMILIONTRADEHOUSE = true,
    ROUTE_11_GATE_2F = true, ROUTE11GATE2F = true,
    ROUTE_12_GATE_2F = true, ROUTE12GATE2F = true, -- alias used by some guides/recomps
    ROUTE_18_GATE_2F = true, ROUTE18GATE2F = true,
    CINNABAR_LAB_TRADE_ROOM = true, CINNABARLABTRADEROOM = true,
    CINNABAR_LAB_FOSSIL_ROOM = true, CINNABARLABFOSSILROOM = true,
    UNDERGROUND_PATH_ROUTE_5 = true, UNDERGROUNDPATHROUTE5 = true,
    UNDERGROUND_PATH_NORTH_SOUTH = true,
  }
  local function isTradeHouse(mapId, game)
    if genOf(game or activeGame) == "gold" then return false end
    local k = giftMapKey(mapId)
    if not k then return false end
    if TRADE_MAPS[k] then return true end
    if k:find("TRADE_HOUSE", 1, true) or k:find("TRADEHOUSE", 1, true)
        or k:find("TRADE_ROOM", 1, true) or k:find("TRADEROOM", 1, true) then
      return true
    end
    return false
  end
  -- Scan map_scripts for THIS map only: textIds with give_item / trade
  local function scriptGives(mapId, textId)
    if not mapId or not textId then return false, false end
    local set = getGiftTextSet(mapId)
    if type(set) ~= "table" then return false, false end
    local tu = type(textId) == "string" and textId:upper() or ""
    local info = set[textId] or set[tu]
    if not info then return false, false end
    local isTrade = false
    if type(info.events) == "table" then
      for _, ev in ipairs(info.events) do
        if type(ev) == "string" and ev:upper():find("TRADE", 1, true) then
          isTrade = true
          break
        end
      end
    end
    if type(tu) == "string" and tu:find("TRADE", 1, true)
        and not tu:find("TRADE_HOUSE", 1, true) then
      isTrade = true
    end
    return true, isTrade
  end

  -- scripts on the map for every NPC.
  local function isBlueMarker(obj, mapId, index)
    if not obj then return false end
    if isRedMarker(obj) then return false end

    local def = type(obj.def) == "table" and obj.def or obj
    local textId = textIdOf(obj)

    if textId ~= nil then
      local has, isTrade = scriptGives(mapId, textId)
      if has then
        return true, isTrade and "trade" or "talk-gift"
      end
    end

    -- the object itself and cannot be caused by another NPC's script.
    if def.trade == true or def.isTrade == true
        or def.tradePokemon == true or def.isTradePokemon == true
        or obj.trade == true or obj.isTrade == true
        or obj.tradePokemon == true or obj.isTradePokemon == true then
      return true, "trade-flag"
    end
    if def.giveItem == true or def.givePokemon == true
        or def.giveKeyItem == true or def.giveTM == true or def.giveHM == true
        or obj.giveItem == true or obj.givePokemon == true
        or obj.giveKeyItem == true or obj.giveTM == true or obj.giveHM == true then
      return true, "giver-flag"
    end

    local defs = defsForMap(mapId, activeGame)
    local idx = objIdx(obj) or tonumber(index)
    local tu = type(textId) == "string" and textId:upper() or ""
    if defs then
      for _, gdef in ipairs(defs) do
        local match = false
        if type(gdef.indices) == "table" and #gdef.indices > 0 and idx ~= nil then
          for _, gi in ipairs(gdef.indices) do
            if tonumber(idx) == tonumber(gi) then
              match = true
              break
            end
          end
        end
        if not match and tu ~= "" and type(gdef.hints) == "table" then
          for _, hint in ipairs(gdef.hints) do
            local hu = tostring(hint):upper()
            if #hu >= 3 and (tu == hu or tu:find(hu, 1, true)) then
              match = true
              break
            end
          end
        end
        if match then
          local trade = gdef.trade == true
          if type(gdef.event) == "string" and gdef.event:upper():find("TRADE", 1, true) then
            trade = true
          end
          return true, trade and "trade-known" or "gift-known"
        end
      end
    end
    if genOf(activeGame) == "gold" then
      local mk = giftMapKey(mapId)
      if mk and (mk:find("BERRY_HOUSE", 1, true) or mk:find("BERRYHOUSE", 1, true)
          or mk:find("BERRY_SPEECH", 1, true)) then
        if not isRedMarker(obj) and not isBerryBush(obj)
            and not isBall(obj) then
          return true, "gift-known"
        end
      end
    end

    if isTradeHouse(mapId, activeGame) then
      local k = giftMapKey(mapId)
      local TRADE_NPC_INDICES = {
        CERULEAN_TRADE_HOUSE = { 2 }, CERULEANTRADEHOUSE = { 2 },
        ROUTE_2_TRADE_HOUSE = { 2 }, ROUTE2TRADEHOUSE = { 2 },
        VERMILION_TRADE_HOUSE = { 1 }, VERMILIONTRADEHOUSE = { 1 },
        ROUTE_11_GATE_2F = { 1 }, ROUTE11GATE2F = { 1 },
        ROUTE_12_GATE_2F = { 1 }, ROUTE12GATE2F = { 1 },
        ROUTE_18_GATE_2F = { 1 }, ROUTE18GATE2F = { 1 },
        UNDERGROUND_PATH_ROUTE_5 = { 1 }, UNDERGROUNDPATHROUTE5 = { 1 },
        CINNABAR_LAB_FOSSIL_ROOM = { 2 }, CINNABARLABFOSSILROOM = { 2 },
        CINNABAR_LAB_TRADE_ROOM = { 2, 3 }, CINNABARLABTRADEROOM = { 2, 3 },
      }
      local indices = TRADE_NPC_INDICES[k]
      if type(indices) == "table" then
        local nIdx = tonumber(index) or tonumber(idx)
        for _, ti in ipairs(indices) do
          if nIdx == ti or tonumber(idx) == ti then
            return true, "trade"
          end
        end
      end
    end

    -- but only for object 1 on the actual Bike Shop map.
    local mapKey = giftMapKey(mapId)
    if mapKey and mapKey:find("BIKE_SHOP", 1, true) then
      if idx == 1 or tonumber(index) == 1 then
        return true, "bike-giver"
      end
    end

    return false
  end

 -- Freestanding overworld pokemon (Snorlax, birds, Sudowoodo, …)
  local function isOverworldMon(obj)
    if not obj then return false end
    local def = (type(obj.def) == "table" and obj.def) or obj
    if obj.pokemon or def.pokemon then return true end
    if obj.species and not isRedMarker(obj) and not (obj.item or def.item) then
      if not (obj.trainerClass or def.trainerClass) then
        return true
      end
    end
    if def.species and not (def.trainerClass or obj.trainerClass)
        and not (obj.item or def.item) then
      return true
    end
    local spr = sprId(obj)
    if type(spr) == "string" then
      local u = spr:upper()
      if u:find("SNORLAX", 1, true) or u:find("RELAXO", 1, true)
          or u:find("SUDOWOODO", 1, true) or u:find("LAPRAS", 1, true)
          or u:find("MEWTWO", 1, true) or u:find("ARTICUNO", 1, true)
          or u:find("ZAPDOS", 1, true) or u:find("MOLTRES", 1, true)
          or u:find("LUGIA", 1, true) or u:find("HO_OH", 1, true)
          or u:find("HOOH", 1, true) or u:find("CELEBI", 1, true)
          or u:find("GYARADOS", 1, true) or u:find("RED_GYARADOS", 1, true) then
        return true
      end
    end
    return false
  end
  giftEventsForObject = function(obj, mapId)
    local out = {}
    local seen = {}
    local function add(ev)
      if ev == nil or ev == "" then return end
      local key = tostring(ev)
      if not seen[key] then
        seen[key] = true
        out[#out + 1] = ev
      end
    end
    local textId = textIdOf(obj)
    local tu = type(textId) == "string" and textId:upper() or ""
    local idx = objIdx(obj)
    local defs = defsForMap(mapId, activeGame)
    if defs then
      for _, gdef in ipairs(defs) do
        local match = false
        if type(gdef.indices) == "table" and #gdef.indices > 0 and idx ~= nil then
          for _, gi in ipairs(gdef.indices) do
            if idx == gi or tonumber(idx) == tonumber(gi) then
              match = true
              break
            end
          end
        end
        if not match and tu ~= "" and type(gdef.hints) == "table" then
          for _, hint in ipairs(gdef.hints) do
            local hu = tostring(hint):upper()
            if #hu >= 3 and (tu == hu or tu:find(hu, 1, true)) then
              match = true
              break
            end
          end
        end
        if match then
          add(gdef.event)
          if gdef.eventId then add(gdef.eventId) end
        end
      end
    end
    local info = giftInfoForText(mapId, textId)
    if info then
      if info.event then add(info.event) end
      if type(info.events) == "table" then
        for _, ev in ipairs(info.events) do add(ev) end
      end
    end
    return out
  end
  local function faceOf(obj)
    if type(obj) ~= "table" then
      return "down"
    end
    local f = obj.facing or obj.direction or obj.dir or obj.face
    if f == nil and type(obj.getFacing) == "function" then
      local ok, got = pcall(obj.getFacing, obj)
      if ok then
        f = got
      end
    end
    if type(f) == "string" then
      local key = f:lower()
      if key == "up" or key == "north" or key == "n" then
        return "up"
      end
      if key == "down" or key == "south" or key == "s" then
        return "down"
      end
      if key == "left" or key == "west" or key == "w" then
        return "left"
      end
      if key == "right" or key == "east" or key == "e" then
        return "right"
      end
    end
    if type(f) == "number" then
      local map = { [0] = "down", [1] = "up", [2] = "left", [3] = "right", [4] = "down" }
      return map[f] or map[f % 4] or "down"
    end
    if type(obj.def) == "table" and type(obj.def.range) == "string" then
      local r = obj.def.range:lower()
      if r == "up" or r == "down" or r == "left" or r == "right" then
        return r
      end
    end
    return "down"
  end
  local function isPersonSpr(spr)
    if type(spr) ~= "string" then return false end
    local u = spr:upper()
    if u:find("BALL", 1, true) or u:find("FOSSIL", 1, true)
        or u:find("BOULDER", 1, true) or u:find("ROCK", 1, true)
        or u:find("TREE", 1, true) or u:find("BUSH", 1, true)
        or u:find("CUT", 1, true) or u:find("PLANT", 1, true)
        or u:find("CABLE", 1, true) or u:find("SIGN", 1, true)
        or u:find("SNORLAX", 1, true) or u:find("RELAXO", 1, true) then
      return false
    end
    return u:find("SPRITE_", 1, true) ~= nil or u:find("NPC", 1, true) ~= nil
  end
  local function isBall(obj)
    if not obj then return false end
    if obj.isHiddenItem or obj.kindHint == "hidden" then return false end
    local spr = sprId(obj)
    if type(spr) == "string" then
      local u = spr:upper()
      if u:find("BALL", 1, true) or u:find("FOSSIL", 1, true) then
        return true
      end
    end
    if itemIdOf(obj) and not isPersonSpr(spr) then
      local def = obj.def or obj
      if isRedMarker(obj) then return false end
      if def.trainerClass or def.movement or def.range then return false end
      if type(spr) == "string" and isPersonSpr(spr) then return false end
      if spr == nil or (type(spr) == "string" and spr:upper():find("BALL", 1, true)) then
        return true
      end
    end
    return false
  end
  local lastGiftReason = nil
  --   item/hidden → GREEN (pokéball)
  --   gift_npc (item reward OR in-game trade) → BLUE
  --   object (freestanding pokemon sprite, NOT a give-item) → BLUE
  --   npc → neutral
  -- Gen2 fruit/berry trees only (strict — no random TREE sprites)
  local function isBerryBush(obj, game)
    -- fruit trees only exist in GSC
    game = game or activeGame
    if genOf(game) ~= "gold" then return false end
    if not obj then return false end
    local def = (type(obj.def) == "table" and obj.def) or obj
    if obj.fruitTree == true or def.fruitTree == true then return true end
    if obj.berryTree == true or def.berryTree == true then return true end
    if type(obj.fruitTree) == "string" or type(def.fruitTree) == "string" then return true end
    if type(obj.berry) == "string" or type(def.berry) == "string" then return true end
    if type(obj.fruit) == "string" or type(def.fruit) == "string" then return true end
    local spr = sprId(obj)
    if type(spr) == "string" then
      local u = spr:upper()
      if u:find("FRUIT_TREE", 1, true) or u:find("FRUITTREE", 1, true)
          or u:find("BERRY_TREE", 1, true) or u:find("BERRYTREE", 1, true)
          or u:find("APRICORN_TREE", 1, true) or u:find("APRICORNTREE", 1, true)
          or u == "SPRITE_FRUIT_TREE" or u == "SPRITE_BERRY_TREE" then
        return true
      end
    end
    return false
  end

  -- HM Cut trees/bushes (not fruit trees)
  local function isCutBush(obj)
    if not obj or isBerryBush(obj) then return false end
    local def = (type(obj.def) == "table" and obj.def) or obj
    if def.cut == true or obj.cut == true or def.isCut == true then return true end
    local spr = sprId(obj)
    if type(spr) ~= "string" then return false end
    local u = spr:upper()
    if u:find("FRUIT", 1, true) or u:find("BERRY", 1, true) or u:find("APRICORN", 1, true) then
      return false
    end
    if u:find("CUT_TREE", 1, true) or u:find("CUTTREE", 1, true)
        or u:find("SPRITE_CUT", 1, true) or u:find("CUTTABLE", 1, true) then
      return true
    end
    if u:find("BUSH", 1, true) then return true end
    return false
  end

  -- pret FRUITTREE_* ids (const_def 1) keyed by map + cell (x,y).
  -- Used when the object def does not carry the tree id itself.
  -- GSC fruit trees: static xy from pret because live objects lose the berry id after pick
  local FRUIT_TREE_XY = {
    ROUTE_29 = { ["12,2"] = 1 },
    ROUTE29 = { ["12,2"] = 1 },
    ROUTE_30 = { ["5,39"] = 2, ["11,5"] = 5 },
    ROUTE30 = { ["5,39"] = 2, ["11,5"] = 5 },
    ROUTE_31 = { ["16,7"] = 7 },
    ROUTE31 = { ["16,7"] = 7 },
    ROUTE_33 = { ["14,16"] = 6 },
    ROUTE33 = { ["14,16"] = 6 },
    ROUTE_35 = { ["2,25"] = 11 },
    ROUTE35 = { ["2,25"] = 11 },
    ROUTE_36 = { ["21,4"] = 13 },
    ROUTE36 = { ["21,4"] = 13 },
    ROUTE_37 = { ["13,5"] = 17, ["16,5"] = 18, ["15,7"] = 19 },
    ROUTE37 = { ["13,5"] = 17, ["16,5"] = 18, ["15,7"] = 19 },
    ROUTE_38 = { ["12,10"] = 3 },
    ROUTE38 = { ["12,10"] = 3 },
    ROUTE_39 = { ["9,3"] = 15 },
    ROUTE39 = { ["9,3"] = 15 },
    ROUTE_42 = { ["27,16"] = 21, ["28,16"] = 22, ["29,16"] = 23 },
    ROUTE42 = { ["27,16"] = 21, ["28,16"] = 22, ["29,16"] = 23 },
    ROUTE_43 = { ["1,26"] = 8 },
    ROUTE43 = { ["1,26"] = 8 },
    ROUTE_44 = { ["9,5"] = 16 },
    ROUTE44 = { ["9,5"] = 16 },
    ROUTE_45 = { ["16,82"] = 12 },
    ROUTE45 = { ["16,82"] = 12 },
    ROUTE_46 = { ["7,5"] = 4, ["8,6"] = 10 },
    ROUTE46 = { ["7,5"] = 4, ["8,6"] = 10 },
    VIOLET_CITY = { ["14,29"] = 9 },
    VIOLETCITY = { ["14,29"] = 9 },
    AZALEA_TOWN = { }, -- FRUITTREE_AZALEA_TOWN = 20, coords filled if needed
    AZALEATOWN = { },
  }
  -- Gen2 fruit trees are keyed by FRUITTREE_* (1-based) in save.fruitTrees.
  -- true = already picked today (Apricorns.treePicked / World:fruitTreePicked).
  local function berryId(obj, game, mapId)
    if not obj then return nil end
    local def = (type(obj.def) == "table" and obj.def) or obj
    local candidates = {
      obj.fruitTree, def.fruitTree, obj.treeId, def.treeId,
      obj.tree, def.tree, obj.fruittree, def.fruittree,
      obj.fruit_tree, def.fruit_tree,
    }
    for _, c in ipairs(candidates) do
      if type(c) == "number" and c > 0 then return c end
      if type(c) == "string" and c ~= "" then
        local n = tonumber(c)
        if n and n > 0 then return n end
        local num = c:match("(%d+)$")
        if num then
          n = tonumber(num)
          if n and n > 0 then return n end
        end
      end
    end
    -- Script form: { op = "fruittree", tree = N } or { "fruittree", N }
    local function scanScript(rows, depth)
      if depth > 8 or type(rows) ~= "table" then return nil end
      if rows.op == "fruittree" or rows.cmd == "fruittree"
          or rows[1] == "fruittree" then
        local t = rows.tree or rows.arg1 or rows[2] or rows.id
        t = tonumber(t) or t
        if type(t) == "number" and t > 0 then return t end
      end
      for _, row in pairs(rows) do
        if type(row) == "table" then
          local hit = scanScript(row, depth + 1)
          if hit then return hit end
        end
      end
      return nil
    end
    local script = obj.script or def.script or obj.commands or def.commands
        or obj.talk or def.talk or obj.scriptKey or def.scriptKey
    if type(script) == "table" then
      local hit = scanScript(script, 0)
      if hit then return hit end
    end
    -- Resolve script key string via content/data tables
    if type(script) == "string" and script ~= "" then
      local sources = {}
      pcall(function()
        if mod.content and mod.content.scripts and mod.content.scripts.get then
          sources[#sources + 1] = mod.content.scripts:get(script)
        end
      end)
      pcall(function()
        local data = game and game.data
        if type(data) == "table" then
          local bag = data.scripts or data.map_scripts or data.generated
          if type(bag) == "table" then
            sources[#sources + 1] = bag[script] or (bag.scripts and bag.scripts[script])
          end
        end
      end)
      for _, src in ipairs(sources) do
        if type(src) == "table" then
          local hit = scanScript(src, 0)
          if hit then return hit end
        end
      end
    end
    -- Static pret FRUITTREE_* lookup by map + cell
    if mapId then
      local mk = tostring(mapId):upper():gsub("%s+", "_")
      local byXy = FRUIT_TREE_XY[mk] or FRUIT_TREE_XY[mk:gsub("_", "")]
      if byXy then
        local ox = tonumber(obj.cellX) or (def and tonumber(def.x))
        local oy = tonumber(obj.cellY) or (def and tonumber(def.y))
        if ox and oy then
          local key = tostring(math.floor(ox)) .. "," .. tostring(math.floor(oy))
          if byXy[key] then return byXy[key] end
        end
      end
    end
    return nil
  end
  local function berryLeft(game, obj, mapId)
    -- Hide when already picked today / empty
    local def = (type(obj.def) == "table" and obj.def) or obj
    if obj.berry == false or def.berry == false then return false end
    if obj.hasBerry == false or def.hasBerry == false then return false end
    if obj.fruit == false or def.fruit == false then return false end
    if obj.picked == true or def.picked == true then return false end
    if obj.empty == true or def.empty == true then return false end

    local treeId = berryId(obj, game, mapId)
    local save = game and game.save
    local world = gscWorld(game)

    -- Preferred: engine API (exact Gen2 semantics)
    if treeId then
      if world and type(world.fruitTreePicked) == "function" then
        local ok, picked = pcall(function() return world:fruitTreePicked(treeId) end)
        if ok and picked then return false end
      end
      if save then
        local okA, picked = pcall(function()
          local Apricorns = require("src.core.gen2.Apricorns")
          return Apricorns.treePicked(save, treeId)
        end)
        if okA and picked then return false end
        if type(save.fruitTrees) == "table" then
          local st = save.fruitTrees[treeId] or save.fruitTrees[tostring(treeId)]
          if st == true or st == 1 then return false end
        end
      end
    end

    -- Fallback: any save.fruitTrees entry for this map object index
    if save then
      local idx = objIdx(obj) or obj.index or (def and def.index)
      local tables = { save.fruitTrees, save.berryTrees, save.fruit_trees,
                       save.dailyFruit, save.gen2FruitTrees }
      for _, t in ipairs(tables) do
        if type(t) == "table" then
          if treeId then
            local st = t[treeId] or t[tostring(treeId)]
            if st == true or st == 1 or st == false or st == 0 then
              if st == true or st == 1 then return false end
            end
          end
          if mapId and idx ~= nil then
            local key = tostring(mapId) .. "_obj_" .. tostring(idx)
            local st = t[key] or t[idx] or t[tostring(idx)]
            if st == true or st == 1 then return false end
            if st == false or st == 0
                or (type(st) == "table" and (st.berry == false or st.picked or st.empty)) then
              return false
            end
          end
        end
      end
    end
    return true
  end
  local function kindOf(obj, mapId, index)
    if obj.isHiddenItem or obj.kindHint == "hidden" then return "hidden" end
    local def = (type(obj.def) == "table" and obj.def) or obj
    if isOverworldMon(obj) then return "object" end
    if isCutBush(obj) then return "cut" end
    -- Berry/fruit tree with available berry → green item marker
    if isBerryBush(obj) then
      return "item"
    end
    local hasItem = (obj.item and obj.item ~= 0 and obj.item ~= "0")
        or (def.item and def.item ~= 0 and def.item ~= "0")
    if hasItem then return "item" end
    if isRedMarker(obj) then return "trainer" end
    -- FIX: a poke-ball SPRITE (e.g. the 5 starter/free balls on Oak's table)
    -- used to fall through to isBlueMarker() first, which flags anything
    -- that "gives" the player something on interaction -- including those
    -- balls -- as kind='gift_npc' (NPC ITEM color). Visually it's a ball
    -- icon, so it should always be kind='item' (ITEMS color) regardless of
    -- what the interaction grants. isBall() is now checked before
    -- isBlueMarker() so the sprite, not the gift logic, decides this case.
    -- Only NPCs with a person sprite (not a ball/fossil sprite) can still
    -- become gift_npc (NPC ITEM / NPC TRADE).
    if isBall(obj) then return "item" end
    local isGiver, reason = isBlueMarker(obj, mapId, index)
    if isGiver then
      lastGiftReason = reason
      return "gift_npc"
    end
    return "npc"
  end
  local spriteCache = {}
  local function colorMode(game)
    local v = opt(game, "minimap_map_color", "recomp")
    if v == "og" or v == "gbc" or v == "recomp" then
      return v
    end
    -- wipe bad values (e.g. marker color names written by mistake)
    if game then
      pcall(setOpt, game, "minimap_map_color", "recomp")
    end
    return "recomp"
  end

  local NPC_PALETTE = {
    { 250, 242, 222 },
    { 235, 168, 90 },
    { 140, 90, 55 },
    { 35, 25, 20 },
  }
  local TRAINER_PALETTE = {
    { 250, 235, 230 },
    { 235, 70, 55 },
    { 150, 30, 25 },
    { 30, 10, 10 },
  }
  local PLAYER_PALETTE = {
    { 245, 240, 235 },
    { 225, 40, 40 },
    { 40, 80, 170 },
    { 20, 15, 15 },
  }
  local POKEBALL_PALETTE = {
    { 250, 250, 250 },
    { 230, 40, 40 },
    { 140, 20, 20 },
    { 20, 20, 20 },
  }

  local ITEM_PALETTE = POKEBALL_PALETTE
  -- Original Game Boy look for player/NPC/item markers on the minimap.
  -- Mirrors the neutral 4-shade fallback already used by drawPokeballIcon
  -- so OG mode is visually consistent (monochrome) across all markers.
  local OG_MARKER_PALETTE = {
    { 255, 255, 255 },
    { 190, 190, 190 },
    { 90, 90, 90 },
    { 20, 20, 20 },
  }
  local function recolorImageDataFromPath(imgPath, palette)
    if not love.image or not love.image.newImageData then
      return nil
    end
    local okData, data = pcall(love.image.newImageData, imgPath)
    if not okData or not data then
      return nil
    end
    local iw, ih = data:getWidth(), data:getHeight()

    do
      local samples, chroma = 0, 0
      local step = math.max(1, math.floor(math.max(iw, ih) / 24))
      for y = 0, ih - 1, step do
        for x = 0, iw - 1, step do
          local r, g, b, a = data:getPixel(x, y)
          if a and a > 0.1 then
            samples = samples + 1
            chroma = chroma + (math.max(r, g, b) - math.min(r, g, b))
          end
        end
      end
      local mostlyGray = samples < 1 or (chroma / samples) < 0.06
      if not mostlyGray then
        return nil
      end
    end
    local out = love.image.newImageData(iw, ih)
    for y = 0, ih - 1 do
      for x = 0, iw - 1 do
        local r, g, b, a = data:getPixel(x, y)
        if a and a > 0 then
          local lum = r * 0.2126 + g * 0.7152 + b * 0.0722
          local shade = lum > 0.83 and 1 or (lum > 0.5 and 2 or (lum > 0.17 and 3 or 4))
          local c = palette[shade]
          out:setPixel(x, y, c[1] / 255, c[2] / 255, c[3] / 255, a)
        else
          out:setPixel(x, y, 0, 0, 0, 0)
        end
      end
    end
    local okImg, colored = pcall(love.graphics.newImage, out)
    if okImg and colored then
      pcall(function()
        colored:setFilter("nearest", "nearest")
      end)
      return colored
    end
    return nil
  end
  -- Same luminance-to-palette remap as recolorImageDataFromPath, but always
  -- applies regardless of the source sprite's original colorfulness. The
  -- gated version above only recolors already-near-grayscale GBC-style art;
  -- OG mode needs to flatten full-color recomp sprites into a monochrome
  -- look too, so it must skip that "mostlyGray" bailout.
  local function recolorImageDataForced(imgPath, palette)
    if not love.image or not love.image.newImageData then
      return nil
    end
    local okData, data = pcall(love.image.newImageData, imgPath)
    if not okData or not data then
      return nil
    end
    local iw, ih = data:getWidth(), data:getHeight()
    local out = love.image.newImageData(iw, ih)
    for y = 0, ih - 1 do
      for x = 0, iw - 1 do
        local r, g, b, a = data:getPixel(x, y)
        if a and a > 0 then
          local lum = r * 0.2126 + g * 0.7152 + b * 0.0722
          local shade = lum > 0.83 and 1 or (lum > 0.5 and 2 or (lum > 0.17 and 3 or 4))
          local c = palette[shade]
          out:setPixel(x, y, c[1] / 255, c[2] / 255, c[3] / 255, a)
        else
          out:setPixel(x, y, 0, 0, 0, 0)
        end
      end
    end
    local okImg, colored = pcall(love.graphics.newImage, out)
    if okImg and colored then
      pcall(function()
        colored:setFilter("nearest", "nearest")
      end)
      return colored
    end
    return nil
  end
  local function tryLoadImage(path, palette, forceRecolor)
    if type(path) ~= "string" then return nil end
    local paths = { path, "assets/" .. path, "assets/generated/" .. path, "assets/generated/sprites/" .. path }
    local seen, uniq = {}, {}
    for _, pth in ipairs(paths) do
      if not seen[pth] then
        seen[pth] = true
        uniq[#uniq + 1] = pth
      end
    end
    for _, pth in ipairs(uniq) do
      if palette then
        local colored
        if forceRecolor then
          colored = recolorImageDataForced(pth, palette)
        else
          colored = recolorImageDataFromPath(pth, palette)
        end
        if colored then return colored end
      end
      if not (palette and forceRecolor) then
        local ok, img = pcall(love.graphics.newImage, pth)
        if ok and img then
          pcall(function() img:setFilter("nearest", "nearest") end)
          return img
        end
      end
    end
    -- last resort: raw image even if forceRecolor failed
    for _, pth in ipairs(uniq) do
      local ok, img = pcall(love.graphics.newImage, pth)
      if ok and img then
        pcall(function() img:setFilter("nearest", "nearest") end)
        return img
      end
    end
    return nil
  end
  local STANDING_FRAME = {
    down = 0,
    up = 1,
    left = 2,
    right = 2,
  }
  local function normalizeFacing(facing)
    if type(facing) ~= "string" then
      return "down"
    end
    local f = facing:lower()
    if f == "up" or f == "north" or f == "n" then
      return "up"
    end
    if f == "down" or f == "south" or f == "s" then
      return "down"
    end
    if f == "left" or f == "west" or f == "w" then
      return "left"
    end
    if f == "right" or f == "east" or f == "e" then
      return "right"
    end
    return "down"
  end
  local function lookupStandingInFrames(frames, facing)
    if type(frames) ~= "table" then
      return nil
    end
    local candidates = {
      facing,
      facing .. "_idle",
      facing .. "_stand",
      "idle_" .. facing,
      "stand_" .. facing,
    }
    for _, key in ipairs(candidates) do
      local f = frames[key]
      if type(f) == "number" then
        return f
      end
      if type(f) == "table" then
        if type(f.frame) == "number" then
          return f.frame
        end
        if f.quad then
          return f
        end
        if type(f[1]) == "number" then
          return f[1]
        end
        if type(f[1]) == "table" then
          if f[1].quad then
            return f[1]
          end
          if type(f[1].frame) == "number" then
            return f[1].frame
          end
        end
      end
    end
    return nil
  end
  local function standingFrameIndex(def, facing)
    facing = normalizeFacing(facing)
    local frames = type(def) == "table" and (def.frames or def.directionFrames) or nil
    if facing == "right" then
      local rightHit = lookupStandingInFrames(frames, "right")
      local leftHit = lookupStandingInFrames(frames, "left")
      if rightHit ~= nil then
        if type(rightHit) == "number" and type(leftHit) == "number" and rightHit == leftHit then
          return leftHit
        end
        if type(rightHit) == "table" then
          return rightHit
        end
        if type(leftHit) ~= "number" or rightHit ~= leftHit then
          return rightHit
        end
      end
      if type(leftHit) == "number" then
        return leftHit
      end
      if type(leftHit) == "table" then
        return leftHit
      end
      return STANDING_FRAME.left
    end
    local hit = lookupStandingInFrames(frames, facing)
    if hit ~= nil then
      return hit
    end
    return STANDING_FRAME[facing] or 0
  end
  local function loadSpriteFrame(spriteId, facing, palette, paletteTag, forceRecolor)
    if not spriteId or type(spriteId) ~= "string" then
      return nil
    end
    facing = normalizeFacing(facing)
    local cacheKey = spriteId .. ":stand:" .. facing .. (paletteTag and (":" .. paletteTag) or "")
    local cached = spriteCache[cacheKey]
    if cached ~= nil then
      return cached or nil
    end
    local def = nil
    if mod.content and mod.content.sprites and type(mod.content.sprites.get) == "function" then
      local ok, d = pcall(function()
        return mod.content.sprites:get(spriteId)
      end)
      if ok then
        def = d
      end
    end
    if type(def) ~= "table" or not def.image then
      spriteCache[cacheKey] = false
      return nil
    end
    local img = tryLoadImage(def.image, palette, forceRecolor)
    if not img then
      spriteCache[cacheKey] = false
      return nil
    end
    local fw = tonumber(def.frameWidth) or 16
    local fh = tonumber(def.frameHeight) or 16
    local iw, ih = img:getWidth(), img:getHeight()
    local cols = math.max(1, math.floor(iw / fw))
    local rows = math.max(1, math.floor(ih / fh))
    local maxFrame = cols * rows - 1
    local function makeEntry(frameIndex, flipX)
      if frameIndex < 0 or frameIndex > maxFrame then
        return nil
      end
      local fx = (frameIndex % cols) * fw
      local fy = math.floor(frameIndex / cols) * fh
      if fx + fw > iw or fy + fh > ih then
        return nil
      end
      return {
        image = img,
        quad = love.graphics.newQuad(fx, fy, fw, fh, iw, ih),
        fw = fw,
        fh = fh,
        flipX = flipX and true or nil,
      }
    end
    local picked = standingFrameIndex(def, facing)
    local flipX = (facing == "right")
    if type(picked) == "table" and picked.quad then
      local entry = {
        image = img,
        quad = picked.quad,
        fw = fw,
        fh = fh,
        flipX = picked.flipX or (facing == "right" and not picked.noFlip) or nil,
      }
      if facing == "right" and def and def.frames and def.frames.right and not picked.flipX then
        entry.flipX = nil
      end
      spriteCache[cacheKey] = entry
      return entry
    end
    local frame = type(picked) == "number" and picked or (STANDING_FRAME[facing] or 0)
    if facing == "right" then
      local leftPicked = standingFrameIndex(def, "left")
      local leftIdx = type(leftPicked) == "number" and leftPicked or STANDING_FRAME.left
      local rightPicked = lookupStandingInFrames(
        type(def) == "table" and (def.frames or def.directionFrames) or nil,
        "right"
      )
      if type(rightPicked) == "number" and rightPicked ~= leftIdx then
        frame = rightPicked
        flipX = false
      else
        frame = leftIdx
        flipX = true
      end
    end
    local entry = makeEntry(frame, flipX)
    if not entry then
      entry = makeEntry(STANDING_FRAME.left or 2, facing == "right")
    end
    if not entry then
      entry = makeEntry(0, false)
    end
    if not entry then
      spriteCache[cacheKey] = false
      return nil
    end
    spriteCache[cacheKey] = entry
    return entry
  end
  local function spriteFromEntity(obj, facing)
    local sr = obj and obj.sprite
    if type(sr) ~= "table" then
      return nil
    end
    facing = normalizeFacing(facing)
    local img = sr.image
    if type(img) == "string" then
      img = tryLoadImage(img)
    end
    if type(sr.resolveImage) == "function" then
      local ok, resolved = pcall(function()
        return sr:resolveImage()
      end)
      if ok and resolved then
        img = resolved
        if type(img) == "string" then
          img = tryLoadImage(img)
        end
      end
    end
    if not img or type(img) ~= "userdata" or type(img.getWidth) ~= "function" then
      return nil
    end
    local fw = tonumber(sr.frameWidth) or 16
    local fh = tonumber(sr.frameHeight) or 16
    local frames = sr.frames or sr.directionFrames
    local flipX = false
    local frame = STANDING_FRAME[facing] or 0
    if facing == "right" then
      local rightHit = lookupStandingInFrames(frames, "right")
      local leftHit = lookupStandingInFrames(frames, "left")
      if type(rightHit) == "table" and rightHit.quad then
        return { image = img, quad = rightHit.quad, fw = fw, fh = fh }
      end
      if type(rightHit) == "number"
          and type(leftHit) == "number"
          and rightHit ~= leftHit then
        frame = rightHit
        flipX = false
      else
        if type(leftHit) == "table" and leftHit.quad then
          return { image = img, quad = leftHit.quad, fw = fw, fh = fh, flipX = true }
        end
        frame = type(leftHit) == "number" and leftHit or STANDING_FRAME.left
        flipX = true
      end
    else
      local hit = lookupStandingInFrames(frames, facing)
      if type(hit) == "table" and hit.quad then
        return { image = img, quad = hit.quad, fw = fw, fh = fh }
      end
      if type(hit) == "number" then
        frame = hit
      else
        frame = STANDING_FRAME[facing] or 0
      end
    end
    if type(sr.getFrameGeometry) == "function" then
      local ok, geo = pcall(function()
        return sr:getFrameGeometry(frame)
      end)
      if ok and geo and geo.quad then
        return { image = img, quad = geo.quad, fw = fw, fh = fh, flipX = flipX or nil }
      end
    end
    local iw, ih = img:getWidth(), img:getHeight()
    local cols = math.max(1, math.floor(iw / fw))
    local rows = math.max(1, math.floor(ih / fh))
    local maxFrame = cols * rows - 1
    if frame < 0 or frame > maxFrame then
      frame = flipX and (STANDING_FRAME.left or 2) or 0
      if frame > maxFrame then
        frame = 0
        flipX = false
      end
    end
    local fx = (frame % cols) * fw
    local fy = math.floor(frame / cols) * fh
    local quad = love.graphics.newQuad(
      fx,
      fy,
      math.min(fw, iw - fx),
      math.min(fh, ih - fy),
      iw,
      ih
    )
    return { image = img, quad = quad, fw = fw, fh = fh, flipX = flipX or nil }
  end
  local function resolveGbcMarkerPalette(game, mapId)
    if colorMode(game) ~= "gbc" then return nil end
    local ver = genOf(game)
    if ver == "gold" then
      return nil
    end
    local okP, P = pcall(require, "src.render.PaletteFX")
    if okP and P and type(P.ogObj) == "function" then
      local ok, colors = pcall(function()
        local c = P.ogObj()
        if type(c) == "table" and c.colors then return c.colors end
        return c
      end)
      if ok and colors then
        return pal4(colors) or colors
      end
    end
    return { {255,255,255}, {123,255,49}, {0,132,0}, {0,0,0} }
  end

  local function resolveGoldRecompMarkerPalette(game, obj)
    local world = game and game.world
    if not world then return nil end
    local okP, Palettes = pcall(require, "src.world.gen2.Palettes")
    if not okP or not Palettes then return nil end
    local spriteDef = obj and (obj.spriteDef or (obj.sprite and obj.sprite.def))
    if not spriteDef and mod.content and mod.content.sprites
        and type(mod.content.sprites.get) == "function" then
      for _, id in ipairs({
        "SPRITE_POKE_BALL", "SPRITE_BALL", "SPRITE_POKEBALL",
        "SPRITE_ITEM_BALL", "POKE_BALL", "BALL", "ITEM_BALL"
      }) do
        local ok, d = pcall(function() return mod.content.sprites:get(id) end)
        if ok and type(d) == "table" then
          spriteDef = d
          break
        end
      end
    end
    if not spriteDef then return nil end
    local daytime = world.daytime
    if not daytime and type(world.hour) == "function" then
      local ok, hour = pcall(function() return world:hour() end)
      if ok then daytime = Palettes.daytimeFor(world.map and world.map.def, hour, world.flashUsed) end
    end
    daytime = daytime or "DAY"
    local colors = nil
    pcall(function()
      colors = Palettes.spritePalette(world.palettes, daytime, spriteDef, obj and obj.def)
    end)
    return colors
  end

  local function resolveRecompMarkerPalette(game, obj, mapId)
    local mode = colorMode(game)
    if mode ~= "recomp" then return nil end
    local ver = genOf(game)
    if ver == "gold" then
      return resolveGoldRecompMarkerPalette(game, obj)
    end
    local okP, P = pcall(require, "src.render.PaletteFX")
    if not okP or not P or not P.usesGbcPack or not P.usesGbcPack() then
      return nil
    end
    local def = obj and (obj.spriteDef or obj.def)
    if not def and mod.content and mod.content.sprites
        and type(mod.content.sprites.get) == "function" then
      for _, id in ipairs({
        "SPRITE_POKE_BALL", "SPRITE_BALL", "SPRITE_POKEBALL",
        "SPRITE_ITEM_BALL", "POKE_BALL", "BALL", "ITEM_BALL"
      }) do
        local ok, d = pcall(function() return mod.content.sprites:get(id) end)
        if ok and type(d) == "table" then
          def = d
          break
        end
      end
    end
    local colors = nil
    pcall(function() colors = P.spriteObp(def, obj and (obj.id or obj.index or mapId)) end)
    return colors
  end

  local function getPokeballSprite(palette, paletteTag)
    for _, id in ipairs({
      "SPRITE_POKE_BALL", "SPRITE_BALL", "SPRITE_POKEBALL", "SPRITE_ITEM_BALL",
      "SPRITE_POKE_BALL_ITEM", "POKE_BALL", "BALL", "ITEM_BALL",
      "SPRITE_OBJ_POKE_BALL", "SPRITE_FIELD_POKE_BALL", "SPRITE_HIDDEN_ITEM",
    }) do
      local s = loadSpriteFrame(id, "down", palette, paletteTag or "ball")
      if s then
        return s
      end
    end
    return nil
  end

local function drawPokeballIcon(px, py, r, mode, game, mapId, obj)
  local p = nil
  if mode == "og" then
    p = OG_MARKER_PALETTE
  elseif mode == "gbc" then
    p = resolveGbcMarkerPalette(game, mapId) or ITEM_PALETTE
  elseif mode == "recomp" then
    if genOf(game) == "gold" then
      p = resolveGoldRecompMarkerPalette(game, obj)
    else
      p = resolveRecompMarkerPalette(game, obj, mapId)
    end
    p = p or ITEM_PALETTE
  end
  p = p or OG_MARKER_PALETTE
  local function c(i)
    local q = p[i] or p[#p] or {255,255,255}
    love.graphics.setColor(q[1]/255, q[2]/255, q[3]/255, 1)
  end
  love.graphics.push()
  c(2); love.graphics.arc("fill", px, py, r, 0, math.pi)
  c(3); love.graphics.arc("fill", px, py, r, math.pi, math.pi * 2)
  c(4); love.graphics.setLineWidth(math.max(1, r * 0.28)); love.graphics.line(px-r, py, px+r, py)
  love.graphics.setLineWidth(1.2); love.graphics.circle("line", px, py, r)
  c(1); love.graphics.circle("fill", px, py, r * 0.32)  -- FIX: * hinzugefügt
  c(4); love.graphics.setLineWidth(1); love.graphics.circle("line", px, py, r * 0.32)  -- FIX: * hinzugefügt
  love.graphics.setColor(1,1,1,1)
  love.graphics.pop()
end
  
  local function drawSpriteMarker(spr, px, py, markerSize, facing, tint)
    if not spr or not spr.image or not spr.quad then
      return false
    end
    local fw = spr.fw or 16
    local fh = spr.fh or 16
    local scale = markerSize / math.max(fw, fh)
    local dw = fw * scale
    local dh = fh * scale
    local sx = scale
    local ox = -dw / 2
    if spr.flipX then
      sx = -scale
      ox = dw / 2
    end
    love.graphics.push()
    love.graphics.translate(px, py)
    if tint then
      love.graphics.setColor(tint[1], tint[2], tint[3], tint[4] or 1)
    else
      love.graphics.setColor(1, 1, 1, 1)
    end
    love.graphics.draw(spr.image, spr.quad, ox, -dh / 2, 0, sx, scale)
    love.graphics.pop()
    love.graphics.setColor(1, 1, 1, 1)
    return true
  end
  local function drawGlow(px, py, radius, r, g, b)
    love.graphics.setColor(r, g, b, 0.35)
    love.graphics.circle("fill", px, py, radius * 1.9)
    love.graphics.setColor(1, 1, 1, 0.9)
    love.graphics.setLineWidth(1.5)
    love.graphics.circle("line", px, py, radius * 1.9)
    love.graphics.setColor(1, 1, 1, 1)
  end
  local function getHiddenItems(game, mapId)
    local out = {}
    local seen = {}
    local srcCounts = { field = 0, mapOverview = 0, contentField = 0 }
    local function add(x, y, src)
      x, y = tonumber(x), tonumber(y)
      if not x or not y then return end
      local k = x .. ":" .. y
      if seen[k] then return end
      seen[k] = true
      out[#out + 1] = { x = x, y = y }
      if src then srcCounts[src] = (srcCounts[src] or 0) + 1 end
    end
    local data = game and game.data
    local field = data and data.field
    local rows = field and field.hiddenItems and field.hiddenItems[mapId]
    if type(rows) == "table" then
      for _, row in ipairs(rows) do
        if type(row) == "table" then
          add(row.x or row[1], row.y or row[2], "field")
        end
      end
    end
    if mod.world and type(mod.world.mapOverview) == "function" then
      local ok, overview = pcall(function() return mod.world:mapOverview() end)
      if ok and type(overview) == "table" and type(overview.markers) == "table" then
        for _, m in ipairs(overview.markers) do
          if m.kind == "hidden" then
            add(m.x, m.y, "mapOverview")
          end
        end
      end
    end
    if #out == 0 and mod.content and mod.content.field then
      local f = mod.content.field
      if type(f.get) == "function" then
        local ok, hi = pcall(function() return f:get("hiddenItems") end)
        if ok and type(hi) == "table" and type(hi[mapId]) == "table" then
          for _, row in ipairs(hi[mapId]) do
            if type(row) == "table" then
              add(row.x or row[1], row.y or row[2], "contentField")
            end
          end
        end
      end
    end
    return out, srcCounts
  end
  local function isHiddenTaken(game, mapId, x, y)
    local save = game and game.save
    if not save or type(save.hiddenTaken) ~= "table" then return false end
    x, y = tonumber(x), tonumber(y)
    if not x or not y then return false end
    -- %d requires an exact integer; coordinates can arrive as floats
    -- (e.g. 5.0) which used to throw and take the whole hidden-item layer down
    local key = string.format("%s_%d_%d", tostring(mapId), math.floor(x + 0.5), math.floor(y + 0.5))
    return not not save.hiddenTaken[key]
  end
  local function isTrainerDefeated(game, obj, mapId)
    local def = (type(obj.def) == "table" and obj.def) or obj
    -- Gen2: trainer.event / eventFlag set when beaten
    if genOf(game) == "gold" then
      local tr = obj.trainer or (def and def.trainer)
      local ef = nil
      if type(tr) == "table" then
        ef = tr.event or tr.eventFlag or tr.flag
      end
      ef = ef or obj.eventFlag or (def and def.eventFlag)
      if ef and ef ~= 0xFFFF and ef ~= -1 and type(ef) == "number" then
        if gscFlag(game, ef) then return true end
      end
    end
    local save = game and game.save
    if not save or type(save.defeatedTrainers) ~= "table" then
      return false
    end
    local idx = objIdx(obj)
    if mapId and idx ~= nil then
      local key = string.format("%s_obj_%s", tostring(mapId), tostring(idx))
      if save.defeatedTrainers[key] then
        return true
      end
      if save.defeatedTrainers[tostring(idx)] then
        return true
      end
    end
    if obj.id and save.defeatedTrainers[obj.id] then
      return true
    end
    if type(def) == "table" and def.id and save.defeatedTrainers[def.id] then
      return true
    end
    local tc = obj.trainerClass or (type(def) == "table" and def.trainerClass)
    if tc and mapId then
      local key2 = string.format("%s_%s", tostring(mapId), tostring(tc))
      if save.defeatedTrainers[key2] then
        return true
      end
    end
    return false
  end
  local function isObjectTaken(game, obj, mapId)
    if not obj then return false end
    local def = (type(obj.def) == "table" and obj.def) or obj
    local ef = obj.eventFlag or def.eventFlag or obj.event_flag or def.event_flag
    local isGen2 = genOf(game) == "gold"
    -- Gen1: named string flags. Gen2: numeric bitfield. Never cross-read.
    if ef ~= nil and ef ~= 0xFFFF and ef ~= -1 and ef ~= 0 then
      if isGen2 and type(ef) == "number" then
        if gscFlag(game, ef) then return true end
      elseif type(ef) == "string" then
        local save = game and game.save
        if save and flagSet(save, ef) then return true end
      end
    end
    local save = game and game.save
    if not save then return false end
    local tables = {}
    if type(save.itemsTaken) == "table" then tables[#tables + 1] = save.itemsTaken end
    if type(save.itemTaken) == "table" then tables[#tables + 1] = save.itemTaken end
    if type(save.takenItems) == "table" then tables[#tables + 1] = save.takenItems end
    if type(save.pickedItems) == "table" then tables[#tables + 1] = save.pickedItems end
    local idx = objIdx(obj) or obj.index or (def and def.index)
    local name = obj.name or (def and def.name)
    local keys = {}
    if obj.id then keys[#keys + 1] = obj.id end
    if mapId and idx ~= nil then
      keys[#keys + 1] = tostring(mapId) .. "_obj_" .. tostring(idx)
      keys[#keys + 1] = tostring(mapId) .. "_" .. tostring(idx)
      keys[#keys + 1] = tostring(idx)
    end
    if name then
      keys[#keys + 1] = name
      if mapId then keys[#keys + 1] = tostring(mapId) .. "_" .. tostring(name) end
    end
    for _, tab in ipairs(tables) do
      for _, k in ipairs(keys) do
        if tab[k] then return true end
      end
    end
    return false
  end
  local function isObjectHidden(game, obj, mapId)
    -- Do NOT treat visible==false alone as hidden: Gen2 sets that while
    -- script text is on screen (Mom talking, etc.) and the sprites come
    -- back after. Permanent disappearance uses hidden/removed/despawned.
    if obj.removed == true or obj.despawned == true or obj.hidden == true then
      return true
    end
    local def = obj.def or obj
    local ef = obj.eventFlag or def.eventFlag or obj.event_flag or def.event_flag
    local isGen2 = genOf(game) == "gold"
    if ef ~= nil and ef ~= 0xFFFF and ef ~= -1 and ef ~= 0 then
      -- Gen2 object event_flag: hide when set — but ONLY for things that
      -- actually leave the map (item balls, temporary props). Permanent
      -- person NPCs (Mom after giving the Pokégear, clerks, …) often carry
      -- the *gift-received* flag on the same field; the overworld keeps
      -- drawing them, so the minimap must too.
      local spr = sprId(obj)
      local person = isPersonSpr(spr)
      local itemish = isBall(obj)
          or (obj.item and obj.item ~= 0 and obj.item ~= "0")
          or (def.item and def.item ~= 0 and def.item ~= "0")
      local tempProp = (not person) and (not isRedMarker(obj))
      if itemish or tempProp then
        if isGen2 and type(ef) == "number" then
          if gscFlag(game, ef) then return true end
        elseif type(ef) == "string" then
          local save = game and game.save
          if save and flagSet(save, ef) then return true end
        end
      end
      -- person / trainer: eventFlag alone never removes them from the minimap
    end
    local save = game and game.save
    if not save then return false end
    local name = obj.name or (def and def.name)
    if name and mapId and type(save.objectToggles) == "table"
        and type(save.objectToggles[mapId]) == "table"
        and save.objectToggles[mapId][name] == false then
      return true
    end
    local idx = objIdx(obj)
    if mapId and idx ~= nil and type(save.objectToggles) == "table"
        and type(save.objectToggles[mapId]) == "table" then
      local t = save.objectToggles[mapId]
      if t[idx] == false or t[tostring(idx)] == false then
        return true
      end
    end
    -- Taken item balls always hide (engine removes them)
    local hasItem = (obj.item and obj.item ~= 0 and obj.item ~= "0")
        or (def.item and def.item ~= 0 and def.item ~= "0")
        or isBall(obj)
    if hasItem and isObjectTaken(game, obj, mapId) then
      return true
    end
    -- Static pokemon gone after battle
    local hasPokemon = obj.pokemon or def.pokemon
    if hasPokemon and type(save.defeatedTrainers) == "table" then
      local key = (mapId and idx ~= nil) and (tostring(mapId) .. "_obj_" .. tostring(idx))
      if (key and save.defeatedTrainers[key]) or (obj.id and save.defeatedTrainers[obj.id]) then
        return true
      end
    end
    return false
  end

  local function screenBlob(obj)
    if type(obj) ~= "table" then return "" end
    local bits = {
      obj.screenId, obj.id, obj.name, obj.type, obj.key, obj.state,
      obj.class, obj.className, obj.scene, obj.mode, obj.kind,
      obj.__name, obj.screen, obj.label, obj.title,
    }
    local mt = getmetatable(obj)
    if type(mt) == "table" and type(mt.__name) == "string" then
      bits[#bits + 1] = mt.__name
    end
    local s = ""
    for i = 1, #bits do
      local v = bits[i]
      if type(v) == "string" and #v > 0 then
        s = s .. " " .. v:upper()
      end
    end
    return s
  end

  local BLOCKED_KWS = {
    "BATTLE", "FIGHT", "TRANSITION",
    "INTRO", "TITLE", "TUTORIAL", "NEWGAME", "NEW_GAME",
    "CUTSCENE", "CINEMATIC", "PROFESSOR",
    "NAMING", "STARTER", "GENDER",
    "MENU", "PAUSE", "BAG", "PARTY", "POKEDEX", "SAVE", "OPTIONS",
    "PC", "MART", "SHOP",
  }

  local function kwBlocked(blob)
    if not blob or blob == "" then return false end
    for i = 1, #BLOCKED_KWS do
      if blob:find(BLOCKED_KWS[i], 1, true) then return true end
    end
    return false
  end

  local function isDialog(top)
    if type(top) ~= "table" then return false end
    if top.isDialog or top.isTextBox or top.isMessage or top.isSpeech
        or top.isScriptedText or top.isText or top.textbox then
      return true
    end
    local b = screenBlob(top)
    if b:find("DIALOG", 1, true) then return true end
    if b:find("TEXTBOX", 1, true) then return true end
    if b:find("MESSAGE", 1, true) then return true end
    if b:find("YESNO", 1, true) then return true end
    if b:find("CHOICEBOX", 1, true) then return true end
    if b:find("SPEECH", 1, true) then return true end
    if b:find("SCRIPT_TEXT", 1, true) or b:find("SCRIPTEDTEXT", 1, true) then return true end
    if b:find("TALK", 1, true) and not b:find("BATTLE", 1, true) then return true end
    -- Gen2 Mom / NPC script windows are often opaque text layers without
    -- isDialog set; treat plain opaque text-only frames as dialog so the
    -- minimap stays up and markers keep drawing.
    if top.isOpaque and (top.text or top.lines or top.message or top.speaker) then
      return true
    end
    return false
  end

  local function isOW(game, top)
    if type(top) ~= "table" then return false end
    if top == game.overworld or top == game.world then return true end
    return top.isOverworld == true
  end

  local function blocksHud(game, top)
    if type(top) ~= "table" then return false end
    if isOW(game, top) then return false end
    if isDialog(top) then return false end
    if top.isBattle or top.isBattleState then return true end
    if top.isOpaque then return true end
    if top.isIntro or top.isTitle or top.isCutscene then return true end
    return kwBlocked(screenBlob(top))
  end

  local function allFrames(stack)
    local frames = {}
    if not stack then return frames end
    if type(stack.top) == "function" then
      local ok, top = pcall(function() return stack:top() end)
      if ok and top then frames[#frames + 1] = top end
    end
    local keys = { "states", "frames", "items" }
    for k = 1, #keys do
      local list = stack[keys[k]]
      if type(list) == "table" then
        for j = 1, #list do
          frames[#frames + 1] = list[j]
        end
      end
    end
    for i = 1, 8 do
      if type(stack[i]) == "table" then
        frames[#frames + 1] = stack[i]
      end
    end
    return frames
  end

  local hidePhase = {
    boot=true, error=true, title=true, menu=true,
    intro=true, battle=true, naming=true, newgame=true,
  }

  -- hide during oak intro, naming, and battles (stack can leave overworld underneath)
  local function canShow(game)
    if not game then return false end
    local phase = tostring(game.phase or ""):lower()
    if hidePhase[phase] then return false end

    if game.battle or game.inBattle or game.isBattle
        or game.battleState or game.battleScene or game.currentBattle then
      return false
    end
    if game.intro or game.inIntro or game.isIntro or game.titleScreen or game.inTitle then
      return false
    end

    local world = game.world
    if world and (world.battleActive or world.inBattle or world.battle) then
      return false
    end
    local ow = game.overworld
    if ow and (ow.battleActive or ow.inBattle or ow.battle or ow.isBattle) then
      return false
    end

    for _, fr in ipairs(allFrames(game.stack)) do
      if blocksHud(game, fr) then return false end
    end

    if phase == "play" and world and world.map and not world.battle then
      return true
    end
    if ow and ow.map and not (ow.battle or ow.inBattle) then
      return true
    end
    return false
  end

  local mapCanvasCache = {}
  local mapCanvasOrder = {}
  local MAP_CANVAS_CACHE_LIMIT = 8
  local function releaseCanvasEntry(entry)
    if type(entry) ~= "table" or entry.fromOverview then return end
    local c = entry.canvas
    if c and type(c) == "userdata" and type(c.release) == "function" then
      pcall(function() c:release() end)
    end
  end
  local function cacheMapCanvas(cacheKey, built)
    local old = mapCanvasCache[cacheKey]
    if old and old ~= built then
      releaseCanvasEntry(old)
    end
    mapCanvasCache[cacheKey] = built
    mapCanvasOrder[#mapCanvasOrder + 1] = cacheKey
    while #mapCanvasOrder > MAP_CANVAS_CACHE_LIMIT do
      local oldKey = table.remove(mapCanvasOrder, 1)
      if oldKey ~= cacheKey and mapCanvasCache[oldKey] ~= nil then
        releaseCanvasEntry(mapCanvasCache[oldKey])
        mapCanvasCache[oldKey] = nil
      end
    end
  end
  local IMAGE_FIELD_CANDIDATES = { "sheet", "image", "path", "spriteSheet", "atlas", "texture" }
  local BLOCKDEF_FIELD_CANDIDATES = { "blocks", "blockDefs", "metatiles", "blockData" }
  local function looksLikeImagePath(s)
    return type(s) == "string" and (s:match("%.png$") or s:match("%.jpg$") or s:match("%.jpeg$")) ~= nil
  end
  local function findImagePath(record)
    if type(record) ~= "table" then
      return nil
    end
    for _, key in ipairs(IMAGE_FIELD_CANDIDATES) do
      if looksLikeImagePath(record[key]) then
        return record[key]
      end
    end
    for _, v in pairs(record) do
      if looksLikeImagePath(v) then
        return v
      end
    end
    return nil
  end
  local function looksLikeBlockDefTable(t)
    if type(t) ~= "table" then
      return false
    end
    local checked, matched = 0, 0
    for _, def in pairs(t) do
      if type(def) == "table" then
        checked = checked + 1
        local n = 0
        for _, tileId in ipairs(def) do
          if type(tileId) == "number" then
            n = n + 1
          end
        end
        if n >= 8 then
          matched = matched + 1
        end
      end
      if checked >= 5 then
        break
      end
    end
    return checked > 0 and matched == checked
  end
  local function findBlockDefs(record)
    if type(record) ~= "table" then
      return nil
    end
    for _, key in ipairs(BLOCKDEF_FIELD_CANDIDATES) do
      if looksLikeBlockDefTable(record[key]) then
        return record[key]
      end
    end
    for _, v in pairs(record) do
      if looksLikeBlockDefTable(v) then
        return v
      end
    end
    return nil
  end
  local function blockColor(blockId)
    local id = tonumber(blockId) or 0
    if id == 0x14 or id == 0x20 or id == 0x48 or id == 0x49 or id == 0x4A
        or id == 0x4B or id == 0x4C or id == 0x4D or id == 0x4E or id == 0x4F
        or id == 0x50 or id == 0x51 or id == 0x52 or id == 0x53
        or id == 0x43 or id == 0x44 or id == 0x45 or id == 0x46 or id == 0x47 then
      return 0.25, 0.55, 0.92
    end
    if id == 0x0A or id == 0x0B or id == 0x0C or id == 0x0D
        or id == 0x02 or id == 0x03 then
      return 0.32, 0.78, 0.28
    end
    if id == 0x0F or id == 0x10 or id == 0x11 or id == 0x12 or id == 0x3E then
      return 0.12, 0.42, 0.16
    end
    if id == 0x2B or id == 0x2C or id == 0x2D or id == 0x2E
        or id == 0x31 or id == 0x32 or id == 0x33 or id == 0x34
        or id == 0x05 or id == 0x06 then
      return 0.55, 0.42, 0.28
    end
    if id == 0x01 or id == 0x27 or id == 0x28 or id == 0x29 then
      return 0.82, 0.75, 0.48
    end
    if id == 0x07 or id == 0x08 or id == 0x09 or id == 0x15
        or id == 0x16 or id == 0x17 or id == 0x18 or id == 0x19 then
      return 0.55, 0.52, 0.48
    end
    local h = (id * 17) % 7
    if h <= 2 then
      return 0.40, 0.72, 0.30
    elseif h <= 4 then
      return 0.50, 0.42, 0.28
    else
      return 0.62, 0.68, 0.42
    end
  end
  local function blockTint(blockId)
    local r, g, b = blockColor(blockId)
    local mix = 0.35 
    return r + (1 - r) * mix, g + (1 - g) * mix, b + (1 - b) * mix
  end
  local function renderBlocks(mapId, game)
    local gameVer = genOf(game)
    local mapDef = mod.content and mod.content.maps and mod.content.maps:get(mapId)
    pcall(function()
      local world = gscWorld(game) or (game and game.world)
      local live = world and world.map
      if not (live and live.def) then return end
      if live.id ~= mapId and live.name ~= mapId then return end
      local ld = live.def
      if not mapDef then
        mapDef = ld
        return
      end
      if (not mapDef.connections or not next(mapDef.connections))
          and type(ld.connections) == "table" then
        local merged = {}
        for k, v in pairs(mapDef) do merged[k] = v end
        merged.connections = ld.connections
        mapDef = merged
      end
      if (not mapDef.blocks or #mapDef.blocks == 0) and type(ld.blocks) == "table" then
        local merged = {}
        for k, v in pairs(mapDef) do merged[k] = v end
        merged.blocks = ld.blocks
        mapDef = merged
      end
    end)
    if not mapDef or type(mapDef.width) ~= "number" or type(mapDef.height) ~= "number"
        or type(mapDef.blocks) ~= "table" then
      return nil
    end
    local w, h = mapDef.width, mapDef.height
    if w <= 0 or h <= 0 or w * h > 20000 then
      return nil
    end
    local mapBlocks = mapDef.blocks
    local tsDef = nil
    if mapDef.tileset and mod.content.tilesets then
      tsDef = mod.content.tilesets:get(mapDef.tileset)
    end
    local tilesetNameU = tostring(mapDef.tileset or ""):upper()
    local outdoorTileset = (
      tilesetNameU == "OVERWORLD"
      or tilesetNameU:find("JOHTO", 1, true) or tilesetNameU:find("KANTO", 1, true)
      or tilesetNameU:find("ROUTE", 1, true) or tilesetNameU:find("TOWN", 1, true)
      or tilesetNameU:find("CITY", 1, true) or tilesetNameU:find("PARK", 1, true)
      or tilesetNameU:find("FOREST", 1, true)
      or tilesetNameU:find("OUTDOOR", 1, true)
      or tilesetNameU:find("EXT", 1, true)
    )
    if tilesetNameU:find("HOUSE", 1, true) or tilesetNameU:find("CENTER", 1, true)
        or tilesetNameU:find("MART", 1, true) or tilesetNameU:find("GYM", 1, true)
        or tilesetNameU:find("INTERIOR", 1, true) or tilesetNameU:find("INDOOR", 1, true)
        or tilesetNameU:find("GATE", 1, true) or tilesetNameU:find("CAVE", 1, true) then
      outdoorTileset = false
    end

    local mapColorMode = opt(game, "minimap_map_color", "recomp")

    local function resolveGbcPalette()
      local okP, P = pcall(require, "src.render.PaletteFX")
      if not okP or not P then
        return { {255,255,255}, {255,132,132}, {148,58,58}, {0,0,0} }
      end
      local name = nil
      pcall(function()
        local ow = game and game.overworld
        local liveMap = ow and ow.map and ow.map.id == mapId and ow.map or nil
        if liveMap and type(ow.paletteNameFor) == "function" then
          name = ow:paletteNameFor(liveMap)
        end
      end)
      name = name or mapDef.palette or mapDef.paletteName or mapDef.tileset
      local colors = nil
      if type(name) == "string" then
        -- PaletteFX.pal() only returns the real per-map GBC-boost colors
        -- (the ones Yellow actually shows on a Game Boy Color / color
        -- emulator) when mode is "ogred". Flip it just for this lookup,
        local prevMode = P.mode
        P.mode = "ogred"
        local ok, c = pcall(function() return P.pal(game.data, name) end)
        P.mode = prevMode
        if ok and c then colors = c end
      end
      if colors then return pal4(colors) end
      local ok2, bg = pcall(function() return P.ogBg() end)
      if ok2 and bg then return pal4(bg) end
      return { {255,255,255}, {255,132,132}, {148,58,58}, {0,0,0} }
    end

    local PaletteFX = nil
    local exactPalette = nil
    if mapColorMode == "recomp" then
      PaletteFX = require("src.render.PaletteFX")
      local okPal, pal = pcall(function()
        local ow = game and game.overworld
        if not ow or type(ow.paletteNameFor) ~= "function" then return nil end
        local liveMap = (ow.map and ow.map.id == mapId) and ow.map or nil
        if not liveMap then return nil end
        local name = ow:paletteNameFor(liveMap)
        if not name then return nil end
        return PaletteFX.pal(game.data, name)
      end)
      if okPal then exactPalette = pal end
    end

    if mapColorMode == "recomp" and not exactPalette then
      pcall(function()
        local name = mapDef.tileset
        if type(name) == "string" then
          exactPalette = PaletteFX.pal(game.data, name)
        end
      end)
    end
    if mapColorMode == "recomp" and not exactPalette then
      pcall(function()
        local name = mapDef.palette or mapDef.paletteName
        if type(name) == "string" then
          exactPalette = PaletteFX.pal(game.data, name)
        end
      end)
    end
    if mapColorMode == "recomp" and not exactPalette then
      pcall(function()
        local ow = game and game.overworld
        if ow and type(ow.paletteNameFor) == "function" then
          local name = ow:paletteNameFor(mapDef)
          if name then exactPalette = PaletteFX.pal(game.data, name) end
        end
      end)
    end

    if mapColorMode == "recomp" and not exactPalette then
      pcall(function()
        local ow = game and game.overworld
        local zones = ow and type(ow.sgbWorldZones) == "function"
                    and ow:sgbWorldZones() or nil
        if zones and zones[1] and zones[1].colors then
          exactPalette = zones[1].colors
        end
      end)
    end

    local function recolorExact(data, colors)
      if not data then return nil end
      if not colors then return nil end
      local iw, ih = data:getWidth(), data:getHeight()
      colors = PaletteFX.effectiveColors(colors) or colors
      local out = love.image.newImageData(iw, ih)
      for y = 0, ih - 1 do
        for x = 0, iw - 1 do
          local r, g, b, a = data:getPixel(x, y)
          if a and a > 0 then
            local lum = r * 0.2126 + g * 0.7152 + b * 0.0722
            local shade = lum > 0.83 and 1
                       or (lum > 0.5 and 2
                       or (lum > 0.17 and 3 or 4))
            local c = colors[shade]
            if c then
              out:setPixel(x, y, c[1] / 255, c[2] / 255, c[3] / 255, a)
            else
              out:setPixel(x, y, r, g, b, a)
            end
          else
            out:setPixel(x, y, r, g, b, a)
          end
        end
      end
      local ok, image = pcall(love.graphics.newImage, out)
      if ok and image then
        pcall(function() image:setFilter("nearest", "nearest") end)
        return image
      end
      return nil
    end

    local function recolorSgb(data, colors)
      colors = pal4(colors)
      if not data or not colors then return nil end
      local iw, ih = data:getWidth(), data:getHeight()
      local out = love.image.newImageData(iw, ih)
      for y = 0, ih - 1 do
        for x = 0, iw - 1 do
          local r, g, b, a = data:getPixel(x, y)
          if a and a > 0 then
            local lum = r * 0.2126 + g * 0.7152 + b * 0.0722
            local shade = lum > 0.83 and 1 or (lum > 0.5 and 2 or (lum > 0.17 and 3 or 4))
            local c = colors[shade]
            out:setPixel(x, y, c[1] / 255, c[2] / 255, c[3] / 255, a)
          else
            out:setPixel(x, y, r, g, b, a)
          end
        end
      end
      local ok, image = pcall(love.graphics.newImage, out)
      if ok and image then
        pcall(function() image:setFilter("nearest", "nearest") end)
        return image
      end
      return nil
    end

    local img, blockDefs, tilesPerRow
    local rawTileData = nil
    -- Gen 2 is intentionally built from its block/tile data below.  The live
    -- world image can contain the engine's visual/design points, which must
    -- not be part of the minimap terrain.

    if type(tsDef) == "table" and not img then
      local imgPath = tsDef.image or findImagePath(tsDef)
      if type(imgPath) == "string" then
        if mapColorMode == "og" then
          local okImg, native = pcall(love.graphics.newImage, imgPath)
          if okImg and native then
            pcall(function() native:setFilter("nearest", "nearest") end)
            img = native
          end
        elseif love.image and love.image.newImageData then
          local okData, data = pcall(love.image.newImageData, imgPath)
          if okData and data then
            rawTileData = data
            if mapColorMode == "gbc" then
              img = recolorSgb(data, resolveGbcPalette())
            else
              local mostlyGray = true
              local samples, chroma = 0, 0
              local step = math.max(1, math.floor(math.max(data:getWidth(), data:getHeight()) / 32))
              for y = 0, data:getHeight() - 1, step do
                for x = 0, data:getWidth() - 1, step do
                  local r, g, b, a = data:getPixel(x, y)
                  if a and a > 0.1 then
                    samples = samples + 1
                    chroma = chroma + (math.max(r, g, b) - math.min(r, g, b))
                  end
                end
              end
              mostlyGray = samples < 1 or (chroma / samples) < 0.06
              if mostlyGray and exactPalette then
                img = recolorExact(data, exactPalette)
              elseif mostlyGray and gameVer == "gold" then
                -- grayscale for now; real GBC colors come from bgSet below.
                local okImg, native = pcall(love.graphics.newImage, data)
                if okImg and native then
                  pcall(function() native:setFilter("nearest", "nearest") end)
                  img = native
                end
              elseif mostlyGray then
                img = recolorSgb(data, resolveGbcPalette())
              else
                local okImg, native = pcall(love.graphics.newImage, data)
                if okImg and native then
                  pcall(function() native:setFilter("nearest", "nearest") end)
                  img = native
                end
              end
            end
          end
        end
        if not img then
          local okImg, native = pcall(love.graphics.newImage, imgPath)
          if okImg and native then
            pcall(function() native:setFilter("nearest", "nearest") end)
            img = native
          end
        end
      end
    end
    if type(tsDef) == "table" then
      if not blockDefs then
        if type(tsDef.blocks) == "table" then
          blockDefs = tsDef.blocks
        else
          blockDefs = findBlockDefs(tsDef)
        end
      end
      if not tilesPerRow or tilesPerRow <= 0 then
        tilesPerRow = tonumber(tsDef.tilesPerRow)
      end
      if img and (not tilesPerRow or tilesPerRow <= 0) then
        tilesPerRow = math.max(1, math.floor(img:getWidth() / TILE_PX))
      end
    end
    local canUseTiles = img and blockDefs and tilesPerRow and tilesPerRow > 0
    local imgByGroup = nil
    local activeWorldGroups = nil
    if canUseTiles and mapColorMode == "recomp" and PaletteFX then
      local okAdvanced, advanced = pcall(function() return PaletteFX.usesGbcPack() end)
      if okAdvanced and advanced and type(tsDef) == "table"
          and type(mapDef.tileset) == "string"
          and PaletteFX.hasWorldTileset(mapDef.tileset)
          and rawTileData then
        activeWorldGroups = PaletteFX.worldGroupColors(
          game.data, mapDef.tileset, mapId,
          game.overworld and game.overworld.player and game.overworld.player.cellY)
        if activeWorldGroups then
          imgByGroup = {}
          for gi = 1, #activeWorldGroups do
            imgByGroup[gi] = recolorExact(rawTileData, activeWorldGroups[gi])
          end
        end
      end
    end

    local isGold = (gameVer == "gold")
    -- Gen2 recomp: color tiles via the same 8 BG palettes the engine bakes
    -- (Palettes.bgSet + tileset.tilePalettes), matching World:bakeMapImage.
    -- Daytime MUST match the live world (NITE/DARK/MORN), not always DAY.
    local gen2TilePalettes = nil
    local gen2Daytime = nil
    local gen2ClearColor = nil
    if isGold and mapColorMode == "recomp" and canUseTiles and rawTileData
        and type(tsDef) == "table" then
      pcall(function()
        local Palettes = require("src.world.gen2.Palettes")
        local world = (game and game.world) or (game and game.overworld)
        local palData = (world and world.palettes)
          or (game and game.data and (game.data.gen2Palettes or game.data.palettes))
        if not palData then return end

        -- Live engine daytime first; otherwise derive from the GAME clock
        -- (Clock.hour / World:hour), never os.date host time alone.
        local daytime = nil
        if world then
          if type(world.daytime) == "string" and world.daytime ~= "" then
            daytime = world.daytime
          elseif type(world.tod) == "string" and world.tod ~= "" then
            daytime = world.tod
          end
          if not daytime and type(world.timeOfDay) == "function" then
            local okT, t = pcall(function()
              if type(world.hour) == "function" then
                local okH, h = pcall(function() return world:hour() end)
                if okH then return world:timeOfDay(h) end
              end
              return world:timeOfDay()
            end)
            if okT and type(t) == "string" and t ~= "" then daytime = t end
          end
        end
        if not daytime then
          local hour = nil
          if world and type(world.hour) == "function" then
            local okH, h = pcall(function() return world:hour() end)
            if okH then hour = h end
          end
          if hour == nil and world and world.clockHour ~= nil then
            hour = world.clockHour
          end
          if hour == nil and game and game.save then
            pcall(function()
              local Clock = require("src.core.gen2.Clock")
              if type(Clock.hour) == "function" then
                hour = Clock.hour(game.save)
              end
            end)
          end
          daytime = Palettes.daytimeFor(mapDef, hour, world and world.flashUsed)
        end
        daytime = daytime or "DAY"
        gen2Daytime = daytime

        -- Prefer the engine's already-baked BG set (exact on-screen colors).
        local bgSet = nil
        if world and type(world.bgSets) == "table" then
          local liveKey = nil
          if type(world.mapCacheKey) == "function" then
            local okK, k = pcall(function() return world:mapCacheKey(mapId) end)
            if okK then liveKey = k end
          end
          if not liveKey then
            liveKey = tostring(mapId) .. "|" .. tostring(daytime)
          end
          local live = world.bgSets[liveKey]
          if type(live) == "table" then bgSet = live end
          -- Fallback: scan keys that start with this mapId
          if not bgSet then
            local prefix = tostring(mapId) .. "|"
            for k, v in pairs(world.bgSets) do
              if type(k) == "string" and k:sub(1, #prefix) == prefix
                  and type(v) == "table" then
                bgSet = v
                break
              end
            end
          end
        end
        if not bgSet then
          bgSet = Palettes.bgSet(palData, mapDef, daytime)
        end
        if not bgSet then return end

        gen2TilePalettes = tsDef.tilePalettes
        imgByGroup = {}
        for slot = 1, 8 do
          if bgSet[slot] then
            imgByGroup[slot] = recolorExact(rawTileData, bgSet[slot])
          end
        end
        for slot = 1, 8 do
          if imgByGroup[slot] then
            img = imgByGroup[slot]
            break
          end
        end
        if bgSet[1] and bgSet[1][1] then
          local c = bgSet[1][1]
          gen2ClearColor = {
            (c[1] or 0) / 255,
            (c[2] or 0) / 255,
            (c[3] or 0) / 255,
          }
        end
      end)
    end
    local BORDER_BLOCKS = 10
    -- Gen1 OVERWORLD tree wall; Gen2 Johto outdoor often uses $05 as border tree
    local TREE_WALL_BLOCK = isGold and 0x05 or 0x0F
    local WATER_BORDER_BLOCK = 0x43
    local function resolveBorderBlock(def)
      if not def then return TREE_WALL_BLOCK end
      if type(def.borderBlock) == "number" then
        return def.borderBlock
      end
      if type(def.border) == "number" then
        return def.border
      end
      local ts = tostring(def.tileset or ""):upper()
      if outdoorTileset or ts == "OVERWORLD" or ts:find("JOHTO", 1, true)
          or ts:find("KANTO", 1, true) or ts:find("PARK", 1, true) then
        return TREE_WALL_BLOCK
      end
      -- Indoor: solid floor/wall block 0 looks wrong; keep black clear
      return 0
    end
    local borderId = resolveBorderBlock(mapDef)

    local function blockColorLocal(blockId)
      if blockId ~= nil and blockColor then
        local ok, r, g, b = pcall(blockColor, blockId)
        if ok and r then return r, g, b end
      end
      local fallback = { red = { 0.22, 0.32, 0.16 }, blue = { 0.16, 0.24, 0.42 },
                         yellow = { 0.40, 0.38, 0.12 }, gold = { 0.18, 0.24, 0.30 } }
      local c = fallback[gameVer] or fallback.red
      return c[1] * 0.7, c[2] * 0.7, c[3] * 0.7
    end

    local voidR, voidG, voidB = blockColorLocal(borderId)
    if outdoorTileset then
      voidR, voidG, voidB = blockColorLocal(borderId)
      if voidR == 0 and voidG == 0 and voidB == 0 then
        voidR, voidG, voidB = 0.12, 0.18, 0.12
      end
    else
      voidR, voidG, voidB = 0, 0, 0
    end

    local cw = w + BORDER_BLOCKS * 2
    local ch = h + BORDER_BLOCKS * 2
    local originBX = BORDER_BLOCKS
    local originBY = BORDER_BLOCKS
    local canvas = love.graphics.newCanvas(cw * BLOCK_PX, ch * BLOCK_PX)
    local prevCanvas = love.graphics.getCanvas()
    love.graphics.setCanvas(canvas)
    love.graphics.clear(voidR, voidG, voidB, 1)

    local sheetW, sheetH = 0, 0
    local quadCache = {}
    local function quadFor(tileId)
      if not img or type(tileId) ~= "number" or not tilesPerRow or tilesPerRow <= 0 then
        return nil
      end
      local q = quadCache[tileId]
      if not q then
        local col = tileId % tilesPerRow
        local row = math.floor(tileId / tilesPerRow)
        local qx, qy = col * TILE_PX, row * TILE_PX
        if sheetW == 0 then
          sheetW, sheetH = img:getWidth(), img:getHeight()
        end
        if qx + TILE_PX <= sheetW and qy + TILE_PX <= sheetH then
          q = love.graphics.newQuad(qx, qy, TILE_PX, TILE_PX, sheetW, sheetH)
          quadCache[tileId] = q
        else
          return nil
        end
      end
      return q
    end

    local function drawBlockAt(blockId, col, row)
      local bx, by = col * BLOCK_PX, row * BLOCK_PX
      if canUseTiles and blockDefs then
        local def = blockDefs[blockId + 1] or blockDefs[blockId]
        if type(def) == "table" then
          love.graphics.setColor(1, 1, 1, 1)
          for ty = 0, 3 do
            for tx = 0, 3 do
              local tileId = def[ty * 4 + tx + 1]
              local q = quadFor(tileId)
              local sheet = img
              if imgByGroup and type(tileId) == "number" then
                if gen2TilePalettes then
                  -- Gen2: tilePalettes is 1-based over sheet tiles (slot 1..8)
                  local slot = gen2TilePalettes[tileId + 1] or 1
                  sheet = imgByGroup[slot] or img
                else
                  local okGroup, group = pcall(function()
                    return PaletteFX.worldGroupAt(mapDef.tileset, mapId, tileId)
                  end)
                  if okGroup and group ~= nil then
                    sheet = imgByGroup[group + 1] or img
                  end
                end
              end
              if q and sheet then
                love.graphics.draw(sheet, q, bx + tx * TILE_PX, by + ty * TILE_PX)
              else
                love.graphics.setColor(0.12, 0.12, 0.12, 1)
                love.graphics.rectangle("fill", bx + tx * TILE_PX,
                  by + ty * TILE_PX, TILE_PX, TILE_PX)
                love.graphics.setColor(1, 1, 1, 1)
              end
            end
          end
          return
        end
      end
      love.graphics.setColor(0.12, 0.12, 0.12, 1)
      love.graphics.rectangle("fill", bx, by, BLOCK_PX, BLOCK_PX)
      love.graphics.setColor(1, 1, 1, 1)
    end

    if outdoorTileset and borderId ~= nil then
      for row = 0, ch - 1 do
        for col = 0, cw - 1 do
          drawBlockAt(borderId, col, row)
        end
      end
    elseif borderId ~= nil and borderId ~= 0 then
      for row = 0, ch - 1 do
        for col = 0, cw - 1 do
          drawBlockAt(borderId, col, row)
        end
      end
    end

    local usedRealTiles = canUseTiles and true or false
    for i = 1, math.min(w * h, #mapBlocks) do
      local blockId = mapBlocks[i]
      if blockId ~= nil then
        local col = (i - 1) % w + originBX
        local row = math.floor((i - 1) / w) + originBY
        drawBlockAt(blockId, col, row)
      end
    end

    local function resolveMapDef(id)
      if not id then return nil end
      local keys = {
        id, tostring(id),
        tostring(id):upper(),
        tostring(id):upper():gsub("%s+", "_"),
        tostring(id):upper():gsub("_", ""),
      }
      if mod.content and mod.content.maps then
        for _, key in ipairs(keys) do
          local ok, got = pcall(function() return mod.content.maps:get(key) end)
          if ok and type(got) == "table" then return got end
        end
      end
      local world = gscWorld(game) or (game and game.world)
      if world and type(world.maps) == "table" then
        for _, key in ipairs(keys) do
          if type(world.maps[key]) == "table" then return world.maps[key] end
        end
      end
      return nil
    end

    local function neighborBlocks(nDef)
      if type(nDef) ~= "table" then return nil end
      local blocks = nDef.blocks or nDef.blockData or nDef.mapBlocks
      if type(blocks) == "table" and #blocks > 0 then return blocks end
      return nil
    end

    local conns = mapDef.connections
    do
      local world = gscWorld(game) or (game and game.world)
      local live = world and world.map
      if live and live.def and type(live.def.connections) == "table" then
        if live.id == mapId or live.name == mapId or not conns then
          conns = live.def.connections
        end
      end
    end

    local DIR = {
      north = { 0, -1 }, south = { 0, 1 }, west = { -1, 0 }, east = { 1, 0 },
      up = { 0, -1 }, down = { 0, 1 }, left = { -1, 0 }, right = { 1, 0 },
      n = { 0, -1 }, s = { 0, 1 }, w = { -1, 0 }, e = { 1, 0 },
    }

    if type(conns) == "table" then
      local drawn = {}
      for key, c in pairs(conns) do
        if type(c) == "table" then
          local dirName = c.dir or c.direction or c.side
          if type(dirName) ~= "string" and type(key) == "string" then
            dirName = key
          end
          dirName = dirName and tostring(dirName):lower() or nil
          local d = dirName and DIR[dirName]
          local destMap = c.map or c.mapId or c.destination or c.target
          if d and destMap then
            local dx, dy = d[1], d[2]
            local sk = dx .. "," .. dy
            if not drawn[sk] then
              drawn[sk] = true
              local nDef = resolveMapDef(destMap)
              local nBlocks = neighborBlocks(nDef)
              local nw = nDef and tonumber(nDef.width)
              local nh = nDef and tonumber(nDef.height)
              if nBlocks and nw and nh and nw > 0 and nh > 0 then
                local offset = tonumber(c.offset) or 0
                local depth = BORDER_BLOCKS
                if dy == -1 then
                  for row = 0, depth - 1 do
                    local nRow = nh - depth + row
                    if nRow >= 0 and nRow < nh then
                      for col = 0, nw - 1 do
                        local destCol = originBX + offset + col
                        local destRow = originBY - depth + row
                        if destCol >= 0 and destCol < cw and destRow >= 0 and destRow < ch then
                          local bid = nBlocks[nRow * nw + col + 1]
                          if bid ~= nil then drawBlockAt(bid, destCol, destRow) end
                        end
                      end
                    end
                  end
                elseif dy == 1 then
                  for row = 0, depth - 1 do
                    if row < nh then
                      for col = 0, nw - 1 do
                        local destCol = originBX + offset + col
                        local destRow = originBY + h + row
                        if destCol >= 0 and destCol < cw and destRow >= 0 and destRow < ch then
                          local bid = nBlocks[row * nw + col + 1]
                          if bid ~= nil then drawBlockAt(bid, destCol, destRow) end
                        end
                      end
                    end
                  end
                elseif dx == -1 then
                  for col = 0, depth - 1 do
                    local nCol = nw - depth + col
                    if nCol >= 0 and nCol < nw then
                      for row = 0, nh - 1 do
                        local destCol = originBX - depth + col
                        local destRow = originBY + offset + row
                        if destCol >= 0 and destCol < cw and destRow >= 0 and destRow < ch then
                          local bid = nBlocks[row * nw + nCol + 1]
                          if bid ~= nil then drawBlockAt(bid, destCol, destRow) end
                        end
                      end
                    end
                  end
                elseif dx == 1 then
                  for col = 0, depth - 1 do
                    if col < nw then
                      for row = 0, nh - 1 do
                        local destCol = originBX + w + col
                        local destRow = originBY + offset + row
                        if destCol >= 0 and destCol < cw and destRow >= 0 and destRow < ch then
                          local bid = nBlocks[row * nw + col + 1]
                          if bid ~= nil then drawBlockAt(bid, destCol, destRow) end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setCanvas(prevCanvas)
    return {
      canvas = canvas,
      width = w,
      height = h,
      usedRealTiles = usedRealTiles,
      originBX = originBX,
      originBY = originBY,
      canvasW = cw,
      canvasH = ch,
    }
  end
  local function rbyOverview(mapId, game)
    if not (mod.world and type(mod.world.mapOverview) == "function") then
      return nil
    end
    local ok, overview = pcall(function()
      return mod.world:mapOverview(mapId)
    end)
    if not ok or type(overview) ~= "table" then
      return nil
    end
    local img = overview.image or overview.canvas or overview.texture
    if img and type(img) == "userdata" then
      local iw, ih = 0, 0
      pcall(function()
        iw, ih = img:getWidth(), img:getHeight()
      end)
      if iw > 0 and ih > 0 then
        local mw = tonumber(overview.width) or tonumber(overview.w)
        local mh = tonumber(overview.height) or tonumber(overview.h)
        if not mw then
          mw = math.max(1, math.floor(iw / CELL_PX))
        end
        if not mh then
          mh = math.max(1, math.floor(ih / CELL_PX))
        end
        return {
          canvas = img,
          width = math.floor(mw / 2),
          height = math.floor(mh / 2),
          usedRealTiles = true,
          originBX = 0,
          originBY = 0,
          canvasW = math.floor(mw / 2),
          canvasH = math.floor(mh / 2),
          pixelWidth = iw,
          pixelHeight = ih,
          fromOverview = true,
        }
      end
    end
    return nil
  end
  local function gscDaytime(game, mapDef)
    local world = (game and game.world) or (game and game.overworld)
    if world then
      if type(world.daytime) == "string" and world.daytime ~= "" then
        return world.daytime
      end
      if type(world.tod) == "string" and world.tod ~= "" then
        return world.tod
      end
      if type(world.timeOfDay) == "function" then
        local okT, t = pcall(function()
          if type(world.hour) == "function" then
            local okH, h = pcall(function() return world:hour() end)
            if okH then return world:timeOfDay(h) end
          end
          return world:timeOfDay()
        end)
        if okT and type(t) == "string" and t ~= "" then return t end
      end
    end
    local hour = nil
    if world and type(world.hour) == "function" then
      local okH, h = pcall(function() return world:hour() end)
      if okH then hour = h end
    end
    if hour == nil then
      pcall(function()
        local Clock = require("src.core.gen2.Clock")
        if game and game.save and type(Clock.hour) == "function" then
          hour = Clock.hour(game.save)
        end
      end)
    end
    local okP, Palettes = pcall(require, "src.world.gen2.Palettes")
    if okP and Palettes and type(Palettes.daytimeFor) == "function" then
      return Palettes.daytimeFor(mapDef, hour, world and world.flashUsed) or "DAY"
    end
    return "DAY"
  end

  -- GSC: World:imageFor already has the right TOD palette; we only add border + neighbors
  local function gscTerrain(mapId, game)
    local world = (game and game.world) or (game and game.overworld)
    if not world or type(world.imageFor) ~= "function" then return nil end

    local function imageFor(id)
      local img = nil
      pcall(function() img = world:imageFor(id) end)
      if img then return img end
      if type(world.mapImages) == "table" then
        local prefix = tostring(id) .. "|"
        for k, v in pairs(world.mapImages) do
          if type(k) == "string" and k:sub(1, #prefix) == prefix and v then
            return v
          end
        end
      end
      return nil
    end

    local rootImg = imageFor(mapId)
    if not rootImg then return nil end

    local base = nil
    local okB, built = pcall(renderBlocks, mapId, game)
    if okB then base = built end

    if not (base and base.canvas) then
      local riw, rih = rootImg:getWidth(), rootImg:getHeight()
      local rw = math.max(1, math.floor(riw / BLOCK_PX + 0.5))
      local rh = math.max(1, math.floor(rih / BLOCK_PX + 0.5))
      local border = 10
      local canvas = love.graphics.newCanvas((rw + border * 2) * BLOCK_PX, (rh + border * 2) * BLOCK_PX)
      local prev = love.graphics.getCanvas()
      love.graphics.setCanvas(canvas)
      love.graphics.clear(0.12, 0.22, 0.16, 1)
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.draw(rootImg, border * BLOCK_PX, border * BLOCK_PX)
      love.graphics.setCanvas(prev)
      return {
        canvas = canvas, width = rw, height = rh, usedRealTiles = true,
        originBX = border, originBY = border,
        canvasW = rw + border * 2, canvasH = rh + border * 2,
        pixelWidth = (rw + border * 2) * BLOCK_PX,
        pixelHeight = (rh + border * 2) * BLOCK_PX,
        fromEngineBake = true,
      }
    end

    local originBX = base.originBX or 0
    local originBY = base.originBY or 0
    local canvas = base.canvas
    local prev = love.graphics.getCanvas()
    love.graphics.setCanvas(canvas)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(rootImg, originBX * BLOCK_PX, originBY * BLOCK_PX)

    local maps = world.maps
    local rootDef = maps and maps[mapId]
    if not rootDef and mod.content and mod.content.maps then
      pcall(function() rootDef = mod.content.maps:get(mapId) end)
    end
    if not rootDef and world.map and world.map.def then
      rootDef = world.map.def
    end
    local rw = base.width or 1
    local rh = base.height or 1

    local neighbors = {}
    pcall(function()
      local World = require("src.world.gen2.World")
      if type(World.computeNeighbors) == "function" and type(maps) == "table" then
        neighbors = World.computeNeighbors(maps, mapId, 1, 320, 320) or {}
      end
    end)
    if #neighbors == 0 and type(rootDef) == "table" and type(rootDef.connections) == "table" then
      for dir, conn in pairs(rootDef.connections) do
        if type(conn) == "table" then
          local destId = conn.mapId or conn.map
          local destDef = maps and maps[destId]
          if not destDef and mod.content and mod.content.maps then
            pcall(function() destDef = mod.content.maps:get(destId) end)
          end
          if destId and type(destDef) == "table" then
            local offset = tonumber(conn.offset) or 0
            local dw = tonumber(destDef.width) or 0
            local dh = tonumber(destDef.height) or 0
            local ox, oy = 0, 0
            local d = tostring(dir):lower()
            if d == "north" or d == "up" or d == "n" then
              ox, oy = offset * BLOCK_PX, -dh * BLOCK_PX
            elseif d == "south" or d == "down" or d == "s" then
              ox, oy = offset * BLOCK_PX, rh * BLOCK_PX
            elseif d == "west" or d == "left" or d == "w" then
              ox, oy = -dw * BLOCK_PX, offset * BLOCK_PX
            else
              ox, oy = rw * BLOCK_PX, offset * BLOCK_PX
            end
            neighbors[#neighbors + 1] = { id = destId, ox = ox, oy = oy }
          end
        end
      end
    end

    for _, n in ipairs(neighbors) do
      local nImg = imageFor(n.id)
      if nImg then
        love.graphics.draw(
          nImg,
          originBX * BLOCK_PX + (tonumber(n.ox) or 0),
          originBY * BLOCK_PX + (tonumber(n.oy) or 0)
        )
      end
    end

    love.graphics.setCanvas(prev)
    love.graphics.setColor(1, 1, 1, 1)
    base.fromEngineBake = true
    base.usedRealTiles = true
    return base
  end

  local function terrainFor(mapId, game)
    local ver = genOf(game)
    local mapColorMode = opt(game, "minimap_map_color", "recomp")
    local goldRendererKey = ""
    if ver == "gold" and mapColorMode == "recomp" then
      local world = (game and game.world) or (game and game.overworld)
      local r = world and world.map and world.map.renderer
      local mapDef = mod.content and mod.content.maps and mod.content.maps:get(mapId)
      local daytime = gscDaytime(game, mapDef)
      goldRendererKey = "#goldRenderer:" .. tostring(r and r.image or "none")
        .. "#tod:" .. tostring(daytime)
    end
    local cacheKey = tostring(mapId) .. "#v:" .. tostring(ver) .. "#mode:" .. tostring(mapColorMode) .. goldRendererKey
    local cached = mapCanvasCache[cacheKey]
    if cached == nil then
      local built = nil
      if mapColorMode == "recomp" then
        if ver == "gold" then
          local okE, engineCanvas = pcall(gscTerrain, mapId, game)
          if okE and engineCanvas then built = engineCanvas end
        else
          local ok, overview = pcall(rbyOverview, mapId, game)
          if ok and overview then built = overview end
        end
      end
      if not built then
        local ok, b = pcall(renderBlocks, mapId, game)
        built = (ok and b) or false
      end
      cached = built or false
      cacheMapCanvas(cacheKey, cached)
    end
    return cached or nil
  end
  local minimapWarned = false
  local minimapWarnedMaps = {}
  -- debug logging removed
    local function drawMm(game, mapId, mmX, mmY, cx, cy)
    activeGame = game
    pcall(enrichGiftTextFromGame, game, mapId)
    local gameVer = genOf(game)
    local zoomOpt = opt(game, "minimap_zoom", "0")
    local legacy = { near = 8, close = 4, medium = 0, far = -4, wide = -8, small = 4, large = -4 }
    if type(zoomOpt) == "string" then
      if legacy[zoomOpt] ~= nil then
        zoomOpt = tostring(legacy[zoomOpt])
      else
        zoomOpt = zoomOpt:gsub("^%+", ""):gsub("%s+", "")
      end
    end
    local radius = zoomCells(zoomOpt, ZOOM_BASE_RADIUS)
    local boxPx = mmBox(game)
    local endColorblind = cbBegin(game)
    love.graphics.setColor(0.04, 0.04, 0.07, 0.92)
    love.graphics.rectangle("fill", mmX, mmY, boxPx, boxPx, 4, 4)
    local borderPad = 2
    local contentX = mmX + borderPad
    local contentY = mmY + borderPad
    local contentPx = boxPx - borderPad * 2
    local terrain = terrainFor(mapId, game)
    if terrain then
      local cellsAcross = radius * 2 + 1
      local cellPxOnScreen = contentPx / cellsAcross
      local scale = cellPxOnScreen / CELL_PX
      local originCellsX = (terrain.originBX or 0) * 2
      local originCellsY = (terrain.originBY or 0) * 2
      local playerPxX = (cx + originCellsX + 0.5) * CELL_PX
      local playerPxY = (cy + originCellsY + 0.5) * CELL_PX
      do
        local ver = genOf(game)
        love.graphics.setColor(0.12, 0.16, 0.12, 1)
      end
      love.graphics.rectangle("fill", contentX, contentY, contentPx, contentPx)
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.setScissor(contentX, contentY, contentPx, contentPx)
      love.graphics.draw(
        terrain.canvas,
        contentX + contentPx / 2 - playerPxX * scale,
        contentY + contentPx / 2 - playerPxY * scale,
        0, scale, scale
      )
      love.graphics.setScissor()
    else
      do
        local ver = genOf(game)
        love.graphics.setColor(0.12, 0.16, 0.12, 1)
      end
      love.graphics.rectangle("fill", contentX, contentY, contentPx, contentPx)
      love.graphics.setColor(1, 1, 1, 1)
    end
    local cellScale = contentPx / (radius * 2 + 1)
    local centerX = contentX + contentPx / 2
    local centerY = contentY + contentPx / 2
    local markerSize = math.max(10, math.min(22, cellScale * 1.35))
    local rawMarker = opt(game, "show_markers", "all")
    local markerMode = tostring(rawMarker or "all")
    local modeAlias = {
      off = "off", none = "off", NONE = "off", OFF = "off",
      items = "items", ITEMS = "items", ITM = "items",
      hidden = "hidden", ["HIDDEN ITEMS"] = "hidden", HIDDEN = "hidden",
      items_hidden = "items_hidden", ["ITEMS + HIDDEN"] = "items_hidden",
      npc_items = "npc_items", ["NPC ITEMS"] = "npc_items",
      npc_extra = "npc_extra", ["NPC EXTRA"] = "npc_extra",
      npc_all = "npc_all", ["NPC ALL"] = "npc_all", npc = "npc_all", NPC = "npc_all",
      trainers = "trainers", TRAINERS = "trainers",
      berry = "berry", ["BERRY BUSH"] = "berry", BERRY = "berry",
      all = "all", ALL = "all",
    }
    markerMode = modeAlias[markerMode] or modeAlias[markerMode:upper()] or "all"
    -- reject color-name pollution
    if MARKER_RGB[markerMode] then
      markerMode = "all"
    end
    local function isNpcExtra(o, mid, idx)
      local ok, reason = isBlueMarker(o, mid, idx)
      if not ok then return false end
      reason = tostring(reason or ""):lower()
      if reason:find("trade", 1, true) then return true end
      local mk = giftMapKey(mid)
      if mk and (mk:find("BIKE", 1, true) or mk:find("BICYCLE", 1, true)) then
        return true
      end
      return false
    end
    local function wantMarker(kind, o, mid, idx)
      if markerMode == "off" then return false end
      if markerMode == "all" then return true end
      local berry = isBerryBush(o)
      if markerMode == "berry" then
        return berry and genOf(game) == "gold"
      end
      if markerMode == "items" then
        return kind == "item" and not berry
      end
      if markerMode == "hidden" then
        return false -- only the separate hidden-item layer
      end
      if markerMode == "items_hidden" then
        return kind == "item" and not berry
      end
      if markerMode == "npc_items" then
        return kind == "gift_npc" and not isNpcExtra(o, mid, idx)
      end
      if markerMode == "npc_extra" then
        return kind == "gift_npc" and isNpcExtra(o, mid, idx)
      end
      if markerMode == "npc_all" then
        return kind == "gift_npc" or kind == "npc" or kind == "object"
      end
      if markerMode == "trainers" then
        return kind == "trainer"
      end
      return false
    end
    love.graphics.setScissor(contentX, contentY, contentPx, contentPx)
    local player = playerEnt(game)
    local objsOk, objs = pcall(listMapStuffStable, game, mapId)
    if not objsOk then
      if not minimapWarned then
        minimapWarned = true
        mod.log:warn("[MiniMap] listMapStuff failed: %s", tostring(objs))
      end
      objs = nil
    end
    -- hidden item icons always; green marker when filter says so
    do
      -- FIX: ball-sprite/palette resolution used to live in the SAME pcall as
      -- the glow-ring + per-item drawing loop below. If loadSpriteFrame /
      -- resolveGoldRecompMarkerPalette / resolveRecompMarkerPalette threw for
      -- any reason, that one pcall failed and NOTHING in the hidden-item
      -- layer drew that frame -- no icon, no ring, on the whole map. Ball
      -- resolution is now isolated: a failure there only means "fall back to
      -- the plain pokeball icon", it can no longer take the glow ring or the
      -- rest of the layer down with it.
      local markHi = (markerMode == "all" or markerMode == "hidden" or markerMode == "items_hidden")
      local hiddenMode = colorMode(game)
      local ball = nil
      local okBall, errBall = pcall(function()
        local bp = ITEM_PALETTE or OG_MARKER_PALETTE
        if hiddenMode == "og" then
          bp = OG_MARKER_PALETTE
        elseif hiddenMode == "gbc" then
          bp = resolveGbcMarkerPalette(game, mapId) or ITEM_PALETTE or OG_MARKER_PALETTE
        else
          if genOf(game) == "gold" then
            bp = resolveGoldRecompMarkerPalette(game, nil) or ITEM_PALETTE or OG_MARKER_PALETTE
          else
            bp = resolveRecompMarkerPalette(game, nil, mapId) or ITEM_PALETTE or OG_MARKER_PALETTE
          end
        end
        ball = loadSpriteFrame("SPRITE_POKE_BALL", "down", bp, "hidden_" .. tostring(hiddenMode), true)
        if not ball then
          ball = getPokeballSprite(bp, "hidden_fallback")
        end
      end)
      if not okBall and not minimapWarned then
        minimapWarned = true
        mod.log:warn("[MiniMap] hidden-item ball sprite resolve failed: %s", tostring(errBall))
      end
      local hiSize = math.max(10, markerSize * 0.82)
      local okList, hiddenList, hiddenSrc = pcall(getHiddenItems, game, mapId)
      if not okList then
        local listErr = hiddenList
        hiddenList = nil
        if not minimapWarned then
          minimapWarned = true
          mod.log:warn("[MiniMap] getHiddenItems failed on %s: %s", tostring(mapId), tostring(listErr))
        end
      end
      if hiddenList then
        for _, hi in ipairs(hiddenList) do
          -- guard each entry individually so one malformed hidden-item
          -- record can't abort the whole layer (and everything drawn after it)
          local taken = nil
          local inRange = nil
          local okItem, errItem = pcall(function()
            taken = isHiddenTaken(game, mapId, hi.x, hi.y)
            if not taken then
              inRange = (math.abs(hi.x - cx) <= radius and math.abs(hi.y - cy) <= radius)
              if inRange then
                local px = centerX + (hi.x - cx) * cellScale
                local py = centerY + (hi.y - cy) * cellScale
                if markHi then
                  local hr, hg, hb = markerRgb(game, "color_hidden", "lime")
                  drawGlow(px, py, markerSize * 0.40, hr, hg, hb)
                end
                local drawn = false
                if ball then
                  drawn = drawSpriteMarker(ball, px, py, hiSize, "down", nil)
                end
                if not drawn then
                  drawPokeballIcon(px, py, math.max(3.5, hiSize * 0.42), hiddenMode, game, mapId, nil)
                end
              end
            end
          end)
          if not okItem and not minimapWarned then
            minimapWarned = true
            mod.log:warn("[MiniMap] hidden-item entry blew up on %s: %s", tostring(mapId), tostring(errItem))
          end
        end
      end
    end

    if objs then
      for objIndex, obj in ipairs(objs) do
        local okObj, errObj = pcall(function()
          if obj == player then
            return
          end
          local defIndex = objIdx(obj) or objIndex
          local kind = kindOf(obj, mapId, defIndex)
          -- cut bushes drawn after hidden items (on top)
          if kind == "cut" then return end
          if isObjectHidden(game, obj, mapId) then return end
          if kind == "item" and isObjectTaken(game, obj, mapId)
              and not isBerryBush(obj) then
            return
          end
          -- glow/badge only; icons always draw
          local showMark = wantMarker(kind, obj, mapId, defIndex)
          if kind == "item" and isBerryBush(obj)
              and not berryLeft(game, obj, mapId) then
            kind = "npc"
            showMark = false
          end
          if kind == "gift_npc" and alreadyGot(game, obj, mapId, defIndex) then
            kind = "npc"
            showMark = false
          end
          -- FIX: this used to log kind/showMark BEFORE the two downgrade
          -- checks above (berry-taken / gift-already-got), so it could show
          -- kind='gift_npc' showMark=true in the log for an object that then
          -- got silently downgraded to kind='npc' showMark=false right
          -- afterward -- i.e. the log didn't reflect what actually got drawn.
          -- Logging moved to here, after both downgrades, so it matches the
          -- values the glow-drawing code below actually sees.
          local ox, oy = xyOf(obj)
          if not ox or not oy then return end
          if math.abs(ox - cx) > radius or math.abs(oy - cy) > radius then return end
          local px = centerX + (ox - cx) * cellScale
          local py = centerY + (oy - cy) * cellScale
          local facing = faceOf(obj)
          local spr = nil
          local sid = sprId(obj)
          local mode = colorMode(game)
          -- FIX: this whole sprite/palette resolution block used to sit in
          -- the SAME pcall as the glow-ring drawing further down. If any of
          -- the resolveXxxMarkerPalette()/loadSpriteFrame() calls threw for
          -- an item/hidden/npc_item/npc_trade object (e.g. an unexpected
          -- spriteDef shape), the exception aborted the whole per-object
          -- closure and the glow ring + fallback icon never ran either --
          -- exactly the "no ring, no sprite" symptom. Now isolated: a sprite
          -- lookup failure just means "no custom sprite", spr stays nil, and
          -- the fallback icon + glow drawing below still runs normally.
          local okSpr, sprErr = pcall(function()
            -- fallback 4-color so we never draw raw greyscale sheets
            local fallbackPal = NPC_PALETTE
            if kind == "item" or kind == "hidden" then
              fallbackPal = ITEM_PALETTE or OG_MARKER_PALETTE
            elseif kind == "trainer" then
              fallbackPal = TRAINER_PALETTE or NPC_PALETTE
            elseif kind == "gift_npc" then
              fallbackPal = NPC_PALETTE
            end
            if mode == "og" then
              if sid then
                spr = loadSpriteFrame(sid, facing, OG_MARKER_PALETTE, "og", true)
              end
            else
              -- GBC/RECOMP: prefer live entity sprite (already has correct colors)
              spr = spriteFromEntity(obj, facing)
              if not spr and sid then
                local rp = resolveRecompMarkerPalette(game, obj, mapId)
                if rp then
                  spr = loadSpriteFrame(sid, facing, rp, mode .. "_pal", true)
                end
              end
              if not spr and sid then
                spr = loadSpriteFrame(sid, facing, fallbackPal, mode .. "_fb", true)
              end
            end
            if not spr and gameVer == "gold" and mode ~= "og"
                and type(obj.spriteDef) == "table" and obj.spriteDef.image then
              local temp = {
                sprite = {
                  image = obj.spriteDef.image,
                  frameWidth = obj.spriteDef.frameWidth or 16,
                  frameHeight = obj.spriteDef.frameHeight or 16,
                  frames = obj.spriteDef.frames or obj.spriteDef.directionFrames,
                  directionFrames = obj.spriteDef.directionFrames,
                  getFrameGeometry = obj.spriteDef.getFrameGeometry,
                }
              }
              spr = spriteFromEntity(temp, facing)
            end
            if kind == "item" or kind == "hidden" then
              local mode2 = colorMode(game)
              local itemSpriteId = sid or "SPRITE_POKE_BALL"
              local itemSpr = nil
              local ip = ITEM_PALETTE or OG_MARKER_PALETTE
              if mode2 == "og" then
                ip = OG_MARKER_PALETTE
              elseif mode2 == "gbc" then
                ip = resolveGbcMarkerPalette(game, mapId) or ITEM_PALETTE or OG_MARKER_PALETTE
              else
                if genOf(game) == "gold" then
                  ip = resolveGoldRecompMarkerPalette(game, obj) or ITEM_PALETTE or OG_MARKER_PALETTE
                else
                  ip = resolveRecompMarkerPalette(game, obj, mapId) or ITEM_PALETTE or OG_MARKER_PALETTE
                end
              end
              itemSpr = loadSpriteFrame(itemSpriteId, "down", ip, "item_" .. tostring(mode2), true)
              if not itemSpr then
                itemSpr = getPokeballSprite(ip, "ball_" .. tostring(mode2))
              end
              if itemSpr then spr = itemSpr end
            end
          end)
          if not okSpr then
            spr = nil
            if not minimapWarnedMaps[mapId] then
              minimapWarnedMaps[mapId] = true
              mod.log:warn("[MiniMap] sprite resolve failed for kind '%s' on map '%s': %s",
                tostring(kind), tostring(mapId), tostring(sprErr))
            end
          end
          local defeatedTrainer = (kind == "trainer") and isTrainerDefeated(game, obj, mapId)
          local drawn = false
          -- category glow (filterable); sprite icons always drawn below
          local function dbgMarkerRgb(colorKey, fallbackName)
            local r, g, b = markerRgb(game, colorKey, fallbackName)
            return r, g, b
          end
          if showMark then
            local okGlow, glowErr = pcall(function()
              if kind == "item" and isBerryBush(obj) then
                local r, g, b = dbgMarkerRgb("color_berry", "green")
                drawGlow(px, py, markerSize * 0.45, r, g, b)
              elseif kind == "item" then
                local r, g, b = dbgMarkerRgb("color_items", "green")
                drawGlow(px, py, markerSize * 0.45, r, g, b)
              elseif kind == "hidden" then
                local r, g, b = dbgMarkerRgb("color_hidden", "lime")
                drawGlow(px, py, markerSize * 0.45, r, g, b)
              elseif kind == "gift_npc" then
                local extra = isNpcExtra(obj, mapId, defIndex)
                local r, g, b = dbgMarkerRgb(extra and "color_npc_extra" or "color_npc_items", extra and "blue" or "cyan")
                drawGlow(px, py, markerSize * 0.55, r, g, b)
              elseif kind == "object" then
                local r, g, b = dbgMarkerRgb("color_pokemon", "purple")
                drawGlow(px, py, markerSize * 0.55, r, g, b)
              elseif kind == "trainer" and not defeatedTrainer then
                local r, g, b = dbgMarkerRgb("color_trainers", "red")
                drawGlow(px, py, markerSize * 0.55, r, g, b)
              end
            end)
            if not okGlow then
              if not minimapWarnedMaps[mapId] then
                minimapWarnedMaps[mapId] = true
                mod.log:warn("[MiniMap] glow draw failed for kind '%s' on map '%s': %s",
                  tostring(kind), tostring(mapId), tostring(glowErr))
              end
            end
          end
          if spr then
            -- no color multiply — keep recomp/OG sprite colors; glow is the category cue
            drawn = drawSpriteMarker(spr, px, py, markerSize, facing, nil)
          end
          if not drawn then
            if kind == "hidden" or kind == "item" then
              drawPokeballIcon(px, py, 4.5, colorMode(game), game, mapId, obj)
            elseif kind == "trainer" and defeatedTrainer then
              love.graphics.setColor(0.80, 0.80, 0.85, 1)
              love.graphics.circle("fill", px, py, 3)
            else
              -- plain icon stand-in (no category color unless showMark)
              if showMark and kind == "trainer" then
                love.graphics.setColor(1.0, 0.15, 0.15, 1)
              elseif showMark and kind == "gift_npc" then
                love.graphics.setColor(0.15, 0.9, 1, 1)
              elseif showMark and kind == "object" then
                love.graphics.setColor(0.35, 0.65, 1.0, 1)
              else
                love.graphics.setColor(0.95, 0.85, 0.55, 1)
              end
              love.graphics.circle("fill", px, py, 3.2)
            end
            love.graphics.setColor(0, 0, 0, 0.8)
            love.graphics.setLineWidth(1.2)
            if not (kind == "hidden" or kind == "item") then
              love.graphics.circle("line", px, py, 3.5)
            end
          end
          if showMark and kind == "gift_npc" then
            local extra = false
            pcall(function() extra = isNpcExtra(obj, mapId, defIndex) end)
            local r, g, b = markerRgb(game, extra and "color_npc_extra" or "color_npc_items", extra and "blue" or "cyan")
            love.graphics.setColor(r, g, b, 1)
            love.graphics.circle("fill", px + markerSize * 0.30, py - markerSize * 0.30, 2.6)
            love.graphics.setColor(0, 0, 0, 0.85)
            love.graphics.setLineWidth(1)
            love.graphics.circle("line", px + markerSize * 0.30, py - markerSize * 0.30, 2.6)
          elseif showMark and kind == "trainer" and not defeatedTrainer then
            local bx, by = px + markerSize * 0.32, py - markerSize * 0.32
            local r, g, b = markerRgb(game, "color_trainers", "red")
            love.graphics.setColor(r, g, b, 1)
            love.graphics.circle("fill", bx, by, 3.4)
            love.graphics.setColor(0, 0, 0, 0.9)
            love.graphics.setLineWidth(1.2)
            love.graphics.circle("line", bx, by, 3.4)
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.setLineWidth(1.5)
            love.graphics.line(bx, by - 1.6, bx, by + 0.35)
            love.graphics.points(bx, by + 1.55)
          end
        end)
        if not okObj and not minimapWarnedMaps[mapId] then
          minimapWarnedMaps[mapId] = true
          mod.log:warn("marker draw failed on map '%s': %s", tostring(mapId), tostring(errObj))
        end
      end
    end
    -- cut bushes on top of hidden-item markers
    if objs then
      for objIndex, obj in ipairs(objs) do
        pcall(function()
          if obj == player then return end
          if not isCutBush(obj) then return end
          if isObjectHidden(game, obj, mapId) then return end
          local ox, oy = xyOf(obj)
          if not ox or not oy then return end
          if math.abs(ox - cx) > radius or math.abs(oy - cy) > radius then return end
          local px = centerX + (ox - cx) * cellScale
          local py = centerY + (oy - cy) * cellScale
          local facing = faceOf(obj) or "down"
          local sid = sprId(obj)
          local mode = colorMode(game)
          local spr = nil
          local bushPal = NPC_PALETTE
          if sid then
            if mode == "og" then
              spr = loadSpriteFrame(sid, facing, OG_MARKER_PALETTE, "cut_og", true)
            else
              local rp = resolveRecompMarkerPalette(game, obj, mapId)
              spr = loadSpriteFrame(sid, facing, rp or bushPal, "cut", true)
            end
          end
          if not spr then
            spr = spriteFromEntity(obj, facing)
          end
          -- soft green cue that something (often a hidden item path) is here
          if markerMode == "all" or markerMode == "items" then
            local r, g, b = markerRgb(game, "color_items", "green")
            drawGlow(px, py, markerSize * 0.4, r, g, b)
          end
          if spr then
            drawSpriteMarker(spr, px, py, markerSize, facing, nil)
          else
            love.graphics.setColor(0.25, 0.70, 0.30, 1)
            love.graphics.rectangle("fill", px - 3, py - 4, 6, 8)
            love.graphics.setColor(0, 0, 0, 0.75)
            love.graphics.rectangle("line", px - 3, py - 4, 6, 8)
          end
        end)
      end
    end
    do
      local faceStr = "down"
      local okFace, nesw = pcall(facingNESW, game)
      if okFace then
        if nesw == "N" then faceStr = "up"
        elseif nesw == "S" then faceStr = "down"
        elseif nesw == "W" then faceStr = "left"
        elseif nesw == "E" then faceStr = "right"
        end
      end
      local playerSpr = nil
      pcall(function()
        local mode = colorMode(game)
        -- Prefer the live entity sprite: it already carries the correct GBC /
        -- recomp palette and facing frames. loadSpriteFrame on a greyscale
        -- sheet with a nil palette was what made GBC mode look broken.
        if player then
          playerSpr = spriteFromEntity(player, faceStr)
        end
        local sid = player and sprId(player) or nil
        if mode == "og" then
          playerSpr = nil
          if sid then
            playerSpr = loadSpriteFrame(sid, faceStr, OG_MARKER_PALETTE, "player_og", true)
          end
          if not playerSpr then
            for _, id in ipairs({
              "SPRITE_RED", "SPRITE_GOLD", "SPRITE_YELLOW", "SPRITE_BOY",
              "SPRITE_RED_BIKE", "SPRITE_PLAYER", "SPRITE_CHRIS",
            }) do
              playerSpr = loadSpriteFrame(id, faceStr, OG_MARKER_PALETTE, "player_og", true)
              if playerSpr then break end
            end
          end
        elseif mode == "gbc" then
          if not playerSpr and sid then
            local gp = resolveGbcMarkerPalette(game, mapId)
            playerSpr = loadSpriteFrame(sid, faceStr, gp, "player_gbc", gp ~= nil)
          end
          if not playerSpr then
            local ids = genOf(game) == "gold"
              and { "SPRITE_CHRIS", "SPRITE_PLAYER", "SPRITE_GOLD" }
              or  { "SPRITE_RED", "SPRITE_PLAYER", "SPRITE_BOY", "SPRITE_YELLOW" }
            for _, id in ipairs(ids) do
              local gp = resolveGbcMarkerPalette(game, mapId)
              playerSpr = loadSpriteFrame(id, faceStr, gp or PLAYER_PALETTE, "player_gbc_fb", true)
              if playerSpr then break end
            end
          end
        elseif mode == "recomp" then
          if not playerSpr then
            if genOf(game) == "gold" then
              playerSpr = spriteFromEntity(player, faceStr)
            else
              local pp = resolveRecompMarkerPalette(game, player, mapId) or PLAYER_PALETTE
              if sid then
                playerSpr = loadSpriteFrame(sid, faceStr, pp, "player_recomp", true)
              end
            end
          end
        end
        if not playerSpr and player then
          playerSpr = spriteFromEntity(player, faceStr)
        end
      end)
      local drawn = false
      if playerSpr then
        local okD = pcall(drawSpriteMarker, playerSpr, centerX, centerY, markerSize * 1.15, faceStr)
        drawn = okD and true
      end
      if not drawn then
        local markerColorMode = colorMode(game)
        if markerColorMode == "og" then
          love.graphics.setColor(0.35, 0.35, 0.35, 1)
        elseif markerColorMode == "gbc" then
          love.graphics.setColor(0.35, 0.70, 0.35, 1)
        else
          love.graphics.setColor(0.25, 0.95, 0.35, 1)
        end
        love.graphics.circle("fill", centerX, centerY, 4.5)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setLineWidth(1.5)
        love.graphics.circle("line", centerX, centerY, 4.5)
      end
    end
    love.graphics.setScissor()
    endColorblind()
    love.graphics.setColor(0, 0, 0, 0.85)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", mmX + 0.5, mmY + 0.5, boxPx - 1, boxPx - 1, 4, 4)
    love.graphics.setColor(1, 1, 1, 0.95)
    love.graphics.setLineWidth(1.5)
    love.graphics.rectangle("line", mmX + 1.5, mmY + 1.5, boxPx - 3, boxPx - 3, 3, 3)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setLineWidth(1)
  end
  -- LoadLocation.lua is a sibling module, not an engine require(). The
  -- Recomp mod loader does not put the mod directory on package.path, so a
  -- normal require("LoadLocation") will silently fail to find a local file.
  -- Load it through the mod filesystem after Minimap has installed its HUD
  -- geometry export. Supports both `return function(mod) ... end` modules and
  -- modules that execute directly when called with mod.
  do
    if not mod._minimapLoadLocationLoaded then
      mod._minimapLoadLocationLoaded = true
      local okRead, source = pcall(function()
        return mod:read("LoadLocation.lua")
      end)
      if okRead and type(source) == "string" and source ~= "" then
        local chunk, compileErr = load(source, "@" .. tostring(mod.path or "mod") .. "/LoadLocation.lua")
        if not chunk then
          mod.log:error("[MiniMap] LoadLocation compile: %s", tostring(compileErr))
        else
          local okRun, result = pcall(chunk, mod)
          if not okRun then
            mod.log:error("[MiniMap] LoadLocation run: %s", tostring(result))
          elseif type(result) == "function" then
            local okEntry, entryErr = pcall(result, mod)
            if not okEntry then
              mod.log:error("[MiniMap] LoadLocation entry: %s", tostring(entryErr))
            else
              mod.log:info("LoadLocation.lua loaded")
            end
          else
            mod.log:info("LoadLocation.lua loaded")
          end
        end
      else
        mod.log:warn("LoadLocation.lua not found in the Minimap mod folder")
      end
    end
  end

  local settingsOpen = false
  local settingsCursor = 1
  local drawSettingsUi -- filled below
  local pollSettingsInput -- filled below

  mod.hooks:wrap("render.hud", function(nextFn, game, viewport)
    if nextFn then
      nextFn(game, viewport)
    end
    mod._lastGame = game
    -- LoadLocation reads this to sit under the minimap (same corner)
    mod._playerPosHud_minimapGeom = nil
    if canShow(game) then
      local mapId, cx, cy = whereAmI(game)
      if mapId then
        local rawMap = opt(game, "minimap", "top_left")
        local mapPos = parseCorner(rawMap)
        if mapPos == nil then mapPos = "top_left" end
        if rawMap == "off" then mapPos = "off" end
        if mapPos ~= "off" then
          local margin = 6
          local ww, wh = love.graphics.getDimensions()
          local boxPx = mmBox(game)
          local function cornerXY(corner, w, h)
            if corner == "top_left" then
              return margin, margin
            elseif corner == "top_right" then
              return ww - w - margin, margin
            elseif corner == "bottom_left" then
              return margin, wh - h - margin
            elseif corner == "bottom_right" then
              return ww - w - margin, wh - h - margin
            end
            return ww - w - margin, margin
          end
          local mmX, mmY = cornerXY(mapPos, boxPx, boxPx)
          mod._playerPosHud_minimapGeom = { pos = mapPos, size = boxPx, margin = margin }
          local ok, err = pcall(drawMm, game, mapId, mmX, mmY, cx, cy)
          if not ok and not minimapWarned then
            minimapWarned = true
            mod.log:warn("[MiniMap] paint blew up on %s: %s", tostring(mapId), tostring(err))
          end
          love.graphics.setColor(1, 1, 1, 1)
          love.graphics.setScissor()
        end
      end
    end
    if pollSettingsInput then pcall(pollSettingsInput, game) end
    if settingsOpen and drawSettingsUi then
      pcall(drawSettingsUi, game)
    end
  end)

  local function settingsList(game)
    local colorModes = MINIMAP_MAP_COLOR_MODES
    if genOf(game) == "gold" then
      colorModes = { { "og", "OG" }, { "recomp", "RECOMP" } }
    end
    local markers = (genOf(game) == "gold") and MARKER_MODES_GSC or MARKER_MODES
    local rows = {
      { label = "MINIMAP", key = "minimap", list = MINIMAP_MODES, fallback = "top_left" },
      { label = "MAP ZOOM", key = "minimap_zoom", list = MINIMAP_ZOOMS, fallback = "0" },
      { label = "MAP SIZE", key = "minimap_bg_size", list = MINIMAP_BG_SIZES, fallback = "5" },
      { label = "MAP COLOR", key = "minimap_map_color", list = colorModes, fallback = "recomp" },
      { label = "COLORBLIND", key = "minimap_colorblind", list = MINIMAP_COLORBLIND_MODES, fallback = "off" },
      { label = "MARKERS", key = "show_markers", list = markers, fallback = "all" },
      { label = "COLOR ITEMS", key = "color_items", list = MARKER_COLOR_LIST, fallback = "green" },
      { label = "COLOR HIDDEN", key = "color_hidden", list = MARKER_COLOR_LIST, fallback = "lime" },
      { label = "COLOR NPC ITEMS", key = "color_npc_items", list = MARKER_COLOR_LIST, fallback = "cyan" },
      { label = "COLOR NPC EXTRA", key = "color_npc_extra", list = MARKER_COLOR_LIST, fallback = "blue" },
      { label = "COLOR TRAINERS", key = "color_trainers", list = MARKER_COLOR_LIST, fallback = "red" },
      { label = "COLOR POKEMON", key = "color_pokemon", list = MARKER_COLOR_LIST, fallback = "purple" },
    }
    if genOf(game) == "gold" then
      rows[#rows + 1] = { label = "COLOR BERRY", key = "color_berry", list = MARKER_COLOR_LIST, fallback = "green" }
    end
    rows[#rows + 1] = { label = "SHOW INFO", key = "show_info", list = {
        { "off", "OFF" }, { "location", "LOCATION" }, { "position", "POSITION" }, { "both", "BOTH" },
      }, fallback = "both" }
    rows[#rows + 1] = { label = "HUD POSITION", key = "hud_position", list = {
        { "top_left", "TOP LEFT" }, { "top_right", "TOP RIGHT" },
        { "bottom_left", "BOTTOM LEFT" }, { "bottom_right", "BOTTOM RIGHT" },
      }, fallback = "top_right" }
    return rows
  end

  -- Geometry of the last-drawn settings panel (for mouse hit-testing)
  local settingsPanel = { px = 0, py = 0, panelW = 0, panelH = 0, rowH = 22, titleH = 28, pad = 14 }

  drawSettingsUi = function(game)
    local rows = settingsList(game)
    if settingsCursor < 1 then settingsCursor = 1 end
    if settingsCursor > #rows then settingsCursor = #rows end
    local ww, wh = love.graphics.getDimensions()
    local panelW = math.min(480, ww - 40)
    local rowH = 22
    local pad = 14
    local titleH = 28
    local panelH = titleH + pad + #rows * rowH + pad + 22
    local px = math.floor((ww - panelW) / 2)
    local py = math.floor((wh - panelH) / 2)
    settingsPanel.px, settingsPanel.py = px, py
    settingsPanel.panelW, settingsPanel.panelH = panelW, panelH
    settingsPanel.rowH, settingsPanel.titleH, settingsPanel.pad = rowH, titleH, pad
    -- Black / red HUD chrome
    love.graphics.setColor(0.04, 0.02, 0.02, 0.96)
    love.graphics.rectangle("fill", px, py, panelW, panelH, 6, 6)
    love.graphics.setColor(0.85, 0.12, 0.12, 1)
    love.graphics.setLineWidth(2)
    love.graphics.rectangle("line", px, py, panelW, panelH, 6, 6)
    love.graphics.setColor(1.0, 0.25, 0.25, 1)
    love.graphics.print("MINIMAP SETTINGS  (F12)", px + pad, py + 8)
    love.graphics.setColor(0.45, 0.08, 0.08, 1)
    love.graphics.line(px + pad, py + titleH, px + panelW - pad, py + titleH)
    for i, row in ipairs(rows) do
      local y = py + titleH + 8 + (i - 1) * rowH
      local val = opt(game, row.key, row.fallback)
      local text = lbl(row.list, val, tostring(val))
      if i == settingsCursor then
        love.graphics.setColor(0.35, 0.05, 0.05, 0.98)
        love.graphics.rectangle("fill", px + 6, y - 2, panelW - 12, rowH - 2, 3, 3)
        love.graphics.setColor(1.0, 0.85, 0.55, 1)
        love.graphics.print("> " .. row.label, px + pad, y)
        love.graphics.print("< " .. text .. " >", px + panelW - pad - 150, y)
      else
        love.graphics.setColor(0.92, 0.88, 0.88, 1)
        love.graphics.print(row.label, px + pad + 12, y)
        love.graphics.setColor(0.95, 0.45, 0.45, 1)
        love.graphics.print(text, px + panelW - pad - 150, y)
      end
    end
    love.graphics.setColor(0.70, 0.35, 0.35, 1)
    love.graphics.print("Up/Down  Left/Right  Click  F12/Esc", px + pad, py + panelH - 18)
    love.graphics.setColor(1, 1, 1, 1)
  end

  -- Single input path: ONLY pollSettingsInput (edge-detect via isDown).
  -- love.keypressed also used to fire and marked held, but poll ran the same
  -- frame with was=false → every arrow counted twice. Poll alone is enough
  -- and matches how the recomp reads the keyboard.
  local settingsKeyHeld = {}

  local function normalizeSettingsKey(key, scancode)
    local k = tostring(key or ""):lower()
    local s = tostring(scancode or ""):lower()
    local aliases = {
      up = "up", w = "up", kp8 = "up",
      down = "down", s = "down", kp2 = "down",
      left = "left", a = "left", kp4 = "left",
      right = "right", d = "right", kp6 = "right",
      escape = "escape", ["return"] = "confirm", space = "confirm", z = "confirm",
      x = "escape", backspace = "escape",
    }
    return aliases[k] or aliases[s] or k
  end

  local function applySettingsDir(game, dir)
    game = game or mod._lastGame
    if not game then return end
    local ok, rows = pcall(settingsList, game)
    if not ok or type(rows) ~= "table" or #rows < 1 then return end
    if settingsCursor < 1 then settingsCursor = 1 end
    if settingsCursor > #rows then settingsCursor = #rows end
    local row = rows[settingsCursor]
    if not row then return end
    pcall(cycle, game, row.key, row.list, dir, row.fallback)
  end

  local function moveSettingsCursor(game, delta)
    game = game or mod._lastGame
    local ok, rows = pcall(settingsList, game)
    if not ok or type(rows) ~= "table" or #rows < 1 then return end
    settingsCursor = settingsCursor + delta
    if settingsCursor < 1 then settingsCursor = #rows end
    if settingsCursor > #rows then settingsCursor = 1 end
  end

  local function onSettingsKey(game, key, scancode)
    local action = normalizeSettingsKey(key, scancode)
    if action == "up" then
      moveSettingsCursor(game, -1)
      return true
    end
    if action == "down" then
      moveSettingsCursor(game, 1)
      return true
    end
    if action == "left" then
      applySettingsDir(game, -1)
      return true
    end
    if action == "right" or action == "confirm" then
      applySettingsDir(game, 1)
      return true
    end
    if action == "escape" then
      settingsOpen = false
      return true
    end
    return true
  end

  pollSettingsInput = function(game)
    if not love or not love.keyboard or not love.keyboard.isDown then return end

    -- F12 toggle (edge detect only)
    do
      local down = false
      pcall(function() down = love.keyboard.isDown("f12") end)
      local was = settingsKeyHeld["f12"]
      settingsKeyHeld["f12"] = down
      if down and not was then
        settingsOpen = not settingsOpen
      end
    end
    if not settingsOpen then return end

    -- One logical action per frame. Several physical keys map to the same
    -- action; share held-state per ACTION so W+Up cannot double-fire.
    local groups = {
      up = { "up", "w", "kp8" },
      down = { "down", "s", "kp2" },
      left = { "left", "a", "kp4" },
      right = { "right", "d", "kp6" },
      escape = { "escape", "x", "backspace" },
      confirm = { "return", "space", "z" },
    }
    local order = { "up", "down", "left", "right", "escape", "confirm" }
    local fired = false
    for _, action in ipairs(order) do
      local names = groups[action]
      local down = false
      for _, name in ipairs(names) do
        local d = false
        pcall(function() d = love.keyboard.isDown(name) end)
        if d then down = true break end
      end
      local holdKey = "action:" .. action
      local was = settingsKeyHeld[holdKey]
      settingsKeyHeld[holdKey] = down
      if not fired and down and not was then
        fired = true
        onSettingsKey(game or mod._lastGame, action, action)
      end
    end
  end

  local function onSettingsClick(game, x, y, button)
    if not settingsOpen then return false end
    game = game or mod._lastGame
    local p = settingsPanel
    if not p or (p.panelW or 0) <= 0 then return false end

    local mx, my = x, y
    pcall(function()
      if love.graphics and love.graphics.inverseTransformPoint then
        local tx, ty = love.graphics.inverseTransformPoint(x, y)
        if tx and ty then mx, my = tx, ty end
      end
    end)

    if mx < p.px or mx > p.px + p.panelW or my < p.py or my > p.py + p.panelH then
      if button == 1 then
        settingsOpen = false
        return true
      end
      return false
    end
    if not game then return true end
    local ok, rows = pcall(settingsList, game)
    if not ok or type(rows) ~= "table" then return true end
    local rowTop = p.py + p.titleH + 8
    for i, row in ipairs(rows) do
      local ry = rowTop + (i - 1) * p.rowH
      if my >= ry - 2 and my < ry - 2 + p.rowH then
        settingsCursor = i
        local mid = p.px + p.panelW * 0.55
        local dir = 1
        if button == 2 or mx < mid then dir = -1 end
        pcall(cycle, game, row.key, row.list, dir, row.fallback)
        return true
      end
    end
    return true
  end

  -- keypressed: only swallow keys while the menu is open (so the player does
  -- not walk). Navigation itself is handled exclusively by pollSettingsInput.
  do
    local prevKey = love.keypressed
    love.keypressed = function(key, scancode, isrepeat)
      local k = tostring(key or ""):lower()
      local s = tostring(scancode or ""):lower()
      if (k == "f12" or s == "f12") and not isrepeat then
        -- Mark held; actual toggle is done by poll to keep a single path.
        -- If poll is somehow skipped this frame, toggle here as fallback.
        if not settingsKeyHeld["f12"] then
          settingsOpen = not settingsOpen
          settingsKeyHeld["f12"] = true
        end
        return
      end
      if settingsOpen then
        -- Consume, do not navigate here (poll owns that)
        return
      end
      if prevKey then
        return prevKey(key, scancode, isrepeat)
      end
    end
  end

  do
    local prevMouse = love.mousepressed
    love.mousepressed = function(x, y, button, istouch, presses)
      if settingsOpen then
        if onSettingsClick(mod._lastGame, x, y, button) then
          return
        end
      end
      if prevMouse then
        return prevMouse(x, y, button, istouch, presses)
      end
    end
  end

end
