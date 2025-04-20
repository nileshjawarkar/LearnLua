-- function that do not return anything
local function hello(name)
    -- Sting concatenation
    print("hello - " .. name)
end

-- function that return sum
hello("nilesh")

local function add(num1, num2)
    return num1 + num2
end

print("addition of 10 and 20 = " .. add(10, 20))

-- higher order function : function that return function.
local function higher_order(num1)
    return function(num2)
        return num1 + num2
    end
end

local one_adder = higher_order(1)
print("5 + 1 = " .. one_adder(5))
print("7 + 1 = " .. one_adder(7))


local five_adder = higher_order(5)
print("5 + 5 = " .. five_adder(5))
print("7 + 5 = " .. five_adder(7))
