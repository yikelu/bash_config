sudo dpkg --get-selections | grep -v deinstall > list.txt
conda list -e > pylist.txt
