. ../common_shell/functions.sh

if __exists port
then
sudo port select --set cython cython27
sudo port select --set cython cython38
sudo port select --set maven maven3
sudo port select --set python python38
sudo port select --set python2 python27
sudo port select --set python3 python38
sudo port select --set ruby ruby25
sudo port select --set pip pip38
sudo port select --set pip2 pip27
sudo port select --set pip3 pip38
sudo port select --set php php73
sudo port select --set pip pip27
sudo port select --set pip pip37
sudo port select --set php php74
sudo port select --set scala scala2.13
sudo port select --set ipython py38-ipython
sudo port select --set ipython2 py27-ipython
sudo port select --set ipython3 py38-ipython
sudo port select --set gcc mp-gcc7
sudo port select --set llvm mp-llvm-7.0
sudo port select --set mysql mariadb-10.1
sudo port select --set postgresql_select postgresql95
sudo port select --set perl perl5.18-apple.15
sudo port select --set nosetests nosetests38
sudo port select --set postgresql postgresql95
sudo port select --set wxWidgets wxWidgets-3.0
sudo port select --set maven maven3
sudo port select --set sphinx py38-sphinx
sudo port select --set pygments py38-pygments
sudo port select --set virtualenv virtualenv38

port select --summary
fi
