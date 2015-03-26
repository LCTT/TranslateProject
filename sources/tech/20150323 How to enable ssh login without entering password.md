How to enable ssh login without entering password
================================================================================
Assume that you are a user "aliceA" on hostA, and wish to ssh to hostB as user "aliceB", without entering her password on hostB. You can follow this guide to **enable ssh login without entering a password**.

First of all, you need to be logged in as user "aliceA" on hostA.

Generate a public/private rsa key pair by using ssh-keygen. The generated key pair will be stored in ~/.ssh directory.

    $ ssh-keygen -t rsa

Then, create ~/.ssh directory on aliceB account at the destination hostB by running the following command. This step can be omitted if there is already .ssh directory at aliceB@hostB.

    $ ssh aliceB@hostB mkdir -p .ssh

Finally, copy the public key of user "aliceA" on hostA to aliceB@hostB to enable password-less ssh.

    $ cat .ssh/id_rsa.pub | ssh aliceB@hostB 'cat >> .ssh/authorized_keys'

From this point on, you no longer need to type in password to ssh to aliceB@hostB from aliceA@hostA.

### Troubleshooting ###

1. You are still asked for an SSH password even after enabling key authentication. In this case, check for system logs (e.g., /var/log/secure) to see if you see something like the following.

    Authentication refused: bad ownership or modes for file /home/aliceB/.ssh/authorized_keys

In this case, failure of key authentication is due to the fact that the permission or ownership ~/.ssh/authorized_keys file is not correct. Typically this error can happen if ~/.ssh/authorized_keys is read accessible to anyone but yourself. To fix this problem, change the file permission as follows.

    $ chmod 700 ~/.ssh/authorized_keys 

--------------------------------------------------------------------------------

via: http://xmodulo.com/how-to-enable-ssh-login-without.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni