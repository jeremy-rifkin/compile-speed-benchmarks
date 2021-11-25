# install
sudo apt install libcurl4-openssl-dev libssl-dev liblzma-dev
git clone https://github.com/mongodb/mongo.git
cd mongo
git checkout tags/r5.1.1-rc0
python3 -m pip install -r etc/pip/compile-requirements.txt

# gcc release
time python3 buildscripts/scons.py install-mongod MONGO_VERSION=5.1.1 --disable-warnings-as-errors
rm -rf build
# clang release
time python3 buildscripts/scons.py install-mongod MONGO_VERSION=5.1.1 CC=clang-12 CXX=clang++-12
rm -rf build
# gcc debug
time python3 buildscripts/scons.py install-mongod --dbg=on MONGO_VERSION=5.1.1 --disable-warnings-as-errors
rm -rf build
# clang debug
time python3 buildscripts/scons.py install-mongod --dbg=on MONGO_VERSION=5.1.1 CC=clang-12 CXX=clang++-12
rm -rf build
