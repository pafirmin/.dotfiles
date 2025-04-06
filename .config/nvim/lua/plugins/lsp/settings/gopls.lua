local util = require("lspconfig.util")
local async = require("lspconfig.async")
local mod_cache = "/home/paul/go/pkg/mod"

return {
  root_dir = function(fname)
    -- see: https://github.com/neovim/nvim-lspconfig/issues/804
    if not mod_cache then
      local result = async.run_command("go env GOMODCACHE")
      if result and result[1] then
        mod_cache = vim.trim(result[1])
      end
    end
    if fname:sub(1, #mod_cache) == mod_cache then
      local clients = vim.lsp.get_clients({ name = "gopls" })
      if #clients > 0 then
        return clients[#clients].config.root_dir
      end
    end
    return util.root_pattern("go.work")(fname) or util.root_pattern("go.mod", ".git")(fname)
  end,
  single_file_support = true,
}
