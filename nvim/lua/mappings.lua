require "nvchad.mappings"

local map = vim.keymap.set

-- Keybindings for leap
map("n", "s", "<Plug>(leap)")
map("n", "S", "<Plug>(leap-from-window)")
map({ "x", "o" }, "s", "<Plug>(leap-forward)")
map({ "x", "o" }, "S", "<Plug>(leap-backward)")

-- nvim-dap
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "dap continue" })

map("n", "<F6>", function()
  require("dap").step_over()
end, { desc = "dap step over" })

map("n", "<F7>", function()
  require("dap").step_into()
end, { desc = "dap step into" })

map("n", "<F8>", function()
  require("dap").step_out()
end, { desc = "dap step out" })

map("n", "<Leader>b", function()
  require("dap").toggle_breakpoint()
end, { desc = "dap toggle breakpoint" })

map("n", "<Leader>B", function()
  require("dap").set_breakpoint()
end, { desc = "dap set breakpoint" })

map("n", "<Leader>lp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "dap set breakpoint" })

map("n", "<Leader>dr", function()
  require("dap").repl.open()
end, { desc = "dap repl open" })

map("n", "<Leader>dl", function()
  require("dap").run_last()
end, { desc = "dap run last" })

map({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "dap ui widgets hover" })

map({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end, { desc = "dap ui widgets preview" })

map("n", "<Leader>dcf", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end, { desc = "dap widgets centered float (frames)" })

map("n", "<Leader>dcs", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end, { desc = "dap widgets centered float (scopes)" })

-- nvim-dap-python
map("n", "<Leader>dtm", function()
  require("dap-python").test_method()
end, { desc = "Test method with dap-python" })

map("n", "<Leader>dtc", function()
  require("dap-python").test_class()
end, { desc = "Test class with dap-python" })

map("v", "<Leader>ds", function()
  require("dap-python").debug_selection()
end, { desc = "Debug selection with dap-python" })

-- dapui
map("n", "<Leader>du", function()
  require("dapui").toggle {}
end, {
  desc = "Dap UI toggle",
})

map({ "n", "v" }, "<leader>de", function()
  require("dapui").eval()
end, { desc = "Dap UI Eval" })

-- flutter-tools
map("n", "<Leader>ft", function()
  require("telescope").extensions.flutter.commands()
end, {
  desc = "Opens a list of flutter commands.",
})
