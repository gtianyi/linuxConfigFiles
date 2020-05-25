# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#this should be change according to machine
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="juanghurtado"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# export LC_CTYPE=en_US.UTF-8
#
#copy from bashrc
#
#
#echo prompt if reboot required
if [ -f /var/run/reboot-required ]; then
  echo 'reboot required'
fi

#more aliases
alias csshai18="cssh ai1 ai2 ai3 ai4 ai5 ai6 ai8 ai9 ai10 ai11 ai12 ai13 ai14 ai15 ais1 ais2 ais3 ais4"
alias csshai15="cssh ai1 ai2 ai3 ai4 ai5 ai6 ai8 ai9 ai10 ai11 ai12 ai13 ai14 ai15"
#open file using nvim
function openFileInBack(){
if [[ ( ${1: -4} = ".pdf") || ( ${1: -4} = ".eps" ) ]]
then
okular $1 &
elif [[ ( ${1: -4} = ".png" ) || ( ${1: -4} = ".jpg" ) || ( ${1: -5} = ".jpeg" ) ]]
then
eog $1 &
elif [[ ( ${1: -4} = ".txt" ) || ( ${1: -3} = ".st" ) || ( ${1: -4} = ".bak" ) ]]
then
less -N $1
elif [[ ( ${1: -5} = ".json" )]]
then
jq -C . $1 | less -r
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
function p(){
lp -o sides=two-sided-long-edge $1
}

function pall(){
for file in $1/*
do
lp -o sides=two-sided-long-edge $file
done
}

function pb(){
lp -d hpw240 -o sides=two-sided-long-edge $1
}

alias startvnc="x11vnc -repeat -usepw -timeout 20 -quiet -display :0"
alias killvnc="x11vnc -R stop"

function scpforestpark(){
scp $1 guty@132.177.219.140:~/Downloads/
}

function scpagatefile(){
scp $1 tg1034@agate.cs.unh.edu:~/t
}

function scpagatedir(){
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
alias sshcorona="ssh -p 31415 gu@corona.cs.unh.edu"
alias sshpioneerkings="ssh tianyi@192.168.1.4"

#source /home/aifs1/gu/phd/pioneer-hallway/devel/setup.bash
#source /opt/ros/kinetic/setup.bash

alias checkupdate="/usr/lib/update-notifier/apt-check --human-readable"

function findhere(){
find ./ -name "*" | xargs grep "$1"
}

alias vpnwhitecliff="sudo openvpn --config ~/.clientconfig.ovpn"

#eval `dircolors /home/aifs1/gu/.dir_colors/dircolors`

alias updatecv="mv /home/aifs1/gu/Downloads/cv_online.pdf /home/aifs1/gu/phd/jobHunt/public_html/TianyiGu_CV.pdf ; scp -r /home/aifs1/gu/phd/jobHunt/public_html tg1034@agate.cs.unh.edu:~/"

#---------------cd bookmarks----------------------
alias cdmotionplan="cd /home/aifs1/gu/gopath/src/github.com/gu/motionPlanning"
alias cddynamic="cd /home/aifs1/gu/phd/2017fall/cs980reinforcementLearning/0project/DynamicObstacles/stochastic/MDP"
alias cdalg="cd /home/aifs1/gu/phd/2016spring/Algorithms/"
alias cdnancy="cd /home/aifs1/gu/phd/research/workingPaper/realtime-nancy/nancyCodeBase/"
alias cdandrewnancy="cd /home/aifs1/gu/phd/research/workingPaper/realtime-nancy/andrewCodeBase/"
alias cdbayesian="cd /home/aifs1/gu/phd/2018fall/cs998IndependentStudyWithMarek/bayesian_exploration"
alias cdmetronome="cd /home/aifs1/gu/phd/research/codeBase/metronome"
alias cdshr="cd /home/tianyi/catkin_ws/src"
alias cdcv="cd /home/aifs1/gu/phd/jobHunt/public_html/"

function t(){
tmux a -t $1
}

alias takeover="tmux detach -a"
export TERM=xterm-256color

alias ls="ls -a --color=auto"

function mylatex(){
latex $1
bibtex $1
latex $1
latex $1
dvips $1.dvi
ps2pdf $1.ps
}

function mylatexslides(){
latex $1
dvips $1.dvi
ps2pdf $1.ps
}

function gcamp(){
git commit -am "$1" && ggp
}


function dos2unix(){
sed -i -e 's/\r$//' $1 
}

function backupnancy(){
unzip ~/Downloads/\[AAAI-20\]\ data-driven\ Nancy.zip -d ~/Downloads/temp
rm -rf ~/phd/research/workingPaper/drafts/nancydd/
mv ~/Downloads/temp ~/phd/research/workingPaper/drafts/nancydd/
rm -rf ~/Downloads/\[AAAI-20\]\ data-driven\ Nancy.zip
cd ~/phd/research/workingPaper/drafts/nancydd/
gaa
gcam "[update from overleaf]--[nancy] $1"
git push
cd -
}

function backupshr(){
unzip ~/Downloads/\[HRI-20\]\ Smart\ Home\ Robot.zip -d ~/Downloads/temp
rm -rf ~/phd/research/workingPaper/drafts/shr
mv ~/Downloads/temp ~/phd/research/workingPaper/drafts/shr
rm -rf ~/Downloads/\[HRI-20\]\ Smart\ Home\ Robot.zip
cd ~/phd/research/workingPaper/drafts/shr
gaa
gcam "[update from overleaf]--[shr] $1"
gcam "[update from overleaf] $1"
git push
cd -
}

#alias rm='echo -e "rm is disabled, use myrm or /bin/rm instead.\nuse cleartrash to clear the trash folder"'

function myrm(){
mv $@ ~/.trash
}

alias cleartrash="/bin/rm -rf ~/.trash/*"

# open the file manager from terminal
function f(){
CURDIR="$(pwd)"
nautilus $CURDIR
}

bindkey -v
#source /opt/ros/kinetic/setup.zsh
#source /home/tianyi/catkin_ws/devel/setup.zsh
#source /home/tianyi/ROSPlan/devel/setup.zsh

if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
tmux attach-session -t def || tmux new-session -s def
fi


alias tname="tmux display-message -p '#S'"

function tkill(){
tmux kill-session -t $1
}

export ROS_WORKSPACE=/home/tianyi/catkin_ws


function rosbuildpkgdebug(){
catkin build -DCMAKE_BUILD_TYPE=Debug $1 
}

switch2s108(){
export ROS_MASTER_URI=http://192.168.1.4:11311
export ROS_HOSTNAME=192.168.1.16
}

export DISPLAY=:0

alias x=exit

function llc(){
num=$(ll $1 | wc -l)
echo $(($num -3))
}

# check process id by partial application name
function cid(){
ps aux | grep -i $1
}

alias diff="colordiff -y"
