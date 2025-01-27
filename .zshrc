source "$ZDOTDIR/aliases/aliases"
source "$ZDOTDIR/aliases/git"
fpath=($ZDOTDIR/prompt $fpath)
autoload -Uz prompt_purification_setup && prompt_purification_setup

