[#]: subject: "How I dynamically generate Jekyll config files"
[#]: via: "https://opensource.com/article/21/11/jekyll-config-files"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I dynamically generate Jekyll config files
======
Insert dynamic data into Jekyll static sites using Python or Bash and
avoid creating an API backend.
![Digital creative of a browser on the internet][1]

[Jekyll][2], the static site generator, uses the `_config.yml` for configuration. The configurations are all Jekyll-specific. But you can also [define variables with our own content][3] in these files and use them throughout your website. In this article, I'll highlight some advantages of dynamically creating Jekyll config files.

On my local laptop, I use the following command to serve my Jekyll website for testing:


```
`bundle exec jekyll serve --incremental --config _config.yml`
```

### Combining many configuration files

During local testing, it's sometimes necessary to override configuration options. My website's [current _config.yml][4] has the following settings:


```
# Jekyll Configuration

# Site Settings
url: "<https://notes.ayushsharma.in>"
website_url: "<https://notes.ayushsharma.in/>"
title: ayush sharma's notes ☕ + 🎧 + 🕹️
email: [ayush@ayushsharma.in][5]
images-path: /static/images/
videos-path: /static/videos/
js-path: /static/js/
baseurl: "" # the subpath of your site, e.g. /blog
```

Since the local `jekyll serve` URL is http : //localhost:4000, the URL defined above won’t work. I can always create a copy of `_config.yml` as `_config-local.yml` and replace all the values. But there is an easier option.

Jekyll allows [specifying many configuration files][6] with later declarations overriding previous ones. This means I can define a new `_config-local.yml` with the following code:


```
`url:""`
```

Then I can combine the above file with my main `_config.yml` like this:


```
`bundle exec jekyll serve --incremental --config _config.yml,_config-local.yml`
```

By combining both files, the final value of `url` for this `jekyll serve` will be blank. This turns all URLs defined in my website into relative URLs and makes them work on my local laptop.

### Combining dynamic config files

As a simple example, suppose you want to display the current date on your website. The bash command for this is:


```
&gt; date '+%A, %d %B %Y'
Saturday, 16 October 2021
```

I know I can [use Jekyll's _config.yml's for custom content][3] as well. I'll output the above date into a new Jekyll config file.


```
`my_date=`date '+%A, %d %B %Y'`; echo 'my_date: "'$my_date'"' > _config-data.yml`
```

Now `_config-data.yml` contains:


```
`my_date: "Saturday, 16 October 2021"`
```

I can combine my new config file with the others and use the `my_date` variable on my website.


```
`bundle exec jekyll serve --incremental --config _config.yml,_config-local.yml,_config-data.yml`
```

On running the above command, `{{ site.my_date }}` outputs its configured value.

### Conclusion

The example above is quite simple, but the possibilities are endless. Bash, Python, and other programming languages can dynamically generate Jekyll config files. I can then combine these during the `build` or `serve` process.

For [findmymastodon.com][7], [I'm using Python to fetch Mastodon user statistics][8]. I'm then writing these into a new [_config-data.yml file][9] (currently manually). Finally, the [home page and others display these from the configuration file][10]. This way, I can leverage a dynamic backend and still keep all the static website goodness I'm so fond of.

I hope this has sparked some ideas for your own static websites. Jamstack is great for static websites, but you can avoid creating an entire API backend for dynamic content. Why not instead use a build job to create config files with updated content? It might not suit every use case, but one less API means fewer infrastructure moving parts.

I hope this helps you in some way during your next static website project. Keep reading, and happy coding.

* * *

_This article originally appeared on the [author's website][11] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/jekyll-config-files

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://opensource.com/article/21/9/build-website-jekyll
[3]: https://ayushsharma.in/2021/08/using-variables-in-jekyll-to-define-custom-content
[4]: https://gitlab.com/ayush-sharma/ayushsharma-in/-/blob/2.0/_config.yml
[5]: mailto:ayush@ayushsharma.in
[6]: https://jekyllrb.com/docs/configuration/options/#build-command-options
[7]: https://findmymastodon.com/
[8]: https://gitlab.com/ayush-sharma/find-my-mastodon/-/blob/1.0/src/fetch-instance-data/fetch_data.py#L252
[9]: https://gitlab.com/ayush-sharma/find-my-mastodon/-/blob/1.0/_config-data.yml
[10]: https://gitlab.com/ayush-sharma/find-my-mastodon/-/blob/1.0/index.md#L16
[11]: https://ayushsharma.in/2021/10/inserting-dynamic-data-into-jekyll-static-sites-using-python-or-bash
