[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A minimalist Mac terminal for Linux fans)
[#]: via: (https://opensource.com/article/20/6/iterm2-mac)
[#]: author: (Lisa Seelye https://opensource.com/users/lisa)

A minimalist Mac terminal for Linux fans
======
Here is how I keep a terminal simple and my dotfiles secure through a
lot of subtle complexity.
![Coffee and laptop][1]

I have a confession to make: I have been a Mac user for more than 10 years now. At first, I felt a little shame, given my strong Linux background, but the Mac gives me a Unix-like shell and a great window manager. Because of that history, I have a mix of features that will run on macOS but feel familiar to Linux users. There's no reason it can't port over to Linux (and it has!).

### Using iTerm2 on a Mac

For a long time, my preferred terminal was the basic built-in Terminal.app, but I recently switched to [iTerm2][2] because it has much better customization and profile support. One of its key wins for me is that it's easy to transplant settings from Mac to Mac. For daily use, I prefer the Solarized Dark theme, but for presentations, I have a separate profile that enlarges the text and uses a plain black background with more vibrant colors.

The first thing I do to make iTerm2 usable is to configure the **Ctrl+Left** and **Ctrl+Right** arrows to respect the classic terminal behavior of jumping to the start and end of a word boundary. To do so, navigate to Preferences &gt; Profiles &gt; Your Profile &gt; Keys and enter the following.

  * Keyboard Shortcut: ^←
  * Action: Send Escape Sequence
  * Esc+: b



Then the other: 

  * Keyboard Shortcut: ^→
  * Action: Send Escape Sequence
  * Esc+: f



Learn more about what you can do with [iTerm2][3] and enjoy the custom experience.

### A simple command prompt

I am one of those boring terminal prompt users. I don't include Git directory or exit code, and I only use a single line. The only fancy component I use is [kubectx][4], which includes the current Kubernetes context. As an [OpenShift Dedicated][5] Site Reliability Engineer (SRE), I have to run commands with the appropriate context, and `kubectx` makes it easy to know where I am when I'm typing. So, my Bash PS1 is the boring `username@host cwd $`, save for the Kubernetes context prefix.

There is no doubt that I'm on the minimalist side, compared to some fancy terminals I've seen. Some people enjoy transparency, and others prefer a lot of information on their prompts—from the time to the exit code and everything else. I find it distracting in my terminals, so I enjoy those setups from afar.

### Beautifully complex dotfiles

Compared to my minimalist terminal, it's easy to see where I put my maximalist efforts: deploying my [dotfiles][6], including my `.bash_profile` and my overall Mac setup.

I use a [series of Makefiles][7], hosted through GitHub, to manage my Mac setup. This pulls in my [dotfile-specific deployment mechanism][8], which is also in GitHub. Why all the tooling around security you ask? IT professionals and hobbyists alike need a robust way to put secure pieces of data on new systems. Maybe you prefer your SSH config to be hidden, or maybe you're deploying credentials through a third-party system. I find it useful to keep my secure data with everything else, and I solved this problem with [Ansible Vault][9]. All my secrets are stored in Git, encrypted with Ansible Vault. Decryption is handled with Makefiles.

Whether I'm installing for the first time or updating existing dotfiles, I (of course) must have Ansible Vault, and to avoid having to install that everywhere, I put it in a container that I run with Docker, which I do have installed everywhere. I put the decryption passphrase into a file, `run make`, and clean up everything with `make clean`. (You can learn more by [exploring the dotfiles][8].)

I will say that this management scheme may be over the top, but some folks like complicated terminal prompts. So perhaps in the balance, it all evens out.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/iterm2-mac

作者：[Lisa Seelye][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lisa
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o (Coffee and laptop)
[2]: https://www.iterm2.com/
[3]: https://www.iterm2.com/documentation.html
[4]: https://github.com/ahmetb/kubectx
[5]: https://www.openshift.com/products/dedicated/
[6]: https://opensource.com/article/19/3/move-your-dotfiles-version-control
[7]: https://github.com/lisa/mac-setup
[8]: https://github.com/lisa/dotrc
[9]: https://docs.ansible.com/ansible/latest/user_guide/vault.html
