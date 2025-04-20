-- metatable
local vec_mt = {}
vec_mt.__add = function(left, right)
    return setmetatable({
        left[1] + right[1],
        left[2] + right[2],
        left[3] + right[3]
    }, vec_mt)
end

local v1 = setmetatable({ 1, 2, 3 }, vec_mt)
local v2 = setmetatable({ 2, -2, 5 }, vec_mt)

local v3 = v1 + v2
print(v3[1], v3[2], v3[3])
vim.print(v3)

-- __add is meta function, that we add and called by lua while addition.
-- setmetatable basically attach the metatable with the table given as input in 1st argument.
------------------------------------------------------------
-- There are some other functions we can use -
-- __index : called when index not found in the table
-- __newindex : called when new index added to the table.
-- __call :
---------------------------------------------------------

local fib_mt = {}
fib_mt.__index = function(self, key)
    if key < 2 then return 1 end
    -- Update table to save intermidiate results.
    self[key] = self[key - 2] + self[key - 1]
    return self[key]
end

local fib = setmetatable({}, fib_mt)
print(fib[5])
print(fib[1000])

