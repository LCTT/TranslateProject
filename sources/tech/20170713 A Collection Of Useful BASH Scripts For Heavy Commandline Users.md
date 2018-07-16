A Collection Of Useful BASH Scripts For Heavy Commandline Users
======

![](https://www.ostechnix.com/wp-content/uploads/2017/07/A-Collection-Of-Useful-BASH-Scripts-720x340.png)

Today, I have stumbled upon a collection of useful BASH scripts for heavy commandline users. These scripts, known as **Bash-Snippets** , might be quite helpful for those who live in Terminal all day. Want to check the weather of a place where you live? This script will do that for you. Wondering what is the Stock price? You can run the script that displays the current details of a stock. Feel bored? You can watch some youtube videos. All from commandline. You don’t need to install any heavy memory consumable GUI applications.

As of writing this, Bash-Snippets provides the following 19 useful tools:

  1. **Cheat** – Linux Commands cheat sheet.
  2. **Cloudup** – A tool to backup your GitHub repositories to bitbucket.
  3. **Crypt** – Encrypt and decrypt files.
  4. **Cryptocurrency** – Converts Cryptocurrency based on realtime exchange rates of the top 10 cryptos.
  5. **Currency** – Currency converter.
  6. **Geo** – Provides the details of wan, lan, router, dns, mac, and ip.
  7. **Lyrics** – Grab lyrics for a given song quickly from the command line.
  8. **Meme** – Command line meme creator.
  9. **Movies** – Search and display a movie details.
  10. **Newton** – Performs numerical calculations all the way up to symbolic math parsing.
  11. **Qrify** – Turns the given string into a qr code.
  12. **Short** – URL Shortner
  13. **Siteciphers** – Check which ciphers are enabled / disabled for a given https site.
  14. **Stocks** – Provides certain Stock details.
  15. **Taste** – Recommendation engine that provides three similar items like the supplied item (The items can be books, music, artists, movies, and games etc).
  16. **Todo** – Command line todo manager.
  17. **Transfer** – Quickly transfer files from the command line.
  18. **Weather** – Displays weather details of your place.
  19. **Youtube-Viewer** – Watch YouTube from Terminal.



The author might add more utilities and/or features in future, so I recommend you to keep an eye on the project’s website or GitHub page for future updates.

### Bash-Snippets – A Collection Of Useful BASH Scripts For Heavy Commandline Users

#### Installation

You can install these scripts on any OS that supports BASH.

First, clone the GIT repository using command:
```
$ git clone https://github.com/alexanderepstein/Bash-Snippets

```

Go to the cloned directory:
```
$ cd Bash-Snippets/

```

Git checkout to the latest stable release:
```
$ git checkout v1.22.0

```

Finally, install the Bash-Snippets using command:
```
$ sudo ./install.sh

```

This will ask you which scripts to install. Just type **Y** and press ENTER key to install the respective script. If you don’t want to install a particular script, type **N** and hit ENTER.
```
Do you wish to install currency [Y/n]: y

```

To install all scripts, run:
```
$ sudo ./install.sh all

```

To install a specific script, say currency, run:
```
$ sudo ./install.sh currency

```

You can also install it using [**Linuxbrew**][1] package manager.

To installs all tools, run:
```
$ brew install bash-snippets

```

To install specific tools:
```
$ brew install bash-snippets --without-all-tools --with-newton --with-weather

```

Also, there is a PPA for Debian-based systems such as Ubuntu, Linux Mint.
```
$ sudo add-apt-repository ppa:navanchauhan/bash-snippets
$ sudo apt update
$ sudo apt install bash-snippets

```

#### Usage

**An active Internet connection is required** to use these tools. The usage is fairly simple. Let us see how to use some of these scripts. I assume you have installed all scripts.

**1\. Currency – Currency Converter**

This script converts the currency based on realtime exchange rates. Enter the base currency code and the currency to exchange to, and the amount being exchanged one by one as shown below.
```
$ currency
What is the base currency: INR
What currency to exchange to: USD
What is the amount being exchanged: 10

=========================
| INR to USD
| Rate: 0.015495
| INR: 10
| USD: .154950
=========================

```

You can also pass all arguments in a single command as shown below.
```
$ currency INR USD 10

```

Refer the following screenshot.

[![Bash-Snippets][2]][3]

**2\. Stocks – Display stock price details**

If you want to check a stock price details, mention the stock item as shown below.
```
$ stocks Intel

INTC stock info
=============================================
| Exchange Name: NASDAQ
| Latest Price: 34.2500
| Close (Previous Trading Day): 34.2500
| Price Change: 0.0000
| Price Change Percentage: 0.00%
| Last Updated: Jul 12, 4:00PM EDT
=============================================

```

The above output the **Intel stock** details.

**3\. Weather – Display Weather details**

Let us check the Weather details by running the following command:
```
$ weather

```

**Sample output:**

![][4]

As you see in the above screenshot, it provides the 3 day weather forecast. Without any arguments, it will display the weather details based on your IP address. You can also bring the weather details of a particular city or country like below.
```
$ weather Chennai

```

Also, you can view the moon phase by entering the following command:
```
$ weather moon

```

Sample output would be:

![][5]

**4\. Crypt – Encrypt and Decrypt files**

This script is a wrapper for openssl that allows you to encrypt and decrypt files quickly and easily.

To encrypt a file, use the following command:
```
$ crypt -e [original file] [encrypted file]

```

For example, the following command will encrypt a file called **ostechnix.txt** , and save it as **encrypt_ostechnix.txt **in the current working directory.
```
$ crypt -e ostechnix.txt encrypt_ostechnix.txt

```

Enter the password for the file twice.
```
Encrypting ostechnix.txt...
enter aes-256-cbc encryption password:
Verifying - enter aes-256-cbc encryption password:
Successfully encrypted

```

The above command will encrypt the given file using **AES 256 level encryption**. The password will not be saved in plain text. You can encrypt .pdf, .txt, .docx, .doc, .png, .jpeg type files.

To decrypt the file, use the following command:
```
$ crypt -d [encrypted file] [output file]

```

Example:
```
$ crypt -d encrypt_ostechnix.txt ostechnix.txt

```

Enter the password to decrypt.
```
Decrypting encrypt_ostechnix.txt...
enter aes-256-cbc decryption password:
Successfully decrypted

```

**5\. Movies – Find Movie details**

Using this script, you can find a movie details.

The following command displays the details of a movie called “mother”.
```
$ movies mother

==================================================
| Title: Mother
| Year: 2009
| Tomato: 95%
| Rated: R
| Genre: Crime, Drama, Mystery
| Director: Bong Joon Ho
| Actors: Hye-ja Kim, Bin Won, Goo Jin, Je-mun Yun
| Plot: A mother desperately searches for the killer who framed her son for a girl's horrific murder.
==================================================

```

**6\. Display similar items like the supplied item**

To use this script, you need to get the API key **[here][6]**. No worries, it is completely FREE! Once the you got the API, add the following line to your **~/.bash_profile** : **export TASTE_API_KEY=”yourAPIKeyGoesHere”**``

Now, you can view the similar item like the supplied item as shown below:
```
$ taste -i Red Hot Chilli Peppers

```

**7\. Short – Shorten URLs**

This script shortens the given URL.
```
$ short <URL>

```

**8\. Geo – Display the details of your network**

This script helps you to find out the details of your network, such as wan, lan, router, dns, mac, and ip geolocation.

For example, to find out your LAN ip, run:
```
$ geo -l

```

Sample output from my system:
```
192.168.43.192

```

To find your Wan IP:
```
$ geo -w

```

For more details, just type ‘geo’ in the Terminal.
```
$ geo
Geo
Description: Provides quick access for wan, lan, router, dns, mac, and ip geolocation data
Usage: geo [flag]
 -w Returns WAN IP
 -l Returns LAN IP(s)
 -r Returns Router IP
 -d Returns DNS Nameserver
 -m Returns MAC address for interface. Ex. eth0
 -g Returns Current IP Geodata
Examples:
 geo -g
 geo -wlrdgm eth0
Custom Geo Output =>
[all] [query] [city] [region] [country] [zip] [isp]
Example: geo -a 8.8.8.8 -o city,zip,isp
 -o [options] Returns Specific Geodata
 -a [address] For specific ip in -s
 -v Returns Version
 -h Returns Help Screen
 -u Updates Bash-Snippets

```

**9\. Cheat – Display cheatsheets of Linux commands**

Want to refer the cheatsheet of Linux command? Well, it is also possible. The following command will display the cheatsheet of **curl** command:
```
$ cheat curl

```

Just replace **curl** with the command of your choice to display its cheatsheet. This can be very useful for the quick reference to any command you want to use.

**10\. Youtube-Viewer – Watch YouTube videos**

Using this script, you can search or watch youtube videos right from the Terminal.

Let us watch some **Ed Sheeran** videos.
```
$ ytview Ed Sheeran

```

Choose the video you want to play from the list. The selected will play in your default media player.

![][7]

To view recent videos by an artist, you can use:
```
$ ytview -c [channel name]

```

To search for videos, just enter:
```
$ ytview -s [videoToSearch]

```

or just,
```
$ ytview [videoToSearch]

```

**11\. cloudup – Backup GitHub repositories to bitbucket**

Have you hosted any project on GitHub? Great! You can backup the GitHub repositories to **bitbucket** , a web-based hosting service used for source code and development projects, at any time.

You can either backup all github repositories of the designated user at once with the **-a** option. Or run it with no flags and backup individual repositories.

To backup GitHub repository, run:
```
$ cloudup

```

You will be asked to enter your GitHub username, name of the repository to backup, and bitbucket username and password etc.

**12\. Qrify – Convert Strings into QR code**

This script converts any given string of text into a QR code. This is useful for sending links or saving a string of commands to your phone
```
$ qrify convert this text into qr code

```

Sample output would be:

![][8]

Cool, isn’t it?

**13\. Cryptocurrency**

It displays the top ten cryptocurrencies realtime exchange rates.

Type the following command and hit ENTER to run it:
```
$ cryptocurrency

```

![][9]

**14\. Lyrics**

This script grabs the lyrics for a given song quickly from the command line.

Say for example, I am going to fetch the lyrics of **“who is it”** song, a popular song sung by **Michael Jackson**.
```
$ lyrics -a michael jackson -s who is it

```

![][10]

**15\. Meme**

This script allows you to create simple memes from command line. It is quite faster than GUI-based meme generators.

To create a meme, just type:
```
$ meme -f mymeme
Enter the name for the meme's background (Ex. buzz, doge, blb ): buzz
Enter the text for the first line: THIS IS A
Enter the text for the second line: MEME

```

This will create jpg file in your current working directory.

**16\. Newton**

Tired of solving complex Maths problems? Here you go. The Newton script will perform numerical calculations all the way up to symbolic math parsing.

![][11]

**17\. Siteciphers**

This script helps you to check which ciphers are enabled / disabled for a given https site.
```
$ siteciphers google.com

```

![][12]

**18\. Todo**

It allows you to create everyday tasks directly from the Terminal.

Let us create some tasks.
```
$ todo -a The first task
01). The first task Tue Jun 26 14:51:30 IST 2018

```

To add another task, simply re-run the above command with the task name.
```
$ todo -a The second task
01). The first task Tue Jun 26 14:51:30 IST 2018
02). The second task Tue Jun 26 14:52:29 IST 2018

```

To view the list of tasks, run:
```
$ todo -g
01). The first task Tue Jun 26 14:51:30 IST 2018
02). A The second task Tue Jun 26 14:51:46 IST 2018

```

Once you completed a task, remove it from the list as shown below.
```
$ todo -r 2
Sucessfully removed task number 2
01). The first task Tue Jun 26 14:51:30 IST 2018

```

To clear all tasks, run:
```
$ todo -c
Tasks cleared.

```

**19\. Transfer**

The transfer script allows you to quickly and easily transfer files and directories over Internet.

Let us upload a file.
```
$ transfer test.txt
Uploading test.txt
################################################################################################################################################ 100.0%
Success!
Transfer Download Command: transfer -d desiredOutputDirectory ivmfj test.txt
Transfer File URL: https://transfer.sh/ivmfj/test.txt

```

The file will be uploaded to transfer.sh site. Transfer.sh allows you to upload files up to **10 GB** in one go. All shared files automatically expire after **14 days**. As you can see, anyone can download the file either by visiting the second URL via a web browser or using the transfer command (it is installed in his/her system, of course).

Now remove the file from your system.
```
$ rm -fr test.txt

```

Now, you can download the file from transfer.sh site at any time (within 14 days) like below.
```
$ transfer -d Downloads ivmfj test.txt

```

For more details about this utility, refer our following guide.

##### Getting help

If you don’t know how to use a particular script, just type that script’s name and press ENTER. You will see the usage details. The following example displays the help section of **Qrify** script.
```
$ qrify
Qrify
Usage: qrify [stringtoturnintoqrcode]
Description: Converts strings or urls into a qr code.
 -u Update Bash-Snippet Tools
 -m Enable multiline support (feature not working yet)
 -h Show the help
 -v Get the tool version
Examples:
 qrify this is a test string
 qrify -m two\\nlines
 qrify github.com # notice no http:// or https:// this will fail

```

#### Updating scripts

You can update the installed tools at any time suing -u option. The following command updates “weather” tool.
```
$ weather -u

```

#### Uninstall

You can uninstall these tools as shown below.

Git clone the repository:
```
$ git clone https://github.com/alexanderepstein/Bash-Snippets

```

Go to the Bash-Snippets directory:
```
$ cd Bash-Snippets

```

And uninstall the scripts by running the following command:
```
$ sudo ./uninstall.sh

```

Type **y** and hit ENTER to remove each script.
```
Do you wish to uninstall currency [Y/n]: y

```

**Also read: **

And, that’s all for now folks. I must admit that I’m very impressed when testing this scripts. I really liked the idea of combing all useful scripts into a single package. Kudos to the developer. Give it a try, you won’t be disappointed.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/collection-useful-bash-scripts-heavy-commandline-users/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
[3]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk_001.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk_002-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk_003.png
[6]:https://tastedive.com/account/api_access
[7]:http://www.ostechnix.com/wp-content/uploads/2017/07/ytview-1.png
[8]:http://www.ostechnix.com/wp-content/uploads/2017/07/sk@sk_005.png
[9]:http://www.ostechnix.com/wp-content/uploads/2017/07/cryptocurrency.png
[10]:http://www.ostechnix.com/wp-content/uploads/2017/07/lyrics.png
[11]:http://www.ostechnix.com/wp-content/uploads/2017/07/newton.png
[12]:http://www.ostechnix.com/wp-content/uploads/2017/07/siteciphers.png
