#!/bin/bash

old_exec_time=$(date +%s -r ~/.update.sh)
cur_exec_time=$(date +%s)
let "time_gap=$cur_exec_time - $old_exec_time"

# echo $old_exec_time
# echo $cur_exec_time
# echo $time_gap

if [ $time_gap -gt 21600 ] || [ $1 == "-f" ]
then
    echo "Updating Git Repos..."
    cd ~/watch-repo/codelite &&\
        /usr/bin/git pull origin master &&\
        /usr/bin/git push gitosc master
    cd ~/watch-repo/cppcheck &&\
        /usr/bin/git pull origin master &&\
        /usr/bin/git push gitosc master
    cd ~/watch-repo/doxygen &&\
        /usr/bin/git pull origin master &&\
        /usr/bin/git push gitosc master
    cd ~/watch-repo/postgresql &&\
        /usr/bin/git pull origin master &&\
        /usr/bin/git push gitosc master
    cd ~/watch-repo/z3 &&\
        /usr/bin/git pull github master &&\
        /usr/bin/git push origin master
    cd ~/watch-repo/z3test &&\
        /usr/bin/git pull origin master &&\
        /usr/bin/git push gitosc master
    cd ~/watch-repo/facebook-clang-plugins &&\
        /usr/bin/git pull github master &&\
        /usr/bin/git push origin master
    cd ~/

    sudo pacman -Syu
    paccache -r
    paccache -ruk0

    touch ~/.update.sh

else
    echo "Less than six hours since the last update."
fi

