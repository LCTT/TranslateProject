[#]: subject: (Encrypting and decrypting files with OpenSSL)
[#]: via: (https://opensource.com/article/21/4/encryption-decryption-openssl)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Encrypting and decrypting files with OpenSSL
======
OpenSSL is a practical tool for ensuring your sensitive and secret
messages can't be opened by outsiders.
![A secure lock.][1]

Encryption is a way to encode a message so that its contents are protected from prying eyes. There are two general types:

  1. Secret-key or symmetric encryption
  2. Public-key or asymmetric encryption



Secret-key encryption uses the same key for encryption and decryption, while public-key encryption uses different keys for encryption and decryption. There are pros and cons to each method. Secret-key encryption is faster, and public-key encryption is more secure since it addresses concerns around securely sharing the keys. Using them together makes optimal use of each type's strengths.

### Public-key encryption

Public-key encryption uses two sets of keys, called a key pair. One is the public key and can be freely shared with anyone you want to communicate with secretly. The other, the private key, is supposed to be a secret and never shared.

Public keys are used for encryption. If someone wants to communicate sensitive information with you, you can send them your public key, which they can use to encrypt their messages or files before sending them to you. Private keys are used for decryption. The only way you can decrypt your sender's encrypted message is by using your private key. Hence the descriptor "key-pair"; the set of keys goes hand-in-hand.

### How to encrypt files with OpenSSL

[OpenSSL][2] is an amazing tool that does a variety of tasks, including encrypting files. This demo uses a Fedora machine with OpenSSL installed. The tool is usually installed by default by most Linux distributions; if not, you can use your package manager to install it:


```
$ cat /etc/fedora-release
Fedora release 33 (Thirty Three)
$
alice $ openssl version
OpenSSL 1.1.1i FIPS  8 Dec 2020
alice $
```

To explore file encryption and decryption, imagine two users, Alice and Bob, who want to communicate with each other by exchanging encrypted files using OpenSSL.

#### Step 1: Generate key pairs

Before you can encrypt files, you need to generate a pair of keys. You will also need a passphrase, which you must use whenever you use OpenSSL, so make sure to remember it.

Alice generates her set of key pairs with:


```
`alice $ openssl genrsa -aes128 -out alice_private.pem 1024`
```

This command uses OpenSSL's [genrsa][3] command to generate a 1024-bit public/private key pair. This is possible because the RSA algorithm is asymmetric. It also uses aes128, a symmetric key algorithm, to encrypt the private key that Alice generates using genrsa.

After entering the command, OpenSSL prompts Alice for a passphrase, which she must enter each time she wants to use the keys:


```
alice $ openssl genrsa -aes128 -out alice_private.pem 1024
Generating RSA private key, 1024 bit long modulus (2 primes)
..........+++++
..................................+++++
e is 65537 (0x010001)
Enter pass phrase for alice_private.pem:
Verifying - Enter pass phrase for alice_private.pem:
alice $
alice $
alice $ ls -l alice_private.pem
-rw-------. 1 alice alice 966 Mar 22 17:44 alice_private.pem
alice $
alice $ file alice_private.pem
alice_private.pem: PEM RSA private key
alice $
```

Bob follows the same procedure to create his key pair:


```
bob $ openssl genrsa -aes128 -out bob_private.pem 1024
Generating RSA private key, 1024 bit long modulus (2 primes)
..................+++++
............................+++++
e is 65537 (0x010001)
Enter pass phrase for bob_private.pem:
Verifying - Enter pass phrase for bob_private.pem:
bob $
bob $ ls -l bob_private.pem
-rw-------. 1 bob bob 986 Mar 22 13:48 bob_private.pem
bob $
bob $ file bob_private.pem
bob_private.pem: PEM RSA private key
bob $
```

If you are curious about what the key file looks like, you can open the .pem file that the command generated—but all you will see is a bunch of text on the screen:


```
alice $ head alice_private.pem
\-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: AES-128-CBC,E26FAC1F143A30632203F09C259200B9

pdKj8Gm5eeAOF0RHzBx8l1tjmA1HSSvy0RF42bOeb7sEVZtJ6pMnrJ26ouwTQnkL
JJjUVPPHoKZ7j4QpwzbPGrz/hVeMXVT/y33ZEEA+3nrobwisLKz+Q+C9TVJU3m7M
/veiBO9xHMGV01YBNeic7MqXBkhIrNZW6pPRfrbjsBMBGSsL8nwJbb3wvHhzPkeM
e+wtt9S5PWhcnGMj3T+2mtFfW6HWpd8Kdp60z7Nh5mhA9+5aDWREfJhJYzl1zfcv
Bmxjf2wZ3sFJNty+sQVajYfk6UXMyJIuWgAjnqjw6c3vxQi0KE3NUNZYO93GQgEF
pyAnN9uGUTBCDYeTwdw8TEzkyaL08FkzLfFbS2N9BDksA3rpI1cxpxRVFr9+jDBz
alice $
```

To view the key's details, you can use the following OpenSSL command to input the .pem file and display the contents. You may be wondering where to find the other key since this is a single file. This is a good observation. Here's how to get the public key:


```
alice $ openssl rsa -in alice_private.pem -noout -text
Enter pass phrase for alice_private.pem:
RSA Private-Key: (1024 bit, 2 primes)
modulus:
    00:bd:e8:61:72:f8:f6:c8:f2:cc:05:fa:07:aa:99:
    47:a6:d8:06:cf:09:bf:d1:66:b7:f9:37:29:5d:dc:
    c7:11:56:59:d7:83:b4:81:f6:cf:e2:5f:16:0d:47:
    81:fe:62:9a:63:c5:20:df:ee:d3:95:73:dc:0a:3f:
    65:d3:36:1d:c1:7d:8b:7d:0f:79🇩🇪80:fc:d2:c0:
    e4:27:fc:e9:66:2d:e2:7e:fc:e6:73:d1:c9:28:6b:
    6a:8a:e8:96:9d:65:a0:8a:46:e0:b8:1f:b0:48:d4:
    db:d4:a3:7f:0d:53:36:9a:7d:2e:e7:d8:f2:16:d3:
    ff:1b:12:af:53:22:c0:41:51
publicExponent: 65537 (0x10001)

&lt;&lt; snip &gt;&gt;

exponent2:
    6e:aa:8c:6e:37:d0:57:37:13:c0:08:7e:75:43:96:
    33:01:99:25:24:75:9c:0b:45:3c:a2:39:44:69:84:
    a4:64:48:f4:5c:bc:40:40:bf:84:b8:f8:0f:1d:7b:
    96:7e:16:00:eb:49:da:6b:20:65:fc:a9:20:d9:98:
    76:ca:59:e1
coefficient:
    68:9e:2e:fa:a3:a4:72:1d:2b:60:61:11:b1:8b:30:
    6e:7e:2d:f9:79:79:f2:27🆎a0:a0:b6:45:08:df:
    12:f7:a4:3b:d9:df:c5:6e:c7:e8:81:29:07💿7e:
    47:99:5d:33:8c:b7:fb:3b:a9:bb:52:c0:47:7a:1c:
    e3:64:90:26
alice $
```

#### Step 2: Extract the public keys

Remember, the public key is the one you can freely share with others, whereas you must keep your private key secret. So, Alice must extract her public key and save it to a file using the following command:


```
alice $ openssl rsa -in alice_private.pem -pubout &gt; alice_public.pem
Enter pass phrase for alice_private.pem:
writing RSA key
alice $
alice $ ls -l *.pem
-rw-------. 1 alice alice 966 Mar 22 17:44 alice_private.pem
-rw-rw-r--. 1 alice alice 272 Mar 22 17:47 alice_public.pem
alice $
```

You can view the public key details the same way as before, but this time, input the public key .pem file instead:


```
alice $
alice $ openssl rsa -in alice_public.pem -pubin -text -noout
RSA Public-Key: (1024 bit)
Modulus:
    00:bd:e8:61:72:f8:f6:c8:f2:cc:05:fa:07:aa:99:
    47:a6:d8:06:cf:09:bf:d1:66:b7:f9:37:29:5d:dc:
    c7:11:56:59:d7:83:b4:81:f6:cf:e2:5f:16:0d:47:
    81:fe:62:9a:63:c5:20:df:ee:d3:95:73:dc:0a:3f:
$
```

Bob can follow the same process to extract his public key and save it to a file:


```
bob $ openssl rsa -in bob_private.pem -pubout &gt; bob_public.pem
Enter pass phrase for bob_private.pem:
writing RSA key
bob $
bob $ ls -l *.pem
-rw-------. 1 bob bob 986 Mar 22 13:48 bob_private.pem
-rw-r--r--. 1 bob bob 272 Mar 22 13:51 bob_public.pem
bob $
```

#### Step 3: Exchange public keys

These public keys are not much use to Alice and Bob until they exchange them with each other. Several methods are available for sharing public keys, including copying the keys to each other's workstations using the `scp` command.

To send Alice's public key to Bob's workstation:


```
` alice $ scp alice_public.pem bob@bob-machine-or-ip:/path/`
```

To send Bob's public key to Alice's workstation:


```
`bob $ scp bob_public.pem alice@alice-machine-or-ip:/path/`
```

Now, Alice has Bob's public key and vice versa:


```
alice $ ls -l bob_public.pem
-rw-r--r--. 1 alice alice 272 Mar 22 17:51 bob_public.pem
alice $

[/code] [code]

bob $ ls -l alice_public.pem
-rw-r--r--. 1 bob bob 272 Mar 22 13:54 alice_public.pem
bob $
```

#### Step 4: Exchange encrypted messages with a public key

Say Alice needs to communicate secretly with Bob. She writes her secret message in a file and saves it to `top_secret.txt`. Since this is a regular file, anybody can open it and see its contents. There isn't much protection here:


```
alice $
alice $ echo "vim or emacs ?" &gt; top_secret.txt
alice $
alice $ cat top_secret.txt
vim or emacs ?
alice $
```

To encrypt this secret message, Alice needs to use the `openssls -encrypt` command. She needs to provide three inputs to the tool:

  1. The name of the file that contains the secret message
  2. Bob's public key (file)
  3. The name of a file where the encrypted message will be stored




```
alice $ openssl rsautl -encrypt -inkey bob_public.pem -pubin -in top_secret.txt -out top_secret.enc
alice $
alice $ ls -l top_secret.*
-rw-rw-r--. 1 alice alice 128 Mar 22 17:54 top_secret.enc
-rw-rw-r--. 1 alice alice  15 Mar 22 17:53 top_secret.txt
alice $
alice $
```

After encryption, the original file is still viewable, whereas the newly created encrypted file looks like gibberish on the screen. You can be assured that the secret message has been encrypted:


```
alice $ cat top_secret.txt
vim or emacs ?
alice $
alice $ cat top_secret.enc
�s��uM)M&amp;&gt;��N��}dmCy92#1X�q󺕦��v���M��@��E�~��1�k~&amp;PU�VhHL�@^P��(��zi�M�4p�e��g+R�1�Ԁ���s�������q_8�lr����C�I-��alice $
alice $
alice $
alice $ hexdump -C ./top_secret.enc
00000000  9e 73 12 8f e3 75 4d 29  4d 26 3e bf 80 4e a0 c5  |.s...uM)M&amp;&gt;..N..|
00000010  7d 64 6d 43 79 39 32 23  31 58 ce 71 f3 ba 95 a6  |}dmCy92#1X.q....|
00000020  c0 c0 76 17 fb f7 bf 4d  ce fc 40 e6 f4 45 7f db  |..v....M..@..E..|
00000030  7e ae c0 31 f8 6b 10 06  7e 26 50 55 b5 05 56 68  |~..1.k..~&amp;PU..Vh|
00000040  48 4c eb 40 5e 50 fe 19  ea 28 a8 b8 7a 13 69 d7  |HL.@^P...(..z.i.|
00000050  4d b0 34 70 d8 65 d5 07  95 67 2b 52 ea 31 aa d4  |M.4p.e...g+R.1..|
00000060  80 b3 a8 ec a1 73 ed a7  f9 17 c3 13 d4 fa c1 71  |.....s.........q|
00000070  5f 38 b9 6c 07 72 81 a6  fe af 43 a6 49 2d c4 ee  |_8.l.r....C.I-..|
00000080
alice $
alice $ file top_secret.enc
top_secret.enc: data
alice $
```

It's safe to delete the original file with the secret message to remove any traces of it:


```
`alice $ rm -f top_secret.txt`
```

Now Alice needs to send this encrypted file to Bob over a network, once again, using the `scp` command to copy the file to Bob's workstation. Remember, even if the file is intercepted, its contents are encrypted, so the contents can't be revealed:


```
`alice $  scp top_secret.enc bob@bob-machine-or-ip:/path/`
```

If Bob uses the usual methods to try to open and view the encrypted message, he won't be able to read it:


```
bob $ ls -l top_secret.enc
-rw-r--r--. 1 bob bob 128 Mar 22 13:59 top_secret.enc
bob $
bob $ cat top_secret.enc
�s��uM)M&amp;&gt;��N��}dmCy92#1X�q󺕦��v���M��@��E�~��1�k~&amp;PU�VhHL�@^P��(��zi�M�4p�e��g+R�1�Ԁ���s�������q_8�lr����C�I-��bob $
bob $
bob $ hexdump -C top_secret.enc
00000000  9e 73 12 8f e3 75 4d 29  4d 26 3e bf 80 4e a0 c5  |.s...uM)M&amp;&gt;..N..|
00000010  7d 64 6d 43 79 39 32 23  31 58 ce 71 f3 ba 95 a6  |}dmCy92#1X.q....|
00000020  c0 c0 76 17 fb f7 bf 4d  ce fc 40 e6 f4 45 7f db  |..v....M..@..E..|
00000030  7e ae c0 31 f8 6b 10 06  7e 26 50 55 b5 05 56 68  |~..1.k..~&amp;PU..Vh|
00000040  48 4c eb 40 5e 50 fe 19  ea 28 a8 b8 7a 13 69 d7  |HL.@^P...(..z.i.|
00000050  4d b0 34 70 d8 65 d5 07  95 67 2b 52 ea 31 aa d4  |M.4p.e...g+R.1..|
00000060  80 b3 a8 ec a1 73 ed a7  f9 17 c3 13 d4 fa c1 71  |.....s.........q|
00000070  5f 38 b9 6c 07 72 81 a6  fe af 43 a6 49 2d c4 ee  |_8.l.r....C.I-..|
00000080
bob $
```

#### Step 5: Decrypt the file using a private key

Bob needs to do his part by decrypting the message using OpenSSL, but this time using the `-decrypt` command-line argument. He needs to provide the following information to the utility:

  1. The encrypted file (which he got from Alice)
  2. Bob's own private key (for decryption, since it was encrypted using Bob's public key)
  3. A file name to save the decrypted output to via redirection




```
bob $ openssl rsautl -decrypt -inkey bob_private.pem -in top_secret.enc &gt; top_secret.txt
Enter pass phrase for bob_private.pem:
bob $
```

Bob can now read the secret message that Alice sent him:


```
bob $ ls -l top_secret.txt
-rw-r--r--. 1 bob bob 15 Mar 22 14:02 top_secret.txt
bob $
bob $ cat top_secret.txt
vim or emacs ?
bob $
```

Bob needs to reply to Alice, so he writes his secret reply in a file:


```
bob $ echo "nano for life" &gt; reply_secret.txt
bob $
bob $ cat reply_secret.txt
nano for life
bob $
```

#### Step 6: Repeat the process with the other key

To send his message, Bob follows the same process Alice used, but since the message is intended for Alice, he uses Alice's public key to encrypt the file:


```
bob $ openssl rsautl -encrypt -inkey alice_public.pem -pubin -in reply_secret.txt -out reply_secret.enc
bob $
bob $ ls -l reply_secret.enc
-rw-r--r--. 1 bob bob 128 Mar 22 14:03 reply_secret.enc
bob $
bob $ cat reply_secret.enc
�F݇��.4"f�1��\��{o԰$�M��I{5�|�\�l͂�e��Y�V��{�|!$c^a
                                                 �*Ԫ\vQ�Ϡ9����'��ٮsP��'��Z�1W�n��k���J�0�I;P8������&amp;:bob $
bob $
bob $ hexdump -C ./reply_secret.enc
00000000  92 46 dd 87 04 bc a7 2e  34 22 01 66 1a 13 31 db  |.F......4".f..1.|
00000010  c4 5c b4 8e 7b 6f d4 b0  24 d2 4d 92 9b 49 7b 35  |.\\..{o..$.M..I{5|
00000020  da 7c ee 5c bb 6c cd 82  f1 1b 92 65 f1 8d f2 59  |.|.\\.l.....e...Y|
00000030  82 56 81 80 7b 89 07 7c  21 24 63 5e 61 0c ae 2a  |.V..{..|!$c^a..*|
00000040  d4 aa 5c 76 51 8d cf a0  39 04 c1 d7 dc f0 ad 99  |..\vQ...9.......|
00000050  27 ed 8e de d9 ae 02 73  50 e0 dd 27 13 ae 8e 5a  |'......sP..'...Z|
00000060  12 e4 9a 31 57 b3 03 6e  dd e1 16 7f 6b c0 b3 8b  |...1W..n....k...|
00000070  4a cf 30 b8 49 3b 50 38  e0 9f 84 f6 83 da 26 3a  |J.0.I;P8......&amp;:|
00000080
bob $
bob $ # remove clear text secret message file
bob $ rm -f reply_secret.txt
```

Bob sends the encrypted file back to Alice's workstation via `scp`:


```
`$ scp reply_secret.enc alice@alice-machine-or-ip:/path/`
```

Alice cannot make sense of the encrypted text if she tries to read it using normal tools:


```
alice $
alice $ ls -l reply_secret.enc
-rw-r--r--. 1 alice alice 128 Mar 22 18:01 reply_secret.enc
alice $
alice $ cat reply_secret.enc
�F݇��.4"f�1��\��{o԰$�M��I{5�|�\�l͂�e��Y�V��{�|!$c^a
                                                 �*Ԫ\vQ�Ϡ9����'��ٮsP��'��Z�1W�n��k���J�0�I;P8������&amp;:alice $
alice $
alice $
alice $ hexdump -C ./reply_secret.enc
00000000  92 46 dd 87 04 bc a7 2e  34 22 01 66 1a 13 31 db  |.F......4".f..1.|
00000010  c4 5c b4 8e 7b 6f d4 b0  24 d2 4d 92 9b 49 7b 35  |.\\..{o..$.M..I{5|
00000020  da 7c ee 5c bb 6c cd 82  f1 1b 92 65 f1 8d f2 59  |.|.\\.l.....e...Y|
00000030  82 56 81 80 7b 89 07 7c  21 24 63 5e 61 0c ae 2a  |.V..{..|!$c^a..*|
00000040  d4 aa 5c 76 51 8d cf a0  39 04 c1 d7 dc f0 ad 99  |..\vQ...9.......|
00000050  27 ed 8e de d9 ae 02 73  50 e0 dd 27 13 ae 8e 5a  |'......sP..'...Z|
00000060  12 e4 9a 31 57 b3 03 6e  dd e1 16 7f 6b c0 b3 8b  |...1W..n....k...|
00000070  4a cf 30 b8 49 3b 50 38  e0 9f 84 f6 83 da 26 3a  |J.0.I;P8......&amp;:|
00000080
alice $
```

So she decrypts the message with OpenSSL, only this time she provides her secret key and saves the output to a file:


```
alice $ openssl rsautl -decrypt -inkey alice_private.pem -in reply_secret.enc &gt; reply_secret.txt
Enter pass phrase for alice_private.pem:
alice $
alice $ ls -l reply_secret.txt
-rw-rw-r--. 1 alice alice 14 Mar 22 18:02 reply_secret.txt
alice $
alice $ cat reply_secret.txt
nano for life
alice $
```

### Learn more about OpenSSL

OpenSSL is a true Swiss Army knife utility for cryptography-related use cases. It can do many tasks besides encrypting files. You can find out all the ways you can use it by accessing the OpenSSL [docs page][4], which includes links to the manual, the _OpenSSL Cookbook_, frequently asked questions, and more. To learn more, play around with its various included encryption algorithms to see how it works.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/encryption-decryption-openssl

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_security_cc.png?itok=3V07Lpko (A secure lock.)
[2]: https://www.openssl.org/
[3]: https://www.openssl.org/docs/man1.0.2/man1/genrsa.html
[4]: https://www.openssl.org/docs/
