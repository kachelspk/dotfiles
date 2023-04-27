#!/bin/bash

red=`tput setaf 1`
blue=`tput setaf 4`
cyan=`tput setaf 6`
reset=`tput sgr0`
cmdout=''
SERVER="ssh://gerrit-asia.fossil.com:5222"
LOG_FILE="/tmp/cherry-pick-${USER}-$(date "+%Y-%m-%d-%H-%M-%S").log"

function print_info() {
    printf  "%s\n" "$cyan$1$reset"
}

function print_debug() {
    printf  "%s\n" "$blue$1$reset"
}

function print_error() {
    printf  "%s\n" "$red$1$reset"
}


function exit_script() {
    print_info "********************************************************************"
    print_info "Exit:: $1"
    print_info "Get full log at: $LOG_FILE"
    print_info "********************************************************************"
    set -e
    /bin/false
}
function run_command() {
    out=$($1 2>&1)
    ret=$?
    cmdout=${cmdout}$'\n'${out}
    return $ret
}


# download_cl project change_id/ref
function download_cl() {
    if [ "$1" == "" ] | [ "$2" == "" ]; then
        print_error "Null arg"
        return
    fi
    project=$1
    ref=$2
    prj_path=$(repo list -f  "$project"| cut -d ' ' -f1)
    if [ "$prj_path" == "" ]; then
        return
    fi

    root_path=$(pwd)
    cd $prj_path
    cmdout=''
    run_command "git fetch $SERVER/$project $ref"
    run_command "git cherry-pick FETCH_HEAD"
    if [ $? -ne 0 ]; then
        run_command "git reset --hard"
        run_command "git pull $SERVER/$project --depth 10 $ref --no-edit"
        if [ $? -ne 0 ]; then
            print_error "☒  $prj_path $ref"
            printf  "%s%s\n" "$reset$cmdout"
            printf  "%s%s\n" "$reset$cmdout" >> $LOG_FILE
            exit_script 1
        else
            print_info "☑ $prj_path $ref pull done"
        fi
    else
        print_info "☑ $prj_path $ref cherry-pick done"
    fi
    printf  "%s\n" "$cmdout" >> $LOG_FILE
    cd $root_path

}

if [ "$1" = "" ]; then
    print_info "********************************************************************"
    print_info "Usage: "
    print_info "        bash ${0} <topic> [nosync]"
    print_info "--------------------------------------------------------------------"
    print_info "Options:"
    print_info "   <topic>	Topic of all of CL need to pull/cherry-pick"
    print_info "   <nosync>	Only pull topic, don't run \"repo sync\""
    exit 1
fi

if [ "$2" != "nosync" ]; then
    repo sync -cdqj$(nproc --all)
fi
if [ $? -ne 0 ]; then
    exit_script 1
fi

ssh gerrit-asia gerrit query  --current-patch-set --format=JSON topic:$1 is:open | jq -s -c -r 'sort_by(.number)| .[] | [.project, .currentPatchSet.ref]|  del(..|nulls) | join(" ")' |
    while IFS=$'\t' read -r project ; do
        if [ "$project" == "" ]; then
            continue
        fi
        echo $project
        #download_cl $project
    done
