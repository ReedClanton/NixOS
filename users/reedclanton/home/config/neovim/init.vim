" Turn line numbers on.
set number

" TODO
set breakindent

" TODO
set shiftround

" When ON:
" - The <tab> key inserts the value of:
"   - `shiftwidth` when at the start of a line.
"   - `tabstop` or `softtabstop` when NOT at start of line.
" - The <backspace> key removes the value of:
"   - `shiftwidth` when at the start of a line.
"   - `tabstop` or `softtabstop` when NOT at start of line.
set smarttab

" TODO
set autoindent

" When OFF:
" - The <tab> key inserts tab character(s).
set noexpandtab

" Determines the amount of whitespace to add in normal mode.
set shiftwidth=4

" Fine tunes the amount of white space to be added by tab.
"set softtabstop=4

" Sets visual width of tab character NOT what is inserted by the <tab> key.
set tabstop=4

augroup python_files
	autocmd!
	autocmd FileType python set smarttab
	autocmd FileType python set autoindent
	autocmd FileType python set noexpandtab
	autocmd FileType python set shiftwidth=4
"	autocmd FileType python set softtabstop=4
	autocmd FileType python set tabstop=4
	autocmd FileType python set vartabstop=4
augroup END

augroup css_files
	autocmd!
	autocmd FileType css set smarttab
	autocmd FileType css set autoindent
	autocmd FileType css set noexpandtab
	autocmd FileType css set shiftwidth=4
"	autocmd FileType css set softtabstop=4
	autocmd FileType css set tabstop=4
	autocmd FileType css set vartabstop=4
augroup END



" Force indentations to show up as tab character for all file type(s).
"augroup tab_appearance
"	autocmd!
"	autocmd FileType * setlocal noexpandtab
"augroup END

" Tabs appeare width a width of 4 for all file type(s).
"augroup tab_size
"	autocmd!
"	autocmd FileType * set tabstop=4
"	autocmd FileType * set shiftwidth=4
"	autocmd FileType * set softtabstop=4
"augroup END

" Ensure auto indentation is on.
"set autoindent
"set copyindent
"set preserveindent

" TODO
"augroup python_files
"	autocmd!
"	autocmd FileType python setlocal noexpandtab
"	autocmd FileType python set tabstop=4
"	autocmd FileType python set shiftwidth=4
"augroup END

