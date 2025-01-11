local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("tex", {
    s({
        trig = "([^%w])cb",
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
        description = "Left/right curly braces",
    }, fmta("\\left{ <> \\right}", { i(1) })),

    s({
        trig = "([^%w])rb",
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
        description = "Left/right parentheses",
    }, fmta("\\left( <> \\right)", { i(1) })),

    s({
        trig = "([^%w])sb",
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
        description = "Left/right square brackets",
    }, fmta("\\left[ <> \\right]", { i(1) })),
})
