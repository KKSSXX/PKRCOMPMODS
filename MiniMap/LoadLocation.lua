return function(mod)
  -- option set (including show_info / hud_position). A second define() would
  -- replace that set and remove all Minimap options from the menu.
  if not mod._minimapOptionsDefined then
    mod.options:define({
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
  end
  local INFO_MODES = {
    { "off", "OFF" },
    { "location", "LOCATION" },
    { "position", "POSITION" },
    { "both", "BOTH" },
  }
  local POS_MODES = {
    { "top_left", "TOP LEFT" },
    { "top_right", "TOP RIGHT" },
    { "bottom_left", "BOTTOM LEFT" },
    { "bottom_right", "BOTTOM RIGHT" },
  }

  -- Own (lightweight) option storage helpers -- deliberately independent
  -- eigene settings-kopie falls Minimap.lua noch nicht geladen ist
  local function bucket(game)
    local o = game and game.save and game.save.options
    if not o then
      return nil
    end
    o.modOptions = o.modOptions or {}
    o.modOptions[mod.id] = o.modOptions[mod.id] or {}
    return o.modOptions[mod.id]
  end
  local function opt(game, key, fallback)
    local b = bucket(game)
    local v = b and b[key]
    if v == nil then
      v = mod.options:get(key)
    end
    return v or fallback
  end
  local function setOpt(game, key, value)
    local b = bucket(game)
    if b then
      b[key] = value
    end
    if mod.options and type(mod.options.set) == "function" then
      pcall(function()
        mod.options:set(key, value)
      end)
    end
  end

  local function idxOf(list, value)
    for i, m in ipairs(list) do
      if m[1] == value then
        return i
      end
    end
    return 1
  end
  local function cycle(game, key, list, dir, fallback)
    local cur = idxOf(list, opt(game, key, fallback))
    local nextIdx = ((cur - 1 + (dir or 1)) % #list) + 1
    setOpt(game, key, list[nextIdx][1])
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
    return {
      { id = "player_pos_hud_show_info", label = "SHOW INFO", key = "show_info", list = INFO_MODES, fallback = "both" },
      { id = "player_pos_hud_position", label = "HUD POSITION", key = "hud_position", list = POS_MODES, fallback = "top_right" },
    }
  end
  mod.hooks:wrap("ui.options.rows", function(nextFn, game, rows)
    rows = nextFn(game, rows)
    if type(rows) ~= "table" then return rows end
    local strip = {
      player_pos_hud_show_info = true,
      player_pos_hud_position = true,
      player_pos_hud_minimap = true,
      player_pos_hud_minimap_zoom = true,
      player_pos_hud_bg_size = true,
      player_pos_hud_color_mode = true,
      player_pos_hud_blindness = true,
      player_pos_hud_markers = true,
    }
    local out = {}
    for _, row in ipairs(rows) do
      if not (row and row.id and strip[row.id]) then
        out[#out + 1] = row
      end
    end
    return out
  end)
  local function fmtMap(id)
    if not id or type(id) ~= "string" then
      return "?"
    end
    local s = id:gsub("_", " "):lower()
    return (s:gsub("(%a)([%w_']*)", function(first, rest)
      return first:upper() .. rest
    end))
  end
  local function whereAmI(game)
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

  -- Build an uppercase name blob from common identity fields on a screen/frame.
  local function screenBlob(obj)
    if type(obj) ~= "table" then return "" end
    local parts = {
      obj.screenId, obj.id, obj.name, obj.type, obj.key, obj.state,
      obj.class, obj.className, obj.scene, obj.mode, obj.kind,
      obj.__name, obj.screen, obj.label, obj.title,
    }
    local mt = getmetatable(obj)
    if type(mt) == "table" and type(mt.__name) == "string" then
      parts[#parts + 1] = mt.__name
    end
    local out = {}
    for _, v in ipairs(parts) do
      if type(v) == "string" and v ~= "" then
        out[#out + 1] = v:upper()
      end
    end
    return table.concat(out, " ")
  end

  -- Keywords that mean "full-screen UI — hide the minimap".
  local BLOCKED_KWS = {
    "BATTLE", "FIGHT", "TRANSITION",
    "INTRO", "TITLE", "TUTORIAL", "NEWGAME", "NEW_GAME",
    "SPEECH", "CUTSCENE", "CINEMATIC", "PROFESSOR",
    "NAMING", "STARTER", "GENDER",
    "MENU", "PAUSE", "BAG", "PARTY", "POKEDEX", "SAVE", "OPTIONS",
    "PC", "MART", "SHOP", "STATE", "SCREEN",
  }

  local function kwBlocked(blob)
    if blob == "" then return false end
    for _, kw in ipairs(BLOCKED_KWS) do
      if blob:find(kw, 1, true) then return true end
    end
    return false
  end

  local function isDialog(top)
    if type(top) ~= "table" then return false end
    if top.isDialog or top.isTextBox or top.isMessage then return true end
    local b = screenBlob(top)
    return b:find("DIALOG", 1, true)
        or b:find("TEXTBOX", 1, true)
        or b:find("MESSAGE", 1, true)
        or b:find("YESNO", 1, true)
        or b:find("CHOICEBOX", 1, true)
  end

  local function isOW(game, top)
    if type(top) ~= "table" then return false end
    return top == game.overworld or top == game.world or top.isOverworld == true
  end

  -- True when this stack frame should hide the minimap.
  local function blocksHud(game, top)
    if type(top) ~= "table" then return false end
    if isOW(game, top) or isDialog(top) then return false end
    if top.isBattle or top.isBattleState or top.isOpaque then return true end
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
    for _, key in ipairs({ "states", "frames", "items" }) do
      local list = stack[key]
      if type(list) == "table" then
        for _, f in ipairs(list) do frames[#frames + 1] = f end
      end
    end
    for i = 1, 8 do
      if type(stack[i]) == "table" then frames[#frames + 1] = stack[i] end
    end
    return frames
  end

  local hidePhase = {
    boot=true, error=true, title=true, menu=true,
    intro=true, battle=true, naming=true, newgame=true,
  }

  local function canShow(game)
    if not game then return false end

    local phase = tostring(game.phase or ""):lower()
    if hidePhase[phase] then return false end

    if game.battle or game.inBattle or game.isBattle
        or game.battleState or game.battleScene or game.currentBattle then
      return false
    end
    if game.intro or game.inIntro or game.isIntro
        or game.titleScreen or game.inTitle then
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

    for _, frame in ipairs(allFrames(game.stack)) do
      if blocksHud(game, frame) then return false end
    end

    if phase == "play" and world and world.map and not world.battle then
      return true
    end
    if ow and ow.map and not (ow.battle or ow.inBattle) then
      return true
    end
    return false
  end


  mod.hooks:wrap("render.hud", function(nextFn, game, viewport)
    if nextFn then
      nextFn(game, viewport)
    end
    if not canShow(game) then
      return
    end
    local mapId, cx, cy = whereAmI(game)
    if not mapId then
      return
    end
    local infoMode = opt(game, "show_info", "both")
    local showLoc = (infoMode == "location" or infoMode == "both")
    local showPos = (infoMode == "position" or infoMode == "both")
    local wantInfo = infoMode ~= "off" and (showLoc or showPos)
    if not wantInfo then
      return
    end
    local hudPos = opt(game, "hud_position", "top_right")
    local margin = 6
    local gap = 6
    local ww, wh = love.graphics.getDimensions()
    local lines, pad, lineH = {}, 4, 14
    if showLoc then
      lines[#lines + 1] = fmtMap(mapId)
    end
    if showPos then
      local facing = facingNESW(game)
      if facing then
        lines[#lines + 1] = string.format("X:%d  Y:%d  %s", cx, cy, facing)
      else
        lines[#lines + 1] = string.format("X:%d  Y:%d", cx, cy)
      end
    end
    local font = love.graphics.getFont()
    lineH = (font and font:getHeight() or 12) + 2
    local maxW = 0
    for _, line in ipairs(lines) do
      local w = font and font:getWidth(line) or (#line * 8)
      if w > maxW then
        maxW = w
      end
    end
    local boxW = maxW + pad * 2
    local boxH = #lines * lineH + pad * 2
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
    local function isTop(corner)
      return corner == "top_left" or corner == "top_right"
    end
    local function isLeft(corner)
      return corner == "top_left" or corner == "bottom_left"
    end
    -- Minimap.lua runs before this hook (see main.lua) and, if it drew a
    -- minimap this frame, leaves its geometry here so we can stack our
    -- info box with it when both are set to the same corner.
    local minimapGeom = mod._playerPosHud_minimapGeom
    local infoX, infoY
    if minimapGeom and minimapGeom.pos == hudPos then
      local boxPx = minimapGeom.size
      local stackH = boxPx + gap + boxH
      local stackW = math.max(boxPx, boxW)
      local sx, sy = cornerXY(hudPos, stackW, stackH)
      if isLeft(hudPos) then
        infoX = sx
      else
        infoX = sx + stackW - boxW
      end
      infoY = sy + boxPx + gap
    else
      infoX, infoY = cornerXY(hudPos, boxW, boxH)
    end
    love.graphics.setColor(0, 0, 0, 0.72)
    love.graphics.rectangle("fill", infoX, infoY, boxW, boxH, 3, 3)
    love.graphics.setColor(1, 1, 1, 0.35)
    love.graphics.setLineWidth(1)
    love.graphics.rectangle("line", infoX + 0.5, infoY + 0.5, boxW - 1, boxH - 1, 3, 3)
    love.graphics.setColor(1, 1, 1, 1)
    for i, line in ipairs(lines) do
      love.graphics.print(line, infoX + pad, infoY + pad + (i - 1) * lineH)
    end
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setScissor()
  end)

end
