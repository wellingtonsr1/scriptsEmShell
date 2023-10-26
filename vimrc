" Mostra os números lateralmente na janela
set number

set softtabstop=4 expandtab



" Divide a janela, criando uma embaixo
set splitbelow

" Muda o cursor quando está em modo de edição e modo normal
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"

set noshowmode
set laststatus=2

hi statusline   cterm=NONE ctermfg=0 ctermbg=7   guibg=#C1C2D0 guifg=#000000
hi statuslinenc cterm=NONE ctermfg=0 ctermbg=240 guibg=#616270 guifg=#000000

augroup ModeEvents
    autocmd!
    au InsertEnter * hi statusline cterm=NONE ctermfg=0 ctermbg=10 guibg=#7BC86F
    au InsertLeave * hi statusline cterm=NONE ctermfg=0 ctermbg=7 guibg=#C1C2D0
    au ModeChanged *:[vV\x16]* hi statusline cterm=NONE ctermfg=0 ctermbg=13 guibg=#C990DC
    au Modechanged [vV\x16]*:* hi statusline cterm=NONE ctermfg=0 ctermbg=7 guibg=#C1C2D0
augroup end

function! LoadStatusLine()

    let g:left_sep='│'
    let g:right_sep='│'

    let g:currentmode={
        \ 'n'  : 'Normal',
        \ 'no' : 'Normal-Operator Pending',
        \ 'v'  : 'Visual',
        \ 'V'  : 'V-Line',
        \ '␖' : 'V-Block',
        \ 's'  : 'Select',
        \ 'S'  : 'S-Line',
        \ '␓' : 'S-Block',
        \ 'i'  : 'Insert',
        \ 'R'  : 'Replace',
        \ 'Rv' : 'V-Replace',
        \ 'c'  : 'Command',
        \ 'cv' : 'Vim Ex',
        \ 'ce' : 'Ex',
        \ 'r'  : 'Prompt',
        \ 'rm' : 'More',
        \ 'r?' : 'Confirm',
        \ '!'  : 'Shell',
        \ 't'  : 'Terminal'
        \}

    set statusline=\ %{toupper(g:currentmode[mode()])}
    " set statusline=\ %{toupper(mode())}
    set statusline+=\ %{left_sep}
    set statusline+=\ %n
    set statusline+=\ %{left_sep}
    set statusline+=\ %f%m\ %y
    set statusline+=\ %{left_sep}
    set statusline+=\ %{&ff}\ %{&fenc!=''?&fenc:&enc}
    set statusline+=\ %{left_sep}
    set statusline+=\ %=
    set statusline+=\ %{right_sep}
    set statusline+=\ %l/%L,%v
    set statusline+=\ %{right_sep}
    set statusline+=\ %P\ 

endfunction

call LoadStatusLine()
