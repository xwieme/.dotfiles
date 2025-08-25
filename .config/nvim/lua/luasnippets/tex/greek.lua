local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {

  s({ trig = ".a", snippetType = "autosnippet", condition = in_mathzone }, { t("\\alpha") }),
  s({ trig = ".b", snippetType = "autosnippet", condition = in_mathzone }, { t("\\beta") }),
  s({ trig = ".g", snippetType = "autosnippet", condition = in_mathzone }, { t("\\gamma") }),
  s({ trig = ".G", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Gamma") }),
  s({ trig = ".d", snippetType = "autosnippet", condition = in_mathzone }, { t("\\delta") }),
  s({ trig = ".D", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Delta") }),
  s({ trig = ".e", snippetType = "autosnippet", condition = in_mathzone }, { t("\\epsilon") }),
  s({ trig = ".z", snippetType = "autosnippet", condition = in_mathzone }, { t("\\zeta") }),
  s({ trig = ".o", snippetType = "autosnippet", condition = in_mathzone }, { t("\\theta") }),
  s({ trig = ".O", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Theta") }),
  s({ trig = ".l", snippetType = "autosnippet", condition = in_mathzone }, { t("\\lambda") }),
  s({ trig = ".L", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Lambda") }),
  s({ trig = ".p", snippetType = "autosnippet", condition = in_mathzone }, { t("\\psi") }),
  s({ trig = ".P", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Psi") }),
  s({ trig = ".f", snippetType = "autosnippet", condition = in_mathzone }, { t("\\phi") }),
  s({ trig = ".F", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Phi") }),
  s({ trig = ".c", snippetType = "autosnippet", condition = in_mathzone }, { t("\\chi") }),
  s({ trig = ".x", snippetType = "autosnippet", condition = in_mathzone }, { t("\\xi") }),
  s({ trig = ".t", snippetType = "autosnippet", condition = in_mathzone }, { t("\\tau") }),
}
