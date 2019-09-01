7z x obs_deps_windows\archive.7z -oobs_deps

cd
dir
dir obs_deps
dir obs_deps\obs_src\
dir obs_deps\obs_src\build_64\


:: 64 bit build
mkdir build_64
cd build_64

cmake.exe ..  -G "Visual Studio 15 2017 Win64" ^
-DOBS_SOURCE_DIR='.\obs_deps\obs_src\' ^
-DOBS_LIB_DIR='.\obs_deps\obs_src\build_64\' ^
-DQT_DIR='.\obs_deps\Qt\5.10.1\msvc2017_64\' ^
-DGOOGLE_API_KEY="%GOOGLE_API_KEY%"

cd ..
cd
dir build_64


:: 32 bit build
mkdir build_32
cd build_32

cmake.exe ..  -G "Visual Studio 15 2017" ^
-DOBS_SOURCE_DIR='.\obs_deps\obs_src\' ^
-DOBS_LIB_DIR='.\obs_deps\obs_src\build_32\' ^
-DQT_DIR='.\obs_deps\Qt\5.10.1\msvc2017\' ^
-DGOOGLE_API_KEY="%GOOGLE_API_KEY%"

cd ..
cd
dir build_32

:: copy the cmake processed file with version_string
copy build_64\CI\post-install-script-win.cmd CI\post-install-script-win.cmd
dir CI
type CI\post-install-script-win.cmd

dir

