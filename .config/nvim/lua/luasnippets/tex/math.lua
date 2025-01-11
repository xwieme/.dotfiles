local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("tex", {

    s({
        trig = "'",
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
        description = "Superscript"
    }, fmta([[^{ <> }]], { i(1) })),

    s({
        trig = "_",
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
        description = "Subscript"
    }, fmta([[_{ <> }]], { i(1) })),


})
