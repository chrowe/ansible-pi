# If you want to set up pagekite on a pi that you can't ssh to without it use this script
# Based on https://pagekite.net/wiki/Howto/GNULinux/DebianPackage/

# Install the latest pagekite
echo deb http://pagekite.net/pk/deb/ pagekite main | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --recv-keys --keyserver keys.gnupg.net AED248B1C7B2CAC3
sudo apt-get update
sudo apt-get install pagekite

# Configure pagekite
sudo apt-get install vim
sudo vim /etc/pagekite.d/10_account.rc
sudo cp /etc/pagekite.d/80_sshd.rc.sample /etc/pagekite.d/80_sshd.rc
sudo invoke-rc.d pagekite restart
