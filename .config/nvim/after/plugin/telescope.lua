local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    file_ignore_patterns = {"Games/*", "Pictures/*", "Music/*", "dotfiles/*", "**/*.pdf", "**/*.jpg", "**/*.jpeg", "**/*.pptx", "**/*.odp"},
  },
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})

