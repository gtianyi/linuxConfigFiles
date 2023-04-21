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
elif [[ ( ${1: -3} = ".st" ) || ( ${1: -4} = ".bak" ) ]]
then
less -N $1
#elif [[ ( ${1: -5} = ".json" ) ]]
#then
#jq -C . $1 | less -r
else
nvim $1 
fi
}
alias o=openFileInBack

PATH="$PATH:.:/home/aifs2/group/bin:/home/aifs2/group/bin/x86_64-linux_3.12.1:/home/aifs2/ruml/bin"
export PATH
export PATH=$PATH:/home/tianyi.gu/.local/bin
export PATH=$PATH:/home/tianyi.gu/.local/lib/python3.8/site-packages

# GO
export GOPATH=~/gopath
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

#OMPL
#export LIBRARY_PATH=/home/aifs1/gu/lib/:$LIBRARY_PATH
#export LD_LIBRARY_PATH=/home/aifs1/gu/lib/:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda

#python
#export PYTHONPATH=$PYTHONPATH:/home/aifs1/gu/lib/python2.7/dist-packages

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
alias startvncaptiv="x11vnc -repeat -usepw -timeout 20 -quiet -display :120"
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
alias sshmotionaldesk="ssh tianyi.gu@10.16.6.15"

#source /home/aifs1/gu/phd/pioneer-hallway/devel/setup.bash
#source /opt/ros/kinetic/setup.bash

alias checkupdate="/usr/lib/update-notifier/apt-check --human-readable"

alias vpnDana="sudo openvpn --config ~/.clientconfig.ovpn"

#eval `dircolors /home/aifs1/gu/.dir_colors/dircolors`

alias updatecv="mv ${HOME}/Downloads/cv_online.pdf ${HOME}/Documents/gtianyi.github.io/TianyiGu_CV.pdf ; cd ${HOME}/Documents/gtianyi.github.io ; gaa ; gcamp \"update\" "
alias updatedissertation="mv /home/aifs1/gu/Downloads/Tianyi_s_PhD_Dissertation.pdf /home/aifs1/gu/phd/jobHunt/public_html/publication/Tianyi_s_PhD_Dissertation.pdf ; updatecv "

#---------------cd bookmarks----------------------
alias cdmotionplan="cd ${HOME}/gopath/src/github.com/gu/motionPlanning"
alias cddynamic="cd ${HOME}/phd/2017fall/cs980reinforcementLearning/0project/DynamicObstacles/stochastic/MDP"
alias cdalg="cd ${HOME}/phd/2016spring/Algorithms/"
alias cdnancy="cd ${HOME}/phd/research/workingPaper/realtime-nancy/nancyCodeBase/"
alias cdandrewnancy="cd ${HOME}/phd/research/workingPaper/realtime-nancy/andrewCodeBase/"
alias cdbayesian="cd ${HOME}/phd/2018fall/cs998IndependentStudyWithMarek/bayesian_exploration"
alias cdmetronome="cd ${HOME}/phd/research/codeBase/metronome"
alias cdshr="cd ${HOME}/catkin_ws/src"
alias cdcv="cd ${HOME}/Documents/gtianyi.github.io"
alias cdsgg="cd ${HOME}/br/src/lib/SpatialGraphGeneration/test"
alias cdbr="cd ${HOME}/br/src"
alias cdbrb="cd ${HOME}/br_build"
alias cdbcs="cd ${HOME}/phd/research/workingPaper/boundedCostSearch/tianyicodebase"
alias cdbss="cd ${HOME}/phd/research/workingPaper/boundedSuboptimalSearch/bsscodebase"
alias cdmeta="cd ${HOME}/phd/research/workingPaper/metareasoning/metaReasonRealTimePlanningCodeBase"
alias cdssipp="cd ${HOME}/phd/research/workingPaper/situatedSIPP/situatedSIPPCodeBase"
alias cdssippexp="cd ${HOME}/phd/research/workingPaper/situatedSIPP/situatedSIPPCodeBase/instances/Examples/small"
alias cdav="cd ${HOME}/av-stack"
alias cdpcd="cd ${HOME}/av-stack/av/planning_controls"
alias cdavmap="cd ${HOME}/av-stack/lib/maps/src/lib/avmap"
alias cdavmission="cd ${HOME}/av-stack/av/planning_controls/standalone-bin/AVMissionValidator"

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

alias rm='echo -e "rm is disabled, use myrm or /bin/rm instead.\nuse cleartrash to clear the trash folder"'

function myrm(){
mv --backup=t $@ ~/.trash
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

#if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
#tmux attach-session -t def || tmux new-session -s def
#fi


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

#export DISPLAY=:120
export DISPLAY=:1

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


alias fzfp="fzf --preview 'bat --style=numbers --color=always {} | head -500'"

function vfzfp(){
    nvim "$(fzfp)"
}

function findhere(){
rg -i "$1" -l | fzfp
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aifs1/gu/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aifs1/gu/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/aifs1/gu/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aifs1/gu/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias gdrive="google-drive-ocamlfuse /home/aifs1/gu/phd/myGoogleDrive"

#-----------config for argo desktop machine------
function gdiff() {
    selectedFile="$(git status -s \
         | sed s/^...// \
         | fzf --no-sort --reverse \
         --preview 'git diff --color=always {+1} | diff-so-fancy' \
         --bind=shift-down:preview-down --bind=shift-up:preview-up \
         --preview-window=right:60%:wrap)"
    git diff --color=always $selectedFile | diff-so-fancy
}

function gdiffprev() {
    fzfcommand="git diff --name-only --relative HEAD^ HEAD \
     | fzf --no-sort --reverse \
     --preview 'git diff --color=always HEAD^ HEAD -- {+1} | diff-so-fancy' \
     --bind=shift-down:preview-down --bind=shift-up:preview-up \
     --preview-window=right:60%:wrap"
    #eval $(echo $fzfcommand)
    selectedFile="$(eval $fzfcommand)"
    git diff --color=always HEAD^ HEAD $selectedFile | diff-so-fancy
}

function gdiffall() {
    mergebase="$(git merge-base HEAD origin/master)"
    fzfcommand="git diff --name-only --relative $mergebase HEAD \
     | fzf --no-sort --reverse \
     --preview 'git diff --color=always $mergebase HEAD -- {+1} | diff-so-fancy' \
     --bind=shift-down:preview-down --bind=shift-up:preview-up \
     --preview-window=right:60%:wrap"
    #eval $(echo $fzfcommand)
    selectedFile="$(eval $fzfcommand)"
    git diff --color=always $mergebase HEAD $selectedFile | diff-so-fancy
}

function gdiffhash() {
    fzfcommand="git diff --name-only --relative $1 HEAD \
     | fzf --no-sort --reverse \
     --preview 'git diff --color=always HEAD^ HEAD -- {+1} | diff-so-fancy' \
     --bind=shift-down:preview-down --bind=shift-up:preview-up \
     --preview-window=right:60%:wrap"
    #eval $(echo $fzfcommand)
    selectedFile="$(eval $fzfcommand)"
    git diff --color=always $1 HEAD $selectedFile | diff-so-fancy
}

alias gcob='git branch | fzf | xargs git checkout'
alias gpfwl='git push --force-with-lease'
alias grebasemaster='git rebase -i origin/master'

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fdfind --type f'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fdfind --type d'

# Motional AWS profile
export AWS_PROFILE=shared-services

unsetopt nomatch

function gbranchdel() {
    branchPrefix="$1*"
    echo "Delete branches with prefix ${branchPrefix}; if you want force delete, please use gbranchDel"
    git branch --list $branchPrefix | xargs -r git branch -d
}

function gbranchDel() {
    branchPrefix="$1*"
    echo "force delete branches with prefix ${branchPrefix}"
    git branch --list $branchPrefix | xargs -r git branch -D
}

# terminal color scheme switch
# need to 
# 1) set profile 1 and 2
# 2) sudo apt install xdotool
function terminaldark(){
      xdotool key --clearmodifiers Shift+F10 r 2
}
function terminallight(){
      xdotool key --clearmodifiers Shift+F10 r 1
}

