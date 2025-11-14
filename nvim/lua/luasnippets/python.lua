local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  s({ trig = "([^%w])mn", snippetType = "autosnippet", regTrig = true, wordTrig = false }, {
    t('if __name__ == "__main__":'),
  }),

  s(
    { trig = "cc", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        """
        <>
        """
      ]],
      { i(0) }
    )
  ),

  s(
    { trig = "ds", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        """
        Args:
            <>
        """
      ]],
      { i(0) }
    )
  ),

  s({ trig = "pp", snippetType = "autosnippet", condition = line_begin }, fmta([[print(f"{ <> = }")]], { i(0) })),
}
