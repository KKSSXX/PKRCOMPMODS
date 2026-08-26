-- PLCNameChange.lua
-- Live-Namen im laufenden Spiel (Gen1 + Gen2)
-- Max-Länge wie Original: 7

local M = {}
M.MAX_LEN = 7

local function clampName(name, fallback)
  name = tostring(name or fallback or "")
  if name == "" then name = fallback or "RED" end
  if #name > M.MAX_LEN then name = name:sub(1, M.MAX_LEN) end
  return name
end

function M.apply_live(mod, game, player_name, rival_name)
  local player = player_name ~= nil and clampName(player_name, "RED") or nil
  local rival  = rival_name  ~= nil and clampName(rival_name, "BLUE") or nil
  local save = game and game.save
  if save and save.player then
    if player then save.player.name = player end
    if rival then save.player.rival = rival end
    return true
  end
  return false
end

return M
