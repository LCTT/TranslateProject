[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My feature-rich and minimal Linux terminal)
[#]: via: (https://opensource.com/article/20/7/minimal-linux-terminal)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)

My feature-rich and minimal Linux terminal
======
These apps and themes help make my terminal my own.
![Digital images of a computer desktop][1]

Everyone likes to set up their workspaces in a specific way; it helps your productivity and makes life easier to have things organized in a way that feels organic and to have an environment that feels good to you. That definitely applies to terminals too; that's probably why there are so many terminal options available.

When starting on a new computer, the very first thing I do is set up my terminal to make it my own.

My preferred terminal app is [terminator][2] because of its minimalist design and built-in windowing options. But it gets more complex from there. I would describe my preferred terminal style as "feature-rich yet, keeping it minimal." That balance is one I'm often fine-tuning.

I use zsh as my default shell, and Ohmyzsh to give is additional features. One can install Ohmyzsh by downloading its install script:


```
$ curl -fsSL \
<https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh> \
\--output install-zsh.sh
```

Read the script over to see what it does, and to ensure you feel confident in running it on your computer. Once you're ready, run the script:


```
`$ sh ./install-zsh.sh`
```

My favorite theme/prompt is [Powerlevel 10k][3], which is an incredibly detailed view of my environment. It includes everything from color highlighting of commands to timestamps for when they were run. All the details integrate into an elegant, context-aware prompt. [context-aware is used as a benefit twice, here and below, can author provide more here on what that means and why it is a good thing in a terminal?}

Installing Powerlevel10k begins with downloading the source code in the `.oh-my-zsh/` custom theme directory.


```
git clone --depth=1 <https://github.com/romkatv/powerlevel10k.git>
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

However, to make Powerlevel10k look as it is shown in the repository, we need to add some fonts that are not included by default; these are listed below:

  * [MesloLGS NF Regular.ttf][4]
  * [MesloLGS NF Bold.ttf][5]
  * [MesloLGS NF Italic.ttf][6]
  * [MesloLGS NF Bold Italic.ttf][7]



This results in a beautiful and context-aware terminal (as shown by [screenfetch][8])

![terminator terminal shot via screenFetch ][9]

I've become accustomed to this particular setup, but, as important as it is to make your work environment your own, that's also not a reason to be stubborn about trying new things. New terminals emerge in order to answer the needs and demands of new generations of users. That means that, even if it's unfamiliar at first, one of the more recently developed terminals could be better suited to today's environments and responsibilities than your old standby.

I have been considering other options recently. I started watching the development of [Starship][10], which describes itself as a minimal, blazing-fast, and infinitely customizable prompt for any shell. It still has a lot of visually immersive details without as much of what some might find distracting from Powerlevel10k.

What's your favorite terminal, and why? Share in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/minimal-linux-terminal

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://terminator-gtk3.readthedocs.io/en/latest/
[3]: https://github.com/romkatv/powerlevel10k
[4]: https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
[5]: https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
[6]: https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
[7]: https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
[8]: https://github.com/KittyKatt/screenFetch
[9]: https://opensource.com/sites/default/files/uploads/osdc00_edit.png (terminator terminal shot via screenFetch )
[10]: https://starship.rs/
