return function()
  local map = require'util.map'

  require'rest-nvim'.setup({
    result_split_horizontal = true,
    highlight = {
      enabled = true,
      timeout = 150,
    },
    result = {
      show_url = true,
      show_http_info = true,
      show_headers = true,
    },
    jump_to_request = false,
    env_file = '.env',
    custom_dynamic_variables = {},
    yank_dry_run = true,
  })

  -- 
  map("n", "<Leader>hr", "<Plug>RestNvim")
end
