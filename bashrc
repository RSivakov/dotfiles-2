export EDITOR=vim

alias top='top -o cpu'
alias less='less -I'
alias grep='grep --color'
alias duplicate='open -a Terminal .'

export PATH=/usr/local/homebrew/bin:/usr/local/homebrew/sbin:/usr/local/bin:$PATH
export MANPATH=/usr/local/homebrew/share/man:$MANPATH

export NODE_PATH=/usr/local/homebrew/lib/node_modules

export YUI_COMPRESSOR=/usr/local/homebrew/Cellar/yuicompressor/2.4.6/libexec/yuicompressor-2.4.6.jar
export NATURALDOCS_DIR=/usr/local/homebrew/Cellar/naturaldocs/1.52/libexec

# rvm
[[ -s "/Users/pstadler/.rvm/scripts/rvm" ]] && source "/Users/pstadler/.rvm/scripts/rvm"

# base64 encode
function base64 {
	openssl enc -base64 -in $1 |tr -d "\n"
}

# serve the current directory
function share {
    port=${1:-8080}
    (ifconfig | grep -E 'inet.[0-9]' | grep -v -E '127.0.0.1|-->' | awk '{ printf $2}';echo ":$port") | pbcopy
    echo "Share link copied to clipboard."
    python -m SimpleHTTPServer $port
}

# load host-specific shellrc
if [ -f ~/.bashrc_local ]; then
	source ~/.bashrc_local
fi