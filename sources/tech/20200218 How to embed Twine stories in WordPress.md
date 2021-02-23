[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to embed Twine stories in WordPress)
[#]: via: (https://opensource.com/article/20/2/embed-twine-wordpress)
[#]: author: (Roman Lukš https://opensource.com/users/romanluks)

How to embed Twine stories in WordPress
======
Share your Twine 2 interactive stories on your WordPress site with the
Embed Twine plugin.
![Person drinking a hat drink at the computer][1]

From the very beginning, I wanted the "About me" page on my WordPress website [romanluks.eu][2] to be interactive.

At first, I experimented with Dart, a programming language developed by Google that transcompiles into JavaScript. I killed the project when I realized I was making a game instead of an "About me" page.

A bit later, I discovered [Twine][3], an open source tool for creating interactive stories. It reminded me of the gamebooks I loved as a kid. It's so easy to create interconnected pieces of text in Twine, and it's ideal for the interview-like format I was aiming for. Because Twine publishes directly to HTML, you can do a lot of interesting things with it—including creating [interactive fiction][4] and [adventure games][5] or publishing stories on a blog or website.

### Early struggles

I created my "About me" page in Twine and tried to paste it into my WordPress page.

"No, can do," said WordPress and Twine.

You see, a Twine story exported from Twine is just a webpage (i.e., a file in HTML format). However, it not only includes HTML but JavaScript code, as well. And somehow it doesn't work when you simply try to copy-paste the contents. I tried copy-pasting just the body of the Twine story page without success.

I thought, "I guess I need to add that JavaScript code separately," and I tried custom fields.

Nope.

I took a break from my investigation. I just uploaded my "About me" Twine story via FTP and linked to it from my website's menu. People could visit it and interact with the story, however, there was no menu, and it didn't feel like a part of my website. I had made a trap for myself. It made me realize I really _really_ wanted my "About me" included directly on my website.

### DIY embed

I took a stab at the problem and came up with [this solution][6].

It worked. It wasn't perfect, but it worked.

But it wasn't _perfect_. Is there a better way? There is bound to be a better way…

It cost me a couple of pulled hairs, but I managed to get a [responsive iframe and autoscroll][7].

It was way better. I was proud of myself and shared it on [Reddit][8].

### The road to Embed Twine

Suddenly, an idea! What if, instead of following my tutorial, people could use a WordPress plugin?

They would only have to give the plugin a Twine story, and it would take care of the rest. Hassle-free. No need to copy-paste any JavaScript code.

Wouldn't that be glorious?!?

I had no idea how WordPress plugins work. I only knew they are written in PHP. A while back, I had part-time work as a PHP developer, and I remembered the basics.

### Containers and WordPress

I mentioned my idea to a friend, and he suggested I could use containers as my WordPress development environment.

In the past, I'd always used [XAMPP][9], but I wanted to try containers for a while.

No problem, I thought! I'll learn containers while I learn how to make a WordPress plugin and revive my PHP skills. That should be sufficiently stimulating.

And it was.

I can't recall how many times I stopped, removed, and rebuilt my containers. I had to use the command line. And the file permissions are painful.

Oh boy! It was like playing a game that you enjoy playing even though it makes you fairly angry. It was challenging but rewarding.

I found out that it's very easy to create a simple WordPress plugin:

  * Write the source code
  * Save it in the WP plugin directory
  * Test it
  * Repeat



Containers make it easy to use a specific environment and are easy to clean up when you screw up and need to start over.

Using Git saved me from accidentally wiping out my entire codebase. I used [Sourcetree][10] as my Git user interface. Initially, I wrote my code in [Notepad++][11], but when I divided my code into multiple files, I switched to [Atom][12]. It's such a cool editor for geeks. Using it feels like the code writes itself.

### Intermission

So what do we know so far?

  * I wanted an interactive "About me" page
  * I created an "About me" story in Twine
  * Twine exports webpages (as HTML files with JavaScript included)
  * WP plugins are easy to make
  * Containers are awesome



### Embed Twine is born

I wanted an easy way to embed Twine stories into WordPress. So, I used the power of software development, fooled around with containers, wrote a bit of PHP code, and published the result as a WordPress plugin called [Embed Twine][13].

### Install the plugin

  1. Upload the plugin [files][14] to the **/wp-content/plugins/plugin-name** directory, or install the plugin through the WordPress Plugins screen.
  2. Activate the plugin through the Plugins screen in WordPress.



### Use the plugin

After you've installed the Embed Twine plugin and created a Twine 2 story, embed it in your WordPress site:

  1. Export your Twine 2 story into an HTML file.
  2. Upload it via the plugin's interface.
  3. Insert the shortcode into the page or post.
  4. Enjoy your embedded story.



The plugin also provides autoscroll functionality to make it easy for users to navigate through your stories.

### Configure the plugin

The plugin is configurable via shortcode parameters. To use the shortcode, simply put **[embed_twine]** into your post.

You can use additional parameters in the format **[embed_twine story="Story" aheight=112 autoscroll=true ascroll=100]** as follows:

  * **story:** Specify the story name (the filename without an extension).
    * If the story parameter is omitted, it defaults to "Story." This means there is no need to use this parameter if your Twine filename is Story.html.
    * If you upload a Twine story called MyFooBar.html, use the shortcode: **[embed_twine story="MyFooBar"]**.
  * **aheight:** Use this parameter to adjust the iframe's height. You might need to tweak **aheight** to get rid of an iframe scrollbar. The default value is 112; this value is added to the iframe height and used to set the iframe's **style.height**.
  * **autoscroll:** Autoscroll is enabled by default. You can turn it off with shortcode parameter **[embed_twine autoscroll=false]**.
  * **ascroll:** Use this to adjust the default position for autoscroll. The default value is 100; this value is subtracted from the iframe's top position and fed into JavaScript method **window.scrollTo()**.



### Known bugs

Currently, Twine passages that include images might report their height incorrectly, and the scrollbar might show up for these passages. Tweak the shortcode parameter **aheight** to get rid of them.

### The script


```
1       &lt;?php
2      
3       /**
4       * Plugin Name: Embed Twine
5       * Description: Insert Twine stories into WordPress
6       * Version: 0.0.6
7       * Author: Roman Luks
8       * Author URI: <https://romanluks.eu/>
9       * License: GPLv2 or later
10      */
11     
12      require_once('include/embed-twine-load-file.php');
13      require_once('include/embed-twine-parent-page.php');
14      require_once('include/embed-twine-process-story.php');
15     
16      // Add plugin to WP menu
17      function embed_twine_customplugin_menu() {
18     
19          add_menu_page("Embed Twine", "Embed Twine","manage_options", __FILE__, "embed_twine_uploadfile");
20      }
21     
22      add_action("admin_menu", "embed_twine_customplugin_menu");
23     
24      function embed_twine_uploadfile(){
25          include "include/embed-twine-upload-file.php";
26      }
27     
28      // Add shortcode
29      function embed_twine_shortcodes_init()
30      {
31          function embed_twine_shortcode($atts = [], $content = null)
32          {
33              // Attributes
34              $atts = shortcode_atts(
35                  [array][15](
36                      'story' =&gt; 'Story',
37                      'aheight' =&gt; 112,       //adjust for style.height (30) and margins of tw-story (2x41)
38                      'autoscroll' =&gt; true,   //autoscroll enabled by default
39                      'ascroll' =&gt; 100,       //adjust for autoscroll
40                  ),
41                  $atts,
42                  'embed_twine'
43              );
44     
45              $content = embed_twine_buildParentPage($atts['story'], $atts['aheight'], $atts['autoscroll'], $atts['ascroll']);
46     
47              return $content;
48          }
49          add_shortcode('embed_twine', 'embed_twine_shortcode');
50      }
51      add_action('init', 'embed_twine_shortcodes_init');
```

* * *

_This article is adapted from [Roman Luks' blog][16] and [Embed Twine][13] page on WordPress plugins._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/embed-twine-wordpress

作者：[Roman Lukš][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/romanluks
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: https://romanluks.eu/
[3]: https://twinery.org/
[4]: https://opensource.com/article/18/7/twine-vs-renpy-interactive-fiction
[5]: https://opensource.com/article/18/2/twine-gaming
[6]: https://romanluks.eu/blog/how-to-embed-twine-on-your-wordpress-website/
[7]: https://romanluks.eu/blog/how-to-embed-twine-on-your-wordpress-website-with-responsive-iframe-and-autoscroll/
[8]: https://www.reddit.com/r/twinegames/comments/dtln4z/how_to_embed_twine_on_your_wordpress_website_with/
[9]: https://en.wikipedia.org/wiki/XAMPP
[10]: https://www.sourcetreeapp.com/
[11]: https://notepad-plus-plus.org/
[12]: https://atom.io/
[13]: https://wordpress.org/plugins/embed-twine/
[14]: https://plugins.trac.wordpress.org/browser/embed-twine/
[15]: http://www.php.net/array
[16]: https://romanluks.eu/blog/embed-twine-wordpress-plugin/
