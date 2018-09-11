#Powered By Linkkong
if [ ! -w $PWD ]; then
    echo '请确保当前文件夹可写入!'
    exit
fi
#add alias file to short command
(
cat <<EOF
#for git
alias gpu='git push'
alias gpl='git pull'
alias gstu='git status'
alias gsth='git stash'
alias gsthp='git stash pop stash@{0}'
alias greb='git rebase -i'
alias gcomm='git commit -m'
alias gcoma='git commit -a -m'
#for docker
alias dpa='docker ps -a'
alias deit='docker exec -it'
alias dpl='docker pull'
EOF
) > ~/.bash_aliases
source ~/.bash_aliases

#change apt source, use tsinghua source https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

(
cat <<EOF
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
EOF
) > ./sources.list
sudo mv ./sources.list /etc/apt/sources.list 
sudo apt-get update

#----------------install docker
#step1. Uninstall Old versions
sudo apt-get remove docker docker-engine docker.io
#step2. install Docker-ce
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
#step3. Add Docker’s official GPG key:
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#stpe4. Use the following command to set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#step5. Install docker-ce stable version
sudo apt update 
sudo apt-get install -y docker-ce
#setp6. Start the docker service
sudo service docker start
#step7. Join the docker group
sudo gpasswd -a ${USER} docker
#-----------------install docker-compose 

sudo apt install python3-pip
sudo pip3 install docker-compose


#-----------------install phpstorm
#sudo snap install phpstorm --classic
#-----------------install chrome browser
#wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
