PHP at 20: From pet project to powerhouse
================================================================================
![](http://images.techhive.com/images/article/2015/06/13049862325_8c97a11878_z-100590275-primary.idge.jpg)

Credit: [Steve Jurvetson via Flickr][1]

> The one-time ‘silly little project’ has transformed into a Web powerhouse, thanks to flexibility, pragmatism, and a vibrant community of Web devs

When Rasmus Lerdorf released “[a set of small tight CGI binaries written in C][2],” he had no idea how much his creation would impact Web development. Delivering the opening keynote at this year’s SunshinePHP conference in Miami, Lerdorf quipped, “In 1995, I thought I had unleashed a C API upon the Web. Obviously, that’s not what happened, or we’d all be C programmers.”

In fact, when Lerdorf released version 1.0 of Personal Home Page Tools -- as PHP was then known -- the Web was very young. HTML 2.0 would not be published until November of that year, and HTTP/1.0 not until May the following year. NCSA HTTPd was the most widely deployed Web server, and Netscape Navigator was the most popular Web browser, with Internet Explorer 1.0 to arrive in August. In other words, PHP’s beginnings coincided with the eve of the browser wars.

Those early days speak volumes about PHP’s impact on Web development. Back then, our options were limited when it came to server-side processing for Web apps. PHP stepped in to fill our need for a tool that would enable us to do dynamic things on the Web. That practical flexibility captured our imaginations, and PHP has since grown up with the Web. Now powering [more than 80 percent of the Web][3], PHP has matured into a scripting language that is especially suited to solve the Web problem. Its unique pedigree tells a story of pragmatism over theory and problem solving over purity.

### The Web glue we got hooked on ###

PHP didn’t start out as a language, and this is clear from its design -- or lack thereof, as detractors point out. It began as an API to help Web developers access lower-level C libraries. The first version was a small CGI binary that provided form-processing functionality with access to request parameters and the mSQL database. And its facility with a Web app’s database would prove key in sparking our interest in PHP and PHP’s subsequent ascendancy.

By version 2 -- aka PHP/FI -- database support had expanded to include PostgreSQL, MySQL, Oracle, Sybase, and more. It supported these databases by wrapping their C libraries, making them a part of the PHP binary. PHP/FI could also wrap the GD library to create and manipulate GIF images. It could be run as an Apache module or compiled with FastCGI support, and it introduced the PHP script language with support for variables, arrays, language constructs, and functions. For many of us working on the Web at that time, PHP was the kind of glue we'd been looking for.

As PHP folded in more and more programming language features, morphing into version 3 and onward, it never lost this gluelike aspect. Through repositories like PECL (PHP Extension Community Library), PHP could tie together libraries and expose their functionality to the PHP layer. This capacity to bring together components became a significant facet of the beauty of PHP, though it was not limited to its source code.

### The Web as a community of coders ###

PHP’s lasting impact on Web development isn’t limited to what can be done with the language itself. How PHP work is done and who participates -- these too are important parts of PHP’s legacy.

As early as 1997, PHP user groups began forming. One of the earliest was the Midwest PHP User’s Group (later known as Chicago PHP), which held its [first meeting in February 1997][4]. This was the beginning of what would become a vibrant, energetic community of developers assembled over an affinity for a little tool that helped them solve problems on the Web. The ubiquity of PHP made it a natural choice for Web development. It became especially popular in the shared hosting world, and its low barrier to entry was attractive to many early Web developers.

With a growing community came an assortment of tools and resources for PHP developers. The year 2000 -- a watershed moment for PHP -- witnessed the first PHP Developers’ Meeting, a gathering of the core developers of the programming language, who met in Tel Aviv to discuss the forthcoming 4.0 release. PHP Extension and Application Repository (PEAR) also launched in 2000 to provide high-quality userland code packages following standards and best practices. The first PHP conference, PHP Kongress, was held in Germany soon after. [PHPDeveloper.org][5] came online, and to this day, it is the most authoritative news source in the PHP community.

This communal momentum proved vital to PHP’s growth in subsequent years, and as the Web development industry erupted, so did PHP. PHP began powering more and larger websites. More user groups formed around the world. Mailing lists; online forums; IRC; conferences; trade journals such as php[architect], the German PHP Magazin, and International PHP Magazine -- the vibrancy of the PHP community had a significant impact on the way Web work would be done: collectively and openly, with an emphasis on code sharing.

Then, 10 years ago, shortly after the release of PHP 5, an interesting thing happened in Web development that created a general shift in how the PHP community built libraries and applications: Ruby on Rails was released.

### The rise of frameworks ###

The Ruby on Rails framework for the Ruby programming language created an increased focus and attention on the MVC (model-view-controller) architectural pattern. The Mojavi PHP framework a few years prior had used this pattern, but the hype around Ruby on Rails is what firmly cemented MVC in the PHP frameworks that followed. Frameworks exploded in the PHP community, and frameworks have changed the way developers build PHP applications.

Many important projects and developments have arisen, thanks to the proliferation of frameworks in the PHP community. The PHP [Framework Interoperability Group][6] formed in 2009 to aid in establishing coding standards, naming conventions, and best practices among frameworks. Codifying these standards and practices helped provide more interoperable software for developers using member projects’ code. This interoperability meant that each framework could be split into components and stand-alone libraries could be used together with monolithic frameworks. With interoperability came another important milestone: The Composer project was born in 2011.

Inspired by Node.js’s NPM and Ruby’s Bundler, Composer has ushered in a new era of PHP application development, creating a PHP renaissance of sorts. It has encouraged interoperability between packages, standard naming conventions, adoption of coding standards, and increased test coverage. It is an essential tool in any modern PHP application.

### The need for speed and innovation ###

Today, the PHP community has a thriving ecosystem of applications and libraries. Some of the most widely installed PHP applications include WordPress, Drupal, Joomla, and MediaWiki. These applications power the Web presence of businesses of all sizes, from small mom-and-pop shops to sites like whitehouse.gov and Wikipedia. Six of the Alexa top 10 sites use PHP to serve billions of pages a day. As a result, PHP applications have been optimized for speed -- and much innovation has gone into PHP core to improve performance.

In 2010, Facebook unveiled its HipHop for PHP source-to-source compiler, which translates PHP code into C++ code and compiles it into a single executable binary application. Facebook’s size and growth necessitated the move away from standard interpreted PHP code to a faster, optimized executable. However, Facebook wanted to continue using PHP for its ease of use and rapid development cycles. HipHop for PHP evolved into HHVM, a JIT (just-in-time) compilation-based execution engine for PHP, which included a new language based on PHP: [Hack][7].

Facebook’s innovations, as well as other VM projects, created competition at the engine level, leading to discussions about the future of the Zend Engine that still powers PHP’s core, as well as the question of a language specification. In 2014, a language specification project was created “to provide a complete and concise definition of the syntax and semantics of the PHP language,” making it possible for compiler projects to create interoperable PHP implementations.

The next major version of PHP became a topic of intense debate, and a project known as phpng (next generation) was offered as an option to clean up, refactor, optimize, and improve the PHP code base, which also showed substantial improvements to the performance of real-world applications. After deciding to name the next major version “PHP 7,” due to a previous, unreleased PHP 6.0 version, the phpng branch was merged in, and plans were made to proceed with PHP 7, working in many of the language features offered by Hack, such as scalar and return type hinting.

With the [first PHP 7 alpha release due out today][8] and benchmarks showing [performance as good as or better than that of HHVM][9] in many cases, PHP is keeping up with the pace of modern Web development needs. Likewise, the PHP-FIG continues to innovate and push frameworks and libraries to collaborate and cooperate -- most recently with the adoption of [PSR-7][10], which will change the way PHP projects handle HTTP. User groups, conferences, publications, and initiatives like [PHPMentoring.org][11] continue to advocate best practices, coding standards, and testing to the PHP developer community.

PHP has seen the Web mature through various stages, and PHP has matured. Once a simple API wrapper around lower-level C libraries, PHP has become a full-fledged programming language in its own right. Its developer community is vibrant and helpful, priding themselves in pragmatism and welcoming newcomers. PHP has stood the test of time for 20 years, and current activity in the language and community is ensuring it will be a relevant and useful language for years to come.

During his SunshinePHP keynote, Rasmus Lerdorf reflected, “Did I think I’d be here 20 years later talking about this silly little project I did? No, I didn’t.”

Here’s to Lerdorf and the rest of the PHP community for transforming this “silly little project” into a lasting, powerful component of the Web today.

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2933858/php/php-at-20-from-pet-project-to-powerhouse.html

作者：[Ben Ramsey][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/Ben-Ramsey/
[1]:https://www.flickr.com/photos/jurvetson/13049862325
[2]:https://groups.google.com/d/msg/comp.infosystems.www.authoring.cgi/PyJ25gZ6z7A/M9FkTUVDfcwJ
[3]:http://w3techs.com/technologies/overview/programming_language/all
[4]:http://web.archive.org/web/20061215165756/http://chiphpug.php.net/mpug.htm
[5]:http://www.phpdeveloper.org/
[6]:http://www.php-fig.org/
[7]:http://www.infoworld.com/article/2610885/facebook-q-a--hack-brings-static-typing-to-php-world.html
[8]:https://wiki.php.net/todo/php70#timetable
[9]:http://talks.php.net/velocity15
[10]:http://www.php-fig.org/psr/psr-7/
[11]:http://phpmentoring.org/