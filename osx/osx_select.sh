. ../common_shell/functions.sh

pythonver=37
phpver=74

if __exists port
then
sudo port select --set cython cython27
sudo port select --set cython cython${pythonver}
sudo port select --set maven maven3
sudo port select --set python python${pythonver}
sudo port select --set python2 python27
sudo port select --set python3 python${pythonver}
sudo port select --set ruby ruby25
sudo port select --set pip pip${pythonver}
sudo port select --set pip2 pip27
sudo port select --set pip3 pip${pythonver}
sudo port select --set php php${phpver}
sudo port select --set pip pip27
sudo port select --set pip pip${pythonver}
sudo port select --set scala scala2.13
sudo port select --set ipython py${pythonver}-ipython
sudo port select --set ipython2 py27-ipython
sudo port select --set ipython3 py${pythonver}-ipython
sudo port select --set gcc mp-gcc9
sudo port select --set llvm mp-llvm-7.0
sudo port select --set mysql mariadb-10.1
sudo port select --set postgresql_select postgresql95
sudo port select --set perl perl5.18-apple.15
sudo port select --set nosetests nosetests${pythonver}
sudo port select --set postgresql postgresql95
sudo port select --set wxWidgets wxWidgets-3.0
sudo port select --set maven maven3
sudo port select --set sphinx py${pythonver}-sphinx
sudo port select --set pygments py${pythonver}-pygments
sudo port select --set virtualenv virtualenv${pythonver}

port select --summary
fi
