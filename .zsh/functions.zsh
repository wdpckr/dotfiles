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