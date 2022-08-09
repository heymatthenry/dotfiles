-- orgmode
local org_dir = '~/org'
-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()
require('orgmode').setup({
    org_agenda_files = {org_dir .. '/**/*'},
    org_default_notes_file = org_dir .. '/notes.org',
    org_capture_templates = {
        j = {
            description = 'Journal',
            template = '\n** %<%Y-%m-%d> %<%A>\n*** %U\n\n%?',
            target = org_dir .. '/journal.org'
        },
        e = {
            description = 'Event',
            template = '* %?\n  %T',
            target = org_dir .. '/calendar.org'
        }
    }
})

require("headlines").setup()
require('org-bullets').setup()
