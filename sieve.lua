#!/usr/bin/env lua5.4
function sieve_sundaram(n)
   local a = {}
   local s = {2}
   local m = n/2
   for i = 1, n do
      for j = i, n do
         local p = i + j + 2*i*j
         if p <= n then
            a[p] = true
         end
      end
   end
   for k = 1, m do
      if not a[k] then
         local q = 2*k + 1
         table.insert(s, q)
      end
   end

   return s
end

local t = sieve_sundaram(1000)
local ts = ""
for k,v in pairs(t) do
   ts = ts .. v .. " "
end
print(ts)
