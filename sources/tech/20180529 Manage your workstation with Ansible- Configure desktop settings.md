Manage your workstation with Ansible: Configure desktop settings
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ)

In the [first article][1] of this series on using Ansible to configure a workstation, we set up a repository and configured a few basic things. In the [second part][2], we automated Ansible to apply settings automatically when changes are made to our repository. In this third (and final) article, we'll use Ansible to configure GNOME desktop settings.

This configuration will work only on newer distributions (such as Ubuntu 18.04, which I'll use in my examples). Older versions of Ubuntu will not work, as they ship with a version of `python-psutils` that is too old for Ansible's `dconf` module to work properly. If you're using a newer version of your Linux distribution, you should have no issues.

Before you begin, make sure you've worked through parts one and two of this series, as part three builds upon that groundwork. If you haven't already, download the GitHub repository you've been using in those first two articles. We'll add a few more features to it.

### Set a wallpaper and lock screen

First, we'll create a taskbook to hold our GNOME settings. In the root of the repository, you should have a file named `local.yml`. Add the following line to it:
```
- include: tasks/gnome.yml

```

The entire file should now look like this:
```
- hosts: localhost

  become: true

  pre_tasks:

    - name: update repositories

      apt: update_cache=yes

      changed_when: False



  tasks:

    - include: tasks/users.yml

    - include: tasks/cron.yml

    - include: tasks/packages.yml

    - include: tasks/gnome.yml

```

Basically, this added a reference to a file named `gnome.yml` that will be stored in the `tasks` directory inside the repository. We haven't created this file yet, so let's do that now. Create `gnome.yml` file in the `tasks` directory, and place the following content inside:
```
- name: Install python-psutil package

  apt: name=python-psutil



- name: Copy wallpaper file

  copy: src=files/wallpaper.jpg dest=/home/jay/.wallpaper.jpg owner=jay group=jay mode=600



- name: Set GNOME Wallpaper

  become_user: jay

  dconf: key="/org/gnome/desktop/background/picture-uri" value="'file:///home/jay/.wallpaper.jpg'"

```

Note that this code refers to my username (`jay`) several times, so make sure to replace every occurrence of `jay` with the username you use on your machine. Also, if you're not using Ubuntu 18.04 (as I am), you'll have to change the `apt` line to match the package manager for your chosen distribution and to confirm the name of the `python-psutil` package for your distribution, as it may be different.

`wallpaper.jpg` inside the `files` directory. This file must exist or the Ansible configuration will fail. Inside the `tasks` directory, create a subdirectory named `files`. Find a wallpaper image you like, name it `wallpaper.jpg`, and place it inside the `files` directory. If the file is a PNG image instead of a JPG, change the file extension in both the code and in the repository. If you're not feeling creative, I have an example wallpaper file in the

In the example tasks, I referred to a file namedinside thedirectory. This file must exist or the Ansible configuration will fail. Inside thedirectory, create a subdirectory named. Find a wallpaper image you like, name it, and place it inside thedirectory. If the file is a PNG image instead of a JPG, change the file extension in both the code and in the repository. If you're not feeling creative, I have an example wallpaper file in the [GitHub repository][3] for this article series that you can use.

Once you've made all these changes, commit everything to your GitHub repository, and push those changes. To recap, you should've completed the following:

  * Modified the `local.yml` file to refer to the `tasks/gnome.yml` playbook
  * Created the `tasks/gnome.yml` playbook with the content mentioned above
  * Created a `files` directory inside the `tasks` directory, with an image file named `wallpaper.jpg` (or whatever you chose to call it).



Once you've completed those steps and pushed your changes back to the repository, the configuration should be automatically applied during its next scheduled run. (You may recall that we automated this in the previous article.) If you're in a hurry, you can apply the configuration immediately with the following command:
```
sudo ansible-pull -U https://github.com/<github_user>/ansible.git

```

If everything ran correctly, you should see your new wallpaper.

Let's take a moment to go through what the new GNOME taskbook does. First, we added a play to install the `python-psutil` package. If we don't add this, we can't use the `dconf` module, since it requires this package to be installed before we can modify GNOME settings. Next, we used the `copy` module to copy the wallpaper file to our `home` directory, and we named the resulting file starting with a period to hide it. If you'd prefer not to have this file in the root of your `home` directory, you can always instruct this section to copy it somewhere else—it will still work as long as you refer to it at the correct place. In the next play, we used the `dconf` module to change GNOME settings. In this case, we adjusted the `/org/gnome/desktop/background/picture-uri` key and set it equal to `file:///home/jay/.wallpaper.jpg`. Note the quotes in this section of the playbook—you must always use two single-quotes in `dconf` values, and you must also include double-quotes if the value is a string.

Now, let's take our configuration a step further and apply a background to the lock screen. Here's the GNOME taskbook again, but with two additional plays added:
```
- name: Install python-psutil package

  apt: name=python-psutil



- name: Copy wallpaper file

  copy: src=files/wallpaper.jpg dest=/home/jay/.wallpaper.jpg owner=jay group=jay mode=600



- name: Set GNOME wallpaper

  dconf: key="/org/gnome/desktop/background/picture-uri" value="'file:///home/jay/.wallpaper.jpg'"



- name: Copy lockscreenfile

  copy: src=files/lockscreen.jpg dest=/home/jay/.lockscreen.jpg owner=jay group=jay mode=600



- name: Set lock screen background

  become_user: jay

  dconf: key="/org/gnome/desktop/screensaver/picture-uri" value="'file:///home/jay/.lockscreen.jpg'"

```

As you can see, we're pretty much doing the same thing as we did with the wallpaper. We added two additional tasks, one to copy the lock screen image and place it in our `home` directory, and another to apply the setting to GNOME so it will be used. Again, be sure to change your username from `jay` and also name your desired lock screen picture `lockscreen.jpg` and copy it to the `files` directory. Once you've committed these changes to your repository, the new lock screen should be applied during the next scheduled Ansible run.

### Apply a new desktop theme

Setting the wallpaper and lock screen background is cool and all, but let's go even further and apply a desktop theme. First, let's add an instruction to our taskbook to install the package for the `arc` theme. Add the following code to the beginning of the GNOME taskbook:
```
- name: Install arc theme

  apt: name=arc-theme

```

Then, at the bottom, add the following play:
```
- name: Set GTK theme

  become_user: jay

  dconf: key="/org/gnome/desktop/interface/gtk-theme" value="'Arc'"

```

Did you see GNOME's GTK theme change right before your eyes? We added a play to install the `arc-theme` package via the `apt` module and another play to apply this theme to GNOME.

### Make other customizations

Now that you've changed some GNOME settings, feel free to add additional customizations on your own. Any setting you can tweak in GNOME can be automated this way; setting the wallpapers and the theme were just a few examples. You may be wondering how to find the settings that you want to change. Here's a trick that works for me.

First, take a snapshot of ALL your current `dconf` settings by running the following command on the machine you're managing:
```
dconf dump / > before.txt

```

This command exports all your current changes to a file named `before.txt`. Next, manually change the setting you want to automate, and capture the `dconf` settings again:
```
dconf dump / > after.txt

```

Now, you can use the `diff` command to see what's different between the two files:
```
diff before.txt after.txt

```

This should give you a list of keys that changed. While it's true that changing settings manually defeats the purpose of automation, what you're essentially doing is capturing the keys that change when you update your preferred settings, which then allows you to create Ansible plays to modify those settings so you'll never need to touch those settings again. If you ever need to restore your machine, your Ansible repository will take care of each and every one of your customizations. If you have multiple machines, or even a fleet of workstations, you only have to manually make the change once, and all other workstations will have the new settings applied and be completely in sync.

### Wrapping up

If you've followed along with this series, you should know how to set up Ansible to automate your workstation. These examples offer a useful baseline, and you can use the syntax and examples to make additional customizations. As you go along, you can continue to add new modifications, which will make your Ansible configuration grow over time.

I've used Ansible in this way to automate everything, including my user account and password; configuration files for Vim, tmux, etc.; desktop packages; SSH settings; SSH keys; and basically everything I could ever want to customize. Using this series as a starting point will pave the way for you to completely automate your workstations.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/manage-your-workstation-ansible-part-3

作者：[Jay LaCroix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jlacroix
[1]:https://opensource.com/article/18/3/manage-workstation-ansible
[2]:https://opensource.com/article/18/3/manage-your-workstation-configuration-ansible-part-2
[3]:https://github.com/jlacroix82/ansible_article.git
