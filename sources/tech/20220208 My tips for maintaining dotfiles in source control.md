[#]: subject: "My tips for maintaining dotfiles in source control"
[#]: via: "https://opensource.com/article/22/2/dotfiles-source-control"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

My tips for maintaining dotfiles in source control
======
When you keep the environment in source control, development VMs and
containers become a solution, not a problem.
![Person drinking a hot drink at the computer][1]

Ever started using a new computer, by choice or because the old one let the magic smoke out, and got frustrated at how long it took to get everything _just_ right? Even worse, ever spent some time reconfiguring your shell prompt, then realizing you liked it better before?

This problem, for me, became acute when I decided I wanted to do development in [containers][2]. Containers are ephemeral. The development tooling is easy to solve: A container image with the tooling works. The source code is easy to solve: Source control maintains it, and development happens on branches. But if every time I create a container, I need to configure it carefully—that's going to be a pain.

### Revision control at home

Keeping configuration files in version control has always been an attractive option. But doing so naively is fraught. It is not possible to directly version `~`.

For one, too many programs assume it's safe to keep secrets there. It's also the location of folders like `~/Downloads` and `~/Pictures`, which should probably not be versioned.

Carefully keeping a `.gitignore` file at the home directory to manage _include_ and _exclude_ lists is risky. At some point, one of the paths gets wrong. Hours of configuration are lost, big files end up in the Git history, or, worst of all, secrets and passwords get leaked. When this strategy fails, it fails catastrophically.

Manually maintaining a sea of symlinks also does not work. The whole reason for revision control is to avoid maintaining configuration manually.

### Write an install script

This hints at the first clue about maintaining dotfiles in source control. Write an installation script.

Like all good installation scripts, make it _idempotent_: Running it twice should not add the configuration twice.

Like all good installation scripts, make it _only do the minimum_: Use whatever other tricks to point to the configuration files in your source control.

### The ~/.config directory

Modern Linux programs look for their configuration in `~/.config` before looking for it directly in the home. The most important example is `git`, which looks for it in `~/.config/git`.

This means the installation script can symlink `~/.config` to a directory inside a source-controlled managed directory in the home directory:


```


#!/bin/bash
set -e
DOTFILES="$(dirname $(realpath $0))"
[ -L ~/.config ] || ln -s $DOTFILES/config ~/.config

```

This script looks for its location and then symlinks `~/.config` to wherever it was checked out to. This means that there are few assumptions about where it needs to be inside the home directory.

### Sourcing files

Most shells still look for files directly in the home directory. To solve this, you add a layer of indirection. Sourcing files from `$DOTFILES` means that there is no need to rerun the installer when modifying the shell configuration:


```


$!/bin/bash
set -e
DOTFILES="$(dirname $(realpath $0))"
grep -q 'SETTING UP BASH' ~/.bashrc || \
  echo "source $DOTFILES/starship.bash # SETTING UP BASH" &gt;&gt; ~/.bashrc

```

Again, notice that the script is careful to be idempotent: If the line is already there, it does not add it again. It is also considerate of any editing you have already done on `.bashrc`. While this is not a good idea, there is no need to punish it.

### Test and test again

When you keep the environment in source control, development VMs and containers become a solution, not a problem. Try an experiment: Bring up a new development environment, clone your dotfiles, install, and see what breaks.

Don't do it just once. Do it weekly, at least. This makes you faster at it, and it also informs you about what does not work—open issues, fix them, and repeat.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/dotfiles-source-control

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://opensource.com/tags/containers
