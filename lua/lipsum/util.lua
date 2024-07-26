local M = {}

---Apply title-case to a word
---@param word string
---@return string
function M.title_case(word)
  return word:sub(1, 1):upper() .. word:sub(2)
end

---Insert text at cursor position
---@param text string Content to be inserted
---@param winnr? number Insert content to Window, default: current
---@param bufnr? number Insert content to Window's buffer, default: current
function M.insert_text(text, winnr, bufnr)
  local win = winnr or vim.api.nvim_get_current_win()
  local buf = bufnr or vim.api.nvim_get_current_buf()
  local row, col = unpack(vim.api.nvim_win_get_cursor(win))
  local lines = vim.split(text, "\n")

  vim.api.nvim_buf_set_text(buf, row - 1, col, row - 1, col, lines)
end

---Standardized errors
---@param message string Error message
---@param notify? boolean Create an error notification as well as a error()
function M.err(message, notify)
  local msg = "[lipsum-nvim] " .. message
  if notify then
    vim.notify(msg, vim.log.levels.ERROR)
  end
  error(msg)
end

return M
