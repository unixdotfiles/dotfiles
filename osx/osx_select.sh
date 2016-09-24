. ../common_shell/functions.sh

if __exists port
then
sudo port select --set cython cython27
sudo port select --set cython cython35
sudo port select --set maven maven3
sudo port select --set python python35
sudo port select --set python2 python27
sudo port select --set python3 python35
sudo port select --set ruby ruby23
sudo port select --set scala scala2.11
sudo port select --set pip pip27
sudo port select --set pip pip35
sudo port select --set php php70
sudo port select --set ipython py35-ipython
sudo port select --set ipython2 py27-ipython
sudo port select --set ipython3 py35-ipython
sudo port select --set gcc mp-gcc6
sudo port select --set llvm mp-llvm-3.8
sudo port select --set mysql mariadb-10.1
sudo port select --set postgresql_select postgresql95
sudo port select --set perl perl5.18-apple.15
sudo port select --set nosetests nosetests27
sudo port select --set nosetests nosetests35
sudo port select --set postgresql postgresql95

port select --summary
fi
