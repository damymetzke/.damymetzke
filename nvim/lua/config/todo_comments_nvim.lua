return function()
  require "todo-comments".setup({
    keywords = {
      FIX = {
        icon = " ",
        color = "error",
        alt = {
                   "fix",   "Fix", 
          "FIXME", "fixme", "Fixme",
          "BUG",   "bug",   "Bug",
          "FIXIT", "fixit", "Fixit",
          "ISSUE", "issue", "Issue",
        },
        
      },

      TODO = {
        icon = " ",
        color = "info",
        alt = {"todo", "Todo"},
      },

      HACK = {
        icon = " ",
        color = "warning",
        alt = {"hack", "Hack"}
      },

      WARN = {
        icon = " ",
        color = "warning",
        alt = {
                     "warn",    "Warn",
          "WARNING", "warning", "Warning",
          "XXX",     "xxx",     "Xxx",
        },
      },

      PERF = {
        icon = " ",
        alt = {
                         "perf",        "Perf",
          "OPTIM",       "optim",       "Optim",
          "PERFORMANCE", "performance", "Performance",
          "OPTIMIZE",    "optimize",    "Optimize",
        },
      },

      NOTE = {
        icon = " ",
        color = "hint",
        alt = {
                  "note", "Note",
          "INFO", "info", "Info",
        },
      },

      TEST = {
        icon = "⏲ ",
        color = "test",
        alt = {
                     "test",    "Test",
          "TESTING", "testing", "Testing",
          "PASSED",  "passed",  "Passed",
          "FAILED",  "failed",  "Failed",
        },
      },
    },
  })
end
