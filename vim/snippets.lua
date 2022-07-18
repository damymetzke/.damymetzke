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
})
