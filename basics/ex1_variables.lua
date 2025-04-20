local number = 10 -- number type

local name = "nilesh jawarkar" -- String type
local name2 = 'nilesh jawarkar' -- Also works
local text = [[ This is multi-line test. And
        You can add many lines here.
        This is another line. ]]

local truth, lies = true, false -- boolean
local nothing = nil -- and nil, which indicates nothing

print("number = " .. number)
print("name = " .. name .. ", another name = " .. name2)
print("text = [" .. text .. "]")
-- Following line will throw error. Can append boolean to string.
-- print("true value = " .. truth .. ", lies = " .. lies)
print("true value = " .. tostring(truth) .. ", lies = " .. tostring(lies))
-- Following line will throw error. Can append nil to string.
-- print("nothing = " .. nothing)
print("nothing = " .. tostring(nothing))


