# Install Ubiquiti Unifi Controller on Ubuntu 20.04.
# As tested on a fresh install of ubuntu-20.04.1-live-server, 2022-07-26.

sudo apt update
sudo apt install --yes apt-transport-https

echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
sudo wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg

sudo apt update
sudo apt install --yes openjdk-8-jre-headless unifi
sudo apt clean

sudo systemctl status --no-pager --full mongodb.service unifi.service

# Now log into https://unifi_controller_hostname:8443/