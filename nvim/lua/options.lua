require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both" -- to enable cursor line!

vim.wo.relativenumber = true
vim.wo.foldmethod = "indent"

vim.opt.spelllang = { "en", "de" }
vim.opt.spell = false

-- automatic filetype detection
vim.filetype.add {
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
    [".*/rofi/.*%.rasi"] = "rasi",
  },
}
