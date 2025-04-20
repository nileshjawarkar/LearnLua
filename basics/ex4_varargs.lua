-- Varibale argument function
local function variableArguments(...)
    local args = { ... }
    for key, value in pairs(args) do
        print(key, value)
    end
    return unpack(args)
end

print("1:", variableArguments(1, 2, "three", 4, "five"))
print("2:", variableArguments(1, 2, "three", 4, "five"), "<LOST>")

