local status_ok, trailing_whitesace = pcall(require, "trailing-whitespace")
if not status_ok then
  return
end


trailing_whitesace.setup {
    patterns = { '\\s\\+$' },
    palette = { markdown = 'RosyBrown' },
    default_color = 'PaleVioletRed',
}
