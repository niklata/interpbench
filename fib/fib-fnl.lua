#!/usr/bin/env lua5.4
local function fib(n)
  if (n < 2) then
    return n
  else
    return (fib((n - 1)) + fib((n - 2)))
  end
end
return print(fib(18))
