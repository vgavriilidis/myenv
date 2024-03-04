cheatsheet(){
    echo "------------------------------------------------------------------"
    echo "gd: go to definition"
    echo "gr: find references"
    echo "gD: go to definition in new vertical tab"
    echo "ctrl+o: jump to previous"
    echo "ctrl+i: jump to next"
    echo "ctrl+^: toggle between two files"
    echo "------------------------------------------------------------------"
    echo "ctlr+j: move line down"
    echo "ctlr+k: move line up"
    echo "-----------------------------"
    echo "di[char]: delete inside [char]"
    echo "dt[char]: delete till [char]"
    echo "ci[char]: change inside [char]"
    echo "cf[char]: change till inclusive [char]"
    echo "------------------------------------------------------------------"
    echo "}}: navigate to next empty line"
    echo "{{: navigate to previous empty line"
    echo "0: navigate to start of line"
    echo "^: navigate to start of not empty character"
    echo "$: navigate to end of line"
    echo "]m: move to next python function"
    echo "[m: move to previous python function"
    echo "o: create a new line and start writing"
    echo "------------------------------------------------------------------"
    echo "zc: close a fold"
    echo "zo: open a fold"
    echo "------------------------------------------------------------------"
    echo "ctrl+p + (start typing): search files plugin"
    echo "------------------------------------------------------------------"
    echo "ctrl+w --> o: close all windows but keep current window"
    echo "ctrl+w --> v: create new vim windows right"
    echo "ctrl+w --> s: create new vim window below"
    echo "ctrl+w --> L: move current window to the right"
    echo "ctrl+w --> H: move current window to the left "
    echo "ctrl+w --> q: close window"
    echo "ctrl+w --> h: go to window left"
    echo "ctrl+w --> =: equally spread splits"
    echo "ctrl+w --> u: undo close but doenst always work because it is plugin"
    echo "ctrl+l: toggle maximize current panel" 
    echo "------------------------------------------------------------------"
    echo "ctrl+g: toggle git highlights"
    echo "]c : gitgutter go to next git hunk"
    echo "[c : gitgutter go to previous git hunk"
    echo ",hs : gitgutter stage hunk"
    echo ",hu : gitgutter unstage hunk"
    echo "------------------------------------------------------------------"
    echo "J : make the below line join this line"
    echo "gqq : break long line into multiple small"
    echo "------------------------------------------------------------------"
    echo ":%s/foo/bar/gci: search and replace foo with bar case insensitively with confirmation" 
    echo ":%s/\s\{1,}/,/gc: remove spaces" 
    echo ":retab : replace tabs with spaces"
    echo "------------------------------------------------------------------"
    echo "ctrl+h: show tabbar (outline) on the right"
    echo "------------------------------------------------------------------"
    echo ",cc : comment current [count] line(s)"
    echo ",cu : uncomment current [count] line(s)"
    echo ",ci : toggle comment current [count] line(s)"
    echo "------------------------------------------------------------------"
    echo "column selection: ctr+v to go to visual block code and move around without the mouse"
    echo "write in multiple lines under cursor: ctlr+v then go down, then press I to insert and then escape"
    echo "write in multiple lines in the end: ctlr+v then go down, then press $ then press I to insert and then escape"
    echo "------------------------------------------------------------------"
    echo "H: move High"
    echo "L: move Low"
    echo "M: move Medium"
    echo "ctrl+d: move half page down"
    echo "ctrl+u: move half page up"
    echo "------------------------------------------------------------------"
    echo "gUw: capitalize word"
    echo "guw: uncapitalize word"
    echo "gg=G: indent format whole document"
    echo "------------------------------------------------------------------"
    echo "ctrl+e: scroll up screen"
    echo "ctrl+y: scroll down screen"
    echo "ctrl+u: move up screen"
    echo "ctrl+d: move down screen"
    echo "------------------------------------------------------------------"
    echo "quickfix beauty..." 
    echo "with a file containing errors of some kind: vi -q errors.txt"
    echo "and then :cn to go to next"
    echo "and then :cp to go to previous"
    echo "------------------------------------------------------------------"
    echo "in order to sort selected just select lines and :sort"
    echo "there are prefixed some characters, do not remove those"
    echo "------------------------------------------------------------------"
    echo "zz: adjust window so that the current line is to the middle"
    echo "zt: adjust window so that the current line is to the top of the screen"
    echo "zb: adjust window so that the current line is to the bottom of the screen"
    echo "------------------------------------------------------------------"
    echo "GIT commands I always forget"
    echo "-------------------"
    echo "Show nice diff: git diff --numstat"
    echo "git add -p: interactively select chunks to put them in staging"
    echo "git checkout -p: interactively select chunks to discard them"
    echo "git diff origin/master..  : diff btw commited and whats in master"
    echo "git tag -l: show tag branches"
    echo "git checkout tags/<tag_name>: checkout tag branches"
    echo "------------------------------------------------------------------"
    echo "colima start --cpu 4 --memory 8"
    echo "------------------------------------------------------------------"
    echo "TMUX"
    echo "<p> + x: create new window"
    echo "<p> + v,s: split window into panes vertival,hori"
    echo "<p> + z: (toggle) make you pane take your whole window space"
    echo "<p> + !: make you pane into a new window "
    echo "<p> + {,}: move panes around"
    echo "<p> + q: show numbers of panes and choose to move to it"
    echo "------------------------------------------------------------------"
}

