set cursorcolumn
set cursorline
autocmd ColorScheme * highlight! Cursorline cterm=bold ctermbg=236 guibg=Grey90
autocmd ColorScheme * highlight! CursorLineNr cterm=bold ctermfg=159 ctermbg=236 guibg=Grey90
autocmd ColorScheme * hi! CursorColumn cterm=bold ctermfg=245 ctermbg=236 guibg=Grey90
set scrolloff=5
set bufhidden=hide " 当buffer被丢弃的时候隐藏它
set nu
set rnu
set noswapfile
colorscheme koehler  " 设定配色方案
"set number " 显示行号
set ruler " 打开状态栏标尺
set shiftwidth=2 
set softtabstop=2 " 使得按退格键时可以一次删掉 2 个空格
set tabstop=2 " 设定 tab 长度为 2
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes " 设置备份时的行为为覆盖
set hlsearch " 搜索时高亮显示被找到的文本
set incsearch 
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%) " 设置在状态行显示的信息
hi StatusLine ctermbg=0 ctermfg=94
"set foldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为 1
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠
set clipboard^=unnamed,unnamedplus
nnoremap H gT
nnoremap L gt
nnoremap <leader>ru :source ~/.vimrc<cr>
nnoremap <leader>re :e ~/.vimrc<cr>
nnoremap <leader>E  :Explore <cr>
nnoremap <C-n> :noh<cr>
nnoremap <leader>n :tabnew 
nnoremap <leader>N :tabnew<cr>
nnoremap <leader>c :tabclose
noremap s <nop>
"imap <C-n> <C-q>  
" tabname without unreadable path
function! Tabline() abort
    let l:line = ''
    let l:current = tabpagenr()

    for l:i in range(1, tabpagenr('$'))
        if l:i == l:current
            let l:line .= '%#TabLineSel#'
        else
            let l:line .= '%#TabLine#'
        endif

        let l:label = fnamemodify(
            \ bufname(tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]),
            \ ':t'
        \ )

        let l:line .= '%' . i . 'T' " Starts mouse click target region.
        let l:line .= '  ' . l:label . '  '
    endfor

    let l:line .= '%#TabLineFill#'
    let l:line .= '%T' " Ends mouse click target region(s).

    return l:line
endfunction
set tabline=%!Tabline()
" show vim cmd
set showcmd

" different mode different cursor
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
" auto indent
set autoindent
set smartindent
