return function(mod)
local MAX_LEN = 7
local function char_len(s)
local n = 0
for _ in tostring(s or ""):gmatch("[%z\1-\127\194-\244][\128-\191]*") do
n = n + 1
end
return n
end
local function trim_chars(s, max)
s = tostring(s or "")
local out, n = {}, 0
for ch in s:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
if n >= max then break end
out[#out + 1] = ch
n = n + 1
end
return table.concat(out)
end
local function normalize_name(s)
s = tostring(s or "")
s = s:gsub("[^A-Za-z0-9 %-%.'%?!]", "")
return trim_chars(s, MAX_LEN)
end
local function game_id()
local ok, GV = pcall(require, "src.core.GameVersion")
if ok and GV and GV.get then return tostring(GV.get() or "") end
return ""
end
-- Versionsspezifische Presets (nicht gemischt)
local PRESETS = {
red = {
player = {  "RED ",  "ASH ",  "JACK ",  "TOM ",  "CUSTOM" },
rival  = {  "BLUE ",  "GARY ",  "JOHN ",  "GREEN ",  "CUSTOM" },
},
blue = {
player = {  "BLUE ",  "ASH ",  "JOHN ",  "GREEN ",  "CUSTOM" },
rival  = {  "RED ",  "GARY ",  "JACK ",  "TOM ",  "CUSTOM" },
},
yellow = {
player = {  "ASH ",  "RED ",  "JACK ",  "TOM ",  "CUSTOM" },
rival  = {  "BLUE ",  "GARY ",  "JOHN ",  "GREEN ",  "CUSTOM" },
},
gold = {
player = {  "CHRIS ",  "GOLD ",  "ETHAN ",  "HIRO ",  "CUSTOM" },
rival  = {  "SILVER ",  "RIVAL ",  "ADAM ",  "SHU ",  "CUSTOM" },
},
silver = {
player = {  "CHRIS ",  "SILVER ",  "ETHAN ",  "HIRO ",  "CUSTOM" },
rival  = {  "GOLD ",  "RIVAL ",  "ADAM ",  "SHU ",  "CUSTOM" },
},
crystal = {
player = {  "CHRIS ",  "KRIS ",  "ETHAN ",  "LYRA ",  "CUSTOM" },
rival  = {  "SILVER ",  "RIVAL ",  "ADAM ",  "GOLD ",  "CUSTOM" },
},
}
local function presets_for(kind)
local id = game_id()
local p = PRESETS[id]
if not p then
p = PRESETS.red
end
return p[kind] or p.player
end
local function default_player()
return presets_for("player")[1]
end
local function default_rival()
return presets_for("rival")[1]
end
local options = {
title_screen_skip = false,
oak_speech_skip = false,
gender = "male",
oak_time_hours = 12,
oak_time_minutes = 0,
player_name = default_player(),
rival_name = default_rival(),
}
local function version_key()
local id = game_id()
if id == "" then return "red" end
return id
end
local function scoped_key(name)
return name .. "_" .. version_key()
end
local live = {
player_name = nil,
rival_name = nil,
}
local function options_path()
return (mod.path or ".") .. "/saved_options.lua"
end
local function load_options()
local ok, chunk = pcall(function() return love.filesystem.load(options_path()) end)
if ok and type(chunk) == "function" then
local ok2, data = pcall(chunk)
if ok2 and type(data) == "table" then
if data.title_screen_skip ~= nil then options.title_screen_skip = not not data.title_screen_skip end
if data.oak_speech_skip ~= nil then options.oak_speech_skip = not not data.oak_speech_skip end
    local scoped = data[version_key()]
     if type(scoped) == "table" then
       if scoped.gender then
         options.gender = (tostring(scoped.gender) == "female") and "female" or "male"
       end
       if scoped.oak_time_hours ~= nil then
         options.oak_time_hours = math.max(0, math.min(23, tonumber(scoped.oak_time_hours) or 12))
       end
       if scoped.oak_time_minutes ~= nil then
         options.oak_time_minutes = math.max(0, math.min(59, tonumber(scoped.oak_time_minutes) or 0))
       end
       if scoped.player_name then options.player_name = normalize_name(tostring(scoped.player_name)) end
       if scoped.rival_name then options.rival_name = normalize_name(tostring(scoped.rival_name)) end
     else
       if data.player_name and data.player_name ~= "Male" and data.player_name ~= "Female" then
         options.player_name = normalize_name(tostring(data.player_name))
       end
       if data.rival_name and data.rival_name ~= "Male" and data.rival_name ~= "Female" then
         options.rival_name = normalize_name(tostring(data.rival_name))
       end
       if data.gender then
         options.gender = (tostring(data.gender) == "female") and "female" or "male"
       end
       if data.oak_time_hours ~= nil then
         options.oak_time_hours = math.max(0, math.min(23, tonumber(data.oak_time_hours) or 12))
       end
       if data.oak_time_minutes ~= nil then
         options.oak_time_minutes = math.max(0, math.min(59, tonumber(data.oak_time_minutes) or 0))
       end
     end
   end
 end
 if mod.save and mod.save.get then
   local v = mod.save:get("title_screen_skip", nil)
   if v ~= nil then options.title_screen_skip = not not v end
   v = mod.save:get("oak_speech_skip", nil)
   if v ~= nil then options.oak_speech_skip = not not v end
   v = mod.save:get(scoped_key("gender"), nil)
   if v ~= nil then options.gender = (tostring(v) == "female") and "female" or "male" end
   v = mod.save:get(scoped_key("oak_time_hours"), nil)
   if v ~= nil then options.oak_time_hours = math.max(0, math.min(23, tonumber(v) or 12)) end
   v = mod.save:get(scoped_key("oak_time_minutes"), nil)
   if v ~= nil then options.oak_time_minutes = math.max(0, math.min(59, tonumber(v) or 0)) end
   local pn = mod.save:get(scoped_key("player_name"), nil)
   if pn and tostring(pn) ~= "Male" and tostring(pn) ~= "Female" then
     options.player_name = normalize_name(tostring(pn))
   end
   local rn = mod.save:get(scoped_key("rival_name"), nil)
   if rn and tostring(rn) ~= "Male" and tostring(rn) ~= "Female" then
     options.rival_name = normalize_name(tostring(rn))
   end
 end
 if options.player_name == "" or options.player_name == "Male" or options.player_name == "Female" then
   options.player_name = default_player()
 end
 if options.rival_name == "" or options.rival_name == "Male" or options.rival_name == "Female" then
   options.rival_name = default_rival()
 end
end
local function save_options()
if mod.save and mod.save.set then
mod.save:set("title_screen_skip", options.title_screen_skip)
mod.save:set("oak_speech_skip", options.oak_speech_skip)
mod.save:set(scoped_key("gender"), options.gender)
mod.save:set(scoped_key("oak_time_hours"), options.oak_time_hours)
mod.save:set(scoped_key("oak_time_minutes"), options.oak_time_minutes)
mod.save:set(scoped_key("player_name"), options.player_name)
mod.save:set(scoped_key("rival_name"), options.rival_name)
end
local body = string.format(
  "return {\n  title_screen_skip = %s,\n  oak_speech_skip = %s,\n  %s = {\n    gender = %q,\n    oak_time_hours = %d,\n    oak_time_minutes = %d,\n    player_name = %q,\n    rival_name = %q,\n  },\n}\n",
  options.title_screen_skip and "true" or "false",
  options.oak_speech_skip and "true" or "false",
  version_key(),
  options.gender or "male",
  options.oak_time_hours or 12,
  options.oak_time_minutes or 0,
  options.player_name or default_player(),
  options.rival_name or default_rival()
)
pcall(function() love.filesystem.write(options_path(), body) end)
end
load_options()
local function load_mod(name)
for _, p in ipairs({ (mod.path or ".") .. "/" .. name, name }) do
local ok, chunk = pcall(function() return love.filesystem.load(p) end)
if ok and type(chunk) == "function" then
local ok2, res = pcall(chunk)
if ok2 and type(res) == "table" then return res end
end
local ok3, res = pcall(dofile, p)
if ok3 and type(res) == "table" then return res end
end
return nil
end
local TitleSkip = load_mod("QOLTitleScreenSkip.lua")
local OakSkip   = load_mod("QOLOakSpeechSkip.lua")
local NameChg   = load_mod("PLCNameChange.lua")
local MoneyChg  = load_mod("PLCMoney.lua")
if NameChg and NameChg.MAX_LEN then MAX_LEN = NameChg.MAX_LEN end
local last_game = nil
local function apply_skips()
if TitleSkip and TitleSkip.apply then
pcall(function() TitleSkip.apply(mod, options) end)
end
if OakSkip and OakSkip.apply then
pcall(function() OakSkip.apply(mod, options) end)
end
end
local function apply_live_names()
if not NameChg or not NameChg.apply_live then return end
local pn = live.player_name
local rn = live.rival_name
if not pn and not rn then return end
pcall(function()
NameChg.apply_live(mod, last_game, pn, rn)
end)
end
apply_skips()
local function sync_live_from_save()
if last_game and last_game.save and last_game.save.player then
local p = last_game.save.player
if p.name and tostring(p.name) ~= "" then
live.player_name = normalize_name(tostring(p.name)):sub(1, MAX_LEN)
end
if p.rival and tostring(p.rival) ~= "" then
live.rival_name = normalize_name(tostring(p.rival)):sub(1, MAX_LEN)
end
end
if not live.player_name then live.player_name = default_player() end
if not live.rival_name then live.rival_name = default_rival() end
end
local function cycle_name(current, list)
local idx = nil
for i, p in ipairs(list) do
if p == current then idx = i break end
end
if not idx or current == "CUSTOM" then
return list[1]
end
idx = idx + 1
if idx > #list then idx = 1 end
return list[idx]
end
local name_edit = nil
local function start_name_edit(sink, target, seed)
local cur = trim_chars(tostring(seed or ""), MAX_LEN)
name_edit = {
sink = sink,
target = target,
text = cur,
cursor = math.min(MAX_LEN, #cur + 1),
}
end
local function finish_edit(cancel)
if not name_edit then return end
if cancel then
if name_edit.sink == "qol" then
if name_edit.target == "player" and (options.player_name == "CUSTOM" or options.player_name == "") then
options.player_name = default_player()
save_options()
apply_skips()
elseif name_edit.target == "rival" and (options.rival_name == "CUSTOM" or options.rival_name == "") then
options.rival_name = default_rival()
save_options()
apply_skips()
end
end
else
local name = (name_edit.text or ""):gsub("%s+$", "")
if name == "" then
name = name_edit.target == "player" and default_player() or default_rival()
end
name = normalize_name(name)
if name_edit.sink == "qol" then
if name_edit.target == "player" then options.player_name = name
else options.rival_name = name end
save_options()
apply_skips()
else
if name_edit.target == "player" then live.player_name = name
else live.rival_name = name end
apply_live_names()
end
end
name_edit = nil
end
local function build_qol()
local rows = {
{
label = "Title Screen Skip",
kind = "check",
get = function() return options.title_screen_skip end,
set = function(v)
options.title_screen_skip = not not v
save_options()
apply_skips()
end,
},
{
label = "Speech Skip",
kind = "check",
get = function() return options.oak_speech_skip end,
set = function(v)
options.oak_speech_skip = not not v
save_options()
apply_skips()
end,
},
{
label = "Player Name",
kind = "cycle",
get = function() return options.player_name end,
cycle = function()
local list = presets_for("player")
local n = cycle_name(options.player_name, list)
options.player_name = n
if n ~= "CUSTOM" then
save_options()
apply_skips()
end
end,
open_custom = function()
local seed = options.player_name
if seed == "CUSTOM" then seed = "" end
start_name_edit("qol", "player", seed)
end,
},
{
label = "Rival Name",
kind = "cycle",
get = function() return options.rival_name end,
cycle = function()
local list = presets_for("rival")
local n = cycle_name(options.rival_name, list)
options.rival_name = n
if n ~= "CUSTOM" then
save_options()
apply_skips()
end
end,
open_custom = function()
local seed = options.rival_name
if seed == "CUSTOM" then seed = "" end
start_name_edit("qol", "rival", seed)
end,
},
}
if game_id() == "gold" or game_id() == "silver" or game_id() == "crystal" then
   table.insert(rows, 3, {
     label = "Gender",
     kind = "cycle",
     get = function() return options.gender == "female" and "Female" or "Male" end,
     cycle = function()
       options.gender = options.gender == "female" and "male" or "female"
       save_options()
       apply_skips()
     end,
     cycle_backward = function()
       options.gender = options.gender == "female" and "male" or "female"
       save_options()
       apply_skips()
     end,
   })
   table.insert(rows, 4, {
     label = "Oak Time Hours",
     kind = "cycle",
     get = function() return string.format("%02d", options.oak_time_hours or 12) end,
     cycle = function()
       options.oak_time_hours = ((options.oak_time_hours or 12) + 1) % 24
       save_options()
       apply_skips()
     end,
     cycle_backward = function()
       options.oak_time_hours = ((options.oak_time_hours or 12) - 1) % 24
       save_options()
       apply_skips()
     end,
   })
   table.insert(rows, 5, {
     label = "Oak Time Minutes",
     kind = "cycle",
     get = function() return string.format("%02d", options.oak_time_minutes or 0) end,
     cycle = function()
       options.oak_time_minutes = ((options.oak_time_minutes or 0) + 1) % 60
       save_options()
       apply_skips()
     end,
     cycle_backward = function()
       options.oak_time_minutes = ((options.oak_time_minutes or 0) - 1) % 60
       save_options()
       apply_skips()
     end,
   })
 end
 return rows
end
local function build_player_cheats()
return {
{
label = "Player Name",
kind = "edit",
get = function()
return live.player_name or "(no save)"
end,
start_edit = function()
sync_live_from_save()
start_name_edit("live", "player", live.player_name)
end,
},
{
label = "Rival Name",
kind = "edit",
get = function()
return live.rival_name or "(no save)"
end,
start_edit = function()
sync_live_from_save()
start_name_edit("live", "rival", live.rival_name)
end,
},
{
label = "Money",
kind = "edit",
get = function()
if MoneyChg and MoneyChg.set_game and last_game then
MoneyChg.set_game(last_game)
end
if MoneyChg and MoneyChg.get then
local value = MoneyChg.get()
if value ~= nil then return tostring(value) end
end
return "(no save)"
end,
start_edit = function()
if MoneyChg and MoneyChg.set_game and last_game then
MoneyChg.set_game(last_game)
end
if MoneyChg and MoneyChg.start_edit then
MoneyChg.start_edit()
end
end,
},
}
end
local categories = {
{ name = "Quality of Life", items = build_qol },
{ name = "Challenge Mods",  items = function() return {} end },
{ name = "Player Cheats",   items = build_player_cheats },
{ name = "Pokemon Cheats",  items = function() return {} end },
}
local settingsOpen = false
local level = 1
local sel_cat = 1
local cursor = 1
local keyHeld = {}
local function current_items()
local c = categories[sel_cat]
return (c and c.items and c.items()) or {}
end
local function edge(name)
local down = false
pcall(function() down = love.keyboard.isDown(name) end)
local was = keyHeld[name]
keyHeld[name] = down
return down and not was
end
local function type_char(ch)
if not name_edit then return end
ch = tostring(ch or "")
if ch == "" then return end
ch = ch:gsub("[^%g ]", "")
if ch == "" then return end
local t = name_edit.text or ""
local cur = name_edit.cursor or (char_len(t) + 1)
local chars = {}
for c in t:gmatch("[%g ]") do
chars[#chars + 1] = c
end
for c in ch:gmatch("[%g ]") do
if #chars >= MAX_LEN then break end
table.insert(chars, cur, c)
cur = cur + 1
end
name_edit.text = table.concat(chars)
name_edit.cursor = math.min(MAX_LEN + 1, cur)
end
local function backspace_char()
if not name_edit then return end
local t = name_edit.text or ""
local chars = {}
for c in t:gmatch("[%z\1-\127\194-\244][\128-\191]*") do chars[#chars + 1] = c end
local cur = name_edit.cursor or (#chars + 1)
if cur <= 1 then return end
table.remove(chars, cur - 1)
name_edit.text = table.concat(chars)
name_edit.cursor = cur - 1
end
local previous_textinput = love.textinput
love.textinput = function(text)
if settingsOpen and MoneyChg and MoneyChg.handle_textinput and MoneyChg.handle_textinput(text) then
return
end
if settingsOpen and name_edit then
  type_char(text)
  return
end
if previous_textinput then return previous_textinput(text) end
end
local function poll_input()
if not (love and love.keyboard and love.keyboard.isDown) then return end
if edge("insert") then
   settingsOpen = not settingsOpen
   name_edit = nil
   if MoneyChg and MoneyChg.reset then MoneyChg.reset() end
   level = 1
   sel_cat = 1
   cursor = 1
   if settingsOpen then sync_live_from_save() end
 end
 if not settingsOpen then return end
 if MoneyChg and MoneyChg.poll_input and MoneyChg.poll_input() then
   return
 end
 if name_edit then
   if edge("left") then
     name_edit.cursor = math.max(1, (name_edit.cursor or 1) - 1)
   end
   if edge("right") then
     local maxc = math.min(MAX_LEN + 1, char_len(name_edit.text or "") + 1)
     name_edit.cursor = math.min(maxc, (name_edit.cursor or 1) + 1)
   end
   if edge("backspace") then backspace_char() end
   if edge("return") or edge("tab") then finish_edit(false) end
   if edge("escape") or edge("x") then finish_edit(true) end
   return
 end
 if edge("up") then
   if level == 1 then
     sel_cat = sel_cat - 1
     if sel_cat < 1 then sel_cat = #categories end
   else
     local n = #current_items()
     if n > 0 then cursor = cursor - 1 if cursor < 1 then cursor = n end end
   end
 end
 if edge("down") then
   if level == 1 then
     sel_cat = sel_cat + 1
     if sel_cat > #categories then sel_cat = 1 end
   else
     local n = #current_items()
     if n > 0 then cursor = cursor + 1 if cursor > n then cursor = 1 end end
   end
 end
 if edge("return") or edge("z") then
   if level == 1 then
     if #current_items() > 0 then level = 2 cursor = 1 end
   else
     local row = current_items()[cursor]
     if row then
       if row.kind == "check" then
         row.set(not row.get())
       elseif row.kind == "cycle" then
         local cur = row.get and row.get()
         if cur == "CUSTOM" and row.open_custom then
           row.open_custom()
         else
           row.cycle()
         end
       elseif row.kind == "edit" and row.start_edit then
         row.start_edit()
       end
     end
   end
 end
 if edge("right") and level == 2 then
   local row = current_items()[cursor]
   if row and row.kind == "cycle" then row.cycle() end
 end
 if edge("left") and level == 2 then
   local row = current_items()[cursor]
   if row and row.kind == "cycle" then
     local list = nil
     if row.label == "Player Name" then list = presets_for("player")
     elseif row.label == "Rival Name" then list = presets_for("rival") end
     if row.cycle_backward then
       row.cycle_backward()
     else
       local cur = row.get()
       local idx = nil
       for i, p in ipairs(list) do if p == cur then idx = i break end end
       if not idx then
         options.player_name = (row.label == "Player Name") and list[1] or options.player_name
         options.rival_name  = (row.label == "Rival Name") and list[1] or options.rival_name
         if row.label == "Player Name" then options.player_name = list[1]
         else options.rival_name = list[1] end
         save_options()
         apply_skips()
       else
         idx = idx - 1
         if idx < 1 then idx = #list end
         local n = list[idx]
         if row.label == "Player Name" then
           options.player_name = n
           if n ~= "CUSTOM" then save_options() apply_skips() end
         else
           options.rival_name = n
           if n ~= "CUSTOM" then save_options() apply_skips() end
         end
       end
   end
 end
 end
 if edge("x") or edge("escape") or edge("backspace") then
   if level == 2 then level = 1 cursor = 1
   else settingsOpen = false end
 end
end
local function draw_settings()
local ww, wh = love.graphics.getDimensions()
local pad, rowH, titleH, panelW = 10, 22, 28, 300
if MoneyChg and MoneyChg.draw and MoneyChg.draw() then
   return
 end
 if name_edit then
   local panelH = titleH + 8 + 4 * rowH + 22
   local px = math.floor((ww - panelW) / 2)
   local py = math.floor((wh - panelH) / 2)
   love.graphics.setColor(0.04, 0.04, 0.06, 0.96)
   love.graphics.rectangle("fill", px, py, panelW, panelH, 6, 6)
   love.graphics.setColor(0.30, 0.50, 1.0, 1)
   love.graphics.setLineWidth(2)
   love.graphics.rectangle("line", px, py, panelW, panelH, 6, 6)
   local title = name_edit.target == "player" and "PLAYER NAME" or "RIVAL NAME"
   love.graphics.setColor(0.85, 0.90, 1.0, 1)
   love.graphics.print(title .. "  (max " .. MAX_LEN .. ")", px + pad, py + 8)
   local t = name_edit.text or ""
   local chars = {}
   for c in t:gmatch("[%z\\1-\\127\\194-\\244][\\128-\\191]*") do chars[#chars + 1] = c end
   local cur = name_edit.cursor or (#chars + 1)
   local displayParts = {}
   for i = 1, #chars do
     displayParts[#displayParts + 1] = (i == cur and "_" or chars[i])
   end
   if cur > #chars then displayParts[#displayParts + 1] = "_" end
   while #displayParts < MAX_LEN + 1 do displayParts[#displayParts + 1] = "." end
   local display = table.concat(displayParts)
   love.graphics.setColor(1, 1, 0.4, 1)
   love.graphics.print(display, px + pad + 40, py + titleH + 8)
   love.graphics.setColor(0.55, 0.55, 0.60, 1)
   love.graphics.print("Type keyboard  Backspace=del", px + pad, py + panelH - 36)
   love.graphics.print("Enter=save  X=cancel", px + pad, py + panelH - 18)
   love.graphics.setColor(1, 1, 1, 1)
   return
 end
 local lines = {}
 local title = "MODS MENU  (Insert)"
 if level == 1 then
   for i, cat in ipairs(categories) do
     local has = #((cat.items and cat.items()) or {}) > 0
     lines[#lines + 1] = { label = cat.name, val = has and ">" or "", sel = (i == sel_cat) }
   end
 else
   local cat = categories[sel_cat]
   title = (cat and cat.name or "MENU")
   lines[#lines + 1] = { label = "< Back", val = "", sel = false, dim = true }
   for i, row in ipairs(current_items()) do
     local val = ""
     if row.kind == "check" then val = row.get() and "[X]" or "[ ]"
     elseif row.kind == "cycle" or row.kind == "edit" then val = tostring(row.get()) end
     lines[#lines + 1] = {
       label = row.label, val = val, sel = (i == cursor),
       on = row.kind == "check" and row.get(),
     }
   end
 end
 local panelH = titleH + 8 + (#lines * rowH) + 22
 local px = math.floor((ww - panelW) / 2)
 local py = math.floor((wh - panelH) / 2)
 love.graphics.setColor(0.04, 0.04, 0.06, 0.96)
 love.graphics.rectangle("fill", px, py, panelW, panelH, 6, 6)
 love.graphics.setColor(0.30, 0.50, 1.0, 1)
 love.graphics.setLineWidth(2)
 love.graphics.rectangle("line", px, py, panelW, panelH, 6, 6)
 love.graphics.setColor(0.85, 0.90, 1.0, 1)
 love.graphics.print(title, px + pad, py + 8)
 love.graphics.setColor(0.20, 0.25, 0.40, 1)
 love.graphics.line(px + pad, py + titleH, px + panelW - pad, py + titleH)
 for i, line in ipairs(lines) do
   local y = py + titleH + 8 + (i - 1) * rowH
   if line.sel then
     love.graphics.setColor(0.12, 0.20, 0.45, 0.98)
     love.graphics.rectangle("fill", px + 6, y - 2, panelW - 12, rowH - 2, 3, 3)
     love.graphics.setColor(1.0, 0.95, 0.40, 1)
     love.graphics.print("> " .. line.label, px + pad, y)
   else
     love.graphics.setColor(line.dim and 0.50 or 0.88, line.dim and 0.55 or 0.88, line.dim and 0.65 or 0.90, 1)
     love.graphics.print("  " .. line.label, px + pad, y)
   end
   if line.val and line.val ~= "" then
     if line.on or line.val == "[X]" then love.graphics.setColor(0.35, 0.95, 0.45, 1)
     elseif line.val == "[ ]" then love.graphics.setColor(0.70, 0.55, 0.55, 1)
     else love.graphics.setColor(line.sel and 1 or 0.75, line.sel and 0.95 or 0.80, line.sel and 0.40 or 0.90, 1) end
     love.graphics.print(line.val, px + panelW - pad - 70, y)
   end
 end
 love.graphics.setColor(0.50, 0.55, 0.65, 1)
 local hint = level == 1 and "Up/Down  Enter=Open  Insert/X=Close" or "Up/Down  Enter  X=Back"
 love.graphics.print(hint, px + pad, py + panelH - 18)
 love.graphics.setColor(1, 1, 1, 1)
end
mod.hooks:wrap("core.update", function(next, game, dt)
if game then last_game = game end
if settingsOpen then
return
end
if next then return next(game, dt) end
end)
mod.hooks:wrap("render.hud", function(nextFn, game, viewport)
if nextFn then nextFn(game, viewport) end
if game then
last_game = game
if MoneyChg and MoneyChg.set_game then MoneyChg.set_game(game) end
end
pcall(poll_input)
if settingsOpen then pcall(draw_settings) end
end)
end