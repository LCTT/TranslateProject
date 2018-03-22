Protecting Code Integrity with PGP — Part 6: Using PGP with Git
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/global-network.jpg?itok=h_hhZc36)
In this tutorial series, we're providing practical guidelines for using PGP, including basic concepts and generating and protecting your keys. If you missed the previous articles, you can catch up below. In this article, we look at Git's integration with PGP, starting with signed tags, then introducing signed commits, and finally adding support for signed pushes.

[Part 1: Basic Concepts and Tools][1]

[Part 2: Generating Your Master Key][2]

[Part 3: Generating PGP Subkeys][3]

[Part 4: Moving Your Master Key to Offline Storage][4]

[Part 5: Moving Subkeys to a Hardware Device][5]

One of the core features of Git is its decentralized nature -- once a repository is cloned to your system, you have full history of the project, including all of its tags, commits and branches. However, with hundreds of cloned repositories floating around, how does anyone verify that the repository you downloaded has not been tampered with by a malicious third party? You may have cloned it from GitHub or some other official-looking location, but what if someone had managed to trick you?

Or what happens if a backdoor is discovered in one of the projects you've worked on, and the "Author" line in the commit says it was done by you, while you're pretty sure you had [nothing to do with it][6]?

To address both of these issues, Git introduced PGP integration. Signed tags prove the repository integrity by assuring that its contents are exactly the same as on the workstation of the developer who created the tag, while signed commits make it nearly impossible for someone to impersonate you without having access to your PGP keys.

### Checklist

  * Understand signed tags, commits, and pushes (ESSENTIAL)

  * Configure git to use your key (ESSENTIAL)

  * Learn how tag signing and verification works (ESSENTIAL)

  * Configure git to always sign annotated tags (NICE)

  * Learn how commit signing and verification works (ESSENTIAL)

  * Configure git to always sign commits (NICE)

  * Configure gpg-agent options (ESSENTIAL)




### Considerations

Git implements multiple levels of integration with PGP, first starting with signed tags, then introducing signed commits, and finally adding support for signed pushes.

#### Understanding Git Hashes

Git is a complicated beast, but you need to know what a "hash" is in order to have a good grasp on how PGP integrates with it. We'll narrow it down to two kinds of hashes: tree hashes and commit hashes.

##### Tree hashes

Every time you commit a change to a repository, git records checksum hashes of all objects in it -- contents (blobs), directories (trees), file names and permissions, etc, for each subdirectory in the repository. It only does this for trees and blobs that have changed with each commit, so as not to re-checksum the entire tree unnecessarily if only a small part of it was touched.

Then it calculates and stores the checksum of the toplevel tree, which will inevitably be different if any part of the repository has changed.

##### Commit hashes

Once the tree hash has been created, git will calculate the commit hash, which will include the following information about the repository and the change being made:

  * The checksum hash of the tree

  * The checksum hash of the tree before the change (parent)

  * Information about the author (name, email, time of authorship)

  * Information about the committer (name, email, time of commit)

  * The commit message




##### Hashing function

At the time of writing, git still uses the SHA1 hashing mechanism to calculate checksums, though work is under way to transition to a stronger algorithm that is more resistant to collisions. Note, that git already includes collision avoidance routines, so it is believed that a successful collision attack against git remains impractical.

#### Annotated tags and tag signatures

Git tags allow developers to mark specific commits in the history of each git repository. Tags can be "lightweight" \-- more or less just a pointer at a specific commit, or they can be "annotated," which becomes its own object in the git tree. An annotated tag object contains all of the following information:

  * The checksum hash of the commit being tagged

  * The tag name

  * Information about the tagger (name, email, time of tagging)

  * The tag message




A PGP-signed tag is simply an annotated tag with all these entries wrapped around in a PGP signature. When a developer signs their git tag, they effectively assure you of the following:

  * Who they are (and why you should trust them)

  * What the state of their repository was at the time of signing:

    * The tag includes the hash of the commit

      * The commit hash includes the hash of the toplevel tree

        * Which includes hashes of all files, contents, and subtrees
      * It also includes all information about authorship

      * Including exact times when changes were made




When you clone a git repository and verify a signed tag, that gives you cryptographic assurance that all contents in the repository, including all of its history, are exactly the same as the contents of the repository on the developer's computer at the time of signing.

#### Signed commits

Signed commits are very similar to signed tags -- the contents of the commit object are PGP-signed instead of the contents of the tag object. A commit signature also gives you full verifiable information about the state of the developer's tree at the time the signature was made. Tag signatures and commit PGP signatures provide exact same security assurances about the repository and its entire history.

#### Signed pushes

This is included here for completeness' sake, since this functionality needs to be enabled on the server receiving the push before it does anything useful. As we saw above, PGP-signing a git object gives verifiable information about the developer's git tree, but not about their intent for that tree.

For example, you can be working on an experimental branch in your own git fork trying out a promising cool feature, but after you submit your work for review, someone finds a nasty bug in your code. Since your commits are properly signed, someone can take the branch containing your nasty bug and push it into master, introducing a vulnerability that was never intended to go into production. Since the commit is properly signed with your key, everything looks legitimate and your reputation is questioned when the bug is discovered.

Ability to require PGP-signatures during git push was added in order to certify the intent of the commit, and not merely verify its contents.

#### Configure git to use your PGP key

If you only have one secret key in your keyring, then you don't really need to do anything extra, as it becomes your default key.

However, if you happen to have multiple secret keys, you can tell git which key should be used ([fpr] is the fingerprint of your key):
```
$ git config --global user.signingKey [fpr]

```

NOTE: If you have a distinct gpg2 command, then you should tell git to always use it instead of the legacy gpg from version 1:
```
$ git config --global gpg.program gpg2

```

#### How to work with signed tags

To create a signed tag, simply pass the -s switch to the tag command:
```
$ git tag -s [tagname]

```

Our recommendation is to always sign git tags, as this allows other developers to ensure that the git repository they are working with has not been maliciously altered (e.g. in order to introduce backdoors).

##### How to verify signed tags

To verify a signed tag, simply use the verify-tag command:
```
$ git verify-tag [tagname]

```

If you are verifying someone else's git tag, then you will need to import their PGP key. Please refer to the "Trusted Team communication" document in the same repository for guidance on this topic.

##### Verifying at pull time

If you are pulling a tag from another fork of the project repository, git should automatically verify the signature at the tip you're pulling and show you the results during the merge operation:
```
$ git pull [url] tags/sometag

```

The merge message will contain something like this:
```
Merge tag 'sometag' of [url]

[Tag message]

# gpg: Signature made [...]
# gpg: Good signature from [...]

```

#### Configure git to always sign annotated tags

Chances are, if you're creating an annotated tag, you'll want to sign it. To force git to always sign annotated tags, you can set a global configuration option:
```
$ git config --global tag.forceSignAnnotated true

```

Alternatively, you can just train your muscle memory to always pass the -s switch:
```
$ git tag -asm "Tag message" tagname

```

#### How to work with signed commits

It is easy to create signed commits, but it is much more difficult to incorporate them into your workflow. Many projects use signed commits as a sort of "Committed-by:" line equivalent that records code provenance -- the signatures are rarely verified by others except when tracking down project history. In a sense, signed commits are used for "tamper evidence," and not to "tamper-proof" the git workflow.

To create a signed commit, you just need to pass the -S flag to the git commit command (it's capital -S due to collision with another flag):
```
$ git commit -S

```

Our recommendation is to always sign commits and to require them of all project members, regardless of whether anyone is verifying them (that can always come at a later time).

##### How to verify signed commits

To verify a single commit you can use verify-commit:
```
$ git verify-commit [hash]

```

You can also look at repository logs and request that all commit signatures are verified and shown:
```
$ git log --pretty=short --show-signature

```

##### Verifying commits during git merge

If all members of your project sign their commits, you can enforce signature checking at merge time (and then sign the resulting merge commit itself using the -S flag):
```
$ git merge --verify-signatures -S merged-branch

```

Note, that the merge will fail if there is even one commit that is not signed or does not pass verification. As it is often the case, technology is the easy part -- the human side of the equation is what makes adopting strict commit signing for your project difficult.

##### If your project uses mailing lists for patch management

If your project uses a mailing list for submitting and processing patches, then there is little use in signing commits, because all signature information will be lost when sent through that medium. It is still useful to sign your commits, just so others can refer to your publicly hosted git trees for reference, but the upstream project receiving your patches will not be able to verify them directly with git.

You can still sign the emails containing the patches, though.

#### Configure git to always sign commits

You can tell git to always sign commits:
```
git config --global commit.gpgSign true

```

Or you can train your muscle memory to always pass the -S flag to all git commit operations (this includes --amend).

#### Configure gpg-agent options

The GnuPG agent is a helper tool that will start automatically whenever you use the gpg command and run in the background with the purpose of caching the private key passphrase. This way you only have to unlock your key once to use it repeatedly (very handy if you need to sign a bunch of git operations in an automated script without having to continuously retype your passphrase).

There are two options you should know in order to tweak when the passphrase should be expired from cache:

  * default-cache-ttl (seconds): If you use the same key again before the time-to-live expires, the countdown will reset for another period. The default is 600 (10 minutes).

  * max-cache-ttl (seconds): Regardless of how recently you've used the key since initial passphrase entry, if the maximum time-to-live countdown expires, you'll have to enter the passphrase again. The default is 30 minutes.




If you find either of these defaults too short (or too long), you can edit your ~/.gnupg/gpg-agent.conf file to set your own values:
```
# set to 30 minutes for regular ttl, and 2 hours for max ttl
default-cache-ttl 1800
max-cache-ttl 7200

```

##### Bonus: Using gpg-agent with ssh

If you've created an [A] (Authentication) key and moved it to the smartcard, you can use it with ssh for adding 2-factor authentication for your ssh sessions. You just need to tell your environment to use the correct socket file for talking to the agent.

First, add the following to your ~/.gnupg/gpg-agent.conf:
```
enable-ssh-support

```

Then, add this to your .bashrc:
```
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

```

You will need to kill the existing gpg-agent process and start a new login session for the changes to take effect:
```
$ killall gpg-agent
$ bash
$ ssh-add -L

```

The last command should list the SSH representation of your PGP Auth key (the comment should say cardno:XXXXXXXX at the end to indicate it's coming from the smartcard).

To enable key-based logins with ssh, just add the ssh-add -L output to ~/.ssh/authorized_keys on remote systems you log in to. Congratulations, you've just made your ssh credentials extremely difficult to steal.

As a bonus, you can get other people's PGP-based ssh keys from public keyservers, should you need to grant them ssh access to anything:
```
$ gpg --export-ssh-key [keyid]

```

This can come in super handy if you need to allow developers access to git repositories over ssh. Next time, we'll provide tips for protecting your email accounts as well as your PGP keys.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-6-using-pgp-git

作者：[KONSTANTIN RYABITSEV][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.linux.com/blog/learn/2018/2/protecting-code-integrity-pgp-part-1-basic-pgp-concepts-and-tools
[2]:https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-2-generating-and-protecting-your-master-pgp-key
[3]:https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-3-generating-pgp-subkeys
[4]:https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-4-moving-your-master-key-offline-storage
[5]:https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-5-moving-subkeys-hardware-device
[6]:https://github.com/jayphelps/git-blame-someone-else
