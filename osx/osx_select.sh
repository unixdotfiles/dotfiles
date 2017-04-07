. ../common_shell/functions.sh

if __exists port
then
sudo port select --set cython cython27
sudo port select --set cython cython36
sudo port select --set maven maven3
sudo port select --set python python36
sudo port select --set python2 python27
sudo port select --set python3 python36
sudo port select --set ruby ruby23
sudo port select --set scala scala2.12
sudo port select --set pip pip27
sudo port select --set pip pip36
sudo port select --set php php71
sudo port select --set ipython py36-ipython
sudo port select --set ipython2 py27-ipython
sudo port select --set ipython3 py36-ipython
sudo port select --set gcc mp-gcc6
sudo port select --set llvm mp-llvm-3.9
sudo port select --set mysql mariadb-10.1
sudo port select --set postgresql_select postgresql95
sudo port select --set perl perl5.18-apple.15
sudo port select --set nosetests nosetests27
sudo port select --set nosetests nosetests36
sudo port select --set postgresql postgresql95
sudo port select --set wxWidgets wxWidgets-3.0
sudo port select --set maven maven3
sudo port select --set sphinx py36-sphinx

port select --summary
fi
