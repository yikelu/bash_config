# enable bitmapped fonts
cd /etc/fonts/conf.d/
sudo rm /etc/fonts/conf.d/10* && sudo rm -rf 70-no-bitmaps.conf && sudo ln -s
../conf.avail/70-yes-bitmaps.conf .
sudo dpkg-reconfigure fontconfig

# restore dpkg stuff
sudo dpkg --clear-selections
sudo dpkg --set-selections < list.txt

# soft link the bashrc
ln -s ~/bash_config/.bashrc ~/.bashrc
