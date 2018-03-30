Manage your workstation with Ansible: Automating configuration
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/robot_arm_artificial_ai.png?itok=8CUU3U_7)
Ansible is an amazing automation and configuration management tool. It is mainly used for servers and cloud deployments, and it gets far less attention for its use in workstations, both desktops and laptops, which is the focus of this series.

In the [first part][1] of this series, I showed you basic usage of the `ansible-pull` command, and we created a playbook that installs a handful of packages. That wasn't extremely useful by itself, but it set the stage for further automation.

In this article, everything comes together full circle, and by the end we will have a fully working solution for automating workstation configuration. This time, we'll set up our Ansible configuration such that future changes we make will automatically be applied to our workstations. At this point, I'm assuming you already worked through part one. If you haven't, feel free to do that now and then return to this article when you're done. You should already have a GitHub repository with the code from the first article inside it. We're going to build directly on what we did before.

First, we need to do some reorganization because we're going to do more than just install packages. At this point, we currently have a playbook named `local.yml` with the following content:
```
- hosts: localhost

  become: true

  tasks:

  - name: Install packages

    apt: name={{item}}

    with_items:

      - htop

      - mc

      - tmux

```

That's all well and good if we only want to perform one task. As we add new things to our configuration, this file will become quite large and get very cluttered. It's better to organize our plays into individual files with each responsible for a different type of configuration. To achieve this, create what's called a taskbook, which is very much like a playbook but the contents are more streamlined. Let's create a directory for our taskbooks inside our Git repository:
```
mkdir tasks

```

The code inside our current `local.yml` playbook lends itself well to become a taskbook for installing packages. Let's move this file into the `tasks` directory we just created with a new name:
```
mv local.yml tasks/packages.yml

```

Now, we can edit our `packages.yml` taskbook and strip it down quite a bit. In fact, we can strip everything except for the individual task itself. Let's make `packages.yml` look like this:
```
- name: Install packages

  apt: name={{item}}

  with_items:

    - htop

    - mc

    - tmux

```

As you can see, it uses the same syntax, but we stripped out everything that isn't necessary to the task it's performing. Now we have a dedicated taskbook for installing packages. However, we still need a file named `local.yml`, since `ansible-pull` still expects to find a file with that name. So we'll create a fresh one with this content in the root of our repository (not in the `tasks` directory):
```
- hosts: localhost

  become: true

  pre_tasks:

    - name: update repositories

      apt: update_cache=yes

      changed_when: False



  tasks:

    - include: tasks/packages.yml

```

This new `local.yml` acts as an index that will import all our taskbooks. I've added a few new things to this file that you haven't seen yet in this series. First, at the beginning of the file, I added `pre_tasks`, which allows us to have Ansible perform a task before all the other tasks run. In this case, we're telling Ansible to update our distribution's repository index. This line does that for us:
```
apt: update_cache=yes

```

Normally the `apt` module allows us to install packages, but we can also tell it to update our repository index. The idea is that we want all our individual plays to work with a fresh index each time Ansible runs. This will help ensure we don't have an issue with a stale index while attempting to install a package. Note that the `apt` module works only with Debian, Ubuntu, and their derivatives. If you're running a different distribution, you'll want to use a module specific to your distribution rather than `apt`. See the documentation for Ansible if you need to use a different module.

The following line is also worth further explanation:
```
changed_when: False

```

This line on an individual task stops Ansible from reporting the results of the play as changed even when it results in a change in the system. In this case, we don't care if the repository index contains new data; it almost always will, since repositories are always changing. We don't care about changes to `apt` repositories, as index changes are par for the course. If we omit this line, we'll see the summary at the end of the process report that something has changed, even if it was merely about the repository being updated. It's better to ignore these types of changes.

Next is our normal tasks section, and we import the taskbook we created. Each time we add another taskbook, we add another line here:
```
tasks:

  - include: tasks/packages.yml

```

If you were to run the `ansible-pull` command here, it should essentially do the same thing as it did in the last article. The difference is that we have improved our organization and we can more efficiently expand on it. The `ansible-pull` command syntax, to save you from finding the previous article, is this:
```
sudo ansible-pull -U https://github.com/<github_user>/ansible.git

```

If you recall, the `ansible-pull` command pulls down a Git repository and applies the configuration it contains.

Now that our foundation is in place, we can expand upon our Ansible config and add features. Specifically, we'll add configuration to automate the deployment of future changes to our workstations. To support this goal, the first thing we should do is to create a user specifically to apply our Ansible configuration. This isn't required—we can continue to run our Ansible configuration under our own user. But using a separate user segregates this to a system process that will run in the background, without our involvement.

We could create this user with the normal method, but since we're using Ansible, we should shy away from manual changes. Instead, we'll create a taskbook to handle user creation. This taskbook will create just one user for now, but you can always add additional plays to this taskbook to add additional users. I'll call this user `ansible`, but you can name it something else if you wish (if you do, make sure to update all occurrences). Let's create a taskbook named `users.yml` and place this code inside of it:
```
- name: create ansible user

  user: name=ansible uid=900

```

Next, we need to edit our `local.yml` file and append this new taskbook to the file, so it will look like this:
```
- hosts: localhost

  become: true

  pre_tasks:

    - name: update repositories

      apt: update_cache=yes

      changed_when: False



  tasks:

    - include: tasks/users.yml

    - include: tasks/packages.yml

```

Now when we run our `ansible-pull` command, a user named `ansible` will be created on the system. Note that I specifically declared `User ID 900` for this user by using the `UID` option. This isn't required, but it's recommended. The reason is that UIDs under 1,000 are typically not shown on the login screen, which is great because there's no reason we would need to log into a desktop session as our `ansible` user. UID 900 is arbitrary; it should be any number under 1,000 that's not already in use. You can find out if UID 900 is in use on your system with the following command:
```
cat /etc/passwd |grep 900

```

However, you shouldn't run into a problem with this UID because I've never seen it used by default in any distribution I've used so far.

Now, we have an `ansible` user that will later be used to apply our Ansible configuration automatically. Next, we can create the actual cron job that will be used to automate this. Rather than place this in the `users.yml` taskbook we just created, we should separate this into its own file. Create a taskbook named `cron.yml` in the tasks directory and place the following code inside:
```
- name: install cron job (ansible-pull)

  cron: user="ansible" name="ansible provision" minute="*/10" job="/usr/bin/ansible-pull -o -U https://github.com/<github_user>/ansible.git > /dev/null"

```

The syntax for the cron module should be fairly self-explanatory. With this play, we're creating a cron job to be run as the `ansible` user. The job will execute every 10 minutes, and the command it will execute is this:
```
/usr/bin/ansible-pull -o -U https://github.com/<github_user>/ansible.git > /dev/null

```

Also, we can put additional cron jobs we want all our workstations to have into this one file. We just need to add additional plays to add new cron jobs. However, simply adding a new taskbook for cron isn't enough—we'll also need to add it to our `local.yml` file so it will be called. Place the following line with the other includes:
```
- include: tasks/cron.yml

```

Now when `ansible-pull` is run, it will set up a new cron job that will be run as the `ansible` user every 10 minutes. But, having an Ansible job running every 10 minutes isn't ideal because it will take considerable CPU power. It really doesn't make sense for Ansible to run every 10 minutes unless we've changed something in the Git repository.

However, we've already solved this problem. Notice the `-o` option I added to the `ansible-pull` command in the cron job that we've never used before. This option tells Ansible to run only if the repository has changed since the last time `ansible-pull` was called. If the repository hasn't changed, it won't do anything. This way, you're not wasting valuable CPU for no reason. Sure, some CPU will be used when it pulls down the repository, but not nearly as much as it would use if it were applying your entire configuration all over again. When `ansible-pull` does run, it will go through all the tasks in the Playbook and taskbooks, but at least it won't run for no purpose.

Although we've added all the required components to automate `ansible-pull`, it actually won't work properly yet. The `ansible-pull` command will run with `sudo`, which would give it access to perform system-level commands. However, our `ansible` user is not set up to perform tasks as `sudo`. Therefore, when the cron job triggers, it will fail. Normally we could just use `visudo` and manually set the `ansible` user up to have this access. However, we should do things the Ansible way from now on, and this is a great opportunity to show you how the `copy` module works. The `copy` module allows you to copy a file from your Ansible repository to somewhere else in the filesystem. In our case, we'll copy a config file for `sudo` to `/etc/sudoers.d/` so that the `ansible` user can perform administrative tasks.

Open up the `users.yml` taskbook, and add the following play to the bottom:
```
- name: copy sudoers_ansible

  copy: src=files/sudoers_ansible dest=/etc/sudoers.d/ansible owner=root group=root mode=0440

```

The `copy` module, as we can see, copies a file from our repository to somewhere else. In this case, we're grabbing a file named `sudoers_ansible` (which we will create shortly) and copying it to `/etc/sudoers.d/ansible` with `root` as the owner.

Next, we need to create the file that we'll be copying. In the root of your Ansible repository, create a `files` directory:​
```
mkdir files

```

Then, in the `files` directory we just created, create the `sudoers_ansible` file with the following content:
```
ansible ALL=(ALL) NOPASSWD: ALL

```

Creating a file in `/etc/sudoers.d`, like we're doing here, allows us to configure `sudo` for a specific user. Here we're allowing the `ansible` user full access to the system via `sudo` without a password prompt. This will allow `ansible-pull` to run as a background task without us needing to run it manually.

Now, you can run `ansible-pull` again to pull down the latest changes:
```
sudo ansible-pull -U https://github.com/<github_user>/ansible.git

```

From this point forward, the cron job for `ansible-pull` will run every 10 minutes in the background and check your repository for changes. If it finds changes, it will run your playbook and apply your taskbooks.

So now we have a fully working solution. When you first set up a new laptop or desktop, you'll run the `ansible-pull` command manually, but only the first time. From that point forward, the `ansible` user will take care of subsequent runs in the background. When you want to make a change to your workstation machines, you simply pull down your Git repository, make the changes, then push those changes back to the repository. Then, the next time the cron job fires on each machine, it will pull down those changes and apply them. You now only have to make changes once, and all your workstations will follow suit. This method may be a bit unconventional though. Normally, you'd have an `inventory` file with your machines listed and several roles each machine could be a member of. However, the `ansible-pull` method, as described in this article, is a very efficient way of managing workstation configuration.

I have updated the code in my [GitHub repository][2] for this article, so feel free to browse the code there and check your syntax against mine. Also, I moved the code from the previous article into its own directory in that repository.

In part 3, we'll close out the series by using Ansible to configure GNOME desktop settings. I'll show you how to set your wallpaper and lock screen, apply a desktop theme, and more.

In the meantime, it's time for a little homework assignment. Most of us have configuration files we like to maintain for various applications we use. This could be configuration files for Bash, Vim, or whatever tools you use. I challenge you now to automate copying these configuration files to your machines via the Ansible repository we've been working on. In this article, I've shown you how to copy a file, so take a look at that and see if you can apply that knowledge to your personal files.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/manage-your-workstation-configuration-ansible-part-2

作者：[Jay LaCroix][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jlacroix
[1]:https://opensource.com/article/18/3/manage-workstation-ansible
[2]:https://github.com/jlacroix82/ansible_article.git
