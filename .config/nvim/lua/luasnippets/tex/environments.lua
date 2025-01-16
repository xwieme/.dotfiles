local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

ls.add_snippets("tex", {

    s({ trig = "env", snippetType = "autosnippet" }, fmta(
        [[
        \begin{<>}
            <>
        \end{<>}
        ]], { i(1), i(2), rep(1) }
    )),

    s({ trig = ";eq", snippetType = "autosnippet" }, fmta(
        [[
        \begin{equation}
            <>
        \end{equation}
        ]], { i(1) }
    )),

    s({ trig = ";al", snippetType = "autosnippet" }, fmta(
        [[
        \begin{align}
            <>
        \end{align}
        ]], { i(1) }
    )),

    s({ trig = ";it", snippetType = "autosnippet" }, fmta(
        [[
        \begin{itemize}
            <>
        \end{itemize}
        ]], { i(1) }
    )),

    s({ trig = ";en", snippetType = "autosnippet" }, fmta(
        [[
        \begin{enumerate}
            <>
        \end{enumerate}
        ]], { i(1) }
    )),

    s({ trig = ";pm", snippetType = "autosnippet" }, fmta(
        [[
        \begin{pmatrix}
            <>
        \end{pmatrix}
        ]], { i(1) }
    )),

    s({ trig = ";ca", snippetType = "autosnippet" }, fmta(
        [[
        \begin{cases}
            <>
        \end{cases}
        ]], { i(1) }
    )),

    s({ trig = ";qu", snippetType = "autosnippet" }, fmta(
        [[
        \begin{quote}
            <>
        \end{quote}
        ]], { i(1) }
    )),

})
