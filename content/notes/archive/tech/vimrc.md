:vim:

# sudo command for when you forget
I often forget to open files in sudo when it's needed,
and don't notice until I've done a bunch of work
that I would prefer not to lose.
This is a great couple of lines to add, from
[Stack Overflow](https://stackoverflow.com/questions/2600783)

    cmap w!! w !sudo tee > /dev/null %

This teaches a few things, as outlined on the SO post:
% means "current file"
When you call :w in Vim, it actually isn't modifying your file,
it is rather sending the current buffer to a file with the name you specify,
which is the current file if you pass no extra commands to :w, but could be anything
(e.g. :w biji2.mom).
In this case, we send it to `tee`, which sends to the specified file
(`%`) as well as the standard output,
which we redirect to `/dev/null` so it doesn't clutter up the stdout.
Vim is often not sudo-accessible, but tee is, so we bypass the problem I usually have.

# SpellBad and friends

Useful commands:
- leader + o to turn on spellcheck (Luke Smith's binding, nice).
- ]s to go to the next misspelled word, [s to go to the previous.
- zg to add a word to the internal dictionary.

Add the following into your .vimrc to get more sane orthographic highlighting:

    hi clear SpellBad
    hi clear SpellLocal
    hi clear SpellCap
    hi clear SpellRare
    hi SpellBad ctermfg=red
    hi SpellLocal ctermfg=green
    hi SpellCap ctermfg=yellow
    hi SpellRare ctermfg=green


Sun 17 Nov 2019 10:23:05 AM CST
