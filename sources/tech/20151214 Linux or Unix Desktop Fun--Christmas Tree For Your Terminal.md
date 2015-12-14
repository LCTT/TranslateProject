sg translating
Linux / Unix Desktop Fun: Christmas Tree For Your Terminal
================================================================================
Let us create Linux or Unix console Christmas tree just for fun and profit. First, you need to install a Perl module called Acme::POE::Tree. It is an animated Christmas tree module. I've tested this on Linux, OS X and Unix-like system.

### Install Acme::POE::Tree ###

The easiest way to install any perl module is to use the cpan (Comprehensive Perl Archive Network). Open the terminal application and type the following command to install Acme::POE::Tree:

    ## run as root ##
    perl -MCPAN -e 'install Acme::POE::Tree'
 
**Sample outputs:**

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

### Show Christmas tree in the shell ###

Simply type the following command:
 
    perl -MAcme::POE::Tree -e 'Acme::POE::Tree->new()->run()'
 
**Sample outputs:**

![Gif 01: An animated christmas tree in Perl](http://s0.cyberciti.org/uploads/cms/2015/12/perl-tree.gif)

Gif 01: An animated christmas tree in Perl

### Tree customization ###

Here is my tree.pl:

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

Now can play with your tree modifying star_delay, run_for, and light_delay. And ,there you have it a a Christmas tree in your shell for fun.

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/open-source/command-line-hacks/linux-unix-desktop-fun-christmas-tree-for-your-terminal/

作者：Vivek Gite
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
