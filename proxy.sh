#!/bin/bash
# TODO : add support for gnome and mozilla proxy settings

SUBJECT="Bash script to change proxy for apt,git,curl and environment variables\n"
AUTHOR="Written By @promptc3 : https://github.com/promptc3"
USAGE="Usage: proxy -e(enable)/d(isable) [APPNAME]\n" 
EXAMPLE="Example: To enable the proxy for apt-get
\n$(tput bold) $ proxy -e apt$(tput sgr0).
\nTo disabe the proxy for apt-get
\n$(tput bold) $ proxy -d apt$(tput sgr0).
\nAvailable options for APPNAME:
\n$(tput bold) apt env curl git$(tput sgr0)\n"

# Configuration Parameters
_CURLRC_PATH="$HOME/.curlrc"
_HOST="http://10.31.0.1"
_PORT=8080
_APT_HTTP="Acquire::http::Proxy '$_HOST:$_PORT';"
_APT_HTTPS="Acquire::https::Proxy '$_HOST:$_PORT';"
_APT_FTP="Acquire::ftp::Proxy '$_HOST:$_PORT';"
_APT_PATH="/etc/apt/apt.conf.d/proxy.conf"

function example() {
	printf "$USAGE"
	printf "$SUBJECT"
	printf "$EXAMPLE"
}

function on() {
	      echo "Adding proxy $_HOST:$_PORT for $APP ......"
	      if [ $APP = "env" ]
	      then
		      export http_proxy="http://$_HOST:$_PORT"
		      export https_proxy=$http_proxy
		      export ftp_proxy=$http_proxy
		      echo "Done"
	      elif [ "$APP" = "curl" ]
	      then
		      echo "proxy = $_HOST:$_PORT" > $_CURLRC_PATH
		      echo "Done"
	      elif [ "$APP" = "git" ]
	      then
		      git config --global http.proxy $_HOST:$_PORT
		      git config --global https.proxy $_HOST:$_PORT
		      echo "Done"
	      elif [ "$APP" = "apt" ]
	      then
		      sudo sed -i '$ a $_APT_HTTP' $_APT_PATH
		      sudo sed -i '$ a $_APT_HTTPS' $_APT_PATH
		      sudo sed -i '$ a $_APT_FTP' $_APT_PATH
		      echo "Done"
	      else
		      echo "Unknown app $APP, try $(tput bold) $ proxy -h"
	      fi
}

function off() {
	      echo "Removing proxy $_HOST:$_PORT for $APP ......"
	      if [ "$APP" = "env" ]
	      then
		      unset http_proxy
		      unset https_proxy
		      unset ftp_proxy
		      echo "Done"
	      elif [ "$APP" = "curl" ]
	      then
		      sed -i '/^pr/ d' $_CURLRC_PATH
		      echo "Done"
	      elif [ "$APP" = "git" ]
	      then
		      git config --global --unset http.proxy
		      git config --global --unset https.proxy
		      echo "Done"
	      elif [ "$APP" = "apt" ]
	      then
		      sudo sed -i '/^A/ d' $_APT_PATH
		      echo "Done"
	      else
		      echo "Unknown app $APP, try $(tput bold) $ proxy -h"
	      fi
}

# options processing
while getopts "he:d:" optname
do
	case "$optname" in
		h)
			example;
			exit 0;
			;;
		e)
			APP=${OPTARG}
			on;
			exit 0;
			;;
		d)
			APP=${OPTARG}
			off;
			exit 0;
			;;
	esac
done
