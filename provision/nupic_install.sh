echo "Getting pip"

python get-pip.py --user

echo "export PATH=$PATH:$HOME/.local/bin" >> /home/vagrant/.profile
echo "export CC=gcc" >> /home/vagrant/.profile
echo "export CXX=g++" >> /home/vagrant/.profile

source /home/vagrant/.profile

pip install --upgrade setuptools --user
pip install wheel --user

echo "Installing NuPIC"

pip install https://s3-us-west-2.amazonaws.com/artifacts.numenta.org/numenta/nupic.core/releases/nupic.bindings/nupic.bindings-0.2.2-cp27-none-linux_x86_64.whl --user
pip install nupic --user

echo "changing NuPIC MYSQL Server credentials"                                                                                                               
cp /vagrant/resources/nupic-site.xml /home/vagrant/.local/lib/python2.7/site-packages/nupic/support
