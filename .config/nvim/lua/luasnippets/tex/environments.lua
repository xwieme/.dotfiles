local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

ls.add_snippets("tex", {

    s({ trig = "env" }, fmta(
        [[
        \begin{<>}
            <>
        \end{<>}
        ]], { i(1), i(2), rep(1) }
    )),

    s({ trig = "eq" }, fmta(
        [[
        \begin{equation}
            <>
        \end{equation}
        ]], { i(1) }
    )),

    s({ trig = "all" }, fmta(
        [[
        \begin{align}
            <>
        \end{align}
        ]], { i(1) }
    )),

    s({ trig = "itt" }, fmta(
        [[
        \begin{align}
            <>
        \end{align}
        ]], { i(1) }
    )),

    s({ trig = "enu" }, fmta(
        [[
        \begin{enumerate}
            <>
        \end{enumerate}
        ]], { i(1) }
    )),

    s({ trig = "pm" }, fmta(
        [[
        \begin{pmatrix}
            <>
        \end{pmatrix}
        ]], { i(1) }
    )),

    s({ trig = "case" }, fmta(
        [[
        \begin{cases}
            <>
        \end{cases}
        ]], { i(1) }
    )),

    s({ trig = "qu" }, fmta(
        [[
        \begin{quote}
            <>
        \end{quote}
        ]], { i(1) }
    )),

})
