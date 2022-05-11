lspc = require "lspconfig"
util = require "lspconfig/util"

local pid = vim.fn.getpid()
-- local omnisharp_bin = "/home/dmetzke/omnisharp/run"
local omnisharp_bin = "/home/dmetzke/installed/omnisharp/run"
-- local omnisharp_bin = "/mnt/d/OmnisharpOlder/omnisharp.exe"
-- Leader <space>
vim.g.mapleader = " "

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
  {"<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>"},
  {"[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"},
  {"]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"},
  {"<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>"},
  {"<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>"},
}

-- Keybinds
local function on_attach(client, buffer_number)

  for _, to_bind in pairs(keybind_list) do
    vim.api.nvim_buf_set_keymap(buffer_number, "n", to_bind[1], to_bind[2], {noremap = true, silent = false})
  end

end

-- vim.lsp.set_log_level("debug")
-- vim.lsp.set_log_level("info")

root = vim.api.nvim_exec("pwd", true)

root = util.root_pattern"*.sln"(root) or util.root_pattern"*.csproj"(root) or root
root = string.gsub(root, "/mnt/d/", "D:\\")
root = string.gsub(root, "/", "\\")

lspc.omnisharp.setup{
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
  on_attach = on_attach,
}

lspc.phpactor.setup{
  on_attach = on_attach,
}

lspc.tsserver.setup{
  on_attach = on_attach,
}

lspc.vuels.setup{
  on_attach = on_attach,
}

lspc.rust_analyzer.setup{
  on_attach = on_attach,
}

lspc.gopls.setup{
  on_attach = on_attach,
}
lspc.cssls.setup{
  on_attach = on_attach,
}
