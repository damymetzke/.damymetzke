local modeTags = require "utils.modeTags"
local setupModes = {}

function setupModes.run()
    modeTags.addMode("Normal", function() end, "1")

    modeTags.addMode("Web Development", function() end, "2")

    modeTags.addMode("Game Development", function() end, "3")
end

return setupModes
