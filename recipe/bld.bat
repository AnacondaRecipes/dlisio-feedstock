:: cmd

:: Isolate the build.
mkdir build
if errorlevel 1 exit 1

:: Taken from here: https://github.com/equinor/dlisio/blob/master/python/pyproject.toml
cmake ^
  -G"Ninja" ^
  -S %SRC_DIR% ^
  -B %SRC_DIR%\build ^
  -DCMAKE_INSTALL_PREFIX="%PREFIX%" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DBUILD_SHARED_LIBS=ON ^
  -DBUILD_TESTING=OFF ^
  -DPYTHON_EXECUTABLE=${PREFIX}/bin/python

cd build
if errorlevel 1 exit /b 1

:: Build.
echo "Building..."
ninja
if errorlevel 1 exit /b 1

:: Install.
echo "Installing..."
ninja install
if errorlevel 1 exit /b 1


:: Error free exit.
echo "Error free exit!"
exit 0



