local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

ls.add_snippets("tex", {

  s({ trig = "sf", snippetType = "autosnippet" }, fmta("\\textbf{<>}", { i(1) })),
  s({ trig = "df", snippetType = "autosnippet" }, fmta("\\underline{<>}", { i(1) })),
  s({ trig = "jf", snippetType = "autosnippet" }, fmta("\\mathcal{<>}", { i(1) })),
  s({ trig = "hf", snippetType = "autosnippet" }, fmta("\\mathbb{<>}", { i(1) })),
  s({ trig = "kf", snippetType = "autosnippet" }, fmta("\\mathbf{<>}", { i(1) })),
})
