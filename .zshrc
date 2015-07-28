HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# PATHの設定
export PATH=$PATH:~/bin

# rbenvの設定
#export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# aliasの設定
alias ls="ls -G"
alias npm="npm -g" # install for grobal
alias emcas=emacs
alias be="bundle exec"

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

# Goの設定
export GOVERSION=1.4.2
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


# aws-cliの補完設定。最後に書く必要があります
source /usr/local/opt/awscli/libexec/bin/aws_zsh_completer.sh
# End of lines configured by zsh-newuser-installexport

