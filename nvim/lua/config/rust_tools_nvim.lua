return function()
  local rt = require("rust-tools")
  local on_attach = require'share.lsp_keybinds'

  rt.setup({
    server = {
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
          diagnostics = {
            disabled = {"inactive-code"},
          },
          procMacro = {
            enable = true,
            disableProcMacroError = true,
          },
          cargo = {
            features = {"all"},
          },
        }
      }
    },
  })
end
