-- QOLTitleScreenSkip.lua
-- Nur Title Screen überspringen (Gen1 + Gen2)
-- apply(mod, options)  options.title_screen_skip

local M = {}

function M.apply(mod, options)
  if not options or not options.title_screen_skip then return end

  local version_id = ""
  local okGV, GameVersion = pcall(require, "src.core.GameVersion")
  if okGV and GameVersion and GameVersion.get then
    version_id = tostring(GameVersion.get() or "")
  end

  local isRBY = (version_id == "red" or version_id == "blue" or version_id == "yellow")
  local isGen2 = (version_id == "gold" or version_id == "silver" or version_id == "crystal")
    or (okGV and GameVersion.isGold and GameVersion.isGold())

  if isRBY then
    pcall(function()
      mod.content.screens:override("TitleState", {
        new = function(game, opts)
          local TitleState = require("src.ui.TitleState")
          local self = TitleState.new(game, opts)
          self.phase = "loop"
          self.scy = 0
          self.ribbonOffset = nil
          self.showBubble = true
          self.timer = 0
          self._menuOpen = false
          local od, osgb, oe, ou, oom = self.draw, self.sgbPalettes, self.enter, self.update, self.openMenu

          function self:draw()
            if self._menuOpen then
              love.graphics.setColor(1, 1, 1, 1)
              love.graphics.rectangle("fill", 0, 0, 160, 144)
            else
              od(self)
            end
          end
          function self:sgbPalettes(g)
            if self._menuOpen then return nil end
            return osgb(self, g)
          end
          function self:openMenu()
            self._menuOpen = true
            local before = game.stack:top()
            oom(self)
            local menu = game.stack:top()
            if menu and menu ~= before and menu ~= self then
              local prev = menu.onCancel
              menu.cancelable = true
              menu.onCancel = function()
                self._menuOpen = false
                self.phase = "loop"
                self.scy = 0
                self.ribbonOffset = nil
                self.showBubble = true
                self.timer = 0
                self:startMusic()
                if prev then prev() end
              end
            end
          end
          function self:enter()
            if oe then oe(self) end
            self:startMusic()
            self:openMenu()
          end
          function self:update(dt)
            if ou then ou(self, dt) end
            if self._menuOpen and game.stack and game.stack:top() == self then
              self:openMenu()
            end
          end
          return self
        end,
      })
    end)
  end

  if isGen2 then
    local function instant()
      return {
        new = function(game, opts)
          local s = { game = game, isOpaque = true, _done = false }
          function s:update(_)
            if s._done then return end
            s._done = true
            pcall(function() require("src.core.Music").stop() end)
            if game and game.showMainMenu then
              game:showMainMenu()
            elseif opts and opts.onDone then
              opts.onDone()
            end
          end
          function s:draw()
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.rectangle("fill", 0, 0, 160, 144)
          end
          return s
        end,
      }
    end

    for _, id in ipairs({
      "Gen2CopyrightSplash",
      "Gen2GameFreakPresents",
      "Gen2GoldSilverIntro",
    }) do
      pcall(function() mod.content.screens:override(id, instant()) end)
    end

    pcall(function()
      mod.content.screens:override("Gen2TitleState", {
        new = function(game, opts)
          local T = require("src.ui.gen2.TitleState")
          local self = T.new(game, opts)
          local oe = self.enter
          function self:enter()
            if oe then oe(self) end
            if game and game.showMainMenu then
              pcall(function() game:showMainMenu() end)
            end
          end
          return self
        end,
      })
    end)
  end
end

-- Liefert die Menüzeile(n) für das QoL-Panel in main.lua.
-- Aufruf: M.menu_rows(options, save_options, apply_skips, game_id)
-- options       -> die zentrale Options-Tabelle aus main.lua (Persistenz bleibt dort)
-- save_options  -> Funktion aus main.lua, speichert options auf Platte
-- apply_skips   -> Funktion aus main.lua, wendet alle QOL-Mods erneut an
function M.menu_rows(options, save_options, apply_skips)
  return {
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
  }
end

return M
