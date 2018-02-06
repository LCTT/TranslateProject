An introduction to the Web::Simple Perl module, a minimalist web framework
============================================================

### Perl module Web::Simple is easy to learn and packs a big enough punch for a variety of one-offs and smaller services.

 
![An introduction to the Web::Simple Perl module, a minimalist web framework](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openweb-osdc-lead.png?itok=yjU4KliG "An introduction to the Web::Simple Perl module, a minimalist web framework")
Image credits : [You as a Machine][10]. Modified by Rikki Endsley. [CC BY-SA 2.0][11].

One of the more-prominent members of the Perl community is [Matt Trout][12], technical director at [Shadowcat Systems][13]. He's been building core tools for Perl applications for years, including being a co-maintaner of the [Catalyst][14] MVC (Model, View, Controller) web framework, creator of the [DBIx::Class][15] object-management system, and much more. In person, he's energetic, interesting, brilliant, and sometimes hard to keep up with. When Matt writes code…well, think of a runaway chainsaw, with the trigger taped down and the safety features disabled. He's off and running, and you never quite know what will come out. Two things are almost certain: the module will precisely fit the purpose Matt has in mind, and it will show up on CPAN for others to use.


One of Matt's special-purpose modules is [Web::Simple][23]. Touted as "a quick and easy way to build simple web applications," it is a stripped-down, minimalist web framework, with an easy to learn interface. Web::Simple is not at all designed for a large-scale application; however, it may be ideal for a small tool that does one or two things in a lower-traffic environment. I can also envision it being used for rapid prototyping if you wanted to create quick wireframes of a new application for demonstrations.

### Installation, and a quick "Howdy!"

You can install the module using `cpan` or `cpanm`. Once you've got it installed, you're ready to write simple web apps without having to hassle with managing the connections or any of that—just your functionality. Here's a quick example:

```
#!/usr/bin/perl
package HelloReader;
use Web::Simple;

sub dispatch_request {
  GET => sub {
    [ 200, [ 'Content-type', 'text/plain' ], [ 'Howdy, Opensource.com reader!' ] ]
  },
  '' => sub {
    [ 405, [ 'Content-type', 'text/plain' ], [ 'You cannot do that, friend. Sorry.' ] ]
  }
}

HelloReader->run_if_script;
```

There are a couple of things to notice right off. For one, I didn't `use strict` and `use warnings` like I usually would. Web::Simple imports those for you, so you don't have to. It also imports [Moo][16], a minimalist OO framework, so if you know Moo and want to use it here, you can! The heart of the system lies in the `dispatch_request`method, which you must define in your application. Each entry in the method is a match string, followed by a subroutine to respond if that string matches. The subroutine must return an array reference containing status, headers, and content of the reply to the request.

### Matching

The matching system in Web::Simple is powerful, allowing for complicated matches, passing parameters in a URL, query parameters, and extension matches, in pretty much any combination you want. As you can see in the example above, starting with a capital letter will match on the request method, and you can combine that with a path match easily:

```
'GET + /person/*' => sub {
  my ($self, $person) = @_;
  # write some code to retrieve and display a person
  },
'POST + /person/* + %*' => sub {
  my ($self, $person, $params) = @_;
  # write some code to modify a person, perhaps
  }
```

In the latter case, the third part of the match indicates that we should pick up all the POST parameters and put them in a hashref called `$params` for use by the subroutine. Using `?` instead of `%` in that part of the match would pick up query parameters, as normally used in a GET request. There's also a useful exported subroutine called `redispatch_to`. This tool lets you redirect, without using a 3xx redirect; it's handled internally, invisible to the user. So:

```
'GET + /some/url' => sub {
  redispatch_to '/some/other/url';
}
```

A GET request to `/some/url` would get handled as if it was sent to `/some/other/url`, without a redirect, and the user won't see a redirect in their browser.

I've just scratched the surface with this module. If you're looking for something production-ready for larger projects, you'll be better off with [Dancer][17] or [Catalyst][18]. But with its light weight and built-in Moo integration, Web::Simple packs a big enough punch for a variety of one-offs and smaller services.

### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/dsc_0028.jpg?itok=RS0GBh25)][19] Ruth Holloway - Ruth Holloway has been a system administrator and software developer for a long, long time, getting her professional start on a VAX 11/780, way back when. She spent a lot of her career (so far) serving the technology needs of libraries, and has been a contributor since 2008 to the Koha open source library automation suite.Ruth is currently a Perl Developer at cPanel in Houston, and also serves as chief of staff for an obnoxious cat. In her copious free time, she occasionally reviews old romance... [more about Ruth Holloway][7][More about me][8]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/introduction-websimple-perl-module-minimalist-web-framework

作者：[Ruth Holloway ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:https://opensource.com/tags/python?src=programming_resource_menu1
[2]:https://opensource.com/tags/javascript?src=programming_resource_menu2
[3]:https://opensource.com/tags/perl?src=programming_resource_menu3
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&src=programming_resource_menu4
[5]:http://perldoc.perl.org/functions/package.html
[6]:https://opensource.com/article/18/1/introduction-websimple-perl-module-minimalist-web-framework?rate=ICN35y076ElpInDKoMqp-sN6f4UVF-n2Qt6dL6lb3kM
[7]:https://opensource.com/users/druthb
[8]:https://opensource.com/users/druthb
[9]:https://opensource.com/user/36051/feed
[10]:https://www.flickr.com/photos/youasamachine/8025582590/in/photolist-decd6C-7pkccp-aBfN9m-8NEffu-3JDbWb-aqf5Tx-7Z9MTZ-rnYTRu-3MeuPx-3yYwA9-6bSLvd-irmvxW-5Asr4h-hdkfCA-gkjaSQ-azcgct-gdV5i4-8yWxCA-9G1qDn-5tousu-71V8U2-73D4PA-iWcrTB-dDrya8-7GPuxe-5pNb1C-qmnLwy-oTxwDW-3bFhjL-f5Zn5u-8Fjrua-bxcdE4-ddug5N-d78G4W-gsYrFA-ocrBbw-pbJJ5d-682rVJ-7q8CbF-7n7gDU-pdfgkJ-92QMx2-aAmM2y-9bAGK1-dcakkn-8rfyTz-aKuYvX-hqWSNP-9FKMkg-dyRPkY
[11]:https://creativecommons.org/licenses/by/2.0/
[12]:https://shadow.cat/resources/bios/matt_short/
[13]:https://shadow.cat/
[14]:https://metacpan.org/pod/Catalyst
[15]:https://metacpan.org/pod/DBIx::Class
[16]:https://metacpan.org/pod/Moo
[17]:http://perldancer.org/
[18]:http://www.catalystframework.org/
[19]:https://opensource.com/users/druthb
[20]:https://opensource.com/users/druthb
[21]:https://opensource.com/users/druthb
[22]:https://opensource.com/article/18/1/introduction-websimple-perl-module-minimalist-web-framework#comments
[23]:https://metacpan.org/pod/Web::Simple
[24]:https://opensource.com/tags/perl
[25]:https://opensource.com/tags/programming
[26]:https://opensource.com/tags/perl-column
[27]:https://opensource.com/tags/web-development