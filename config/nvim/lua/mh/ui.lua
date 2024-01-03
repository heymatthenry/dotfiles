vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true

require('lualine').setup {
  options = {
    theme = 'catppuccin-mocha',
    section_separators = '',
    component_separators = ''
  }
}
