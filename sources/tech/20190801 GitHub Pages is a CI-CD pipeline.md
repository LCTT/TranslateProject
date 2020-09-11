[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (GitHub Pages is a CI/CD pipeline)
[#]: via: (https://opensource.com/article/19/8/github-pages-cicd-pipeline)
[#]: author: (Katie McLaughlin https://opensource.com/users/glasnt)

GitHub Pages is a CI/CD pipeline
======
Integrating just a little bit of automation into your workflow can
greatly improve your productivity and development velocity.
![An intersection of pipes.][1]

One of GitHub's superpowers is the ability to _magically_ turn your documentation into a website. If you configure a [GitHub Page][2] for your **docs/** folder on your AwesomeProject website, you'll end up with **yourname.github.io/awesomeproject**, showing your documentation, all for free.

But it's not actually magic. Sadly, even though we have taught glass to think, we can still only thank the advanced application of technology for anything that appears to be magical.

GitHub Pages is just an integrated pathway within GitHub to help you set up a Jekyll project. [Jekyll][3] is a static site generator, written in Ruby. Out of the box you can quickly generate websites using markdown files that are then merged into pre-formatted HTML templated themes. There are many [default themes][4] available for GitHub Pages, or you can use one of the many [free templates][5] out there.

![Jekyll Themes screenshot][6]

There are many open source licensed templates available for use.

When you first set up GitHub Pages, you declare which branch you want to build from and the domain you want to use. When you merge into that branch, GitHub goes and takes your Jekyll site, renders it, and hosts it for you on that domain. You don't have to do anything else. No FTP transfers onto a server. No server costs. [No GitHub costs][7]. This is all the power of automation.

### Turning it up to 11 with Netlify PR previews

One of the limitations of this system is when you're working with pull requests (PRs). If you want to test your code, you have to run Jekyll locally. This isn't [terribly difficult][8], but when you're reviewing someone else's PR, say when it's related to the documentation on a project's homepage, you want to be able to see what the new website will look like if you merge the PR. Especially if there could be issues with the changes that are proposed (particularly large changes, changes to the theme/layout, etc)

Normally, you'd have to go to the PR, clone the fork of the repo and check out the branch that was used for the PR, merge that code into your local master, build _that_ version of the code in Jekyll, and open the local server to look at the changes.

But the great thing is, you can automate this.

One such service is [Netlify][9]. You can use Netlify to host your projects, but you can also use its [Deploy Previews][10] feature to generate Jekyll sites for any PR on your project automatically.

Its [continuous deployment][11] docs show how to set up Netlify to automatically build your site any time a PR is opened or updated. The results of that build are available as a temporary website that is linked in the "Checks" section at the bottom of the PR, uniquely named for the PR and project. You can have multiple active PRs and Netlify will update the previews independently!

This has greatly improved the website development process for [PyCon AU][12], which is using GitHub Pages to host the [2019 event website][13]. We heavily borrowed this idea and the Netlify setup from [DjangoCon US][14], which has every [DjangoCon website][15] on GitHub. Well, [most of them][16], as there is an ongoing project to ensure that every DjangoCon conference website is archived for prosperity.

### Machines do the work, so people have time to code

CI and CD have many benefits, but integrating just a little bit of automation into your workflow can greatly improve your productivity and development velocity.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/github-pages-cicd-pipeline

作者：[Katie McLaughlin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/glasnt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe (An intersection of pipes.)
[2]: https://help.github.com/en/articles/configuring-a-publishing-source-for-github-pages
[3]: https://jekyllrb.com/
[4]: https://pages.github.com/themes/
[5]: http://jekyllthemes.org/
[6]: https://opensource.com/sites/default/files/uploads/jekyll-themes.png (Jekyll Themes screenshot)
[7]: https://github.com/pricing
[8]: https://jekyllrb.com/docs/
[9]: https://www.netlify.com/
[10]: https://www.netlify.com/blog/2017/10/31/introducing-public-deploy-logs-for-open-source-sites/
[11]: https://www.netlify.com/docs/continuous-deployment/
[12]: http://2019.pycon-au.org
[13]: https://github.com/pyconau/2019.pycon-au.org
[14]: https://2019.djangocon.us/
[15]: https://github.com/djangocon
[16]: https://github.com/djangocon/djangocon-archive-project
