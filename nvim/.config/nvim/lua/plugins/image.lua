return {
  {
    "3rd/image.nvim",
    build = false, -- skip luarocks build; use imagemagick cli
    opts = {
      processor = "magick_cli",
    },
  },
}
