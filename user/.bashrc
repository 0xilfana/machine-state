#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# ---- Variables ----

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'


# ---- Aliases ----

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias la='ls -a'
alias ll='ls -l'

alias zed='zeditor'
alias py='python'


# ----- Download Settings -----
VIDEO_DIR="$HOME/Videos/Downloads"
AUDIO_DIR="$HOME/Audios/Downloads"

VIDEO_FMT="b"
AUDIO_FMT="ba"


# ---- Functions -----
download() {
    local type=$1
    local url=$2
    local format sd

    [[ -z "$type" || ! "$type" =~ ^(a|v)$ ]] && return
    [[ -z "$url" ]] && return

    if [[ "$type" == "a" ]]; then
        format="$AUDIO_FMT"
        sd="$AUDIO_DIR"
    else
        format="$VIDEO_FMT"
        sd="$VIDEO_DIR"
    fi

    mkdir -p "$sd"
    yt-dlp --no-playlist -P "$sd" -o "%(title)s.%(ext)s" -f "$format" "$url"
}

video_download() {
        local url=$1
        [[ -z "$url" ]] && return
        download "v" "$url"
}

audio_download() {
        local url=$1
        [[ -z "$url" ]] && return
        download "a" "$url"
}
