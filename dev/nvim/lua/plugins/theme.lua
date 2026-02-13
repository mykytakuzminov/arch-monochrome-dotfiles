return {
  "kdheepak/monochrome.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme monochrome")
    vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
  end
}
