let mapleader = ','

"
"  Buffer management.
"
nnoremap <Leader>b :buffers
nnoremap <Leader>t :botright 15split \| terminal<CR>
nnoremap <Leader>e :Ex<CR>

function! SwitchBuffer(dir)
	let current = bufnr('%')
	let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
	if empty(buffers)
		return
	endif

	let idx = index(buffers, current)
	if a:dir ==# 'prev'
		let newidx = idx - 1
		if newidx < 0
			return
		endif
	elseif a:dir ==# 'next'
		let newidx = idx + 1
		if newidx >= len(buffers)
			return
		endif
	endif

	execute 'silent write'
	execute 'buffer ' . buffers[newidx]
endfunction

nnoremap <Leader><Left> :call SwitchBuffer('prev')<CR>
inoremap <Leader><Left> :call SwitchBuffer('prev')<CR>

nnoremap <Leader><Right> :call SwitchBuffer('next')<CR>
inoremap <Leader><Right> :call SwitchBuffer('next')<CR>

"
"  File management. Quicker than using commands.
"
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

nnoremap <C-q> :q<CR>
nnoremap <C-S-q> :qa!<CR>

"
"  Text selection, similar to visual editors, such as
"   Visual Studio Code, Sublime, and more.
"
nnoremap <C-S-Left> v<Left>
nnoremap <C-S-Right> v<Right>
nnoremap <C-S-Up> v<Up>
nnoremap <C-S-Down> v<Down>

vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv

vnoremap <C-S-a> ggVG
nnoremap <C-S-a> ggVG

"
"  Clipboard features. Copy, Cut, Paste.
"
vnoremap <C-c> "+y
nnoremap <C-c> "+y

vnoremap <C-x> "+d
nnoremap <C-x> "+d

nnoremap <C-v> "+gP
inoremap <C-v> <C-r>+

vnoremap <C-z> :undo<CR>
nnoremap <C-z> :undo<CR>

vnoremap <C-y> :redo<CR>
nnoremap <C-y> :redo<CR>
