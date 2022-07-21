local snip = require"luasnip"

snip.add_snippets("java", {
  snip.snippet(
    {trig="sout"},
    {
      snip.text_node({"System.out.println("}),
      snip.insert_node(1),
      snip.text_node({");"}),
    }
  ),
  snip.snippet(
    {trig="serr"},
    {
      snip.text_node({"System.err.println("}),
      snip.insert_node(1),
      snip.text_node({");"}),
    }
  ),
  snip.snippet(
    {trig="psvm"},
    {
      snip.text_node({"public static void main(String[] args) {", ""}),
      snip.insert_node(0),
      snip.text_node({"", "}"}),
    }
  ),
})

snip.add_snippets("rust", {
  -- Create a match block
  -- TODO: Automatically insert match arms when possible
  snip.snippet(
    {trig=".match"},
    {
      snip.text_node({"match "}),
      snip.insert_node(1),
      snip.text_node({" {", ""}),
      snip.insert_node(0),
      snip.text_node({"", "}"}),
    }
  ),
  -- Create an impl block with a `new` function
  snip.snippet(
    {trig="impl:new"},
    {
      snip.text_node({"impl "}),
      snip.insert_node(1),
      snip.text_node({" {", "  pub fn new("}),
      snip.insert_node(2),
      snip.text_node({") -> Self {", "  "}),
      snip.function_node(
        function(args, snip, user_arg_1) return args[1][1] end,
        {1},
        { user_args = {""}}
      ),
      snip.text_node({" {", "    "}),
      snip.insert_node(0),
      snip.text_node({"", "  }", "}"}),
    }
  ),
})
