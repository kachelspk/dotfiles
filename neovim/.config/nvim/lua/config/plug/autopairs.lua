local require_status , autopairs = pcall(require, "nvim-autopairs")
if not require_status then
  return
end

autopairs.setup({
	disable_filetype = { "telescopeprompt", "vim" },
})
