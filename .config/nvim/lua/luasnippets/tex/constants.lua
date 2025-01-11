local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("tex", {

    s({ trig = ";N", snippetType = "autosnippet" },
        { t("\\nabla"), }
    ),

    s({ trig = ";a", snippetType = "autosnippet" },
        { t("\\alpha"), }
    ),

    s({ trig = ";b", snippetType = "autosnippet" },
        { t("\\beta"), }
    ),

    s({ trig = ";g", snippetType = "autosnippet" },
        { t("\\gamma"), }
    ),

    s({ trig = ";G", snippetType = "autosnippet" },
        { t("\\Gamma"), }
    ),

    s({ trig = ";d", snippetType = "autosnippet" },
        { t("\\delta"), }
    ),

    s({ trig = ";D", snippetType = "autosnippet" },
        { t("\\Delta"), }
    ),

    s({ trig = ";e", snippetType = "autosnippet" },
        { t("\\epsilon"), }
    ),

    s({ trig = ";z", snippetType = "autosnippet" },
        { t("\\zeta"), }
    ),

    s({ trig = ";o", snippetType = "autosnippet" },
        { t("\\theta"), }
    ),

    s({ trig = ";O", snippetType = "autosnippet" },
        { t("\\Theta"), }
    ),

    s({ trig = ";l", snippetType = "autosnippet" },
        { t("\\lambda"), }
    ),

    s({ trig = ";L", snippetType = "autosnippet" },
        { t("\\Lambda"), }
    ),

    s({ trig = ";p", snippetType = "autosnippet" },
        { t("\\psi"), }
    ),

    s({ trig = ";P", snippetType = "autosnippet" },
        { t("\\Psi"), }
    ),

    s({ trig = ";f", snippetType = "autosnippet" },
        { t("\\phi"), }
    ),

    s({ trig = ";F", snippetType = "autosnippet" },
        { t("\\Phi"), }
    ),

    s({ trig = ";c", snippetType = "autosnippet" },
        { t("\\chi"), }
    ),

    s({ trig = ";x", snippetType = "autosnippet" },
        { t("\\xi"), }
    ),

})
