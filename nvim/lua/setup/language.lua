vim.api.nvim_create_augroup("manualfiletypedetect", { clear = true })

vim.api.nvim_create_autocmd(
  {
    "BufNew",
    "BufNewFile",
    "BufRead",
  },
  {
    group = 'manualfiletypedetect',
    pattern = { '*.blade.php' },
    command = ':set filetype=blade',
  })
