[#]: subject: (Helix: A Terminal Based Text Editor for Power Linux Users)
[#]: via: (https://itsfoss.com/helix-editor/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Helix: A Terminal Based Text Editor for Power Linux Users
======

When it comes to [terminal based text editors][1], it is usually Vim, Emacs and Nano that get the limelight.

That doesn’t mean there are not other such text editors. [Neovim][2], a modern enhancement to Vim, is one of many such examples.

Along the same line, I would like to introduce yet another terminal based text editor called Helix Editor.

### Helix, a modern text editor written in Rust

![][3]

[Helix][4] is written in Rust and uses Tree-sitter for syntax highlighting. The developer claims that it is faster than regex highlighting because Tree-sitter parses code into syntax trees like a compiler and thus giving a lot more information about code structure.

You can track local variables, calculate indentations and manipulate selection to select syntax nodes. It is robust enough to produce results even with syntax error.

The main focus of Helix is on ‘multiple selection’. This is based on [Kakoune][5].

The built-in language server support provides context aware completion, diagnostics and code actions.

### Installing Helix on Linux

For Arch and Manjaro users, Helix is available in the AUR in two packages:

  * [helix-bin][6]: contains prebuilt binary from GitHub releases
  * [helix-git][7]: builds the master branch of this repository



As an Arch user, you probably already know [how to install applications using AUR][8], I believe.

For other Linux distributions, you have to use Cargo. Cargo is Rust package manager. With this, you can install Rust packages. Consider it Rust equivalent to PIP of Python.

You should be able to install Cargo using your distribution’s package manager. On Ubuntu based distributions, install cargo like this:

```
sudo apt install cargo
```

Next, you clone the Helix repository:

```
git clone --recurse-submodules --shallow-submodules -j8 https://github.com/helix-editor/helix
```

Move to the cloned directory:

```
cd helix
```

And now use cargo to install Helix:

```
cargo install --path helix-term --features "embed_runtime"
```

One last step is to add the hx binary to the PATH variable so that you can run it from anywhere. This should be added to your bashrc or bash profile.

```
export PATH=”$HOME/.cargo/bin:$PATH”
```

Now that everything is set, you should be able to use the editor by typing `hx` in the terminal.

You can find the keyboard shortcuts for using Helix on its [documentation page][9]:

[Helix Keyboard Shortcuts][10]

How does it compare with Vim or Neovim? I cannot say. I can use Vim for basic editing but I am not a Vim ninja. If you are someone who swears and live by Vim (or Emacs), I let you try Helix and judge it yourself.

--------------------------------------------------------------------------------

via: https://itsfoss.com/helix-editor/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/command-line-text-editors-linux/
[2]: https://neovim.io/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/helix-editor-screenshot.png?resize=800%2C515&ssl=1
[4]: https://helix-editor.com/
[5]: http://kakoune.org/
[6]: https://aur.archlinux.org/packages/helix-bin/
[7]: https://aur.archlinux.org/packages/helix-git/
[8]: https://itsfoss.com/aur-arch-linux/
[9]: https://docs.helix-editor.com/
[10]: https://docs.helix-editor.com/keymap.html
