	# ~/.bashrc: executed by bash(1) for non-login shells.
	# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF -lh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#more aliases
alias csshai18="cssh -K 30 ai1 ai2 ai3 ai4 ai5 ai6 ai8 ai9 ai10 ai11 ai12 ai13 ai14 ai15 ais1 ais2 ais3 ais4"
alias csshai14="cssh -K 30 ai1 ai2 ai3 ai4 ai5 ai6 ai8 ai9 ai10 ai11 ai12 ai13 ai14 ai15"
#open file using nvim
openFileInBack(){
	if [[ ( ${1: -4} = ".pdf") || ( ${1: -4} = ".eps" ) ]]
	then
	okular $1 &
	elif [[ ( ${1: -4} = ".png" )  || ( ${1: -4} = ".jpg" ) || ( ${1: -4} = ".jpeg" ) ]]
	then
	eog $1 &
    else
	nvim $1 
    fi
}
alias o=openFileInBack

PATH="$PATH:.:/home/aifs2/group/bin:/home/aifs2/group/bin/x86_64-linux_3.12.1:/home/aifs2/ruml/bin"
export PATH

# GO
export GOPATH=~/gopath
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

#OMPL
export LIBRARY_PATH=/home/aifs1/gu/lib/:$LIBRARY_PATH
export LD_LIBRARY_PATH=/home/aifs1/gu/lib/:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda

#python
export PYTHONPATH=$PYTHONPATH:/home/aifs1/gu/lib/python2.7/dist-packages

#craam
export EIGEN3_INCLUDE_DIR=/usr/include/eigen3

#pinter
p(){
    lp -o sides=two-sided-long-edge $1
}

pall(){
    for file in $1/*
	do
      lp -o sides=two-sided-long-edge $file
    done
}

pb(){
    lp -d hpw240 -o sides=two-sided-long-edge $1
}

alias startvnc="x11vnc -repeat -usepw -timeout 20 -quiet -display :0"

scpforestpark(){
    scp $1 guty@132.177.219.140:~/Downloads/
}

scpagatefile(){
    scp $1 tg1034@agate.cs.unh.edu:~/t
}

scpagatedir(){
    scp -r $1 tg1034@agate.cs.unh.edu:~/t
}

alias sshagate="ssh tg1034@agate.cs.unh.edu"
alias sshmica="ssh tg1034@mica.cs.unh.edu"
alias ssh758="ssh cs758@agate.cs.unh.edu"
alias ssh730="ssh cs730@agate.cs.unh.edu"
alias sshscylla="ssh gu@scylla.cs.unh.edu"
alias sshcharybdis="ssh gu@charybdis.cs.unh.edu"
alias sshshugakuin="ssh gu@shugakuin.cs.unh.edu"
alias sshkatsura="ssh gu@katsura.cs.unh.edu"
alias sshbyodoin="ssh -p 31415 gu@byodoin.cs.unh.edu"
alias sshaerials="ssh -p 31415 gu@aerials.cs.unh.edu"
alias sshkraken="ssh -p 31415 gu@kraken.cs.unh.edu"
alias sshcarl03="ssh -p 31415 tianyi@carl03.cs.unh.edu"
alias sshai12="ssh gu@ai12.cs.unh.edu"

#source /home/aifs1/gu/phd/pioneer-hallway/devel/setup.bash
#source /opt/ros/kinetic/setup.bash

alias checkupdate="/usr/lib/update-notifier/apt-check --human-readable"

findhere(){
    find ./ -name "*" | xargs grep "$1"
}

alias vpnwhitecliff="sudo openvpn --config ~/.clientconfig.ovpn"

#eval `dircolors /home/aifs1/gu/.dir_colors/dircolors`

alias updatecv="mv /home/aifs1/gu/Downloads/cv_online.pdf /home/aifs1/gu/phd/jobHunt/public_html/TianyiGu_CV.pdf 2> /dev/null && scp -r /home/aifs1/gu/phd/jobHunt/public_html tg1034@agate.cs.unh.edu:~/"

#---------------cd bookmarks----------------------
alias cdmotionplan="cd /home/aifs1/gu/gopath/src/github.com/gu/motionPlanning"
alias cddynamic="cd /home/aifs1/gu/phd/2017fall/cs980reinforcementLearning/0project/DynamicObstacles/stochastic/MDP"
alias cdalg="cd /home/aifs1/gu/phd/2016spring/Algorithms/"
alias cdnancy="cd /home/aifs1/gu/phd/research/workingPaper/realtime-nancy/nancyCodeBase/"
alias cdandrewnancy="cd /home/aifs1/gu/phd/research/workingPaper/realtime-nancy/andrewCodeBase/"
alias cdbayesian="cd /home/aifs1/gu/phd/2018fall/cs998IndependentStudyWithMarek/bayesian_exploration"
alias cdmetronome="cd /home/aifs1/gu/phd/research/codeBase/metronome"

t(){
    tmux a -t $1
}

alias takeover="tmux detach -a"
export TERM=screen-256color

alias ls="ls -a --color=auto"

mylatex(){
    latex $1
	bibtex $1
	latex $1
	latex $1
    dvips $1.dvi
    ps2pdf $1.ps
}

mylatexslides(){
	latex $1
    dvips $1.dvi
    ps2pdf $1.ps
}

gcam(){
    git commit -am "$1"
}

dos2unix(){
	sed -i -e 's/\r$//' $1 
}

backupoverleaf(){
    unzip ~/Downloads/\[AAAI-20\]\ data-driven\ Nancy.zip -d ~/Downloads/temp
	mv ~/Downloads/temp/main.tex ~/phd/research/workingPaper/drafts/nancydd/
	rm -rf ~/Downloads/temp
	rm -rf ~/Downloads/\[AAAI-20\]\ data-driven\ Nancy.zip
	cd ~/phd/research/workingPaper/drafts/nancydd/
	gcam "[update from overleaf] $1"
	git push
	cd -
}

alias rm='echo -e "rm is disabled, use myrm or /bin/rm instead.\nuse cleartrash to clear the trash folder"'

myrm(){
    mv $@ ~/.trash
}

alias cleartrash="/bin/rm -rf ~/.trash/* ~/.trash/.[!.]*"

# open the file manager from terminal
alias f="thunar | pwd"

set -o vi

alias killvnc="x11vnc -R stop"

#if [[ -z "$TMUX"  ]] && [ "$SSH_CONNECTION" != ""  ]; then
     #tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux 
#fi

myeps2pdf(){
    ps-montage -across 3 -down 5 *.eps out.ps
    ps2pdf out.ps
}

cid(){
	ps aux | grep -i $1
}

alias x=exit
