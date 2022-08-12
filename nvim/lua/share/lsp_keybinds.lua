local keybind_list = {
  {"gD", "<Cmd>lua vim.lsp.declaration()<CR>"},
  {"gd", "<Cmd>lua vim.lsp.buf.definition()<CR>"},
  {"K", "<Cmd>lua vim.lsp.buf.hover()<CR>"},
  {"gi", "<cmd>lua vim.lsp.buf.implementation()<CR>"},
  {"<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>"},
  {"<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>"},
  {"<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>"},
  {"<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>"},
  {"<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>"},
  {"<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>"},
  {"<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>"},
  {"gr", "<cmd>lua vim.lsp.buf.references()<CR>"},
  {"<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>"},
  {"[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"},
  {"]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"},
  {"<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>"},
  {"<leader>f", "<cmd>lua vim.lsp.buf.formatting({ async = true })<CR>"},
}

-- Keybinds
return function (client, buffer_number)
  for _, to_bind in pairs(keybind_list) do
    vim.api.nvim_buf_set_keymap(buffer_number, "n", to_bind[1], to_bind[2], {noremap = true, silent = false})
  end
end
