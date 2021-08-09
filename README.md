# vimer
it's IDE.

1. yum install python3.6-devel ncurses-libs ncurses-devel gcc gcc-c++ kernel-devel
2. rpm -i http://mirror.ghettoforge.org/distributions/gf/el/7/gf/x86_64/gcc10-libstdc++-10.2.1-7.gf.el7.x86_64.rpm
3. find / -name "libstdc++.so.6*"
4. clone vim source code
	git clone https://github.com/vim/vim.git
3. compile

	cd ./vim

	./configure --enable-python3interp --with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu/ --prefix=/usr/local/vim8

	make

	make install

需要重新配置可 输入 make distclean #清理一下上一次编译生成的所有文件

其中参数说明如下：

	--with-features=huge：支持最大特性
	
	--enable-rubyinterp：启用Vim对ruby编写的插件的支持
	
	--enable-pythoninterp：启用Vim对python编写的插件的支持
	
	--enable-luainterp：启用Vim对lua编写的插件的支持
	
	--enable-perlinterp：启用Vim对perl编写的插件的支持
	
	--enable-multibyte：多字节支持 可以在Vim中输入中文
	
	--enable-cscope：Vim对cscope支持
	
	--enable-gui=gtk2：gtk2支持,也可以使用gnome，表示生成gvim
	
	--with-python-config-dir=/usr/lib/python2.7/config-i386-linux-gnu/ 指定 python 路径
	
	--prefix=/usr：编译安装路径

	make
	
	sudo make install

4. git clone https://github.com/vimcoders/vimer.git

	cp -rf .vim .vimrc ~/

	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/

5. BundleInstall

    :BundleInstall

