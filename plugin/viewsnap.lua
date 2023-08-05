--  Title:        viewsnap.nvim
--  Description:  A plugin to keep your cursor & scroll positions even if you change the buffers.
--  Last Change:  5 August 2023
--  Maintainer:   riodelphino <https://github.com/riodelphino>
--
--  Prevents the plugin from being loaded multiple times. If the loaded
--  variable exists, do nothing more. Otherwise, assign the loaded
--  variable and continue running this instance of the plugin.

if vim.g.loaded_viewsnap_nvim then return end

local viewsnap = require("viewsnap")
viewsnap.setup {}
