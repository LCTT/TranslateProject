FSSlc translating

# 4 Easy Ways To Generate A Strong Password In Linux

 ![Generate a strong password in Linux](https://www.ostechnix.com/wp-content/uploads/2016/11/password-720x340.jpg) 
Image Courtesy: Google.

Yesterday, We have covered how to [force users to use a strong password in DEB based systems][8]such as Debian, Ubuntu, Linux Mint, Elementary OS etc. You might wonder how a strong password looks like, and how could I create one? No worries! Here is the 4 easy ways to generate a strong password in Linux. Of course, there are many free tools and ways to accomplish this task, however I consider these methods are simple, and straightforward. Let us get started.

Download – [Free EBook: “Getting started with Ubuntu 16.04”][7]

### 1\. Generate a strong password in Linux using OpenSSL

OpenSSL is available for all Unix-like distributions, Solaris, Mac OS X, and Windows.

To generate a random password with OpenSSL, fire up your Terminal and run the following command:

```
openssl rand 14 -base64
```

Here, ‘-base64’ string will make sure the password can be typed on a keyboard.

Sample output:

```
wXCHXlxuhrFrFMQLqik=
```

[
 ![sksk_003](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_003.png) 
][6]

The above command will generate a random and strong password with length of 14 characters. Remember It is always recommend to generate 14 characters password. Of course you can generate any length of characters using openssl.

For more details, refer the man pages.

```
man openssl
```

### 2\. Generate a strong password in Linux using Pwgen

pwgen is simple, yet useful command line utility to generate a random and strong password in seconds. It designs secure passwords that can be easily memorized by humans. It is available in the most Unix-like operating systems.

To install pwgen in DEB based systems, run:

```
sudo apt-get install pwgen
```

In RPM based systems:

```
sudo yum install pwgen
```

In Arch based systems:

```
sudo pacman -S pwgen
```

Once pwgen installed, generate a random and strong password with length of 14 letters using command:

```
pwgen 14 1
```

Sample output:

```
Choo4aicozai3a
```

[
 ![sksk_004](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_004.png) 
][5]

The above command will create only one password with length of 14 characters. To create 2 different passwords with length of 14 characters, run:

```
pwgen 14 2
```

Sample output:

```
xee7seerez6Kau Aeshu0geveeji8
```

To crate 100 different passwords (Not necessary though) with length of 14 characters, run:

```
pwgen 14
```

Sample output:

```
kaeNg3EiVei4ei Oo0iehiJaix5Ae aenuv2eree2Quo iaT7zahH1eN2Aj Bie2owaiFahsie
gaan9zu5Xeh5ah ahGeeth8ea5ooh Ir0ueda5poogh5 uo0ohqu2ufaiX2 Mei0pee6Og3zae
Oofeiceer8Aipu sheew3aeReidir Dee4Heib2eim2o eig6jar8giPhae Zahde9nae1Niew
quatol5Oi3Bah2 quue4eebaiNgaa oGoahieSh5oL4m aequeeQue2piti laige5seePhugo
iiGo9Uthee4ros WievaiQu2xech6 shaeve0maaK3ae ool8Pai2eighis EPheiRiet1ohci
ZieX9outhoht8N Uh1UoPhah2Thee reaGhohZae5idi oiG4ooshiyi5in keePh1ohshei8y
aim5Eevah2thah Xaej8tha5eisho IeGie1Anaalaev gaoY3ohthooh3x chaebeesahTh8e
soh7oosieY5eiD ahmoh6Ihii6que Shoowoo5dahbah ieW0aiChubee7I Caet6aikai6aex
coo1du2Re9aika Ohnei5Egoh7leV aiyie6Ahdeipho EiV0aeToeth1da iNgaesu4eeyu0S
Eeb1suoV3naera railai2Vaina8u xu3OhVee1reeyu Og0eavae3oohoh audahneihaeK8a
foo6iechi5Eira oXeixoh6EwuboD we1eiDahNgoh9s ko1Eeju1iedu1z aeP7achiisohr7
phang5caeGei5j ait4Shuo5Aitai no4eis9Tohd8oh Quiet6oTaaQuei Dei2pu2NaefeCa
Shiim9quiuy0ku yiewooph3thieL thu8Aphai1ieDa Phahnahch1Aam1 oocex7Yaith8oo
eraiGaech5ahNg neixa3malif5Ya Eux7chah8ahXix eex1lahXae4Mei uGhahzonu6airu
yah8uWahn3jeiW Yi4ye4Choongie io1Vo3aiQuahpi rie4Rucheet6ae Dohbieyaeleis5
xi1Zaushohbei7 jeeb9EiSiech0u eewo0Oow7ielie aiquooZamah5th kouj7Jaivohx9o
biyeeshesaDi9e she9ooj3zuw6Ah Eit7dei1Yei5la xohN0aeSheipaa Eeg9Phob6neema
eengoneo4saeL4 aeghi4feephu6W eiWash2Vie1mee chieceish5ioPe ool4Hongo7ef1o
jahBe1pui9thou eeV2choohoa4ee Ohmae0eef4ic8I Eet0deiyohdiew Ke9ue5thohzei3
aiyoxeiva8Maih gieRahgh8anahM ve2ath9Eyi5iet quohg6ok3Ahgee theingaech5Nef
```

[
 ![sksk_005](https://www.ostechnix.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][4]

To include at least 1 number in the password run:

```
pwgen 14 1 -n 1
```

Sample output:

```
xoiFush3ceiPhe
```

There are also some useful options available to use with pwgen command.

```
 -c or --capitalize (Include at least one capital letter in the password)

 -A or --no-capitalize (Don't include capital letters in the password)

 -n or --numerals (Include at least one number in the password)

 -0 or --no-numerals (Don't include numbers in the password)

 -y or --symbols (Include at least one special symbol in the password)

 -s or --secure (Generate completely random passwords)

 -B or --ambiguous (Don't include ambiguous characters in the password)
 -h or --help (Print a help message)

 -H or --sha1=path/to/file[#seed] (Use sha1 hash of given file as a (not so) random generator)
 -C (Print the generated passwords in columns)

 -1 (Don't print the generated passwords in columns)

 -v or --no-vowels (Do not use any vowels so as to avoid accidental nasty words)
```

For more details, check the man pages.

```
man pwgen
```

### 3\. Generate a strong password in Linux using GPG

GPG (GnuPG or GNU Privacy Guard), is free command-line program and replacement of Symantec’s PGP cryptographic software. It is available for Unix-like operating systems, Microsoft Windows and Android versions.

To generate a random and strong password with length of 14 characters using GPG, run the following command from the Terminal:

```
 gpg --gen-random --armor 1 14
```

Sample output:

```
DkmsrUy3klzzbIbavx8=
```

[
 ![sksk_006](https://www.ostechnix.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][3]

The above command will generate a secure, random, strong and base64 encoded password.

### 4\. Generate a strong password in Linux using Perl

Perl is available in the most Linux distribution’s default repositories. Install it using the package manager.

For example, to install Perl on DEB based systems run:

```
sudo apt-get install perl
```

To install Perl on RPM based systems, run:

```
sudo yum install perl
```

On Arch based systems:

```
sudo pacman -S perl
```

Once Perl installed, create a file:

```
vi password.pl
```

Add the following contents in it.

```
#!/usr/bin/perl

my @alphanumeric = ('a'..'z', 'A'..'Z', 0..9);
my $randpassword = join '', map $alphanumeric[rand @alphanumeric], 0..8;
print "$randpassword\n"
```

[
 ![sksk_001](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_001.png) 
][2]

Save and close the file.

Now, go to the location where you saved the file, and run the following command:

```
perl password.pl
```

Replace password.pl with your own filename.

Sample output:

```
3V4CJJnYd
```

[
 ![sksk_002](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_002.png) 
][1]

Note: I couldn’t find the original author of this script. If anyone know the author’s name, please let me know in the comment section below. I will add the author name in this guide.

Please note that you must memorize or keep the passwords you have generated in a safe place in your computer. I recommend you to memorize the password and delete it from your system. It is much better in case your system is compromised by any hackers.

That’s all for today folks. I will here with another interesting article soon. Until then, stay tuned with OSTechNix.

Happy Weekend!

Cheers!!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/4-easy-ways-to-generate-a-strong-password-in-linux/

作者：[ SK ][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_002.png
[2]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_001.png
[3]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_006.png
[4]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_005.png
[5]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_004.png
[6]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_003.png
[7]:http://ostechnix.tradepub.com/free/w_ubun08/prgm.cgi?a=1
[8]:https://www.ostechnix.com/force-users-use-strong-passwords-debian-ubuntu/
