" Vim filetype plugin
" Language: nasm

" only run if not done yet for this buffer
if exists('b:ftplugin_nasm_loaded')
    finish
endif

let b:ftplugin_nasm_loaded = 1

" define match groups for nasm
if exists('loaded_matchit')
    let b:match_words = '%if:%elif:%else:%endif,'
                    \ . '%macro:%endmacro'
endif
