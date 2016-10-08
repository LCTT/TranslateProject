wcnnbdk1 Translating
Content Security Policy, Your Future Best Friend
=====

A long time ago, my personal website was attacked. I do not know how it happened, but it happened. Fortunately, the damage from the attack was quite minor: A piece of JavaScript was inserted at the bottom of some pages. I updated the FTP and other credentials, cleaned up some files, and that was that.

One point made me mad: At the time, there was no simple solution that could have informed me there was a problem and — more importantly — that could have protected the website’s visitors from this annoying piece of code.

A solution exists now, and it is a technology that succeeds in both roles. Its name is content security policy (CSP).

### What Is A CSP? Link

The idea is quite simple: By sending a CSP header from a website, you are telling the browser what it is authorized to execute and what it is authorized to block.

Here is an example with PHP:

```
<?php
    header("Content-Security-Policy: <your directives>");
?>
```

#### SOME DIRECTIVES LINK

You may define global rules or define rules related to a type of asset:

```
default-src 'self' ;
     # self = same port, same domain name, same protocol => OK
```

The base argument is default-src: If no directive is defined for a type of asset, then the browser will use this value.

```
script-src 'self' www.google-analytics.com ;
     # JS files on these domains => OK
```

In this example, we’ve authorized the domain name www.google-analytics.com as a source of JavaScript files to use on our website. We’ve added the keyword 'self'; if we redefined the directive script-src with another rule, it would override default-src rules.

If no scheme or port is specified, then it enforces the same scheme or port from the current page. This prevents mixed content. If the page is https://example.com, then you wouldn’t be able to load http://www.google-analytics.com/file.js because it would be blocked (the scheme wouldn’t match). However, there is an exception to allow a scheme upgrade. If http://example.com tries to load https://www.google-analytics.com/file.js, then the scheme or port would be allowed to change to facilitate the scheme upgrade.

```
style-src 'self' data: ;
     # Data-Uri in a CSS => OK
```

In this example, the keyword data: authorizes embedded content in CSS files.

Under the CSP level 1 specification, you may also define rules for the following:

- `img-src`

valid sources of images

- `connect-src`

applies to XMLHttpRequest (AJAX), WebSocket or EventSource

- `font-src`

valid sources of fonts

- `object-src`

valid sources of plugins (for example, `<object>, <embed>, <applet>`)

- `media-src`

valid sources of `<audio> and <video>`


CSP level 2 rules include the following:

- `child-src`

valid sources of web workers and elements such as `<frame>` and `<iframe>` (this replaces the deprecated frame-src from CSP level 1)

- `form-action`

valid sources that can be used as an HTML `<form>` action

- `frame-ancestors`

valid sources for embedding the resource using `<frame>, <iframe>, <object>, <embed> or <applet>`.

- `upgrade-insecure-requests`

instructs user agents to rewrite URL schemes, changing HTTP to HTTPS (for websites with a lot of old URLs that need to be rewritten).

For better backwards-compatibility with deprecated properties, you may simply copy the contents of the actual directive and duplicate them in the deprecated one. For example, you may copy the contents of child-src and duplicate them in frame-src.

CSP 2 allows you to whitelist paths (CSP 1 allows only domains to be whitelisted). So, rather than whitelisting all of www.foo.com, you could whitelist www.foo.com/some/folder to restrict it further. This does require CSP 2 support in the browser, but it is obviously more secure.

#### AN EXAMPLE 

I made a simple example for the Paris Web 2015 conference, where I presented a talk entitled “[CSP in Action][1].”
Without CSP, the page would look like this:

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing1b-500.jpg)

Not very nice. What if we enabled the following CSP directives?

```
<?php
    header("Content-Security-Policy: 
      default-src 'self' ;
      script-src 'self' www.google-analytics.com stats.g.doubleclick.net ; 
      style-src 'self' data: ;
      img-src 'self' www.google-analytics.com stats.g.doubleclick.net data: ;
      frame-src 'self' ;");
?>
```

What would the browser do? It would (very strictly) apply these directives under the primary rule of CSP, which is that anything not authorized in a CSP directive will be blocked (“blocked” meaning not executed, not displayed and not used by the website).

By default in CSP, inline scripts and styles are not authorized, which means that every `<script>`, onclick or style attribute will be blocked. You could authorize inline CSS with style-src 'unsafe-inline' ;.

In a modern browser with CSP support, the example would look like this:

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing5-500.jpg)

What happened? The browser applied the directives and rejected anything that was not authorized. It sent these notifications to the console:

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing2-500.jpg)

If you’re still not convinced of the value of CSP, have a look at Aaron Gustafson’s article “[More Proof We Don’t Control Our Web Pages][2].”

Of course, you may use stricter directives than the ones in the example provided above:

- set default-src to 'none',
- specify what you need for each rule,
- specify the exact paths of required files,
- etc.


### More Information On CSP 

#### SUPPORT 

CSP is not a nightly feature requiring three flags to be activated in order for it to work. CSP levels 1 and 2 are candidate recommendations! [Browser support for CSP level 1][3] is excellent.

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing3-500.jpg)

The [level 2 specification][4] is more recent, so it is a bit less supported.

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing4-500.jpg)

CSP level 3 is an early draft now, so it is not yet supported, but you can already do great things with levels 1 and 2.

#### OTHER CONSIDERATIONS

CSP has been designed to reduce cross-site scripting (XSS) risks, which is why enabling inline scripts in script-src directives is not recommended. Firefox illustrates this issue very nicely: In the browser, hit Shift + F2 and type security csp, and it will show you directives and advice. For example, here it is used on Twitter’s website:

![](https://www.smashingmagazine.com/wp-content/uploads/2016/09/csp_smashing6b-500.jpg)

Another possibility for inline scripts or inline styles, if you really have to use them, is to create a hash value. For example, suppose you need to have this inline script:

```
<script>alert('Hello, world.');</script>
```

You might add 'sha256-qznLcsROx4GACP2dm0UCKCzCG-HiZ1guq6ZZDob_Tng=' as a valid source in your script-src directives. The hash generated is the result of this in PHP:

```
<?php
    echo base64_encode(hash('sha256', "alert('Hello, world.');", true));
?>
```

I said earlier that CSP is designed to reduce XSS risks — I could have added, “… and reduce the risks of unsolicited content.” With CSP, you have to know where your sources of content are and what they are doing on your front end (inline styles, etc.). CSP can also help you force contributors, developers and others to respect your rules about sources of content!

Now your question is, “OK, this is great, but how do we use it in a production environment?”

### How To Use It In The Real World

The easiest way to get discouraged with using CSP the first time is to test it in a live environment, thinking, “This will be easy. My code is bad ass and perfectly clean.” Don’t do this. I did it. It’s stupid, trust me.

As I explained, CSP directives are activated with a CSP header — there is no middle ground. You are the weak link here. You might forget to authorize something or forget a piece of code on your website. CSP will not forgive your oversight. However, two features of CSP greatly simplify this problem.

#### REPORT-URI

Remember the notifications that CSP sends to the console? The directive report-uri can be used to tell the browser to send them to the specified address. Reports are sent in JSON format.

```
report-uri /csp-parser.php ;
```

So, in the csp-parser.php file, we can process the data sent by the browser. Here is the most basic example in PHP:

```
$data = file_get_contents('php://input');

    if ($data = json_decode($data, true)) {
     $data = json_encode(
      $data,
      JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES
      );
     mail(EMAIL, SUBJECT, $data);
    }
```

This notification will be transformed into an email. During development, you might not need anything more complex than this.

For a production environment (or a more visited development environment), you’d better use a way other than email to collect information, because there is no auth or rate limiting on the endpoint, and CSP can be very noisy. Just imagine a page that generates 100 CSP notifications (for example, a script that display images from an unauthorized source) and that is viewed 100 times a day — you could get 10,000 notifications a day!

A service such as report-uri.io can be used to simplify the management of reporting. You can see other simple examples for report-uri (with a database, with some optimizations, etc.) on GitHub.

### REPORT-ONLY

As we have seen, the biggest issue is that there is no middle ground between CSP being enabled and disabled. However, a feature named report-only sends a slightly different header:

```
<?php
    header("Content-Security-Policy-Report-Only: <your directives>");
?>
```

Basically, this tells the browser, “Act as if these CSP directives were being applied, but do not block anything. Just send me the notifications.” It is a great way to test directives without the risk of blocking any required assets.

With report-only and report-uri, you can test CSP directives with no risk, and you can monitor in real time everything CSP-related on a website. These two features are really powerful for deploying and maintaining CSP!

### Conclusion

#### WHY CSP IS COOL

CSP is most important for your users: They don’t have to suffer any unsolicited scripts or content or XSS vulnerabilities on your website.

The most important advantage of CSP for website maintainers is awareness. If you’ve set strict rules for image sources, and a script kiddie attempts to insert an image on your website from an unauthorized source, that image will be blocked, and you will be notified instantly.

Developers, meanwhile, need to know exactly what their front-end code does, and CSP helps them master that. They will be prompted to refactor parts of their code (avoiding inline functions and styles, etc.) and to follow best practices.

#### HOW CSP COULD BE EVEN COOLER LINK

Ironically, CSP is too efficient in some browsers — it creates bugs with bookmarklets. So, do not update your CSP directives to allow bookmarklets. We can’t blame any one browser in particular; all of them have issues:

- Firefox
- Chrome (Blink)
- WebKit

Most of the time, the bugs are false positives in blocked notifications. All browser vendors are working on these issues, so we can expect fixes soon. Anyway, this should not stop you from using CSP.

--------------------------------------------------------------------------------

via: https://www.smashingmagazine.com/2016/09/content-security-policy-your-future-best-friend/?utm_source=webopsweekly&utm_medium=email

作者：[Nicolas Hoffmann][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.smashingmagazine.com/author/nicolashoffmann/
[1]: https://rocssti.net/en/example-csp-paris-web2015
[2]: https://www.aaron-gustafson.com/notebook/more-proof-we-dont-control-our-web-pages/
[3]: http://caniuse.com/#feat=contentsecuritypolicy
[4]: http://caniuse.com/#feat=contentsecuritypolicy2

