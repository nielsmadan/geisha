" Author: Niels Madan
" URL: github.com/nielsmadan/geisha

hi clear

set background=light

if exists("syntax_on")
    syntax reset
endif

if !has("gui_running") && &t_Co != 256
    finish
endif

let colors_name = "geisha"

let s:text = ['#17140B', 000]
let s:text_bg = ['#F0F0FF', 000]

let s:white = ['#FFFFFF', 15]
let s:black = ['#000000', 0]
let s:greys = [['#080808', 232], ['#232323', 236], ['#545454', 240], ['#696969', 242], ['#808080', 244], ['#BEBEBE', 250]]

let s:ocha = ['#A8A18E', 000]
let s:darkocha = ['#C1853D', 000]
let s:mordant = ['#8C001F', 000]

let s:gold = ['#C4561F', 000]

let s:lips = ['#AA0001', 000]
let s:belt = ['#A10C03', 000]

let s:blue = ['#31468E', 000]

let s:lime = ['#B2C16A', 000]
let s:purple = ['#3F1239', 000]

let s:tealgrey = ['#8CABA7', 000]
let s:hair = ['#323318', 000]

let s:auburn = ['#7C0A02', 88]
let s:moss = ['#004225', 22]

" pass empty string for defaults: guifg - fg, guibg - bg, gui - none, guisp - fg
function! s:Highlight(group_name, guifg, guibg, gui, guisp)
    if !empty(a:guifg)
        let guifg = a:guifg
    else
        let guifg = ['fg', 'fg']
    endif
    if !empty(a:guibg)
        let guibg = a:guibg
    else
        let guibg = ['bg', 'bg']
    endif
    if !empty(a:gui)
        let gui = a:gui
    else
        let gui = 'none'
    endif
    if !empty(a:guisp)
        let guisp = a:guisp
    else
        let guisp = ['fg', 'fg']
    endif

    if has("gui_running")
        exe 'hi ' . a:group_name . ' guifg=' . guifg[0] . ' guibg=' . guibg[0] . ' gui=' . gui . ' guisp=' . guisp[0]
    else
        exe 'hi ' . a:group_name . ' ctermfg=' . guifg[1] . ' ctermbg=' . guibg[1] . ' cterm=' . gui
    endif
endfunction

" Function without defaults.
function! s:HighlightX(group_name, guifg, guibg, gui, guisp)
    if empty(a:guifg) && empty(a:guibg) && empty(a:gui) && !has("gui_running")
        return
    endif

    let hi_str = 'hi ' . a:group_name

    if !empty(a:guifg)
        if has("gui_running")
            let hi_str = hi_str . ' guifg=' . a:guifg[0]
        else
            let hi_str = hi_str . ' ctermfg=' . a:guifg[1]
        endif
    endif

    if !empty(a:guibg)
        if has("gui_running")
            let hi_str = hi_str . ' guibg=' . a:guibg[0]
        else
            let hi_str = hi_str . ' ctermbg=' . a:guibg[1]
        endif
    endif

    if !empty(a:gui)
        if has("gui_running")
            let hi_str = hi_str . ' gui=' . a:gui
        else
            let hi_str = hi_str . ' cterm=' . a:gui
        endif
    endif

    if !empty(a:guisp) && has("gui_running")
        let hi_str = hi_str . ' guisp=' . a:guisp[0]
    endif

    exe hi_str
endfunction

call s:Highlight('Normal', s:text, s:text_bg, '', '')

call s:Highlight('Statement',   s:lips, '', 'bold', '')
call s:Highlight('Keyword',     s:lips, '', 'bold', '')
call s:Highlight('Conditional', s:lips, '', 'bold', '')
call s:Highlight('Operator',    s:lips, '', '', '')
call s:Highlight('Label',       s:lips, '', '', '')
call s:Highlight('Repeat',      s:lips, '', 'bold', '')

call s:Highlight('Type',            s:mordant, '', '', '')
call s:Highlight('StorageClass',    s:lips, '', '', '')
call s:Highlight('Structure',       s:lips, '', '', '')
call s:Highlight('TypeDef',         s:lips, '', 'bold', '')

call s:Highlight('Exception',       s:lime, '', 'bold', '')
call s:Highlight('Include',         s:lime, '', 'bold', '')

call s:Highlight('PreProc',         s:lime, '', '', '')
call s:Highlight('Macro',           s:lime, '', '', '')
call s:Highlight('Define',          s:lime, '', '', '')
call s:Highlight('Delimiter',       s:lime, '', '', '')
call s:Highlight('Ignore',          s:lime, '', '', '')
call s:Highlight('PreCondit',       s:lime, '', 'bold', '')
call s:Highlight('Debug',           s:lime, '', 'bold', '')

call s:Highlight('Function',        s:gold, '', '', '')
call s:Highlight('Identifier',      s:gold, '', '', '')

call s:Highlight('Comment',         s:tealgrey, '', '', '')
call s:Highlight('CommentEmail',    s:tealgrey, '', 'underline', '')
call s:Highlight('CommentUrl',      s:tealgrey, '', 'underline', '')
call s:Highlight('SpecialComment',  s:tealgrey, '', 'bold', '')
call s:Highlight('Todo',            s:tealgrey, '', 'bold', '')

call s:Highlight('String',          s:purple, '', '', '') 
call s:Highlight('SpecialKey',      s:blue, '', 'bold', '')
call s:Highlight('Special',         s:blue, '', 'bold', '')
call s:Highlight('SpecialChar',     s:blue, '', 'bold', '')

call s:Highlight('Boolean',         s:blue, '', 'bold', '')
call s:Highlight('Character',       s:blue, '', 'bold', '')
call s:Highlight('Number',          s:blue, '', 'bold', '')
call s:Highlight('Constant',        s:blue, '', 'bold', '')
call s:Highlight('Float',           s:blue, '', 'bold', '')

call s:Highlight('FoldColumn',      s:greys[1], s:white, '', '')
call s:Highlight('Folded',          s:greys[1], s:white, '', '')

call s:Highlight('MatchParen',      s:white, s:gold, 'bold', '')

call s:Highlight('LineNr',          s:greys[2], '', '', '')
call s:Highlight('NonText',         s:greys[2], '', '', '')
call s:HighlightX('CursorColumn',   '', s:greys[5], '', '')
call s:HighlightX('CursorLine',     '', s:greys[5], '', '')
call s:Highlight('SignColumn',      '', s:greys[5], '', '')
call s:HighlightX('ColorColumn',    '', s:greys[5], '', '')

call s:Highlight('Error',           s:mordant, s:greys[5], 'bold', '')
call s:Highlight('ErrorMsg',        s:mordant, '', 'bold', '')
call s:Highlight('WarningMsg',      s:mordant, '', '', '')

call s:Highlight('Cursor',          s:greys[5], s:black, '', '')
call s:Highlight('vCursor',         s:greys[5], s:black, '', '')
call s:Highlight('iCursor',         s:greys[5], s:black, '', '')

call s:Highlight('StatusLine',      s:black, s:darkocha, 'bold', '')
call s:Highlight('StatusLineNC',    s:greys[1], s:ocha, 'bold', '')
call s:Highlight('VertSplit',       s:greys[1], s:greys[5], 'bold', '')

call s:Highlight('ModeMsg',         s:purple, '', 'bold', '')

if has("spell")
    call s:HighlightX('SpellBad',    '', '', 'undercurl', s:mordant)
    call s:HighlightX('SpellCap',    '', '', 'undercurl', s:auburn)
    call s:HighlightX('SpellLocal',  '', '', 'undercurl', s:auburn)
    call s:HighlightX('SpellRare',   '', '', 'undercurl', s:black)
endif

call s:HighlightX('VisualNOS',      '', s:greys[4], '', '')
call s:HighlightX('Visual',         '', s:greys[4], '', '')
call s:Highlight('Search',          s:white, s:tealgrey, '', '')
call s:Highlight('IncSearch',       s:white, s:purple, '', '')

call s:Highlight('Pmenu',           s:white, s:gold, '', '')
call s:Highlight('PmenuSel',        s:gold, s:white, 'bold', '')
call s:Highlight('Pmenu',           '', s:greys[5], '', '')
call s:Highlight('Pmenu',           s:tealgrey, '', '', '')

call s:HighlightX('DiffDelete',     s:auburn, s:auburn, '', '')
call s:HighlightX('DiffText',       '', s:greys[3], '', '')
call s:HighlightX('DiffChange',     '', s:greys[4], '', '')
call s:HighlightX('DiffAdd',        '', s:moss, '', '')

call s:HighlightX('Underlined',     '', '', 'underline', '')

call s:Highlight('Directory',       s:lime, '', '', '')
call s:Highlight('Question',        s:lime, '', '', '')
call s:Highlight('MoreMsg',         s:lime, '', '', '')
  
call s:Highlight('WildMenu',        s:white, s:blue, 'bold', '')

call s:Highlight('Title',           '', '', 'underline', '')

call s:HighlightX('Tag',            '', '', 'bold', '')

"*** PYTHON ***
call s:Highlight('pythonDecorator',     s:lips, '', '', '')
call s:Highlight('pythonException',     s:lime, '', 'bold', '')
call s:Highlight('pythonExceptions',    s:lime, '', '', '')

"*** RUBY ***
call s:Highlight('rubyModule',            s:lime, '', '', '')
call s:Highlight('rubyModuleNameTag',     s:text, '', '', '')
call s:Highlight('rubyPseudoVariable',    s:text, '', '', '')
call s:Highlight('rubyClass',             s:lips, '', '', '')
call s:Highlight('rubyClassNameTag',      s:gold, '', '', '')
call s:Highlight('rubyDefine',            s:lips, '', '', '')
call s:Highlight('rubyConstant',          s:text, '', '', '')
call s:Highlight('rubyStringDelimiter',   s:purple, '', '', '')
call s:Highlight('rubyInterpolation',     s:blue, '', '', '')
call s:Highlight('rubyInterpolationDelimiter',     s:blue, '', '', '')

"*** JAVASCRIPT ***
call s:Highlight('javaScriptNull',        s:blue, '', 'bold', '')
call s:Highlight('javaScriptNumber',      s:blue, '', 'bold', '')
call s:Highlight('javaScriptFunction',    s:lips, '', '', '')
call s:Highlight('javaScriptOperator',    s:lips, '', 'bold', '')
call s:Highlight('javaScriptBraces',      s:text, '', '', '')
call s:Highlight('javaScriptIdentifier',  s:mordant, '', '', '')
call s:Highlight('javaScriptMember',      s:gold, '', '', '')
call s:Highlight('javaScriptType',        s:gold, '', '', '')

"*** CLOJURE ***
call s:Highlight('clojureDefine',         s:lips, '', '', '')
call s:Highlight('clojureSpecial',        s:lips, '', '', '')
call s:Highlight('clojureCond',           s:lips, '', '', '')
call s:Highlight('clojureParen0',         s:text, '', '', '')
call s:Highlight('clojureMacro',          s:lime, '', 'bold', '')
call s:Highlight('clojureDispatch',       s:blue, '', 'bold', '')
call s:Highlight('clojureError',          s:white, s:mordant, 'bold', '')

"*** SCALA ***
call s:Highlight('scalaClassName',        s:gold, '', '', '')
call s:Highlight('scalaConstructor',      s:text, '', '', '')

"*** VIMSCRIPT ***
call s:Highlight('vimCommentTitle',       s:tealgrey, '', 'bold', '')
call s:Highlight('vimParenSep',           s:text, '', '', '')
call s:Highlight('vimSep',                s:text, '', '', '')
call s:Highlight('vimOper',               s:text, '', '', '')

"*** XML ***
call s:Highlight('xmlProcessingDelim',       s:mordant, '', '', '')
call s:Highlight('xmlNamespace',             s:gold, '', '', '')
call s:Highlight('xmlTag',                   s:gold, '', '', '')
call s:Highlight('xmlTagName',               s:gold, '', '', '')
call s:Highlight('xmlEndTag',                s:gold, '', '', '')
call s:Highlight('xmlAttrib',                s:mordant, '', '', '')
call s:Highlight('xmlAttribPunct',           s:mordant, '', '', '')
call s:Highlight('xmlEntity',                s:blue, '', 'bold', '')
call s:Highlight('xmlEntityPunct',           s:blue, '', '', '')

"*** HTML ***
call s:Highlight('htmlTagName',              s:gold, '', '', '')
call s:Highlight('htmlTag',                  s:gold, '', '', '')
call s:Highlight('htmlTagN',                 s:gold, '', '', '')
call s:Highlight('htmlEvent',                s:mordant, '', '', '')
call s:Highlight('htmlEventDQ',              s:lime, '', '', '')
call s:Highlight('htmlH1',                   '', '', 'bold', '')
call s:Highlight('htmlH2',                   '', '', 'bold', '')
call s:Highlight('htmlH3',                   '', '', 'italic', '')
call s:Highlight('htmlH4',                   '', '', 'italic', '')
call s:Highlight('htmlScriptTag',            s:lime, '', '', '')

"*** HTML/JAVASCRIPT ***
call s:Highlight('javaScript',               s:text, '', '', '')

"*** CSS ***
call s:Highlight('cssSelectorOp',            s:text, '', '', '')
call s:Highlight('cssSelectorOp2',           s:text, '', '', '')
call s:Highlight('cssBraces',                s:text, '', '', '')
call s:Highlight('cssPseudoClass',           s:lime, '', '', '')
call s:Highlight('cssValueNumber',           s:blue, '', '', '')
call s:Highlight('cssValueLength',           s:blue, '', '', '')
call s:Highlight('cssColor',                 s:blue, '', '', '')
call s:Highlight('cssImportant',             s:lime, '', 'bold', '')
call s:Highlight('cssCommonAttr',            s:blue, '', 'bold', '')
call s:Highlight('cssRenderAttr',            s:blue, '', 'bold', '')
call s:Highlight('cssBoxAttr',               s:blue, '', 'bold', '')
call s:Highlight('cssUIAttr',                s:blue, '', 'bold', '')
call s:Highlight('cssTextAttr',              s:blue, '', 'bold', '')
call s:Highlight('cssTableAttr',             s:blue, '', 'bold', '')
call s:Highlight('cssColorAttr',             s:blue, '', 'bold', '')

"*** minibufexpl ***
call s:Highlight('MBENormal',                 s:greys[1], '', '', '')
call s:Highlight('MBEVisibleNormal',          s:black, '', 'bold', '')
call s:Highlight('MBEVisibleActive',          s:tealgrey, '', 'bold', '')
call s:Highlight('MBEChanged',                s:greys[1], '', 'italic', '')
call s:Highlight('MBEVisibleChanged',         s:black, '', 'bold,italic', '')
call s:Highlight('MBEVisibleChangedActive',   s:tealgrey, '', 'bold,italic', '')

"*** vim-easymotion ***
call s:Highlight('EasyMotionTarget',          s:lips, '', 'bold', '')
call s:Highlight('EasyMotionShade',           s:greys[2], '', '', '')

"*** CtrlP ***
call s:Highlight('CtrlPNoEntries',            s:mordant, '', '', '')
call s:Highlight('CtrlPPrtBase',              '', '', 'bold', '')
