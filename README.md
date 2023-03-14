# GnuWin32

1. 下载[**GetGnuWin32**](https://sourceforge.net/projects/getgnuwin32/)
2. 打开，解压到文件夹**GetGnuWin32**
3. 下载最新的[**wget**](https://eternallybored.org/misc/wget/)
4. 进入**GetGnuWin32\bin**，把**wget-1.12.exe**替换成最新的（保持文件名为**wget-1.12.exe**）
5. 返回**GetGnuWin32**目录，命令行执行`download.bat -u`
6. 再次进入**GetGnuWin32\bin**，把**wget.exe**替换成最新的（保持文件名为**wget.exe**）
7. 返回**GetGnuWin32**目录，命令行执行`download.bat -d [mirror] [mirror] [mirror]`
   > 这一步可以把mirror换成指定镜像，支持多个镜像，具体选项可以打开**download.bat**文件查看
8. 下载完毕后执行**install target_dir**，把**target_dir**改成想要安装的目录
