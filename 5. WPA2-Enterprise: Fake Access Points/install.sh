#!/sh

origin=$(pwd)

sudo apt-get -y install libssl-dev libnl-genl-3-dev git aircrack-ng git hostapd openssl
sudo apt-get -y install libssl1.0-dev || echo 'Continuing...'

mkdir install_h
cd install_h && git clone https://github.com/OpenSecurityResearch/hostapd-wpe && wget http://hostap.epitest.fi/releases/hostapd-2.6.tar.gz && tar -xzvf hostapd-2.6.tar.gz
cd hostapd-2.6 && patch -p1 < ../hostapd-wpe/hostapd-wpe.patch
cd hostapd  && make  && sudo make install
cd ../../hostapd-wpe/certs && ./bootstrap
sudo cp install_h/hostapd-2.6/hostapd/hostapd-wpe /usr/bin/hostapd-wpe

cd $origin

mkdir install_f
cd install_f
wget ftp://ftp.freeradius.org/pub/radius/old/freeradius-server-2.1.12.tar.bz2
wget https://raw.github.com/brad-anton/freeradius-wpe/master/freeradius-wpe.patch
tar -jxvf freeradius-server-2.1.12.tar.bz2
cd freeradius-server-2.1.12
patch -p1 < ../freeradius-wpe.patch
./configure && make && sudo make install
sudo /usr/local/etc/raddb/certs/bootstrap && sudo ldconfig

cd $origin
sudo cp files/users /usr/local/etc/raddb/
sudo cp files/clients.conf /usr/local/etc/raddb/
sudo cp files/eap.conf /usr/local/etc/raddb/
sudo chmod 640 /usr/local/etc/raddb/users
sudo chmod 640 /usr/local/etc/raddb/clients.conf
sudo chmod 640 /usr/local/etc/raddb/eap.conf

cd $origin
sudo rm -rf install_h
sudo rm -rf install_f


