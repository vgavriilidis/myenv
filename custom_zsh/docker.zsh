gotoco (){
	docker exec -ti "$1" /bin/bash
}
 
gotocoSU (){
	docker exec -u root -ti "$1" /bin/bash
}

gotocosh (){
	docker exec -ti "$1" sh
}
 
gotocoSUsh (){
	docker exec -u root -ti "$1" sh
}

alias dockls='docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}" | sort -k 2'

findIP(){
    if [ "$1" != "CONTAINER" ]
    then
        docker inspect "$1" | grep -i ipaddress|tail -1|xargs|sed -e 's/IPAddress: //g'|sed -e 's/,//g'
    else
        echo "IP-Address"
    fi
}

dockerls(){
    OLDIFS=$IFS
    IFS=$'\n'
    for i in $(dockls);
    do
        id=`echo $i|awk '{print $1}'`
        ip=`findIP $id`
        echo -e "$i \t\t $ip"
        #printf "%20s %20s \n" $i $ip
    done
    IFS=$OLDIFS
}

alias removeNoneImages='docker rmi $(docker images -f "dangling=true" -q)'
alias stopAllContainers='docker container stop $(docker container ls -aq)'
alias removeAllContainers='docker container rm $(docker container ls -aq)'
alias removeAllImages='docker rmi -f $(docker images -aq)'
