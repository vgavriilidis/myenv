return {
"anuvyklack/windows.nvim",
   enabled=true,
   dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
   },
   config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = true

      require('windows').setup(
      {
        animation = {duration = 100}
      }
    )
   end,
}
