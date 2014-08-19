 function proxy_set(){
	proxyserver=
	username=
	password=
	colon=':'
	at='@'
	vared -p 'proxyserver: ' proxyserver
	vared -p 'username   : ' username
	vared -p 'password   : ' password
 	if [[ "$username" == "" ]]; then
		colon=
		at=
 	fi
 	if [[ "$password" == "" ]]; then
 		colon=
 		at=
 	fi
 	export http_proxy="http://$username$colon$password$at$proxyserver:8080/"
 	export https_proxy=$http_proxy
 	export ftp_proxy=$http_proxy
 	export rsync_proxy=$http_proxy
 	export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
 	echo -e "\nProxy environment variable set."
 }

 function proxy_unset(){
 	unset HTTP_PROXY
 	unset http_proxy
 	unset HTTPS_PROXY
 	unset https_proxy
 	unset FTP_PROXY
 	unset ftp_proxy
 	unset RSYNC_PROXY
 	unset rsync_proxy
 	echo -e "\nProxy environment variable removed."
 } 
 
 function find_symlink(){
	dir=$1
	if [[ "$1" == "" ]]; then
		dir="."
	fi
	find $dir -type l | xargs ls -la
 }

 function add_to_path() {
 	if [[ $# == 0 ]]; then
		echo usage: $0 dir1 [dir2] [dirN]
	fi
	for ((i=1; i<=$#; i++)); do
		export -U PATH=${@[i]}:${PATH}
	done
 }

function remove_from_path() {
	if [[ $# == 0 ]]; then
		echo usage: $0 dir1 [dir2] [dirN]
	fi
	for ((i=1; i<=$#; i++)); do
	        PATH=:$PATH:
        	PATH=${PATH//:${@[i]}:/:}
        	PATH=${PATH#:}; PATH=${PATH%:}	
	done	
}
