local require_status , configs = pcall(require, "nvim-treesitter.configs")
if not require_status then
  return
end

configs.setup {
    ensure_installed = "all", -- Only use parsers that are maintained
    highlight = { -- enable highlighting
        enable = true,
    },
    indent = {
        enable = true,
    }
}
