"function! OscCopy()
"  let encodedText=@"
"  let encodedText=substitute(encodedText, '\', '\\\\', "g")
"  let encodedText=substitute(encodedText, "'", "'\\\\''", "g")
"  let executeCmd="echo -n '".encodedText."' | base64 | tr -d '\\n'"
"  let encodedText=system(executeCmd)
"  if $TMUX != ""
"    "tmux
"    let executeCmd='echo -en "\x1bPtmux;\x1b\x1b]52;;'.encodedText.'\x1b\x1b\\\\\x1b\\" > /dev/tty'
"  else
"    let executeCmd='echo -en "\x1b]52;;'.encodedText.'\x1b\\" > /dev/tty'
"  endif
"  call system(executeCmd)
"  redraw!
"endfunction
"command! OscCopy :call OscCopy()
"
