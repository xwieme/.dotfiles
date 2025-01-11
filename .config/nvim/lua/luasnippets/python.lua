local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("python", {
    s({ trig = "([^%w])mn", snippetType = "autosnippet", regTrig = true, wordTrig = false }, {
        t('if __name__ == "__main__":'),
    }),

    s(
        {
            trig = "([^%w])cc",
            snippetType = "autosnippet",
            regTrig = true,
            wordTrig = false,
            description = "Insert block comment",
        },
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
        {
            trig = "([^%w])ds",
            snippetType = "autosnippet",
            regTrig = true,
            wordTrig = false,
            description = "Insert a function docstring",
        },
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

    s(
        {
            trig = "([^%w])pp",
            snippetType = "autosnippet",
            regTrig = true,
            wordTrig = false,
            description = "Print a variable",
        },
        fmta([[print(f"{ <> = }")]], { i(0) })
    )

})
