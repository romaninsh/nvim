set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#format = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"let g:airline_powerline_fonts = 'fancy'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

function! AirLineBlaenk()
  function! Modified()
    return &modified ? " +" : ''
  endfunction

  call airline#parts#define_raw('filename', '%<%f')
  call airline#parts#define_function('modified', 'Modified')

  let g:airline_section_b = airline#section#create_left(['filename'])
  let g:airline_section_c = airline#section#create([''])
  let g:airline_section_gutter = airline#section#create(['modified', '%='])
  let g:airline_section_x = airline#section#create_right([''])
  let g:airline_section_y = airline#section#create_right(['%c'])
  let g:airline_section_z = airline#section#create(['branch'])
endfunction

autocmd Vimenter * call AirLineBlaenk()

let g:airline_theme_patch_func = 'AirLineBlaenkTheme'

" 0,1: gfg, gbg; 2,3: tfg, tbg; 4: styles
function! AirLineBlaenkTheme(palette)
  if g:airline_theme == 'solarized'
    let purple = ['#ffffff', '#5f5faf', 255, 13, '']
    let violet = ['#5f5faf', '#aeaed7', 13, 61, '']
    let inv_purple = ['#5f5faf', '#ffffff', 13, 255, '']
    let purple_violet = ['#5f5faf', '#aeaed7', 61, 13, '']

    " dark = middle
    " white = focus
    " light = edges

    let a:palette.ctrlp = {
      \ 'CtrlPlight' : purple,
      \ 'CtrlPwhite' : inv_purple,
      \ 'CtrlPdark'  : violet,
      \ 'CtrlParrow1': inv_purple,
      \ 'CtrlParrow2': purple,
      \ 'CtrlParrow3': purple_violet,
      \ }

    let secondary = ['#ffffff', '#657b83', 255, 240, '']

    let magenta = ['#ffffff', '#d33682', 255, 125, '']
    let blue = ['#ffffff', '#268bd2', 255, 33, '']
    let green = ['#ffffff', '#859900', 255, 64, '']
    let red = ['#ffffff', '#dc322f', 255, 160, '']
    let orange = ['#ffffff', '#cb4b16', 255, 166, '']

    let modes = {
      \ 'normal': blue,
      \ 'insert': green,
      \ 'replace': magenta,
      \ 'visual': orange
      \}

    let a:palette.replace = copy(a:palette.insert)
    let a:palette.replace_modified = a:palette.insert_modified

    for key in ['insert', 'visual', 'normal']
      " no red on modified
      let a:palette[key . '_modified'].airline_c[0] = '#657b83'
      let a:palette[key . '_modified'].airline_c[2] = 11

      for section in ['a', 'b', 'y', 'z']
        let airline_section = 'airline_' . section
        if has_key(a:palette[key], airline_section)
          " white foreground for most components; better contrast imo
          let a:palette[key][airline_section][0] = '#ffffff'
          let a:palette[key][airline_section][2] = 255
        endif
      endfor
    endfor

    for key in keys(modes)
      let a:palette[key].airline_a = modes[key]
      let a:palette[key].airline_z = modes[key]

      "let a:palette[key . '_modified'].airline_b = ['#002b36', '#93a1a1', 234, 245]

      let a:palette[key].airline_b = secondary
      let a:palette[key].airline_y = secondary
    endfor

  endif
endfunction

let g:airline#extensions#default#section_truncate_width = {
  \ 'x': 60,
  \ 'y': 60
  \ }

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'v'  : 'V',
  \ 'V'  : 'V-L',
  \ 'c'  : 'C',
  \ '' : 'V-B',
  \ 's'  : 'S',
  \ 'S'  : 'S-L',
  \ '' : 'S-B',
  \ }
