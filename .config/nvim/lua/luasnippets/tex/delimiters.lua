local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("tex", {
  s({
    trig = "([^%w])l\\{",
    regTrig = true,
    wordTrig = false,
    description = "Left/right curly braces",
    snippetType = "autosnippet",
  }, fmta("\\left{ <> \\right}", { i(1) })),

  s({
    trig = "([^%w])l\\(",
    regTrig = true,
    wordTrig = false,
    description = "Left/right parentheses",
    snippetType = "autosnippet",
  }, fmta("\\left( <> \\right)", { i(1) })),

  s({
    trig = "([^%w])l\\[",
    regTrig = true,
    wordTrig = false,
    description = "Left/right square brackets",
    snippetType = "autosnippet",
  }, fmta("\\left[ <> \\right]", { i(1) })),
})
