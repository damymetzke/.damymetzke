local awful = require "awful"

local setupTags = {}

function setupTags.run(screen, modes, globalTags)
    for modeI, mode in pairs(modes) do
        for i = 1, mode.numTags, 1 do
            if #(mode.tags) < i then
                awful.tag.add("" .. (i % 10), {
                        layout = awful.layout.suit.tile,
                        master_fill_policy = "expand",
                        gap_single_client = true,
                        gap = 2,
                        screen = screen,
                        selected = (i == 1) and (modeI == 1),
                    })
            else
                tag = mode.tags[i]
                awful.tag.add(tag.name, {
                        layout = tag.layout,
                        master_fill_policy = tag.master_fill_policy,
                        gap_single_client = tag.gap_single_client,
                        gap = tag.gap,
                        screen = screen,
                        selected = (i == 1) and (modeI == 1),
                    })
            end
        end
    end

    for _, tag in pairs(globalTags) do
        awful.tag.add(tag.name, {
                layout = tag.layout,
                master_fill_policy = tag.master_fill_policy,
                gap_single_client = tag.gap_single_client,
                gap = tag.gap,
                screen = screen,
                selected = (i == 1) and (modeI == 1),
            })
    end
end

return setupTags
