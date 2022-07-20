vim.api.nvim_create_augroup("filetypedetect", { clear = true })

vim.api.nvim_create_autocmd(
  {
    "BufNew",
    "BufNewFile",
    "BufRead",
  },
  {
    group = 'filetypedetect',
    pattern = { '*.blade.php' },
    command = ':set filetype=blade',
  })
