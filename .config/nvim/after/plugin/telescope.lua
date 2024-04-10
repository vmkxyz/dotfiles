local builtin = require('telescope.builtin')
file_ignore_patterns = { "" }

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})

