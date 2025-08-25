local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
  s(
    { trig = "cb", snippetType = "autosnippet", description = "Left/right curly braces", condition = in_mathzone },
    fmta("\\left{ <> \\right}", { i(1) })
  ),

  s(
    { trig = "rb", snippetType = "autosnippet", description = "Left/right parentheses", condition = in_mathzone },
    fmta("\\left( <> \\right)", { i(1) })
  ),

  s(
    {
      trig = "([^%w])sb",
      snippetType = "autosnippet",
      description = "Left/right square brackets",
      condition = in_mathzone,
    },
    fmta("\\left[ <> \\right]", { i(1) })
  ),
}
