# enable bitmapped fonts
cd /etc/fonts/conf.d/
sudo rm /etc/fonts/conf.d/10* && sudo rm -rf 70-no-bitmaps.conf && sudo ln -s ../conf.avail/70-yes-bitmaps.conf .
sudo dpkg-reconfigure fontconfig

# restore dpkg stuff
sudo dpkg --clear-selections
sudo dpkg --set-selections < list.txt
for i in `awk '{print $1}' list.txt`; do sudo apt-get install -y $i; done

mkdir -p ~/bin

# soft link the bashrc
ln -s ~/bash_config/.bashrc ~/.bashrc
ln -s ~/bash_config/.gitconfig ~/.gitconfig
ln -s ~/bash_config/.vrapperrc ~/.vrapperrc
ln -s ~/bash_config/.ypy ~/.ypy
ln -s ~/bash_config/ypy ~/bin/ypy
ln -s ~/bash_config/.gdbinit ~/.gdbinit

# install zmqpp
pushd zmqpp
make
sudo make install
popd

# install Anaconda
wget http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-1.8.0-Linux-x86_64.sh
bash Anaconda-1.8.0-Linux-x86_64.sh

# haven't figured out how to loop through the pylist and install yet


# put /usr/local/lib onto the library path

sudo echo "/usr/local/lib" > /etc/ld.so.conf.d/99local.conf
sudo ldconfig
