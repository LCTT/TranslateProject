translating---geekpi

A Perl module for better debugging
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/annoyingbugs.png?itok=ywFZ99Gs)
It's occasionally useful to have a block of Perl code that you use only for debugging or development tweaking. That's fine, but having blocks like this can be expensive to performance, particularly if the decision whether to execute it is made at runtime.

[Curtis "Ovid" Poe][1] recently wrote a module that can help with this problem: [Keyword::DEVELOPMENT][2]. The module utilizes Keyword::Simple and the pluggable keyword architecture introduced in Perl 5.012 to create a new keyword: DEVELOPMENT. It uses the value of the PERL_KEYWORD_DEVELOPMENT environment variable to determine whether or not a block of code is to be executed.

Using it couldn't be easier:
```
use Keyword::DEVELOPMENT;

       

sub doing_my_big_loop {

    my $self = shift;

    DEVELOPMENT {

        # insert expensive debugging code here!

    }

}Keyworddoing_my_big_loopDEVELOPMENT

```

At compile time, the code inside the DEVELOPMENT block is optimized away and simply doesn't exist.

Do you see the advantage here? Set up the PERL_KEYWORD_DEVELOPMENT environment variable to be true on your sandbox and false on your production environment, and valuable debugging tools can be committed to your code repo, always there when you need them.

You could also use this module, in the absence of a more evolved configuration management system, to handle variations in settings between production and development or test environments:
```
sub connect_to_my_database {

       

    my $dsn = "dbi:mysql:productiondb";

    my $user = "db_user";

    my $pass = "db_pass";

   

    DEVELOPMENT {

        # Override some of that config information

        $dsn = "dbi:mysql:developmentdb";

    }

   

    my $db_handle = DBI->connect($dsn, $user, $pass);

}connect_to_my_databaseDEVELOPMENTDBI

```

Later enhancement to this snippet would have you reading in configuration information from somewhere else, perhaps from a YAML or INI file, but I hope you see the utility here.

I looked at the source code for Keyword::DEVELOPMENT and spent about a half hour wondering, "Gosh, why didn't I think of that?" Once Keyword::Simple is installed, the module that Curtis has given us is surprisingly simple. It's an elegant solution to something I've needed in my own coding practice for a long time.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/perl-module-debugging-code

作者：[Ruth Holloway][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:https://metacpan.org/author/OVID
[2]:https://metacpan.org/pod/release/OVID/Keyword-DEVELOPMENT-0.04/lib/Keyword/DEVELOPMENT.pm
