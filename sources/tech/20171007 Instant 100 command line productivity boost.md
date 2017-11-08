Translating by qhwdw Instant +100% command line productivity boost
============================================================

Being productive is fun.

There are a lot of fields to improve your productivity. Today I am going to share some command line tips and tricks to make your life easier.

### TLDR

My full setup includes all the stuff discussed in this article and even more. Check it out: [https://github.com/sobolevn/dotfiles][9]

### Shell

Using a good, helping, and the stable shell is the key to your command line productivity. While there are many choices, I prefer `zsh` coupled with `oh-my-zsh`. It is amazing for several reasons:

*   Autocomplete nearly everything

*   Tons of plugins

*   Really helping and customizable `PROMPT`

You can follow these steps to install this setup:

1.  Install `zsh`: [https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH][1]

2.  Install `oh-my-zsh`: [http://ohmyz.sh/][2]

3.  Choose plugins that might be useful for you: [https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins][3]

You may also want to tweak your settings to [turn off case sensitive autocomplete][10]. Or change how your [history works][11].

That's it. You will gain instant +50% productivity. Now hit tab as much as you can!

### Theme

Choosing theme is quite important as well since you see it all the time. It has to be functional and pretty. I also prefer minimalistic themes, since it does not contain a lot of visual noise and unused information.

Your theme should show you:

*   current folder

*   current branch

*   current repository status: clean or dirty

*   error codes if any

I also prefer my theme to have new commands on a new line, so there is enough space to read and write it.

I personally use [`sobole`][12]. It looks pretty awesome. It has two modes.

Light:

 [![sobole.zsh-theme](https://res.cloudinary.com/practicaldev/image/fetch/s--Lz_uthoR--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://raw.githubusercontent.com/sobolevn/sobole-zsh-theme/master/showcases/env-and-user.png)][13] 

And dark:

 [![sobole.zsh-theme](https://res.cloudinary.com/practicaldev/image/fetch/s--4o6hZwL9--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://raw.githubusercontent.com/sobolevn/sobole-zsh-theme/master/showcases/dark-mode.png)][14] 

Get your another +15% boost. And an awesome-looking theme.

### Syntax highlighting

For me, it is very important to have enough visual information from my shell to make right decisions. Like "does this command have any typos in its name" or "do I have paired scopes in this command"? And I really make tpyos all the time.

So, [`zsh-syntax-highlighting`][15] was a big finding for me. It comes with reasonable defaults, but you can [change anything you want][16].

These steps brings us extra +5%.

### Working with files

I travel inside my directories a lot. Like  _a lot_ . And I do all the things there:

*   navigating back and forwards

*   listing files and directories

*   printing files' contents

I prefer to use [`z`][17] to navigate to the folders I have already been to. This tool is awesome. It uses 'frecency' method to turn your `.dot TAB` into `~/dev/shell/config/.dotfiles`. Really nice!

When printing files you want usually to know several things:

*   file names

*   permissions

*   owner

*   git status of the file

*   modified date

*   size in human readable form

You also probably what to show hidden files to show up by default as well. So, I use [`exa`][18] as the replacement for standard `ls`. Why? Because it has a lot of stuff enabled by default:

 [![exa](https://res.cloudinary.com/practicaldev/image/fetch/s--n_YCO9Hj--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://raw.githubusercontent.com/ogham/exa/master/screenshots.png)][19] 

To print the file contents I use standard `cat` or if I want to see to proper syntax highlighting I use a custom alias:

```
# exa:
alias la="exa -abghl --git --color=automatic"

# `cat` with beautiful colors. requires: pip install -U Pygments
alias c='pygmentize -O style=borland -f console256 -g'
```

Now you have mastered the navigation. Get your +15% productivity boost.

### Searching

When searching in a source code of your applications you don't want to include folders like `node_modules` or `bower_components` into your results by default. You also want your search to be fast and smooth.

Here's a good replacement for the built in search methods: [`the_silver_searcher`][20].

It is written in pure `C` and uses a lot of smart logic to work fast.

Using `ctrl` + `R` for [reverse search][21] in `history` is very useful. But have you ever found yourself in a situation when I can quite remember a command? What if there were a tool that makes this search even greater enabling fuzzy searching and a nice UI?

There is such a tool, actually. It is called `fzf`:

 [![fzf](https://res.cloudinary.com/practicaldev/image/fetch/s--hykHvwjq--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://thepracticaldev.s3.amazonaws.com/i/erts5tffgo5i0rpi8q3r.png)][22] 

It can be used to fuzzy-find anything, not just history. But it requires [some configuration][23].

You are now a search ninja with +15% productivity bonus.

### Further reading

Using better CLIs: [https://dev.to/sobolevn/using-better-clis-6o8][24]

### Conclusion

Following these simple steps, you can dramatically increase your command line productivity, like +100% (numbers are approximate).

There are other tools and hacks I will cover in the next articles.

Do you like reading about the latest trends in software development? Subscribe to our blog on Medium: [https://medium.com/wemake-services][25]

--------------------------------------------------------------------------------

via: https://dev.to/sobolevn/instant-100-command-line-productivity-boost

作者：[Nikita Sobolev ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://dev.to/sobolevn
[1]:https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH
[2]:http://ohmyz.sh/
[3]:https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
[4]:https://dev.to/sobolevn
[5]:http://github.com/sobolevn
[6]:https://dev.to/t/commandline
[7]:https://dev.to/t/dotfiles
[8]:https://dev.to/t/productivity
[9]:https://github.com/sobolevn/dotfiles
[10]:https://github.com/sobolevn/dotfiles/blob/master/zshrc#L12
[11]:https://github.com/sobolevn/dotfiles/blob/master/zshrc#L24
[12]:https://github.com/sobolevn/sobole-zsh-theme
[13]:https://res.cloudinary.com/practicaldev/image/fetch/s--Lz_uthoR--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://raw.githubusercontent.com/sobolevn/sobole-zsh-theme/master/showcases/env-and-user.png
[14]:https://res.cloudinary.com/practicaldev/image/fetch/s--4o6hZwL9--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://raw.githubusercontent.com/sobolevn/sobole-zsh-theme/master/showcases/dark-mode.png
[15]:https://github.com/zsh-users/zsh-syntax-highlighting
[16]:https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
[17]:https://github.com/rupa/z
[18]:https://github.com/ogham/exa
[19]:https://res.cloudinary.com/practicaldev/image/fetch/s--n_YCO9Hj--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://raw.githubusercontent.com/ogham/exa/master/screenshots.png
[20]:https://github.com/ggreer/the_silver_searcher
[21]:https://unix.stackexchange.com/questions/73498/how-to-cycle-through-reverse-i-search-in-bash
[22]:https://res.cloudinary.com/practicaldev/image/fetch/s--hykHvwjq--/c_limit,f_auto,fl_progressive,q_auto,w_880/https://thepracticaldev.s3.amazonaws.com/i/erts5tffgo5i0rpi8q3r.png
[23]:https://github.com/sobolevn/dotfiles/blob/master/shell/.external#L19
[24]:https://dev.to/sobolevn/using-better-clis-6o8
[25]:https://medium.com/wemake-services
