#!/usr/bin/env lua5.4
local function sieve_sundaram(n)
  local a = {}
  local s = {2}
  local m = (n / 2)
  for i = 1, n do
    for j = i, n do
      local p = (i + j + (2 * i * j))
      if (p <= n) then
        a[p] = true
      else
      end
    end
  end
  for k = 1, m do
    if not a[k] then
      table.insert(s, ((2 * k) + 1))
    else
    end
  end
  return s
end
local t = sieve_sundaram(1000)
local s = ""
for k, v in pairs(t) do
  s = (s .. v .. " ")
end
return print(s)
