return function()
  local luasnip = require'luasnip'

  local add = luasnip.add_snippets
  local snippet = luasnip.snippet

  local t = luasnip.text_node
  local i = luasnip.insert_node
  local f = luasnip.function_node
  local fmt = require'luasnip.extras.fmt'.fmt

  add("markdown", {
    snippet(
      {trig = "!!"},
        fmt(
        [[
          <!-- {} -->
        ]],
        {
          i(0),
        }
      )
    ),
    snippet(
      {
        trig = "code"
      },
      fmt(
        [[
          ```{}
          {}
          ```
        ]],
        {
          i(1),
          i(0),
        }
      )
    ),
    snippet(
      {trig = "title"},
      fmt(
        [[
          # {}

          {}
        ]],
        {
          f(
            function(args, snip, user_arg_1) return vim.fn.expand("%:t") end,
            {1},
            { user_args = {""}}
          ),
          i(0),
        }
      )
    ),
  })

  add("java", {
    snippet(
      {trig="sout"},
      {
        t({"System.out.println("}),
        i(1),
        t({");"}),
      }
    ),
    snippet(
      {trig="serr"},
      {
        t({"System.err.println("}),
        i(1),
        t({");"}),
      }
    ),
    snippet(
      {trig="psvm"},
      {
        t({"public static void main(String[] args) {", ""}),
        i(0),
        t({"", "}"}),
      }
    ),
  })

  add("rust", {
    -- Create a match block
    -- TODO: Automatically insert match arms when possible
    snippet(
      "match",
        fmt(
          [[
            match {} {{
              {}
            }}
          ]],
          {
            i(1),
            i(0),
          }
        )
    ),
    -- Create an impl block with a `new` function
    -- TODO: Create a more comprehensive snippet
    snippet(
      "impl:new",
      fmt(
        [[
          impl {} {{
            pub fn new({}) -> Self {{
              {} {{
                {}
              }}
            }}
          }}
        ]],
        {
          i(1),
          i(2),
          f(
            function(args, snip, user_arg_1) return args[1][1] end,
            {1},
            { user_args = {""}}
          ),
          i(0),
        }
      )
    ),
    -- Create quick test block
    snippet(
      "test",
      fmt(
        [[
          #[cfg(test)]
          mod test {{
              #[test]
              fn test_{}() {{
                  {}
              }}
          }}
        ]],
        {
          i(1),
          i(0),
        }
      )
    )
  })
end
