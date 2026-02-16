" Turn line numbers on.
set number

" Turn on spell check.
set spell
set spelllang=en_us

colorscheme retrobox

" Causes wrapped lines to be indented to line up with the start of said line.
set breakindent
" Determines the amount of white space to add in normal mode.
set shiftwidth=4
" Indents will be rounded to a multiple of `shiftwidth`.
set shiftround
" Sets visual width of tab character, NOT what is inserted by the <tab> key.
set tabstop=4
" Upon <enter> being pressed, the new line will be auto-indented to match the
" previous line's indentation.
set autoindent
" When ON:
" - The <tab> key inserts the value of:
"   - `shiftwidth` when at the start of a line.
"   - `tabstop` or `softtabstop` when NOT at start of line.
" - The <backspace> key removes the value of:
"   - `shiftwidth` when at the start of a line.
"   - `tabstop` or `softtabstop` when NOT at start of line.
set smarttab
" Causes the <tab> key to insert tab character(s).
set noexpandtab

" ## Specific File Type Configuration ##
augroup nix_files
	autocmd!
	autocmd FileType nix set smarttab
	autocmd FileType nix set autoindent
	autocmd FileType nix set expandtab
	autocmd FileType nix set shiftwidth=2
	autocmd FileType nix set tabstop=2
augroup END

augroup python_files
	autocmd!
	autocmd FileType python set smarttab
	autocmd FileType python set autoindent
	autocmd FileType python set noexpandtab
	autocmd FileType python set shiftwidth=4
	autocmd FileType python set tabstop=4
	autocmd FileType python set vartabstop=4
augroup END

augroup css_files
	autocmd!
	autocmd FileType css set smarttab
	autocmd FileType css set autoindent
	autocmd FileType css set noexpandtab
	autocmd FileType css set shiftwidth=4
	autocmd FileType css set tabstop=4
	autocmd FileType css set vartabstop=4
augroup END

" ## Key Remapping ##
" Change function of `h` and `l` to skip indentation spaces.
nnoremap <silent> l :call MyLMotion()<CR>
function! MyLMotion()
    let cursorPosition=getpos(".")
    normal ^
    let firstChar=getpos(".")

    if cursorPosition[2] < firstChar[2]
        normal ^
    else
        call setpos('.', cursorPosition)
        normal! l
    endif
endfunction

nnoremap <silent> h :call MyHMotion()<CR>
function! MyHMotion()
    let cursorPosition=getpos(".")
    normal ^
    let firstChar=getpos(".")

    if cursorPosition[2] <= firstChar[2]
        normal 0
    else
        call setpos('.', cursorPosition)
        normal! h
    endif
endfunction

