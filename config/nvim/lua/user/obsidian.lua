require("obsidian").setup({
    dir = "~/Documents/Notes/",
    daily_notes = {folder = 'Daily-Notes'},
    completion = {
        nvim_cmp = true -- if using nvim-cmp, otherwise set to false
    }
})

vim.keymap.set("n", "<leader>odn", ":ObsidianToday<CR>")
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>")
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>")
