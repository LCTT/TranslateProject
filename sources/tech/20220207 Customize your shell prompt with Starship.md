[#]: subject: "Customize your shell prompt with Starship"
[#]: via: "https://opensource.com/article/22/2/customize-prompt-starship"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Customize your shell prompt with Starship
======
Take control of your prompt, and have all the information you need at
your fingertips.
![Cosmic stars in outer space][1]

Nothing irritates me more than when I forget to `git add` files in my Git repository. I test locally, commit, and push, only to find out it failed in the continuous integration phase. Even worse is when I'm on the `main` branch instead of a feature branch and accidentally push to it. The best-case scenario is that it fails because of branch protection, and I need to do some surgery to get the changes to a branch. Even more worse, I did not configure branch protection properly, and I accidentally pushed it directly to `main`.

Wouldn't it be nice if the information was available right in the prompt?

There is even more information that is useful in the prompt. While the name of Python virtual environments is in the prompt, the Python version the virtual environment has is not.

It is possible to carefully configure the `PS1` environment variable to all relevant information. This can get long, annoying, and non-trivial to debug.

This is the problem that Starship got designed to solve.

### Install Starship

The initial setup for Starship only requires two steps: Installing and configuring your shell to use it. Installation can be as simple as:


```
`$ curl -fsSL https://starship.rs/install.sh`
```

Read over the install script to make sure you understand what it does, and then make it executable and run it:


```


$ chmod +x install.sh
$ ./install.sh

```

There are other ways to install, covered on the website. You can develop virtual machines or containers at the image-building step.

### Configuring Starship

The next step is to configure your shell to use it. To try it as a one-off, assuming the shell is `bash` or `zsh`, run the following:


```
`$ eval "$(starship init $(basename $SHELL))"`
```

Your prompt changes immediately:


```


localhost in myproject on  master
&gt;

```

If you like what you see, add `eval "$(starship init $(basename $SHELL))"` to your shell's `rc` file to make it permanent.

### Customizing Starship

The default installation assumes that you can install a "Nerd font," such as [Fantasque Sans Mono][2]. You want, particularly, a font with glyphs from Unicode's "private implementation" section.

This works great when controlling the terminal, but sometimes, the terminal is not easy to configure. For example, when using some in-browser shell abstraction, configuring the browser font can be non-trivial.

The biggest user of the code points is the Git integration, which uses a special custom symbol for "branch." Disabling it can be done by configuring `starship.rs` using the file `~/.config/starship.toml`.

Disabling the branch symbol is done by configuring the `git_branch` section's `format` variable:


```


[git_branch]
format = "on [$branch]($style) "

```

One of the nice things about `starship.rs` is that changing the configuration has an immediate effect. Save the file, press **Enter**, and see if the font looks as intended.

It's also possible to configure the color of different sections in the prompt. For example, if the Python section's bright yellow is a bit harder to see on a white background, you can configure blue:


```


[python]
style = "blue bold"

```

There is configuration support for many languages, including Go, .NET, and JavaScript. There is also support for showing command duration (only for commands which take longer than a threshold) and more.

### Take the con

Take control of your prompt, and have all the information you need at your fingertips. Install Starship, make it work for you, and enjoy!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/customize-prompt-starship

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/space_stars_cosmic.jpg?itok=bE94WtN- (Cosmic stars in outer space)
[2]: https://github.com/belluzj/fantasque-sans
