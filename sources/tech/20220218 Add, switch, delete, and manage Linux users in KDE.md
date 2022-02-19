[#]: subject: "Add, switch, delete, and manage Linux users in KDE"
[#]: via: "https://opensource.com/article/22/2/manage-linux-users-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Add, switch, delete, and manage Linux users in KDE
======
Maintaining separate users on a computer is a luxury, and a great way to
keep your own data, and the data of those you care about, safe.
![people in different locations who are part of the same team][1]

Sharing a computer in a household is usually a pretty casual affair. When you need the computer, you pick it up and start using it. It's simple in theory, and mostly works. That is, until you accidentally grab the common computer and accidentally post screenshots of your server's uptime to your partner's cooking blog. Then it's time for separate user accounts.

From the very beginning, Linux has been a multi-user system. It's designed to treat each user, so long as they log in, as a unique human being, with a desktop all their own, a unique web browser profile, access to their own documents and files, and so on. The KDE Plasma Desktop does a lot to make it easy to switch from one account to another, but first you must set up a user account for each person who you expect to use a computer. You might also set up a special account for guests (I call this account, pragmatically, **guest**.)

### Add a user in KDE

There are different ways to add users on Linux. One way is the sysadmins-style of [using the terminal][2]. This is very efficient when you have lots of users to add, and so you want to automate the process or just reduce the number of mouse clicks.

In the Plasma Desktop, though, you can add users with the **Users** application. **Users** is actually a control panel in **System Settings**, but you can launch it from your application menu as if it were a stand-alone app.

![Users in KDE System Settings][3]

(Seth Kenlon, [CC BY-SA 4.0][4])

To add a user, click the **Add New User** button at the bottom of the window.

![Adding a user in KDE][5]

(Seth Kenlon, [CC BY-SA 4.0][4])

Give the new user a name and a username. These can be the same thing, but the intent is that their name is their birth name, while their username is a simple handle they use for computing. For instance, my name is "Seth Kenlon", while my username is `seth`.

Designate the new user as either a standard user or an administrator. Standard users have full control over just their own environment. They can [install Flatpaks][6] and save data to their home directory, but they can't affect other users on the machine. This is one of the advantages of having user accounts. I don't suspect that anyone I allow to use my computer intends to delete data that's important to me, but accidents happen. By creating a separate user account for myself and my partner, I'm protecting each of our data, and I'm protecting each of us individually from accidentally moving a file or misplacing data that's important to the other.

An administrator can make systemwide changes. I usually reserve this for myself on my computer, and I expect my partner to reserve that role for herself on her own computer. At work, however, that role belongs to the IT department.

Create a password for the user. Once logged in, new users can change their passwords.

To finalize user creation, click the **Create** button.

### Switching users

There are two different ways to switch users at the desktop level. You can log out and then let the other user log in, or you can choose **Switch user** from the **Power / Sessions** category in your application menu.

![Switching users in KDE][7]

(Seth Kenlon, [CC BY-SA 4.0][4])

When a new user logs in, your desktop is "frozen" or paused, and a new desktop is brought up for the other user. All of your windows remain open. You can even switch users in the middle of a game (you should probably pause first if you're in the middle of combat), and when you switch back you can pick right up where you left off. Better still, all of your processes continue to run, too. So you can switch users while rendering video or compiling code, and when you switch back your video will have finished rendering, or your code will have finished compiling (provided enough time has elapsed.)

![Login][8]

(Seth Kenlon, [CC BY-SA 4.0][4])

### Deleting a user

When I have house guests, I often create a guest account for the duration of their stay, and then I remove the account once they've gone.

You can remove a user from your computer by deleting their user account. This removes all of their data, so **make sure that the user you're about to delete has migrated what they need off of the machine!

The **Delete User** button is located in each user account in the **Users** control panel, where you created the user in the first place.

![Deleting a user][9]

(Seth Kenlon, [CC BY-SA 4.0][4])

### Linux user management

Maintaining separate users on a computer is a luxury, and a great way to keep your own data, and the data of those you care about, safe. It allows each user to be unique, and to make the desktop their own. With Linux, it's easy and nondisruptive, so create users for friends, houseguests, and family members.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/manage-linux-users-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connection_people_team_collaboration.png?itok=0_vQT8xV (people in different locations who are part of the same team)
[2]: https://www.redhat.com/sysadmin/linux-commands-manage-users
[3]: https://opensource.com/sites/default/files/kde-users.jpg (Users in KDE System Settings)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/kde-users-add.jpg (Adding a user in KDE)
[6]: https://opensource.com/article/21/11/install-flatpak-linux
[7]: https://opensource.com/sites/default/files/kde-users-switch.jpg (Switching users in KDE)
[8]: https://opensource.com/sites/default/files/kde-users-login.jpg (Login)
[9]: https://opensource.com/sites/default/files/kde-users-delete.jpg (Deleting a user)
