# Profile file. Runs on login.
[ -f "/etc/profile" ] && . /etc/profile

export _JAVA_AWT_WM_NONREPARENTING=1
export QT_STYLE_OVERRIDE=gtk

export PATH="$HOME/.local/bin:$PATH"

export BROWSER="google-chrome"
export EDITOR="nvim"
export TERM="st"
export VISUAL="$EDITOR"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"

export GOPATH="$XDG_DATA_HOME/go"

export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export PYTHON_EGG_CACHE="$XDG_CACHE_HOME/python-eggs"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"

export LESSHISTFILE="-"

export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

export ZDOTDIR="$HOME/.config/zsh"

