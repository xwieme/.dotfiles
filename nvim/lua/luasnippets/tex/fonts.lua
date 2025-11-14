local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("tex", {

    s({ trig = "sf", snippetType = "autosnippet" }, fmta("\\textbf{<>}", { i(1) })),
    s({ trig = "df", snippetType = "autosnippet" }, fmta("\\underline{<>}", { i(1) })),
    s({ trig = "jf", snippetType = "autosnippet" }, fmta("\\mathcal{<>}", { i(1) })),
    s({ trig = "hf", snippetType = "autosnippet" }, fmta("\\mathbb{<>}", { i(1) })),
    s({ trig = "kf", snippetType = "autosnippet" }, fmta("\\mathbf{<>}", { i(1) })),

    -- Headings
    s({ trig = "hp", snippetType = "autosnippet" }, fmta("\\part{<>}", { i(1) })),
    s({ trig = "h0", snippetType = "autosnippet" }, fmta("\\chapter{<>}", { i(1) })),
    s({ trig = "h1", snippetType = "autosnippet" }, fmta("\\section{<>}", { i(1) })),
    s({ trig = "h2", snippetType = "autosnippet" }, fmta("\\subsection{<>}", { i(1) })),
    s({ trig = "h3", snippetType = "autosnippet" }, fmta("\\subsubsection{<>}", { i(1) })),

})
