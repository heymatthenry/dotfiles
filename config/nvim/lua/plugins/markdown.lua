return {
  { 
    'vimwiki/vimwiki', 
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki",
          path_html= "~/vimwiki/public_html",
          auto_tags = 1,
          auto_diary_index = 1,
          syntax = 'markdown',
          ext = '.md'
        },
      }
      vim.g.vimwiki_markdown_link_ext = 1
      vim.g.vimwiki_stripsym = ' '
      vim.g.vimwiki_global_ext = 0
    end
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    init = function()
      require("headlines").setup {
        vimwiki = { -- this might be ['vimwiki.markdown'] depending on your vimwiki configuration
          treesitter_language = "markdown",
          query = vim.treesitter.query.parse(
              "markdown",
              [[
                  (atx_heading [
                      (atx_h1_marker)
                      (atx_h2_marker)
                      (atx_h3_marker)
                      (atx_h4_marker)
                      (atx_h5_marker)
                      (atx_h6_marker)
                  ] @headline)

                  (thematic_break) @dash

                  (fenced_code_block) @codeblock

                  (block_quote_marker) @quote
                  (block_quote (paragraph (inline (block_continuation) @quote)))
                  (block_quote (paragraph (block_continuation) @quote))
                  (block_quote (block_continuation) @quote)
              ]]
          ),
          headline_highlights = { "Headline" },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          dash_string = "-",
          quote_highlight = "Quote",
          quote_string = "┃",
          fat_headlines = true,
          fat_headline_upper_string = "▃",
          fat_headline_lower_string = "🬂",
        }
      }
    end
  },
}
