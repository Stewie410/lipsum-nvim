local M = {}

---Get selected wordlist
---@param name string
---@return table
function M.get_words(name)
  local ok, words = pcall(require, "lipsum.words." .. string.lower(name))

  if not ok then
    error("Cannot load lipsum wordlist: " .. name)
  end

  return words
end

return M
