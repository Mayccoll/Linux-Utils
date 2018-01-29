#
# | Load Antigen
#

source $HOME/.antigen/antigen.zsh

#
# | Load various lib files
#

antigen bundle command-not-found
antigen bundle fabric
antigen bundle heroku
antigen bundle kennethreitz/autoenv
antigen bundle lein
antigen bundle pip
antigen bundle rake
antigen bundle rvm
antigen bundle sprunge
antigen bundle vundle
antigen bundle bundler
antigen bundle node
antigen bundle npm
antigen bundle python
antigen bundle history
antigen bundle rsync
antigen-bundle vagrant
antigen bundle git

antigen-use oh-my-zsh

antigen bundle robbyrussell/oh-my-zsh lib/
antigen-bundle arialdomartini/oh-my-git
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src
antigen-bundle zsh-users/zsh-history-substring-search

#
# | Antigen Themes
#

antigen theme Mayccoll/oh-my-zsh-m-themes libra_dark
# antigen theme Mayccoll/oh-my-zsh-m-themes libra
# antigen theme Mayccoll/oh-my-zsh-m-themes libra_clean
# antigen theme Mayccoll/oh-my-zsh-m-themes liino
# antigen theme Mayccoll/oh-my-zsh-m-themes liino_red
# antigen theme Mayccoll/oh-my-zsh-m-themes remol


antigen-apply
