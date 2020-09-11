[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use Bitwarden for password protection on Active Directory)
[#]: via: (https://opensource.com/article/19/11/bitwarden-password-protection-active-directory)
[#]: author: (Stephen Bancroft https://opensource.com/users/stevereaver)

How to use Bitwarden for password protection on Active Directory
======
Integrate your Linux self-hosted Bitwarden instance with AD using
Bitwarden Directory Connector.
![A lock on the side of a building][1]

[Bitwarden][2] is a fantastic tool for managing passwords. It has applications for every platform, a browser plugin, and a self-hosted version, and it offers some great password management tricks like folders and collections. One of my favorite features is that it will keep a history of your old passwords, which is a great feature for enterprise users.

If you are an enterprise user, you are probably self-hosting Bitwarden and want to sync your users with a staff directory. My organization uses Active Directory (AD), which is the standard for user directories and integrates seamlessly with Windows desktops. I also need it to work with our open source tools, and herein lies the secret sauce shared in this article.

The tool that allows you to do this is [Bitwarden Directory Connector][3] (BWDC). If you do a Google search, you will not find much information on using BWDC with AD on Linux. [Bitwarden's blog][4] is a great starting point if you're using the Windows version but it won't help you integrate it into your Linux environment. You can find instructions to do that on Bitwarden's GitHub page, but they aren't very clear. So, here I'll explain how to get your Linux self-hosted version of Bitwarden to integrate with your enterprise Active Directory (and, hopefully, provide more fruitful results for future Google searchers looking for this information).

In my setup, both Bitwarden and Active Directory are hosted on AWS, the former in an EC2 instance and the latter in AWS Simple Directory. The Bitwarden Docker container is installed in the home directory of a user called **bitwarden**. [Bitwarden's instructions][5] make this easy to set up. But setting up BWDC is not as clear, so I will try to fix that here.

### Install BWDC

Start by setting up a directory for BWDC, then download the ZIP file and unzip it:


```
cd /home/bitwarden
mkdir directory-connector
cd directory-connector
wget <https://github.com/bitwarden/directory-connector/releases/download/v2.6.2/bwdc-linux-2.6.2.zip>
unzip bwdc-linux-2.6.2.zip
chmod +x bwdc
```

(At the time of this writing, BWDC 2.6.2 was the current version; that may change, so make sure to download the latest release.)

You will now have a binary file called **bwdc** and a file called **keytar.node**; leave both files right where they are.

Next, edit the profile of the **bitwarden** user:


```
`vi /home/bitwarden/.profile`
```

and add the lines:


```
export BITWARDENCLI_CONNECTOR_PLAINTEXT_SECRETS=true
export PATH=$PATH:/home/bitwarden/directory-connector
```

Log out and back in to pick up the new settings, or you can source the profile with:


```
`  . ~/.profile`
```

The line **BITWARDENCLI_CONNECTOR_PLAINTEXT_SECRETS=true** tells BWDC not to use any desktop-based keystore. Since this is a server and it's unlikely to have a desktop installed, you will have to keep the password in plain text (but you will take precautions to protect it later). The second line sets up a path to the **bwdc** binary so it can run from any directory you are in.

### Configure BWDC

Once BWDC is installed, configure it to connect to your Bitwarden instance:


```
bwdc login
? Email address: &lt;your email for your master account&gt;
? Master password: [hidden]
```

After you are logged in, you're ready to work on the **data.json** file.

If you set up BWDC using the steps above, its configuration information will be stored in **/home/bitwarden/.config/Bitwarden Directory Connector/data.json**. This file contains the **appId** and **access token**; these are the login credentials for your Bitwarden instance. But what about Active Directory, you say? You can add that manually by editing your **data.json** file (I assume you are on a server and are using Vi):


```
`vi '/home/bitwarden/.config/Bitwarden Directory Connector/data.json'`
```

Add the following just underneath the **appId** line:


```
"rememberEmail": true,
  "rememberedEmail": "&lt;the email address you logged in with&gt;",
  "organizationId": "&lt;your organization id&gt;",
  "directoryType": 0,
  "directoryConfig_0": {
    "ssl": false,
    "sslAllowUnauthorized": false,
    "port": 389,
    "currentUser": false,
    "ad": true,
    "hostname": "&lt;hostname of your active directory&gt;",
    "rootPath": "&lt;root path of AD, something like; dc=com,dc=au&gt;",
    "username": "&lt;username with privilege to read the AD; DOMAIN\\\Username&gt;",
    "password": "&lt;password for the above account&gt;"
  },
  "directoryConfig_2": {},
  "directoryConfig_1": {},
  "directoryConfig_3": {},
  "syncConfig": {
    "users": true,
    "groups": true,
    "interval": 5,
    "removeDisabled": true,
    "overwriteExisting": true,
    "useEmailPrefixSuffix": false,
    "creationDateAttribute": "whenCreated",
    "revisionDateAttribute": "whenChanged",
    "emailPrefixAttribute": "sAMAccountName",
    "memberAttribute": "member",
    "userObjectClass": "person",
    "groupObjectClass": "group",
    "userEmailAttribute": "mail",
    "groupNameAttribute": "name",
    "userFilter": "(&amp;(memberOf=CN=bitwarden,OU=groups,DC=work,DC=corp))",
    "groupPath": "OU=Groups",
    "userPath": "CN=Users"
  },
  "environmentUrls": {
    "base": "&lt;base url of your bitwarden instance; [https://bitwarden.yourdomain\&gt;][6]",
    "api": null,
    "identity": null,
    "webVault": null,
    "icons": null,
    "notifications": null,
    "events": null
  },
```

If you look through this, you'll see that you need to change several values in this entry, including the **userFilter**, **groupPath**, and **userPath**. (I will assume you are familiar with LDAP and AD and know what those values should be for your instance.) Keep the **CN=bitwarden** part for the Bitwarden AD group you will create later. The other value you need to change is **organizationID**, which you can find in your **bwdata** directory as the name of one of the JSON files. List the files:


```
`ls /home/bitwarden/bwdata/core/licenses/organization`
```

This should return a directory listing, containing a single filename in the form **&lt;organization id&gt;.json**. The filename itself is your organization's ID. Insert it into the **organizationID** line in the code above.

Once you get your **data.json** file right, _I **highly** recommend you back up this file_. There seems to be an issue that sets this file back to default settings if BWDC finds a problem with it. This means if you innocently make a change to the file and there is a mistake, you will lose the entire configuration.

Next, test connectivity to your AD as the **bitwarden** user:


```
`bwdc test`
```

This should return a dump of the groups in your AD. To protect your password, set the permissions on that file so that only the **bitwarden** user can read it:


```
`chmod 700 '/home/bitwarden/.config/Bitwarden Directory Connector/data.json'`
```

### Set up your group

Now add a group to your AD (my group is called **bitwarden**), where you will add and remove users as they need access to Bitwarden. This group is necessary because, if you don't filter the users based on this group, BWDC will try to use ALL users in your AD. If the number of users is greater than your Bitwarden license allows, BWDC will fail silently, and you will hate yourself for a long time…. much like I did!

Once the group is set up and has at least one user, run the test again. You should see your user's email address in the output.

Now it is time to sync. Once you sync, any users that appear in the **bitwarden** group will be added to Bitwarden, and an email will be sent to them to invite them to sign up. Working as the **bitwarden** user, sync the directories with:


```
`bwdc sync`
```

Given that **removeDisabled** is set to **true** in the **data.json** file, you can set up a cron job to keep the members of the **bitwarden** group and the Bitwarden users in constant sync so that any changes you make in your AD are immediately reflected in your Bitwarden instance. Add the following to your **/etc/crontab**:


```
# Sync for Active Directory to Bitwarden
* *     * * *   bitwarden export BITWARDENCLI_CONNECTOR_PLAINTEXT_SECRETS=true ; /home/bitwarden/directory-connector/bwdc sync &gt;/dev/null 2&gt;&amp;1
```

Once you have auto-sync going, you will have a complete list of all your AD groups in Bitwarden. From there, it's just a simple matter of assigning a group to a collection and then adding members to groups in your AD. The users will be automatically assigned to the correct password collections and see the passwords they need.

### Potential traps

Finally, I will tell you about a few little traps that I fell into when setting this up. First, be aware of the **AD Primary Group**. You may have set this for a user if any of your Linux or other POSIX systems get login credentials from AD. It seems that AD will not include a user in group search results if that group is set as the primary group; this could remove a user from a group and therefore lose access to a collection.

Second, when you need to delete a user, you might think that removing an account from the group in AD would remove the user… wrong! It seems that Bitwarden keeps some user information hanging around in its database. This became painfully obvious when I removed my own account and then discovered that I was no longer able to log in after recreating it because the multi-factor authentication (MFA) was still active and the token had expired, effectively locking me out. You must explicitly tell Bitwarden to remove that stuff in the database. To do so, go to the URL:


```
`https://<your bitwarden site>/#/recover-delete`
```

Enter the email address the user signed up with. They will get an email instructing them to click a link to confirm to remove the account. Once that is done, the user can be put back in the Bitwarden AD group and go through the sign-on process again.

Now you know how to get your self-hosted Bitwarden working with your AD. I think you will still experience a few issues, but with a little bit of patience and tinkering with the configuration, it will work. Just don't muck around with it too much once it is working!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/bitwarden-password-protection-active-directory

作者：[Stephen Bancroft][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stevereaver
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: https://bitwarden.com/
[3]: https://github.com/bitwarden/directory-connector
[4]: https://blog.bitwarden.com/organization-user-groups-directory-sync-ba674cb78a5c
[5]: https://help.bitwarden.com/article/install-on-premise/
[6]: https://bitwarden.yourdomain\>
