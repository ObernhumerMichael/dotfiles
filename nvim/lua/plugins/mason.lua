-- Mason install list
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "pyright",
        "marksman",
        "black",
        "beautysh",
        -- "bash-language-server",
        "bashls",
      },
    },
  },
}
