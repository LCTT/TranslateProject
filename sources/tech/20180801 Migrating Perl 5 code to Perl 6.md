Migrating Perl 5 code to Perl 6
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/perl6-logo-camilla.png?itok=LY5EkYUV)

Whether you are a programmer who is taking the first steps to convert your Perl 5 code to Perl 6 and encountering some issues or you're just interested in learning about what might happen if you try to port Perl 5 programs to Perl 6, this article should answer your questions.

The [Perl 6 documentation][1] already contains most (if not all) the [documentation you need][2] to deal with the issues you will confront in migrating Perl 5 code to Perl 6. But, as documentation goes, the focus is on the factual differences. I will try to go a little more in-depth about specific issues and provide a little more hands-on information based on my experience porting quite a lot of Perl 5 code to Perl 6.

### How is Perl 6 anyway?

Very well, thank you! Since its first official release in December 2015, Rakudo Perl 6 has seen an order of magnitude of improvement and quite a few bug fixes (more than 14,000 commits in total). Seven books about Perl 6 have been published so far. [Learning Perl 6][3] by Brian D. Foy will soon be published by O'Reilly, having been re-worked from the seminal [Learning Perl][4] (aka "The Llama Book") that many people have come to know and love.

The user distribution [Rakudo Star][5] is on a three-month release cycle, and more than 1,100 modules are available in the [Perl 6 ecosystem][6]. The Rakudo Compiler Release is on a monthly release cycle and typically contains contributions by more than 30 people. Perl 6 modules are uploaded to the Perl programming Authors Upload Server ([PAUSE][7]) and distributed all over the world using the Comprehensive Perl Archive Network ([CPAN][8]).

The online [Perl 6 Introduction][9] document has been translated into 12 languages, teaching over 3 billion people about Perl 6 in their native language. The most recent incarnation of [Perl 6 Weekly][10] has been reporting on all things Perl 6 every week since February 2014.

[Cro][11], a microservices framework, uses all of Perl 6's features from the ground up, providing HTTP 1.1 persistent connections, HTTP 2.0 with request multiplexing, and HTTPS with optional certificate authority out of the box. And a [Perl 6 IDE][12] is now in (paid) beta (think of it as a Kickstarter with immediate deliverables).

### Using Perl 5 features in Perl 6

Perl 5 code can be seamlessly integrated with Perl 6 using the [`Inline::Perl5`][13] module, making all of [CPAN][14] available to any Perl 6 program. This could be considered cheating, as it will embed a Perl 5 interpreter and therefore continues to have a dependency on the `perl` (5) runtime. But it does make it easy to get your Perl 6 code running (if you need access to modules that have not yet been ported) simply by adding `:from<Perl5>` to your `use` statement, like `use DBI:from<Perl5>;`.

In January 2018, I proposed a [CPAN Butterfly Plan][15] to convert Perl 5 functionality to Perl 6 as closely as possible to the original API. I stated this as a goal because Perl 5 (as a programming language) is so much more than syntax alone. Ask anyone what Perl's unique selling point is, and they will most likely tell you it is CPAN. Therefore, I think it's time to move from this view of the Perl universe:

![](https://opensource.com/sites/default/files/uploads/perl_dromecentricview.png)

to a more modern view:

![](https://opensource.com/sites/default/files/uploads/perl_cpannicanview.png)

In other words: put CPAN, as the most important element of Perl, in the center.

### Converting semantics

To run Perl 5 code natively in Perl 6, you also need a lot of Perl 5 semantics. Having (optional) support for Perl 5 semantics available in Perl 6 lowers the conceptual threshold that Perl 5 programmers perceive when trying to program in Perl 6. It's easier to feel at home!

Since the publication of the CPAN Butterfly Plan, more than 100 built-in Perl 5 functions are now supported in Perl 6 with the same API. Many functions already exist in Perl 6 but have slightly different semantics, e.g., `shift` in Perl 5 magically shifts from `@_` (or `@ARGV`) if no parameter is specified; in Perl 6 the parameter is obligatory.

More than 50 Perl 5 CPAN distributions have also been ported to Perl 6 while adhering to the original Perl 5 API. These include core modules such as [Scalar::Util][16] and [List::Util][17], but also non-core modules such as [Text::CSV][18] and [Memoize][19]. Distributions that are upstream on the [River of CPAN][20] are targeted to have as much effect on the ecosystem as possible.

### Summary

Rakudo Perl 6 has matured in such a way that using Perl 6 is now a viable approach to creating new, interactive projects. Being able to use reliable and proven Perl 5 language components aids in lowering the threshold for developers to use Perl 6, and it builds towards a situation where the sum of Perl 5 and Perl 6 becomes greater than its parts.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/migrating-perl-5-perl-6

作者：[Elizabeth Mattijsen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/lizmat
[1]:https://docs.perl6.org/
[2]:https://docs.perl6.org/language/5to6-overview
[3]:https://www.learningperl6.com
[4]:http://shop.oreilly.com/product/0636920049517.do
[5]:https://rakudo.org/files
[6]:https://modules.perl6.org
[7]:https://pause.perl.org/pause/query?ACTION=pause_04about
[8]:https://www.cpan.org
[9]:https://perl6intro.com
[10]:https://p6weekly.wordpress.com
[11]:https://cro.services
[12]:https://commaide.com
[13]:http://modules.perl6.org/dist/Inline::Perl5:cpan:NINE
[14]:https://metacpan.org
[15]:https://www.perl.com/article/an-open-letter-to-the-perl-community/
[16]:https://modules.perl6.org/dist/Scalar::Util
[17]:https://modules.perl6.org/dist/List::Util
[18]:https://modules.perl6.org/dist/Text::CSV
[19]:https://modules.perl6.org/dist/Memoize
[20]:http://neilb.org/2015/04/20/river-of-cpan.html
