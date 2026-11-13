vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Autocomplétion LSP intégrée : décommenter pour l'activer
    -- vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
  end,
})

-- jdtls refuse de démarrer sous Java 21 : on lui choisit un JDK compatible
-- pour ne pas dépendre du JAVA_HOME du shell (.zshrc), qui peut changer
vim.lsp.config("jdtls", {
  cmd_env = {
    JAVA_HOME = vim.trim(vim.fn.system({ "/usr/libexec/java_home", "-v", "21+" })),
  },
})

vim.lsp.enable("pyright")
vim.lsp.enable("jdtls")
