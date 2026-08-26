-- QOLOakSpeechSkip.lua
-- Speech skip + New-Game-Namen (nur Presets der aktuellen Version)
-- apply(mod, options)  options: oak_speech_skip, player_name, rival_name, gender

local M = {}
local MAX_LEN = 7

local function clampName(name, fallback)
  name = tostring(name or fallback or "")
  if name == "" then name = fallback or "RED" end
  if #name > MAX_LEN then name = name:sub(1, MAX_LEN) end
  -- Cartridge text is uppercase-only; preserve digits/punctuation but never
  -- pass lowercase letters into the engine's text tables.
  return name:gsub("%l", string.upper)
end

function M.apply(mod, options)
  if not options then return end

  local player = clampName(options.player_name, "RED")
  local rival  = clampName(options.rival_name, "BLUE")
  local gender = (options.gender == "female") and "female" or "male"

  pcall(function()
    local okGV, GV = pcall(require, "src.core.GameVersion")
    local id = ""
    if okGV and GV and GV.get then id = tostring(GV.get() or "") end

    local presets = {
      red = {
        player = { "RED", "ASH", "JACK", "TOM" },
        rival  = { "BLUE", "GARY", "JOHN", "GREEN" },
      },
      blue = {
        player = { "BLUE", "GARY", "JOHN", "ASH" },
        rival  = { "RED", "ASH", "JACK", "TOM" },
      },
      yellow = {
        player = { "ASH", "RED", "JACK", "TOM" },
        rival  = { "BLUE", "GARY", "JOHN", "GREEN" },
      },
      gold = {
        player = { "CHRIS", "GOLD", "ETHAN", "HIRO" },
        rival  = { "SILVER", "RIVAL", "ADAM", "SHU" },
      },
      silver = {
        player = { "CHRIS", "SILVER", "ETHAN", "HIRO" },
        rival  = { "GOLD", "RIVAL", "ADAM", "SHU" },
      },
      crystal = {
        player = { "CHRIS", "KRIS", "ETHAN", "LYRA" },
        rival  = { "SILVER", "RIVAL", "ADAM", "GOLD" },
      },
    }
    local p = presets[id] or presets.red
    local patch = {
      playerName = player,
      rivalName = rival,
      playerGender = gender,
      gender = gender,
      playerGender = gender,
      oakTimeHours = tonumber(options.oak_time_hours) or 12,
      oakTimeMinutes = tonumber(options.oak_time_minutes) or 0,
      oakTime = {
        hours = tonumber(options.oak_time_hours) or 12,
        minutes = tonumber(options.oak_time_minutes) or 0,
      },
      namePresets = {
        player = { p.player[1], p.player[2], p.player[3], p.player[4], player },
        rival  = { p.rival[1], p.rival[2], p.rival[3], p.rival[4], rival },
      },
    }
    mod.content.field:patch("boot", patch)
  end)

  local function applyNames(save)
    if not (save and save.player) then return end
    save.player.name  = player
    save.player.rival = rival

    -- Gen2 builds have used slightly different save-field names across
    -- revisions. Set the player object first (the normal save API), then
    -- mirror the value to the common top-level aliases when present.
    local isFemale = (gender == "female")
    local genderValue = isFemale and 1 or 0
    save.player.gender = genderValue
    save.player.isFemale = isFemale
    save.player.playerGender = genderValue
    save.player.genderFemale = isFemale
    save.player_gender = genderValue
    save.playerGender = genderValue

    -- Oak's clock selection: set the clock/time containers when they exist.
    -- We intentionally do not touch play-time counters here.
    local hours = math.max(0, math.min(23, tonumber(options.oak_time_hours) or 12))
    local minutes = math.max(0, math.min(59, tonumber(options.oak_time_minutes) or 0))
    local function setTime(t)
      if type(t) ~= "table" then return end
      if t.hours ~= nil then t.hours = hours end
      if t.hour ~= nil then t.hour = hours end
      if t.minutes ~= nil then t.minutes = minutes end
      if t.minute ~= nil then t.minute = minutes end
    end
    -- Prefer the actual clock object used by Gen2. Create it when the save
    -- does not have one yet (new-game/Oak-skip path).
    if type(save.clock) ~= "table" then save.clock = {} end
    save.clock.hours = hours
    save.clock.minutes = minutes
    setTime(save.clock)
    setTime(save.time)
    setTime(save.rtc)
  end

  pcall(function()
    mod.events:on("save.created", function(ev)
      applyNames(ev.save)
    end)
  end)

  if not options.oak_speech_skip then return end

  pcall(function()
    mod.hooks:wrap("intro.oak_speech.build", function(next, steps, speech)
      next(steps, speech)
      if speech and speech.game and speech.game.save then applyNames(speech.game.save) end
      return {}
    end)
  end)

  pcall(function()
    mod.content.field:patch("intro", { skip = true })
  end)

  pcall(function()
    mod.hooks:wrap("intro.speech.build", function(next, steps, speech)
      next(steps, speech)
      if speech and speech.game and speech.game.save then applyNames(speech.game.save) end
      return {}
    end)
  end)
end

return M
