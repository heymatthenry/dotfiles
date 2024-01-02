vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'

require('lualine').setup {
  options = {
    theme = 'catppuccin-mocha',
    section_separators = '',
    component_separators = ''
  }
}
-- require('mh.evilline') 
