local ModeCollection = {
    modes = {},
    endOffset = 0,
}

function ModeCollection:new(o)
    o is o or {}
    setmetatable(o, self)
    self.__index = self
end

function ModeCollection:addMode(mode)
    table.insert(self.modes, mode)
    return true
end

function ModeCollection:tagIsVisible(i)
end

return ModeCollection
