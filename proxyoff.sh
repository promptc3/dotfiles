if [ $(id -u) -ne 0 ]; then
  echo "This script must be run as root";
  exit 1;
fi

gsettings set org.gnome.system.proxy mode 'none' ;
git config --global --unset http.proxy
git config --global --unset https.proxy

grep PATH /etc/environment > lol.t;
cat lol.t > /etc/environment;

printf "" > /etc/apt/apt.conf.d/proxy.conf;

rm -rf lol.t;
