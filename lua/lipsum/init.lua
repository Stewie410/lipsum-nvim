---@class Lipsum
local M = {}

---Apply config options to lipsum.nvim
---@param options? lipsum.Options
function M.setup(options)
  require("lipsum.config").setup(options)
end

return M
