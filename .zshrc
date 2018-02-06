HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# PATHの設定
export PATH=$PATH:~/bin:/usr/local/bin

# EDITORの設定
export EDITOR=emacs

# rbenvの設定
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

if which pyenv > /dev/null; then eval "$(pyenv init - zsh)"; fi

if which nodenv > /dev/null; then eval "$(nodenv init - zsh)"; fi


# aliasの設定
alias ls="ls -G"
alias emcas=emacs
alias e=emacs
alias be="bundle exec"
alias tf="terraform"
alias gpom="git pull origin master"

# emacsキーバインド設定
bindkey -e

# 補完機能の強化
autoload -Uz compinit
compinit

# 色を使う
setopt prompt_subst

# 補完候補一覧でファイルの種別をマーク表示
setopt list_types

# 補完候補をTABキーで選択し,C-cで自前入力までリセット
zstyle ':completion:*:default' menu select=1

# プロンプトの設定
autoload colors
colors
setopt transient_rprompt

# ディレクトリ名だけでディレクトリ移動
setopt autocd

# Ctrl-Dによるログアウト防止
setopt IGNOREEOF

setopt hist_ignore_dups

# source-highlightによるless colorize
if [ -f `which src-hilite-lesspipe.sh | awk '{print $1}'` ]; then
    export LESS='-R'
    export LESSOPEN='| src-hilite-lesspipe.sh %s'
fi

# Goの設定
export GOVERSION=1.6.3
export GOPATH=~/.go/${GOVERSION}
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN


# git ps1の設定
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]
then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
fi

setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_DESCRIBE_STYLE="default"
GIT_PS1_SHOWCOLORHINTS=1

precmd() {
    PROMPT="$(__git_ps1 "(%s)")
%{${fg[red]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
}

# 2行目（ifなどの中身など）の表示名
PROMPT2="%{${fg[red]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[white]}%}correct: %R -> %r[nyae]? %{${reset_color}%}"

# 右側に表示されるプロンプト（カレントディレクトリを表示）
RPROMPT="%{${fg[yellow]}%}[%~]%{${reset_color}%}"


MYSQL_PS1="${fg[yellow]}\u@\h:${reset_color} [\\d] \r:\m \P\n> "

# aws-cliの補完設定。最後に書く必要があります
source /usr/local/opt/awscli/libexec/bin/aws_zsh_completer.sh
# End of lines configured by zsh-newuser-installexport
