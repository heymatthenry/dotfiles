require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {work = "~/notes/work", home = "~/notes/home"}
            }
        }
    }
}

require("headlines").setup({
    norg = {
        headline_highlights = {
            "Headline1", "Headline2", "Headline3", "Headline4", "Headline5",
            "Headline6"
        },
        codeblock_highlight = {"NeorgCodeBlock"}
    }
})
