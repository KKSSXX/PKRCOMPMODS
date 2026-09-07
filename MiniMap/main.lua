return function(mod)
  if mod._minimapMainLoaded then return end
  mod._minimapMainLoaded = true

  local function loadSibling(rel, ...)
    local okRead, source = pcall(function()
      return mod:read(rel)
    end)
    if not (okRead and type(source) == "string" and source ~= "") then
      if mod.log then
        pcall(function() mod.log:error("[MiniMap] missing %s", rel) end)
      end
      return nil
    end
    local chunk, compileErr = load(source, "@MiniMap/" .. rel)
    if not chunk then
      if mod.log then
        pcall(function()
        end)
      end
      return nil
    end
    local okRun, result = pcall(chunk)
    if not okRun then
      if mod.log then
        pcall(function()
        end)
      end
      return nil
    end
    if type(result) == "function" then
      local okEntry, value = pcall(result, ...)
      if not okEntry then
        if mod.log then
          pcall(function()
          end)
        end
        return nil
      end
      return value
    end
    return result
  end

  local api = loadSibling("MinimapApi.lua", mod)
  loadSibling("Gen1Markers.lua", mod, api)
  loadSibling("Gen2Markers.lua", mod, api)
  loadSibling("Minimap.lua", mod)
end
