local list = { "One", "two", "tree", "four" }
for key, value in ipairs(list) do
    print(key, value)
end

local t1 = { one = 1, two = 2, tree = 3, four = 4 }
-- ipairs will not work for t1 bacause its not list which indexed like in case of example above.
-- This is more like a map
-- for key, value in ipairs(t1) do
--
-- In this case we have to use pairs
for key, value in pairs(t1) do
    print(key, value)
end
