[Translating by Snapcrafter]
Making your snaps available to the store using snapcraft
============================================================

### Share or save

![snaps](https://insights.ubuntu.com/wp-content/uploads/9be3/Snaps.jpg)

Now that Ubuntu Core has been officially released, it might be a good time to get your snaps into the Store!

**Delivery and Store Concepts **
So let’s start with a refresher on what we have available on the Store side to manage your snaps.

Every time you push a snap to the store, the store will assign it a revision, this revision is unique in the store for this particular snap.

However to be able to push a snap for the first time, the name needs to be registered which is pretty easy to do given the name is not already taken.

Any revision on the store can be released to a number of channels which are defined conceptually to give your users the idea of a stability or risk level, these channel names are:

*   stable

*   candidate

*   beta

*   edge

Ideally anyone with a CI/CD process would push daily or on every source update to the edge channel. During this process there are two things to take into account.

The first thing to take into account is that at the beginning of the snapping process you will likely get started with a non confined snap as this is where the bulk of the work needs to happen to adapt to this new paradigm. With that in mind, your project gets started with a confinement set to devmode. This makes it possible to get going on the early phases of development and still get your snap into the store. Once everything is fully supported with the security model snaps work in, this confinement entry can be switched to strict. Given the confinement level of devmode this snap is only releasable on the edge and beta channels which hints your users on how much risk they are taking by going there.

So let’s say you are good to go on the confinement side and you start a CI/CD process against edge but you also want to make sure in some cases that early releases of a new iteration against master never make it to stable or candidate and for this we have a grade entry. If the grade of the snap is set to devel the store will never allow you to release to the most stable channels (stable and candidate). not be possible.

Somewhere along the way we might want to release a revision into beta which some users are more likely want to track on their side (which given good release management process should be to some level more usable than a random daily build). When that stage in the process is over but want people to keep getting updates we can choose to close the beta channel as we only plan to release to candidate and stable from a certain point in time, by closing this beta channel we will make that channel track the following open channel in the stability list, in this case it is candidate, if candidate is tracking stable whatever is in stable is what we will get.

**Enter Snapcraft**

So given all these concepts how do we get going with snapcraft, first of all we need to login:

```
$ snapcraft login
Enter your Ubuntu One SSO credentials.
Email: sxxxxx.sxxxxxx@canonical.com
Password: **************
Second-factor auth: 123456
```

After logging in we are ready to get our snap registered, for examples sake let’s say we wanted to register awesome-database, a fantasy snap we want to get started with:

```
 $ snapcraft register awesome-database
We always want to ensure that users get the software they expect
for a particular name.

If needed, we will rename snaps to ensure that a particular name
reflects the software most widely expected by our community.

For example, most people would expect ‘thunderbird’ to be published by
Mozilla. They would also expect to be able to get other snaps of
Thunderbird as 'thunderbird-sergiusens'.

Would you say that MOST users will expect 'a' to come from
you, and be the software you intend to publish there? [y/N]: y

You are now the publisher for 'awesome-database'
```

So assuming we have the snap built already, all we have to do is push it to the store. Let’s take advantage of a shortcut and –release in the same command:

```
 $ snapcraft push awesome-databse_0.1_amd64.snap --release edge
Uploading awesome-database_0.1_amd64.snap [=================] 100%
Processing....
Revision 1 of 'awesome-database' created.

Channel    Version    Revision
stable     -          -
candidate  -          -
beta       -          -
edge       0.1        1

The edge channel is now open. 
```

If we try to release this to stable the store will block us:

```
 $ snapcraft release awesome-database 1 stable
Revision 1 (devmode) cannot target a stable channel (stable, grade: devel) 
```

We are safe from messing up and making this available to our faithful users. Now eventually we will push a revision worthy of releasing to the stable channel:

```
 $ snapcraft push awesome-databse_0.1_amd64.snap
Uploading awesome-database_0.1_amd64.snap [=================] 100%
Processing....
Revision 10 of 'awesome-database' created. 
```

```
 Notice that the version is just a friendly identifier and what really matters is the revision number the store generates for us. Now let’s go ahead and release this to stable: 
```

```
  $ snapcraft release awesome-database 10 stable
Channel    Version    Revision
stable     0.1        10
candidate  ^          ^
beta       ^          ^
edge       0.1        10

The 'stable' channel is now open. 
```

In this last channel map view for the architecture we are working with, we can see that edge is going to be stuck on revision 10, and that beta and candidate will be following stable which is on revision 10\. For some reason we decide that we will focus on stability and make our CI/CD push to beta instead. This means that our edge channel will slightly fall out of date, in order to avoid things like this we can decide to close the channel:

```
 $ snapcraft close awesome-database edge
Arch    Channel    Version    Revision
amd64   stable     0.1        10
        candidate  ^          ^
        beta       ^          ^
        edge       ^          ^

The edge channel is now closed. 
```

In this current state, all channels are following the stable channel so people subscribed to candidate, beta and edge would be tracking changes to that channel. If revision 11 is ever pushed to stable only, people on the other channels would also see it.

This listing also provides us with a full architecture view, in this case we have only been working with amd64.

**Getting more information**

So some time passed and we want to know what was the history and status of our snap in the store. There are two commands for this, the straightforward one is to run status which will give us a familiar result:

```
 $ snapcraft status awesome-database
Arch    Channel    Version    Revision
amd64   stable     0.1        10
        candidate  ^          ^
        beta       ^          ^
        edge       ^          ^ 
```

We can also get the full history:

```
 $ snapcraft history awesome-database
Rev.    Uploaded              Arch       Version    Channels
3       2016-09-30T12:46:21Z  amd64      0.1        stable*
...
...
...
2       2016-09-30T12:38:20Z  amd64      0.1        -
1       2016-09-30T12:33:55Z  amd64      0.1        - 
```

**Closing remarks**

I hope this gives an overview of the things you can do with the store and more people start taking advantage of it!

[Publish a snap][2]

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2016/11/15/making-your-snaps-available-to-the-store-using-snapcraft/

作者：[Sergio Schvezov  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/sergio-schvezov/
[1]:https://insights.ubuntu.com/author/sergio-schvezov/
[2]:http://snapcraft.io/docs/build-snaps/publish
