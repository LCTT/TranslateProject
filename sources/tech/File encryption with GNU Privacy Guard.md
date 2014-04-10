File encryption with GNU Privacy Guard
================================================================================
Encryption ensures that files are stored in an encrypted form whether you are transmitting it over the Internet, backing it up on a server, carrying it on USB or on your laptop. Encrypting your data makes it unreadable to anyone but you or intended recipient, thus preventing unwanted access to it.

### GPG (GNU Privacy Guard) ###

GPG stands for GNU Privacy Guard. It is a key-based encryption method which means that a pair of keys is used to encrypt and decrypt a message so that it arrives securely. Initially, a user receives a public and a private key pair from a certificate authority. Any other user who wants to send an encrypted message can get the intended recipient's public key from the public directory. They use this key to encrypt the message, and then send it to the recipient. When the recipient gets the message, they decrypt it with their private key, which no one else should have an access to.

### GPG gives you the public key and the private key. ###

A public key is a key that you share with the public. It can be given to anyone you wish to received encrypted messages from. They would encrypt the message with your public key. They cannot decrypt their own message after they encrypt it. Only you, who hold the private key, can decrypt the message. A private key is your own personal password. Your private key will be used to decrypt messages encrypted in your public key, If you give someone your private key he can decrypt and read all your messages written in your public key.

### Using GPG from the terminal ###

Today most Linux distributions include GPG by default. To find out if this is the case, open up a terminal and type:

    $ gpg --version 

You should get version number. If so, you don't need to do anything, if not you can install GPG from your distribution's repositories.

### Key Generation ###

To use GPG to encrypt your communications, you need to create a key pair. Launch your terminal and run the following command to get started:

    $ gpg --gen-key 

You will be prompted back with the following:

    Please select what kind of key you want:
    (1) DSA and Elgamal (default)
    (2) DSA (sign only)
    (5) RSA (sign only)
    Your selection? 

Select number 1, as it can be used for encryption and decryption, the second and third choices are only allowed to sign messages. To do so, press the number 1, and then press Enter.

You then will be prompted with the following:

    1 DSA key-pair will have 1024 bits.
    2 ELG-E keys may be between 1024 and 4096 bits long.
    3 What key-size do you want? (2048) 

You will want to enter "2048" here, as recommended by GPG. If you don't want your key to expire (for the next prompt, select 0). Answer Yes if the information is correct, when prompted, and then enter your real name, your email address, and a comment (which is optional). If everything is correct, press "o" (for OK) and then Enter.

After that, you will be asked to enter a pass-phrase. This process will be repeated. As usual, make a strong password which will be difficult to crack. Do not enter a name/address/birth date or word from a dictionary as your password.

After entering your pass-phrase, follow the instructions in the terminal: We need to generate a lot of random bytes. It is a good idea to perform some other action (type on the keyboard, move the mouse, utilize the disk) during the prime generation; this gives the random number generator a better chance to gain enough entropy.

When you have successfully finished generating your key, you will see a message similar to the following one: gpg: key 083C39A4 marked as ultimately trusted. public and secret key created and signed.

### Key Servers ###

Key servers are used to distribute your public key to other key servers so that other users can easily look up your name (or the e-mail address) in the database and find your public key to send encrypted messages to you. This eliminates the process of physically or insecurely giving your friend your public key, and allows others to be able to find you on the on-line database.

Uploading your public key to the key server:

    $ gpg --send-keys --keyserver [keyservers.address.com] [yourpublicid] 

You should replace keyservers.address.com with key server of your choice (or use mit.edu which syncs it with other servers) also replace yourpublicid with yours. In the end it would look as follows:

    $ gpg --send-keys --keyserver hkp://pgp.mit.edu 083C39A4 

### To Encrypt a File ###

If you wish to encrypt a file for your friend with his public key, run the command in the following format:

    $ gpg -o encrypted_file.gpg --encrypt -r key-id original.file 

Explanation:

    -o encrypted_file.gpg = Output to the following filename.
    --encrypt = Encrypting a file
    -r = Recipient. KEY-ID would be your friends KEY-ID here.
    original.file = The file that you will be encrypting.

### To Decrypt a File ###

If someone has sent you a file that has been encrypted with your public key, you can decrypt it with following command:

    $ gpg --decrypt filename.gpg 

### Symmetric Encryption ###

With GPG you can do a symmetric encryption where you encrypt a file with a pass-phrase. This is not a key based encryption. In symmetric cryptography, the same key is used for both encryption and decryption. This approach is simpler in dealing with each message, but it is less secure since the key must be communicated to recipient. To encrypt a file with a pass-phrase, use:

    $ gpg -c filename.txt 

To decrypt this type of file, just use:

    $ gpg filename.txt 

You will be prompted for the pass-phrase and it will decrypt the file.

### Clearsign a Document ###

Clearsigning is very similar to adding your signature to the bottom of a letter or an important document. It signifies that it actually comes from you. By clearsigning, it generates a SHA1 hash of the entire file's contents and adds the SHA1 sum to the bottom of the signature. If the file has been tampered with, the signature verification will fail, which can be used to spot the forgery. If the user edits the file after it has been signed, the verification of the signature will also fail, because the SHA1 sum will not match the one of the actual content.

To clearsign a document or file, run the following:

    $ gpg --clearsign filename.txt 


### Generating Revocation Key ###

A revocation key is used to revoke your public key if your private key has been compromised in any way, or you suspect that it may be compromised. To create a revocation key, run the command:

    $ gpg --output revoke.asc --gen-revoke keyid 

Keep the revocation key in a safe place, anyone who gets a hold of it can use it to disable your key. (You could use symmetric encryption on your revocation file.)

### Tips for using GPG from terminal ###

To list the Keys you have imported into GPG, you can issue the following command:

    $ gpg --list-keys 

A list of the keys registered with your e-mail should appear (and since there should be only one, it will only list your key.) Then, you can obtain your KEY-ID and run the command above in order to submit it to the key servers.

To display the private or public keys on your key ring

    $ gpg --list-public-keys # will list public keys
    $ gpg --list-secret-keys # will lists private keys 

### Importing Keys ###

    $ gpg --import KEYFILE 

Keyfile would be the filename of the public key in your home folder. (If it is not in your home folder, use the cd command to go to the proper directory first, and then run the above command.)

### Exporting your Public Key ###

To export your public key in the ASCII Armored fashion, run the following command:

    $ gpg --export -a > publickey.asc 

\* * * * *
### About Richard White ###

Richard is technology enthusiast, on more than one occasion he was called a geek, he is also the author of three books, his most recent, Privacy in Digital Era is forthcoming in hardcover in May 2014. He is also the head editor and the driving force behind Digital Era website. The purpose of Digital Era is to present and give resources and tools to achieve and maintain anonymity, security and privacy. Richard regularly writes about privacy related issues and is hard at work on The Art of CLI, a collection of command line, open-source software. For [more information][1] on GNU Privacy Guard works and how to use graphical front-ends to the GPG software, you can find further reading on White's Digital Era website. 

--------------------------------------------------------------------------------

via: http://distrowatch.com/weekly.php?issue=20140407

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://digital-era.net/gpa-gnu-privacy-assistant/