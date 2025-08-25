local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {

  s(
    { trig = "nn", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
        ]],
      { i(1), i(2), rep(1) }
    )
  ),

  s(
    { trig = "eq", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        \begin{equation}
            <>
        \end{equation}
        ]],
      { i(1) }
    )
  ),

  s(
    { trig = "al", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        \begin{align}
            <>
        \end{align}
        ]],
      { i(1) }
    )
  ),

  s(
    { trig = "it", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        \begin{itemize}
            <>
        \end{itemize}
        ]],
      { i(1) }
    )
  ),

  s(
    { trig = "en", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        \begin{enumerate}
            <>
        \end{enumerate}
        ]],
      { i(1) }
    )
  ),

  s(
    { trig = "qu", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        \begin{quote}
            <>
        \end{quote}
        ]],
      { i(1) }
    )
  ),

  s(
    { trig = "pm", snippetType = "autosnippet", condition = in_mathzone },
    fmta(
      [[ 
        \begin{pmatrix} 
            <> 
        \end{pmatrix} 
    ]],
      { i(1) }
    )
  ),

  s(
    { trig = "mint", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[ 
        \begin{minted}{ <> } 
            <> 
        \end{pmatrix} 
    ]],
      { i(1), i(2) }
    )
  ),

  s(
    { trig = "nt", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        \NewTcbTheorem[number within=chapter]{theorem}{Theorem}%
            {colback=green!5, colframe=green!35!black,fonttitle=\bfseries}{th}
    ]],
      {}
    )
  ),

  s(
    { trig = "nd", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        \NewTcbTheorem[number within=chapter]{definition}{Definition}%
            {colback=blue!5, colframe=blue!35!black,fonttitle=\bfseries}{def}
    ]],
      {}
    )
  ),

  s(
    { trig = "nl", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        \NewTcbTheorem[number within=chapter]{lemma}{Lemma}%
            {colback=red!5, colframe=red!35!black,fonttitle=\bfseries}{lem}
    ]],
      {}
    )
  ),

  s(
    { trig = "np", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        \NewTcbTheorem[number within=chapter]{proposition}{Proposition}%
            {colback=red!5, colframe=red!35!black,fonttitle=\bfseries}{prop}
    ]],
      {}
    )
  ),

  s(
    { trig = "nc", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
        \NewTcbTheorem[number within=chapter]{corollary}{Corollary}%
            {colback=red!5, colframe=red!35!black,fonttitle=\bfseries}{col}
    ]],
      {}
    )
  ),

  s(
    { trig = "tb", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[ 
        \begin{theorem}{ <> } 
            <> 
        \end{theorem} 
    ]],
      { i(1), i(2) }
    )
  ),

  s(
    { trig = "db", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[ 
        \begin{definition}{ <> } 
            <> 
        \end{definition} 
    ]],
      { i(1), i(2) }
    )
  ),

  s(
    { trig = "pb", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[ 
        \begin{proposition}{ <> } 
            <> 
        \end{proposition} 
    ]],
      { i(1), i(2) }
    )
  ),

  s(
    { trig = "cb", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[ 
        \begin{corollary}{ <> } 
            <> 
        \end{corollary} 
    ]],
      { i(1), i(2) }
    )
  ),
}
