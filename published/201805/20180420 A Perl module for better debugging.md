一个可以更好地调试的 Perl 模块
======

> 这个简单优雅的模块可以让你包含调试或仅用于开发环境的代码，而在产品环境中隐藏它们。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/annoyingbugs.png?itok=ywFZ99Gs)

仅用于调试或开发调整时的 Perl 代码块有时会很有用。这很好，但是这样的代码块可能会对性能产生很大的影响, 尤其是在运行时才决定是否执行它。

[Curtis "Ovid" Poe][1] 最近编写了一个可以帮助解决这个问题的模块：[Keyword::DEVELOPMENT][2]。该模块利用 `Keyword::Simple` 和 Perl 5.012 中引入的可插入关键字架构来创建了新的关键字：`DEVELOPMENT`。它使用 `PERL_KEYWORD_DEVELOPMENT` 环境变量的值来确定是否要执行一段代码。

使用它不能更容易了：

```
use Keyword::DEVELOPMENT;
        
sub doing_my_big_loop {
    my $self = shift;
    DEVELOPMENT {
        # insert expensive debugging code here!
    }
}
```

在编译时，`DEVELOPMENT` 块内的代码已经被优化掉了，根本就不存在。

你看到好处了么？在沙盒中将 `PERL_KEYWORD_DEVELOPMENT` 环境变量设置为 `true`，在生产环境设为 `false`，并且可以将有价值的调试工具提交到你的代码库中，在你需要的时候随时可用。

在缺乏高级配置管理的系统中，你也可以使用此模块来处理生产和开发或测试环境之间的设置差异：

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
}
```

稍后对此代码片段的增强使你能在其他地方，比如 YAML 或 INI 中读取配置信息，但我希望您能在此看到该工具。

我查看了关键字 `Keyword::DEVELOPMENT` 的源码，花了大约半小时研究，“天哪，我为什么没有想到这个？”安装 `Keyword::Simple` 后，Curtis 给我们的模块就非常简单了。这是我长期以来在自己的编码实践中所需要的一个优雅解决方案。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/perl-module-debugging-code

作者：[Ruth Holloway][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:https://metacpan.org/author/OVID
[2]:https://metacpan.org/pod/release/OVID/Keyword-DEVELOPMENT-0.04/lib/Keyword/DEVELOPMENT.pm
