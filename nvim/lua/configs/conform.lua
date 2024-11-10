local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    -- web
    angular = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    scss = { "prettier" },
    typescript = { "prettier" },
    vue = { "prettier" },
    --other
    markdown = { "prettier" },
    yaml = { "prettier" },
    json = { "prettier" },
    jsx = { "prettier" },
    -- shell
    bash = { "beautysh" },
    csh = { "beautysh" },
    ksh = { "beautysh" },
    sh = { "beautysh" },
    zsh = { "beautysh" },

    -- never used these languages
    flow = { "prettier" },
    graphql = { "prettier" },
    less = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
