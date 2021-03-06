return function()
  local cmp = require'cmp'
  local luasnip = require'luasnip'
  local lspkind = require'lspkind'

  cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
      expand = function(args)

        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, {"i", "s"}),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, {"i", "s"}),

      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<S-Esc>'] = cmp.mapping.close(),
      ['<C-Space>'] = cmp.mapping.confirm({ select = false }),
      ['<C-n>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end),
      ['<C-l>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end),
    }),

    sources = {
      { name = 'luasnip' },
      { name = 'nvim_lua' },
      { name = 'nvim_lsp' },
    },

    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          luasnip = '[lua snip]',
          nvim_lua = '[api]',
          nvim_lsp = '[lsp]',
        },
      },
    },
  })
end
