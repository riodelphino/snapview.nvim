local M = {}

-- Print tables as string & recursively
print_table = function(t, degug, indent)
   if debug then
      indent = indent or "  "
      for k, v in pairs(t) do
         if type(v) == "table" then
            print(indent .. k .. " :")
            print_table(v, indent .. "  ")
         else
            print(indent .. k .. " : " .. tostring(v))
         end
      end
   end
end

M = {
   print_table = print_table,
}

return M
