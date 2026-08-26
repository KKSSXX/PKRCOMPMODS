-- PLCMoney.lua
-- Player Cheats: live money editor.
-- Reads/writes the current game's save directly and handles its own UI/Input.
local M = {}
M.MAX_MONEY = 999999
local game_ref = nil
local money_edit = nil

-- Lokale Helper-Funktion für Tasten-Abfrage (Edge-Detection)
local keyHeld = {}
local function edge(name)
  local down = false
  pcall(function() down = love.keyboard.isDown(name) end)
  local was = keyHeld[name]
  keyHeld[name] = down
  return down and not was
end

function M.set_game(game)
  if game then game_ref = game end
end

function M.get()
  if not game_ref or not game_ref.save then return nil end
  return tonumber(game_ref.save.money) or 0
end

function M.set(value)
  if not game_ref or not game_ref.save then return false end
  value = tonumber(value)
  if not value then return false end
  value = math.floor(value)
  value = math.max(0, math.min(M.MAX_MONEY, value))
  game_ref.save.money = value
  return true
end

-- Startet den Edit-Modus
function M.start_edit()
  local value = M.get() or 0
  money_edit = { text = tostring(value), cursor = #(tostring(value)) + 1 }
end

-- Setzt den Status zurück (z.B. wenn Menü geschlossen wird)
function M.reset()
  money_edit = nil
end

-- Verarbeitet Texteingaben (Zahlen)
function M.handle_textinput(text)
  if not money_edit then return false end
  text = tostring(text or ""):gsub("[^0-9]", "")
  if text == "" then return true end
  local t = money_edit.text or ""
  local cur = money_edit.cursor or (#t + 1)
  t = t:sub(1, cur - 1) .. text .. t:sub(cur)
  t = t:gsub("^0+", "")
  if t == "" then t = "0" end
  local n = tonumber(t) or 0
  if n > M.MAX_MONEY then n = M.MAX_MONEY end
  t = tostring(n)
  money_edit.text = t
  money_edit.cursor = #t + 1
  return true
end

-- Verarbeitet Tastatur-Inputs (Pfeiltasten, Backspace, Enter, Esc)
function M.poll_input()
  if not money_edit then return false end
  
  if edge("left") then
    money_edit.cursor = math.max(1, (money_edit.cursor or 1) - 1)
  end
  if edge("right") then
    money_edit.cursor = math.min(#(money_edit.text or "") + 1, (money_edit.cursor or 1) + 1)
  end
if edge("backspace") then
  local t = money_edit.text or ""
  local cur = money_edit.cursor or (#t + 1)
  if cur > 1 then
    t = t:sub(1, cur - 2) .. t:sub(cur)
    t = t:gsub("^0+", "")   
    money_edit.text = t
    money_edit.cursor = math.max(1, cur - 1)
  end
end
  if edge("return") or edge("tab") then
    M.set(money_edit.text)
    money_edit = nil
  elseif edge("escape") or edge("x") then
    money_edit = nil
  end
  return true
end

-- Zeichnet die Money Box
function M.draw()
  if not money_edit then return false end
  local ww, wh = love.graphics.getDimensions()
  local pad, rowH, titleH, panelW = 10, 22, 28, 300
  local panelH = titleH + 8 + 4 * rowH + 22
  local px = math.floor((ww - panelW) / 2)
  local py = math.floor((wh - panelH) / 2)
  
  love.graphics.setColor(0.04, 0.04, 0.06, 0.96)
  love.graphics.rectangle("fill", px, py, panelW, panelH, 6, 6)
  love.graphics.setColor(0.30, 0.50, 1.0, 1)
  love.graphics.setLineWidth(2)
  love.graphics.rectangle("line", px, py, panelW, panelH, 6, 6)
  love.graphics.setColor(0.85, 0.90, 1.0, 1)
  love.graphics.print("MONEY  (0-" .. M.MAX_MONEY .. ")", px + pad, py + 8)
  love.graphics.setColor(1, 1, 0.4, 1)
  love.graphics.print((money_edit.text or "0") .. "_", px + pad + 40, py + titleH + 8)
  love.graphics.setColor(0.55, 0.55, 0.60, 1)
  love.graphics.print("Type numbers  Backspace=del", px + pad, py + panelH - 36)
  love.graphics.print("Enter=save  X=cancel", px + pad, py + panelH - 18)
  love.graphics.setColor(1, 1, 1, 1)
  return true
end

return M