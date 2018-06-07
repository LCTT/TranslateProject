translating----geekpi

Vim-plug : A Minimalist Vim Plugin Manager
======

![](https://www.ostechnix.com/wp-content/uploads/2018/06/vim-plug-720x340.png)

When there were no plugin managers, the Vim users had to manually download the Plugins distributed as tarballs and extract them in a directory called **~/.vim**. It was OK for few plugins. When they installed more plugins, it became a mess. All plugin files scattered in a single directory and the users couldn’t find which file belongs to which plugin. Further more, they could not find which file they should remove to uninstall a plugin. There is where Vim plugin managers comes in handy. The plugin managers saves the files of installed plugins in separate directory, so it is became very easy to manage all plugins. We already wrote about [**Vundle**][1] few months ago. Today, we will see yet another Vim plugin manager named **“Vim-plug”**.

Vim-plug is a free, open source, very fast, minimalist vim plugin manager. It can install or update plugins in parallel. You can also rollback the updates. It creates shallow clones to minimize disk space usage and download time. It supports on-demand plugin loading for faster startup time. Other notable features are branch/tag/commit support, post-update hooks, support for externally managed plugins etc.

### Vim-plug : A Minimalist Vim Plugin Manager

#### **Installation**

It is very easier to setup and use. All you have to do is to open your Terminal and run the following command:
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

```

The Neovim users can install Vim-plug using the following command:
```
$ curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

```

#### Usage

**Installing Plugins**

To install plugins, you must first declare them in Vim configuration file as shown below. The configuration file for ordinary Vim is **~/.vimrc** and the config file for Neovim is **~/.config/nvim/init.vim**. Please remember that when you declare the plugins in configuration file, the list should start with **call plug#begin(PLUGIN_DIRECTORY)** and end with call **plug#end()**.

For example, let us install “lightline.vim” plugin. To do so, add the following lines on top of your **~/.vimrc** file.
```
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
call plug#end()

```

After adding the above lines in vim configuration file, reload by entering the following:
```
:source ~/.vimrc

```

Or, simply reload the Vim editor.

Now, open vim editor:
```
$ vim

```

Check the status using command:
```
:PlugStatus

```

And type following command and hit ENTER to install the plugins that you have declared in the config file earlier.
```
:PlugInstall

```

**Update Plugins**

To update plugins, run:
```
:PlugUpdate

```

After updating the plugins, press **d** to review the changes. Or, you can do it later by typing **:PlugDiff**.

**Review Plugins**

Some times, the updated plugins may have new bugs or no longer work correctly. To fix this, you can simply rollback the problematic plugins. Type **:PlugDiff** command and hit ENTER to review the changes from the last **:PlugUpdate** and roll each plugin back to the previous state before the update by pressing **X** on each paragraph.

**Removing Plugins**

To remove a plugin delete or comment out the **plug** commands that you have added earlier in your vim configuration file. Then, run **:source ~/.vimrc** or restart Vim editor. Finally, run the following command to uninstall the plugins:
```
:PlugClean

```

This command will delete all undeclared plugins in your vim config file.

**Upgrade Vim-plug**

To upgrade vim-plug itself, type:
```
:PlugUpgrade

```

As you can see, managing plugins using Vim-plug is not a big deal. It simplifies the plugin management a lot easier. Now go and find out your favorite plugins and install them using Vim-plug.

**Suggested read:**

And, that’s all for now. I will be soon here with another interesting topic. Until then, stay tuned with OSTechNix.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/vim-plug-a-minimalist-vim-plugin-manager/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/manage-vim-plugins-using-vundle-linux/
