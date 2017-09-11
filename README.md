# vimer
it's IDE.

1.clone vim source code

  git clone https://github.com/vim/vim.git

2.compile

  sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev 

  libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev 

  libxpm-dev libxt-dev python-dev ruby-dev mercurial

  sudo apt-get remove vim  

  sudo apt-get remove vim-runtime  

  sudo apt-get remove gvim  

  sudo apt-get remove vim-tiny  

  sudo apt-get remove vim-common  

  sudo apt-get remove vim-gui-common
  
  cd ./vim
  ./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp 

  --with-python-config-dir=/usr/lib/python2.7/config-i386-linux-gnu/ 

  --enable-perlinterp --enable-gui=gtk2 --enable-cscope --enable-luainterp 

  --enable-perlinterp --enable-multibyte --prefix=/usr


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

  3. git clone https://github.com/vimcoders/vimer.git

     cp -rf .vim .vimrc ~/

     git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/

  4.BundleInstall

     :BundleInstall

     YouCompleteMe:https://github.com/Valloric/YouCompleteMe

     vim-go:https://github.com/fatih/vim-go
