local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("all", {

  s(
    { trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" },
    fmt(
      "\\frac{<>}{<>}",
      {
        i(1),
        i(2),
      },
      { delimiters = "<>" } -- manually specifying angle bracket delimiters
    )
  ),

  -- s(
  --   { trig = "ff", snippetType = "autosnippet" },
  --   fmt("\\frac{<>}{<>}", {
  --     i(1),
  --     i(2),
  --   }, { delimiters = "<>" })
  -- ),
})
