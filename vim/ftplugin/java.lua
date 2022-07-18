vim.bo.shiftwidth = 4

jdtls = require "jdtls"

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
  {"<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>"},
}

-- Keybinds
local function on_attach(client, buffer_number)

  for _, to_bind in pairs(keybind_list) do
    vim.api.nvim_buf_set_keymap(buffer_number, "n", to_bind[1], to_bind[2], {noremap = true, silent = false})
  end

end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local java_config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    'java',

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', '/home/dmetzke/manual-installs/jdt/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',


    '-configuration', '/home/dmetzke/manual-installs/jdt/config_linux',


    '-data', '/home/dmetzke/tmp/dumb_java_data_directory/' .. project_name,
  },
  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },

  on_attach = on_attach,
}


jdtls.start_or_attach(java_config)
