local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {

  -- Superscripts and subscripts
  -------------------------------
  s({ trig = "'", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone }, fmta("^{ <> }", { i(1) })),
  s({ trig = ";", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone }, fmta("_{ <> }", { i(1) })),

  s(
    { trig = "ee", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("e^{ <> }", { i(1) })
  ),

  s(
    { trig = "tt", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("^{ \\top }<>", { i(0) })
  ),

  s(
    { trig = "cc", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("^{ \\complement }<>", { i(0) })
  ),

  -- Semantic commands (vec, tilde etc ...)
  ------------------------------------------
  s({ trig = "mm", snippetType = "autosnippet", wordTrig = false }, fmta("$ <> $", { i(1) })),

  s(
    { trig = "ff", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\frac{ <> }{ <> }", { i(1), i(2) })
  ),

  s(
    { trig = "df", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\dfrac{ <> }{ <> }", { i(1), i(2) })
  ),

  s(
    { trig = "sq", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\sqrt{ <> }", { i(1) })
  ),

  s(
    { trig = "vv", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\vec{ <> }", { i(1) })
  ),

  s(
    { trig = "uv", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\uvec{ <> }", { i(1) })
  ),

  s(
    { trig = "mt", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\mat{ <> }", { i(1) })
  ),

  s(
    { trig = "tn", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\tensor{ <> }", { i(1) })
  ),

  s(
    { trig = "wt", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\widetilde{ <> }", { i(1) })
  ),

  s(
    { trig = "hh", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\hat{ <> }", { i(1) })
  ),

  s(
    { trig = "bb", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\bar{ <> }", { i(1) })
  ),

  s(
    { trig = "dd", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\dot{ <> }", { i(1) })
  ),

  s(
    { trig = "aa", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\abs{ <> }", { i(1) })
  ),

  s(
    { trig = "norm", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\norm{ <> }", { i(1) })
  ),

  s(
    { trig = "ang", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\ang{ <> }", { i(1) })
  ),

  -- Integrals
  -------------
  s(
    { trig = "intt", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\int_{ <> }^{ <> }", { i(1), i(2) })
  ),

  s(
    { trig = "innt", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone },
    fmta("\\int_{ - <> }^{ <> }", { i(1), rep(1) })
  ),

  s({ trig = "int3", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone }, t("\\iiint")),

  s({ trig = "int2", snippetType = "autosnippet", wordTrig = false, condition = in_mathzone }, t("\\iint")),

  -- Sums
  --------
  s({ trig = "sM", snippetType = "autosnippet", condition = in_mathzone }, fmta("\\sum_{ <> } ", { i(1) })),

  s(
    { trig = "smm", snippetType = "autosnippet", condition = in_mathzone },
    fmta("\\sum_{ <> }^{ <> } ", { i(1), i(2) })
  ),

  s(
    { trig = "smf", snippetType = "autosnippet", condition = in_mathzone },
    fmta("\\sum_{ <> = - \\infty }^{ \\infty } ", { i(1) })
  ),

  s({ trig = "lsM", snippetType = "autosnippet", condition = in_mathzone }, fmta("\\sum \\limits_{ <> } ", { i(1) })),

  s(
    { trig = "lsmm", snippetType = "autosnippet", condition = in_mathzone },
    fmta("\\sum \\limits_{ <> }^{ <> } ", { i(1), i(2) })
  ),

  -- Limits
  ----------
  s({ trig = "lM", snippetType = "autosnippet", condition = in_mathzone }, fmta("\\limits_{ <> } ", { i(1) })),

  s(
    { trig = "lmm", snippetType = "autosnippet", condition = in_mathzone },
    fmta("\\limits_{ <> }{ <> } ", { i(1), i(2) })
  ),

  -- Static text
  ---------------
  s({ trig = "and", snippetType = "autosnippet", condition = in_mathzone }, t("\\qquad \\text{and} \\quad ")),

  s({ trig = "where", snippetType = "autosnippet", condition = in_mathzone }, t("\\qquad \\text{where } \\, ")),

  s({ trig = "else", snippetType = "autosnippet", condition = in_mathzone }, t("\\qquad \\text{otherwise} \\qquad ")),

  -- Static math snippets
  ------------------------
  s({ trig = "inff", snippetType = "autosnippet", condition = in_mathzone }, t("\\infty ")),

  s({ trig = "intf", snippetType = "autosnippet", condition = in_mathzone }, t("\\int_{-\\infty}{\\infty} ")),

  s({ trig = ">>", snippetType = "autosnippet", condition = in_mathzone }, t("\\implies ")),

  s({ trig = "lra", snippetType = "autosnippet", condition = in_mathzone }, t("\\leftrightarrow ")),

  s({ trig = "df", snippetType = "autosnippet", condition = in_mathzone }, t("\\diff ")),

  s({ trig = "gd", snippetType = "autosnippet", condition = in_mathzone }, t("\\grad ")),

  s({ trig = "lap", snippetType = "autosnippet", condition = in_mathzone }, t("\\laplacian ")),

  s({ trig = "cll", snippetType = "autosnippet", condition = in_mathzone }, t("\\curl ")),

  s({ trig = ",.", snippetType = "autosnippet", condition = in_mathzone }, t("\\cdot ")),

  s({ trig = "xx", snippetType = "autosnippet", condition = in_mathzone }, t("\\times ")),

  s({ trig = "pt", snippetType = "autosnippet", condition = in_mathzone }, t("\\propto ")),

  s({ trig = "px", snippetType = "autosnippet", condition = in_mathzone }, t("\\approx ")),

  s({ trig = "eqq", snippetType = "autosnippet", condition = in_mathzone }, t("\\equiv ")),

  -- Misc
  --------

  s({ trig = "sgg", snippetType = "autosnippet", condition = in_mathzone }, fmta("\\subgrad{ <> } ", { i(1) })),

  s(
    { trig = "spp", snippetType = "autosnippet", condition = in_mathzone },
    fmta("\\subgraph{ <> }{ <> } ", { i(1), i(2) })
  ),
}
