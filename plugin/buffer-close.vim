command! BufferClose call <SID>BufferClose()

function! s:BufferClose()
	let buffer_id = '%'
	let buffer_count = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
	let is_last_buffer = buffer_count == 1
	let is_empty_buffer = (bufname(buffer_id) == '') && !getbufvar(buffer_id, '&modified')
	if is_last_buffer && is_empty_buffer
		quit
	else
		confirm bdelete
	endif
endfunction
