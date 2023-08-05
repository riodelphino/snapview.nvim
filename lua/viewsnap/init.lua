----------------------------------------------------
-- Save & Restore current cursor & scroll positions
----------------------------------------------------
-- print("viewsnap: init.lua: top")

local M = {}
local fn = require("viewsnap.functions")

-- this variable keeps the winview settings as table.
local savedBufViews = {}

local default_configs = {}

function create_command()
   -- When switching buffers, preserve window view.
   vim.api.nvim_create_autocmd({ "BufLeave" }, { pattern = "*", command = "lua AutoSaveWinView()" })
   vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = "*", command = "lua AutoRestoreWinView()" })
end

function update_configs(configs, user_configs)
   for k, v in pairs(user_configs) do
      if type(v) == "table" then
         if not configs[k] then configs[k] = {} end
         update_configs(configs[k], v)
      else
         configs[k] = v
      end
   end
end

M.setup = function(user_configs)
   update_configs(default_configs, user_configs)
   create_command()
   vim.g.loaded_viewsnap_nvim = true
end

-- Save current view settings on a per-window, per-buffer basis.
function AutoSaveWinView()
   local win_id = vim.api.nvim_get_current_win()
   local buf = vim.fn.bufnr("%")
   if not savedBufViews[win_id] then savedBufViews[win_id] = {} end
   local v = vim.fn.winsaveview()
   savedBufViews[win_id][buf] = v
end

-- Restore current view settings.
function AutoRestoreWinView()
   local win_id = vim.api.nvim_get_current_win()
   local buf = vim.fn.bufnr("%")
   if savedBufViews[win_id] and savedBufViews[win_id][buf] then
      local v = savedBufViews[win_id][buf]
      vim.fn.winrestview(v)
      savedBufViews[win_id][buf] = nil
   end
end

-- print("viewsnap: init.lua: bottom")

return M
