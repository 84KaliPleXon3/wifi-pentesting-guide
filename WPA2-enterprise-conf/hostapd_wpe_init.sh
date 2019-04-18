#!/sh

sudo files/hostapd_wpe/certs/bootstrap || files/hostapd_wpe/certs/bootstrap
sudo airmon-ng check kill || airmon-ng check kill

if [ ! -z "$2" ]; then
	sed 's/SSID_name/'$1'/g' files/hostapd_wpe/hostapd-wpe.conf > files/hostapd_wpe/aux.conf
	sed '0,/wlan0/s/wlan0/'$2'/' files/hostapd_wpe/aux.conf > files/hostapd_wpe/temp.conf
	rm files/hostapd_wpe/aux.conf
else
	sed 's/SSID_name/'$1'/g' files/hostapd_wpe/hostapd-wpe.conf > files/hostapd_wpe/temp.conf
fi

cd files/hostapd_wpe && sudo hostapd-wpe temp.conf

