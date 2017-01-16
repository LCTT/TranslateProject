translating---geekpi

Block Ads on All Your Devices at Home with Pi-hole and an Orange Pi
============================================================


Do you find it irritating having to set up an ad blocker on your computer web browsers, smart phones, and tablets? I sure do.  And then there are some ‘smart’ devices at home that don’t appear to have ad blocking software of any kind.  Well, I learned about [Pi-hole][2] which is ad blocking software for your pi board and it blocks all the advertisements on your home network before they get to your various devices.  It gives you the ability to black list or white list any domain, plus it has a great dashboard that gives you insights into your home network’s most accessed domains/web sites, most active devices, and most frequent advertisers.

Pi-hole was really targeted to run on the Raspberry Pi but I wanted to know if it would work on my inexpensive Orange Pi running Armbian Linux. Well, it absolutely does! Below is my process for getting Pi-hole up and running quickly.

### Installing Pi-hole

Installing Pi-hole is done using the terminal, so open a terminal on your Orange Pi’s desktop or ssh into the pi board.

You will be downloading the software, so navigate to a directory of your choosing, making sure that you have write privileges. Like this:

```
cd <your preferred directory>/
```

I deviated from the “one command” installation on the Pi-hole home page. I mean, they do say right underneath that command that “piping to bash can be dangerous” and that a local install is “safer.” So, here’s my local installation steps:

```
git clone --depth 1 https://github.com/pi-hole/pi-hole.git Pi-hole
cd Pi-hole/automated\ install/
./basic-install.sh
```

If you are not logged in as the root user, then the basic-install script will prompt you to enter your password before continuing. If needed, the script will download and install some prerequisite Linux packages. Then it’ll provide you with a simple blue/red graphical interface, prompting you to answer a few questions about how you want Pi-hole configured. In my experience, simply accepting the defaults was fine and I later discovered that the Pi-hole web application enables you to change settings like DNS provider.

The script will tell you what the password is for Pi-hole both in the graphical interface and in the terminal. Do take note of that password!

The script will also tell you the web address for Pi-hole, which should be like this:

```
http://<your pi’s IP address>/admin
```

or even something like:

```
http://orangepipc/admin
```

You will need enter your Pi-hole password, and then you should get a nice dashboard that looks something like this:

 ![Ph-hole](https://i1.wp.com/piboards.com/wp-content/uploads/2017/01/ph-hole.png?resize=640%2C532) 

Remember to change the DNS setting on your home network router so it that uses the address of your pi board. Otherwise, the ads won’t be filtered!

The instructions above are more or less the same as the alternative “safe” method as provided by the Pi-hole web site despite the fact that Armbian is not listed as an officially supported operating system. I believe that these instructions should work on a Raspberry Pi or other pi board running some form of Debian based Linux operating system. However, I haven’t tested that and I would be interested to hear your experience (just drop me a brief comment, please).


### Thoughts and Observations

After running Pi-hole for a while an studying the information in the Pi-hole dashboard, I found that there was a lot more network activity going on than I was aware of, not all of which did I approve of. For example, there were some ‘interesting’ connections going out from my kid’s devices related to game apps that I wonder about, plus social networking apps were apparently sending some data continuously which bothered me. Altogether, whether it was benign traffic or not, I was glad to reduce the traffic load even if by a little…I mean, why should I be content to allow apps and ads to eat up my network traffic for things I don’t want or care about? Well, now they are blocked. Period.

Setting up an Orange Pi for ad blocking like this is cheap, easy, and helps to put my mind at ease about limiting some unwanted traffic to/from my home network (especially where the kids are involved). If you are interested, you can see my previous post about how to [easily setting up an Orange Pi][3] and check out how cheap the Orange Pis are at the links below.  I believe that it is a worthwhile investment.

 Orange Pi on Amazon (affiliate link):  [Orange Pi PC Single Board Computer Quad Core ARM Cortex-A7 1GB DDR3 4K Decode][4]

 [Orange Pi store on AliExpress][5] (affiliate link).

EDIT:  The irony of this post is that if you successfully set up Pi-hole, then affiliate links on this site (s.click.aliexpress.com) gets blocked.  White list that if you like, you are in control.

--------------------------------------------------------------------------------

via: http://piboards.com/2017/01/07/block-ads-on-all-your-devices-at-home-with-pi-hole-and-an-orange-pi/

作者：[MIKE WILMOTH][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://piboards.com/author/piguy/
[1]:http://s.click.aliexpress.com/deep_link.htm?aff_short_key=N3VJQBY&dl_target_url=http://best.aliexpress.com
[2]:https://pi-hole.net/
[3]:http://piboards.com/2017/01/04/easy-set-up-orange-pi/
[4]:https://www.amazon.com/gp/product/B018W6OTIM/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B018W6OTIM&linkCode=as2&tag=piboards-20&linkId=ac292a536d58eabf1ee73e2c575e1111
[5]:http://s.click.aliexpress.com/e/bAMVj2R
