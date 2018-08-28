echo
echo building...

mkdir -p build
cd build

python_exe=$(which python)
if [ "$python_exe" -eq "" ]; then
	echo "python is not installed on this machine, please install first"
	exit 0
fi

tmpdir=/tmp/open3d_install

# you can specify a custom install location and the python version
cmake -DCMAKE_INSTALL_PREFIX=${tmpdir} .. -DPYTHON_EXECUTABLE=${python_exe}

make -j
sudo make install

# this will copy the libs and headers to ~/open3d_install/lib & ~/open3d_install/include
# make install

echo
