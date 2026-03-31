vim.loader.enable()

-- mapleader must be set before plugin/ files are sourced
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

require("options")
require("keymaps")

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.schedule(function()
      local stamp = vim.fn.stdpath("cache") .. "/pack_last_update"
      local day = 60 * 60 * 24
      local stat = vim.uv.fs_stat(stamp)
      if stat and os.time() - stat.mtime.sec < day then return end
      vim.pack.update(nil, { force = true })
      vim.fn.writefile({}, stamp)
    end)
  end,
})
