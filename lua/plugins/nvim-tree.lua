return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
--    "nvim-tree/nvim-web-devicons", -- Pour les icônes de fichiers
  },
  config = function()
    -- Désactiver netrw (l'explorateur de fichiers par défaut de vim)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false, -- Afficher les fichiers cachés
      },
    })

    -- Keybinding pour ouvrir/fermer l'arbre
    vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true, desc = "Toggle file tree" })
  end,
}
