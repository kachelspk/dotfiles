local require_status , nvim_comment = pcall(require, "nvim_comment")
if not require_status then
  return
end
nvim_comment.setup({
	-- Linters prefer comment and line to have a space in between markers
	marker_padding = true,
	-- should comment out empty or whitespace only lines
	comment_empty = true,
	-- Should key mappings be created
	create_mappings = false,
	-- Normal mode mapping left hand side
	line_mapping = "gcc",
	-- Visual/Operator mapping left hand side
	operator_mapping = "gc",
	-- Hook function to call before commenting takes place
	hook = nil,
})
