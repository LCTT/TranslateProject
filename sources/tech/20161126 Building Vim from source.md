Compiling Vim from source is actually not that difficult.
Here's what you should do:

1. First, install all the prerequisite libraries, including Git.
   For a Debian-like Linux distribution like Ubuntu,
   that would be the following:

    ```sh
    sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
        python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
    ```

    On Ubuntu 16.04, `liblua5.1-dev` is the lua dev package name not `lua5.1-dev`.

   (If you know what languages you'll be using, feel free to leave out
   packages you won't need, e.g. Python2 `python-dev` or Ruby `ruby-dev`.
   This principle heavily applies to the whole page.)

    For Fedora 20, that would be the following:

    ```sh
    sudo yum install -y ruby ruby-devel lua lua-devel luajit \
        luajit-devel ctags git python python-devel \
        python3 python3-devel tcl-devel \
        perl perl-devel perl-ExtUtils-ParseXS \
        perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
        perl-ExtUtils-Embed
    ```

    This step is needed to rectify an issue with how Fedora 20 installs XSubPP:

    ```sh
    # symlink xsubpp (perl) from /usr/bin to the perl dir
    sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp 
    ```

2. Remove vim if you have it already.

    ```sh
    sudo apt-get remove vim vim-runtime gvim
    ```

    On Ubuntu 12.04.2 you probably have to remove these packages as well:

    ```sh
    sudo apt-get remove vim-tiny vim-common vim-gui-common vim-nox
    ```

3. Once everything is installed, getting the source is easy.

   Note: If you are using Python, your config directory might have
   a machine-specific name (e.g. `config-3.5m-x86_64-linux-gnu`).
   Check in /usr/lib/python[2/3/3.5] to find yours, and change
   the `python-config-dir` and/or `python3-config-dir` arguments accordingly.

    Add/remove the flags below to fit your setup. For example, you can leave out
    `enable-luainterp` if you don't plan on writing any Lua.

   Also, if you're not using vim 8.0,
   make sure to set the VIMRUNTIMEDIR variable correctly below
   (for instance, with vim 8.0a, use /usr/share/vim/vim80a).
   Keep in mind that some vim installations are located directly
   inside /usr/share/vim; adjust to fit your system:

    ```sh
    cd ~
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-rubyinterp=yes \
                --enable-pythoninterp=yes \
                --with-python-config-dir=/usr/lib/python2.7/config \
                --enable-python3interp=yes \
                --with-python3-config-dir=/usr/lib/python3.5/config \
                --enable-perlinterp=yes \
                --enable-luainterp=yes \
                --enable-gui=gtk2 --enable-cscope --prefix=/usr
    make VIMRUNTIMEDIR=/usr/share/vim/vim80
    ```
    On Ubuntu 16.04, Python support was not working due to enabling both Python2 and Python3. Read [answer by chirinosky](http://stackoverflow.com/questions/23023783/vim-compiled-with-python-support-but-cant-see-sys-version) for workaround.

    If you want to be able to easily uninstall vim use `checkinstall`.

    ```sh
    sudo apt-get install checkinstall
    cd ~/vim
    sudo checkinstall
    ```

    Otherwise, you can use `make` to install.

    ```sh
    cd ~/vim
    sudo make install
    ```

    Set vim as your default editor with `update-alternatives`.

    ```sh
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
    sudo update-alternatives --set editor /usr/bin/vim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
    sudo update-alternatives --set vi /usr/bin/vim
    ```

4. Double check that you are in fact running the new Vim binary by looking at
   the output of `vim --version`.

    **If you don't get gvim working (on ubuntu 12.04.1 LTS), try changing
    `--enable-gui=gtk2` to `--enable-gui=gnome2`**

    If you have problems, double check that you `configure`d using the correct Python config
    directory, as noted at the beginning of Step 3.

    These `configure` and `make` calls assume a Debian-like distro where Vim's
    runtime files directory is placed in `/usr/share/vim/vim80/`,
    which is not Vim's default. Same thing goes for `--prefix=/usr` in the 
    `configure` call. Those values may need to be different with a Linux 
    distro that is not based on Debian. In such a case, try to remove the 
    `--prefix` variable in the `configure` call and the `VIMRUNTIMEDIR` in the
    `make` call (in other words, go with the defaults).

    If you get stuck, here's some [other useful information on building Vim]
    (http://vim.wikia.com/wiki/Building_Vim).
    
--------------------------------------------------------------------------------

via: https://www.dataquest.io/blog/data-science-portfolio-project/

作者：[Val Markovic][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:   https://github.com/Valloric
