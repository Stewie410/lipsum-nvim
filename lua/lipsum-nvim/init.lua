---@class Lipsum
local M = {}

---Apply config options to lipsum-nvim.nvim
---@param options? lipsum-nvim.Options
function M.setup(options)
  require("lipsum-nvim.config").setup(options)
end

return M
