require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  indent = {
    enable = true,
    disable = { "yaml" },
  },

  highlight = {
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    additional_vim_regex_highlighting = false,
  },
}
