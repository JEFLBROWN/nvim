mt = {}

-- A metatable is simply a table with functions in it.
mt.__tostring = function() return "lol" end
mt.__add      = function(b) ... end       -- a + b
mt.__mul      = function(b) ... end       -- a * b
mt.__index    = function(k) ... end       -- Lookups (a[k] or a.k)
mt.__newindex = function(k, v) ... end    -- Setters (a[k] = v)

-- Metatables allow you to override behavior of another table.
mytable = {}
setmetatable(mytable, mt)
print(myobject)
Account = {}
function Account:new(balance)
  local t = setmetatable({}, { __index = Account })
  -- Your constructor stuff
  t.balance = (balance or 0)
  return t
end
function Account:withdraw(amount)
  print("Withdrawing "..amount.."...")
  self.balance = self.balance - amount
  self:report()
end
function Account:report()
  print("Your current balance is: "..self.balance)
end
a = Account:new(9000)
a:withdraw(200)    -- method call
mytable = { x = 2, y = function() .. end }
-- The same:
mytable.x
mytable['x']
-- Syntactic sugar, these are equivalent:
mytable.y(mytable)
mytable:y()
mytable.y(mytable, a, b)
mytable:y(a, b)
function X:y(z) .. end
function X.y(self, z) .. end

function myFunction()
  return 1
end

function myFunctionWithArgs(a, b)
  -- ...
end

myFunction()

anonymousFunctions(function()
  -- ...
end)

-- Not exported in the module
local function myPrivateFunction()
end

-- Splats
function doAction(action, ...)
  print("Doing '"..action.."' to", ...)
  --> print("Doing 'write' to", "Shirley", "Abed")
end

doAction('write', "Shirley", "Abed")
