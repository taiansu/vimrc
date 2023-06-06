require'todo-comments'.setup {
  keywords = {
     TODO = { icon = " ", color = "info" },
     IDEAL = { icon = "⏲ " },
     NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
     DECAY = { icon = " ", color = "warning" },
     OPTIM = { icon = " ", alt = { "PERFORMANCE", "OPTIMIZE" } },
  },
  highlight = {
    keyword = "bg"
  }
}
