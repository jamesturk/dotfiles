return {
  "lervag/wiki.vim",
  event = "VeryLazy",
  ft = "markdown",
  init = function()
    vim.g.wiki_root = "~/Sync/wiki"
  end,
}
