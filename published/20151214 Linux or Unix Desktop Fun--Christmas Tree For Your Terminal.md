Linux/Unix 桌面趣事：终端上的圣诞树
================================================================================

给你的Linux或Unix控制台创造一棵圣诞树玩玩吧。在此之前，需要先安装一个Perl模块，命名为Acme::POE::Tree。这是一棵很喜庆的圣诞树，我已经在Linux、OSX和类Unix系统上验证过了。

### 安装 Acme::POE::Tree ###

安装perl模块最简单的办法就是使用CPAN（Perl综合典藏网（Comprehensive Perl Archive Network））。打开终端，把下面的指令敲进去便可安装Acme::POE::Tree。

    ## 以root身份运行 ##
    perl -MCPAN -e 'install Acme::POE::Tree'
 
**示例输出：**

    Installing /home/vivek/perl5/man/man3/POE::NFA.3pm
    Installing /home/vivek/perl5/man/man3/POE::Kernel.3pm
    Installing /home/vivek/perl5/man/man3/POE::Loop.3pm
    Installing /home/vivek/perl5/man/man3/POE::Resource.3pm
    Installing /home/vivek/perl5/man/man3/POE::Filter::Map.3pm
    Installing /home/vivek/perl5/man/man3/POE::Resource::SIDs.3pm
    Installing /home/vivek/perl5/man/man3/POE::Loop::IO_Poll.3pm
    Installing /home/vivek/perl5/man/man3/POE::Pipe::TwoWay.3pm
    Appending installation info to /home/vivek/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/perllocal.pod
      RCAPUTO/POE-1.367.tar.gz
      /usr/bin/make install  -- OK
      RCAPUTO/Acme-POE-Tree-1.022.tar.gz
      Has already been unwrapped into directory /home/vivek/.cpan/build/Acme-POE-Tree-1.022-uhlZUz
      RCAPUTO/Acme-POE-Tree-1.022.tar.gz
      Has already been prepared
    Running make for R/RC/RCAPUTO/Acme-POE-Tree-1.022.tar.gz
    cp lib/Acme/POE/Tree.pm blib/lib/Acme/POE/Tree.pm
    Manifying 1 pod document
      RCAPUTO/Acme-POE-Tree-1.022.tar.gz
      /usr/bin/make -- OK
    Running make test
    PERL_DL_NONLAZY=1 "/usr/bin/perl" "-MExtUtils::Command::MM" "-MTest::Harness" "-e" "undef *Test::Harness::Switches; test_harness(0, 'blib/lib', 'blib/arch')" t/*.t
    t/01_basic.t .. ok
    All tests successful.
    Files=1, Tests=2,  6 wallclock secs ( 0.09 usr  0.03 sys +  0.53 cusr  0.06 csys =  0.71 CPU)
    Result: PASS
      RCAPUTO/Acme-POE-Tree-1.022.tar.gz
    Tests succeeded but one dependency not OK (Curses)
      RCAPUTO/Acme-POE-Tree-1.022.tar.gz
      [dependencies] -- NA

### 在Shell中显示圣诞树 ###

只需要在终端上运行以下命令：
 
    perl -MAcme::POE::Tree -e 'Acme::POE::Tree->new()->run()'
 
**示例输出**

![Gif 01: An animated christmas tree in Perl](http://s0.cyberciti.org/uploads/cms/2015/12/perl-tree.gif)

Gif 01: 一棵用Perl写的喜庆圣诞树

### 树的定制 ###

以下是我的脚本文件tree.pl的内容：

    #!/usr/bin/perl
     
    use Acme::POE::Tree;
    my $tree = Acme::POE::Tree->new(
    {
      star_delay => 1.5,  # shimmer star every 1.5 sec
      light_delay => 2,   # twinkle lights every 2 sec
      run_for => 10,      # automatically exit after 10 sec
    }
    );
    $tree->run();

这样就可以通过修改star_delay、run_for和light_delay参数的值来自定义你的树了。一棵好玩的终端圣诞树就此诞生。

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/open-source/command-line-hacks/linux-unix-desktop-fun-christmas-tree-for-your-terminal/

作者：Vivek Gite
译者：[soooogreen](https://github.com/soooogreen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
