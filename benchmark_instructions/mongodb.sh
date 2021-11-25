sudo apt install libcurl4-openssl-dev libssl-dev liblzma-dev
git clone https://github.com/mongodb/mongo.git
cd mongo
git checkout tags/r5.1.1-rc0
python3 -m pip install -r etc/pip/compile-requirements.txt
time python3 buildscripts/scons.py install-mongod MONGO_VERSION=5.1.1
rm -rf
time python3 buildscripts/scons.py install-mongod MONGO_VERSION=5.1.1 CC=clang-12 CXX=clang++-12
