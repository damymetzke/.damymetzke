return function()
  local lspc = require "lspconfig"
  local util = require "lspconfig/util"

  local pid = vim.fn.getpid()
  -- local omnisharp_bin = "/home/dmetzke/omnisharp/run"
  local omnisharp_bin = "/home/dmetzke/installed/omnisharp/run"
  -- local omnisharp_bin = "/mnt/d/OmnisharpOlder/omnisharp.exe"
  -- Leader <space>
  vim.g.mapleader = " "

  on_attach = require'share.lsp_keybinds'

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

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  lspc.cssls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
  }

  lspc.tailwindcss.setup{
    on_attach = on_attach,
  }

  lspc.pyright.setup{
    on_attach = on_attach,
  }

  lspc.gopls.setup{
    on_attach = on_attach,
  }

  lspc.cssls.setup{
    on_attach = on_attach,
  }

  lspc.taplo.setup{
    on_attach = on_attach,
  }

  -- lspc.java_language_server.setup{
  --   on_attach = on_attach,
  --   cmd = { "/home/dmetzke/source_installs/java-language-server/lang_server_linux.sh" },
  -- }

  lspc.texlab.setup{
    on_attach = on_attach,
  }

end
