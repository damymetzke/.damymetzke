return function()
  local luasnip = require"luasnip"

  local add = luasnip.add_snippets
  local snippet = luasnip.snippet

  local t = luasnip.text_node
  local i = luasnip.insert_node
  local f = luasnip.function_node

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
      {trig=".match"},
      {
        t({"match "}),
        i(1),
        t({" {", ""}),
        i(0),
        t({"", "}"}),
      }
    ),
    -- Create an impl block with a `new` function
    snippet(
      {trig="impl:new"},
      {
        t({"impl "}),
        i(1),
        t({" {", "  pub fn new("}),
        i(2),
        t({") -> Self {", "  "}),
        f(
          function(args, snip, user_arg_1) return args[1][1] end,
          {1},
          { user_args = {""}}
        ),
        t({" {", "    "}),
        i(0),
        t({"", "  }", "}"}),
      }
    ),
  })
end
