Use this vi setup to keep and organize your notes
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk)

The idea of using vi to manage a wiki for your notes may seem unconventional, but when you're using vi in your daily work, it makes a lot of sense.

As a software developer, it’s just easier to write my notes in the same tool I use to code. I want my notes to be only an editor command away, available wherever I am, and managed the same way I handle my code. That's why I created a vi-based setup for my personal knowledge base. In a nutshell: I use the vi plugin [Vimwiki][1] to manage my wiki locally on my laptop, I use Git to version it (and keep a central, updated version), and I use GitLab for online editing (for example, on my mobile device).

### Why it makes sense to use a wiki for note-keeping

I've tried many different tools to keep track of notes, write down fleeting thoughts, and structure tasks I shouldn’t forget. These include offline notebooks (yes, that involves paper), special note-keeping software, and mind-mapping software.

All these solutions have positives, but none fit all of my needs. For example, [mind maps][2] are a great way to visualize what’s in your mind (hence the name), but the tools I tried provided poor searching functionality. (The same thing is true for paper notes.) Also, it’s often hard to read mind maps after time passes, so they don’t work very well for long-term note keeping.

One day while setting up a [DokuWiki][3] for a collaboration project, I found that the wiki structure fits most of my requirements. With a wiki, you can create notes (like you would in any text editor) and create links between your notes. If a link points to a non-existent page (maybe because you wanted a piece of information to be on its own page but haven’t set it up yet), the wiki will create that page for you. These features make a wiki a good fit for quickly writing things as they come to your mind, while still keeping your notes in a page structure that is easy to browse and search for keywords.

While this sounds promising, and setting up DokuWiki is not difficult, I found it a bit too much work to set up a whole wiki just for keeping track of my notes. After some research, I found Vimwiki, a Vi plugin that does what I want. Since I use Vi every day, keeping notes is very similar to editing code. Also, it’s even easier to create a page in Vimwiki than DokuWiki—all you have to do is press Enter while your cursor hovers over a word. If there isn’t already a page with that name, Vimwiki will create it for you.

To take my plan to use my everyday tools for note-keeping a step further, I’m not only using my favorite IDE to write notes but also my favorite code management tools—Git and GitLab—to distribute notes across my various machines and be able to access them online. I’m also using Markdown syntax in GitLab's online Markdown editor to write this article.

### Setting up Vimwiki

Installing Vimwiki is easy using your existing plugin manager: Just add `vimwiki/vimwiki` to your plugins. In my preferred plugin manager, Vundle, you just add the line `Plugin 'vimwiki/vimwiki'` in your `~/.vimrc` followed by a `:source ~/.vimrc|PluginInstall`.

Following is a piece of my `~.vimrc` showing a bit of Vimwiki configuration. You can learn more about installing and using this tool on the [Vimwiki page][1].
```
let wiki_1 = {}
let wiki_1.path = '~/vimwiki_work_md/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let wiki_2 = {}
let wiki_2.path = '~/vimwiki_personal_md/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'

let g:vimwiki_list = [wiki_1, wiki_2]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
```

Another advantage of my approach, which you can see in the configuration, is that I can easily divide my personal and work-related notes without switching the note-keeping software. I want my personal notes accessible everywhere, but I don’t want to sync my work-related notes to my private GitLab and computer. This was easier to set up in Vimwiki compared to the other software I tried.

The configuration tells Vimwiki there are two different wikis and I want to use Markdown syntax in both (again, because I’m used to Markdown from my daily work). It also tells Vimwiki the folders where to store the wiki pages.

If you navigate to the folders where the wiki pages are stored, you will find your wiki’s flat Markdown pages without any special Vimwiki context. That makes it easy to initialize a Git repository and sync your wiki to a central repository.

### Synchronizing your wiki to GitLab

The steps to check out a GitLab project to your local Vimwiki folder are nearly the same as you’d use for any GitHub repository. I just prefer to keep my notes in a private GitLab repository, so I keep a GitLab instance running for my personal projects.

GitLab has a wiki functionality that allows you to create wiki pages for your projects. Those wikis are Git repositories themselves. And they use Markdown syntax. You get where this is leading.

Just initialize the wiki you want to synchronize with the wiki of a project you created for your notes:
```
cd ~/vimwiki_personal_md/
git init
git remote add origin git@your.gitlab.com:your_user/vimwiki_personal_md.wiki
git add .
git commit -m "Initial commit"
git push -u origin master
```

These steps can be copied from the page where you land after creating a new project on GitLab. The only thing to change is the `.wiki` at the end of the repository URL (instead of `.git`), which tells it to clone the wiki repository instead of the project itself.

That’s it! Now you can manage your notes with Git and edit them in GitLab’s wiki user interface.

But maybe (like me) you don’t want to manually create commits for every note you add to your notebook. To solve this problem, I use the Vim plugin [chazy/dirsettings][4]. I added a `.vimdir` file with the following content to `~/vimwiki_personal_md`:
```
:cd %:p:h
silent! !git pull > /dev/null
:e!
autocmd! BufWritePost * silent! !git add .;git commit -m "vim autocommit" > /dev/null; git push > /dev/null&
```

This pulls the latest version of my wiki every time I open a wiki file and publishes my changes after every `:w` command. Doing this should keep your local copy in sync with the central repo. If you have merge conflicts, you may need to resolve them (as usual).

For now, this is the way I interact with my knowledge base, and I’m quite happy with it. Please let me know what you think about this approach. And please share in the comments your favorite way to keep track of your notes.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/vimwiki-gitlab-notes

作者：[Manuel Dewald][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ntlx
[1]:http://vimwiki.github.io/
[2]:https://opensource.com/article/17/8/mind-maps-creative-dashboard
[3]:https://www.dokuwiki.org/dokuwiki
[4]:https://github.com/chazy/dirsettings
