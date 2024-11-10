-- syntax hihlighting
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "typescript",
        "javascript",
        "css",
        "python",
        "markdown",
        "java",
        "c_sharp",
        "c",
        "cpp",
        "bash",
        "dart",
      },
    },
  },
}
