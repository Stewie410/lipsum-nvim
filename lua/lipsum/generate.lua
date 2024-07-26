local M = {}

local title = require("lipsum.util").title_case

-- set random seed on current time
math.randomseed(vim.fn.reltimefloat(vim.fn.reltime()))

---Get random word(s) from wordlist
---@param words string[] List of available words
---@param comma decimal Chance to append a comma after a word, between 0-1
---@param semi decimal Chance to append a semicolon after a word, between 0-1
---@param count number Number of words to generate
---@return string
function M.words(words, comma, semi, count)
  local t = {}

  while vim.tbl_count(t) < count do
    local w = words[math.random(#words)]

    if vim.tbl_count(t) < (count - 1) then
      if math.random() < comma then
        w = w .. ","
      elseif math.random() < semi then
        w = w .. ";"
      end
    end

    table.insert(t, w)
  end

  return table.concat(t, " ")
end

---Get line(s) of random length from wordlist
---@param words string[] List of available words
---@param comma decimal Chance to append a comma after a word, between 0-1
---@param semi decimal Chance to append a semicolon after a word, betwene 0-1
---@param min number Minimum line length
---@param max number Maximum line length
---@param count number Number of lines to generate
---@return string
function M.lines(words, comma, semi, min, max, count)
  local t = {}

  while vim.tbl_count(t) < count do
    local l = M.words(words, comma, semi, math.random(min, max))
    table.insert(t, title(l) .. ".")
  end

  return table.concat(t, "  ")
end

---Get paragraph(s) of random length from wordlist
---@param words string[] List of available words
---@param comma decimal Chance to append a comma after a word, between 0-1
---@param semi decimal Chance to append a semicolon after a word, between 0-1
---@param line_min number Minimum line length
---@param line_max number Maximum line length
---@param para_min number Minimum paragraph length
---@param para_max number Maximum paragraph length
---@param count number Number of paragraphs to generate
---@return string
function M.paragraphs(words, comma, semi, line_min, line_max, para_min, para_max, count)
  local t = {}

  while vim.tbl_count(t) < count do
    local len = math.random(para_min, para_max)
    local p = M.lines(words, comma, semi, line_min, line_max, len)
    table.insert(t, p)
  end

  return table.concat(t, "\n\n")
end

return M
