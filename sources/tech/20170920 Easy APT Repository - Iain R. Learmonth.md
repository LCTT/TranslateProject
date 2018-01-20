translating---geekpi

Easy APT Repository · Iain R. Learmonth
======

The [PATHspider][5] software I maintain as part of my work depends on some features in [cURL][6] and in [PycURL][7] that have [only][8] [just][9] been mereged or are still [awaiting][10] merge. I need to build a docker container that includes these as Debian packages, so I need to quickly build an APT repository.

A Debian repository can essentially be seen as a static website and the contents are GPG signed so it doesn't necessarily need to be hosted somewhere trusted (unless availability is critical for your application). I host my blog with [Netlify][11], a static website host, and I figured they would be perfect for this use case. They also [support open source projects][12].

There is a CLI tool for netlify which you can install with:
```
sudo apt install npm
sudo npm install -g netlify-cli

```

The basic steps for setting up a repository are:
```
mkdir repository
cp /path/to/*.deb repository/


cd

 repository
apt-ftparchive packages . > Packages
apt-ftparchive release . > Release
gpg --clearsign -o InRelease Release
netlify deploy

```

Once you've followed these steps, and created a new site on Netlify, you'll be able to manage this site also through the web interface. A few things you might want to do are set up a custom domain name for your repository, or enable HTTPS with Let's Encrypt. (Make sure you have `apt-transport-https` if you're going to enable HTTPS though.)

To add this repository to your apt sources:
```
gpg --export -a YOURKEYID | sudo apt-key add -


echo



"deb https://SUBDOMAIN.netlify.com/ /"

 | sudo tee -a /etc/apt/sources.list
sudo apt update

```

You'll now find that those packages are installable. Beware of [APT pinning][13] as you may find that the newer versions on your repository are not actually the preferred versions according to your policy.

**Update** : If you're wanting a solution that would be more suitable for regular use, take a look at [repropro][14]. If you're wanting to have end-users add your apt repository as a third-party repository to their system, please take a look at [this page on the Debian wiki][15] which contains advice on how to instruct users to use your repository.

**Update 2** : Another commenter has pointed out [aptly][16], which offers a greater feature set and removes some of the restrictions imposed by repropro. I've never use aptly myself so can't comment on specifics, but from the website it looks like it might be a nicely polished tool.



--------------------------------------------------------------------------------

via: https://iain.learmonth.me/blog/2017/2017w383/

作者：[Iain R. Learmonth][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://iain.learmonth.me
[1]:https://iain.learmonth.me/tags/netlify/
[2]:https://iain.learmonth.me/tags/debian/
[3]:https://iain.learmonth.me/tags/apt/
[4]:https://iain.learmonth.me/tags/foss/
[5]:https://pathspider.net
[6]:http://curl.haxx.se/
[7]:http://pycurl.io/
[8]:https://github.com/pycurl/pycurl/pull/456
[9]:https://github.com/pycurl/pycurl/pull/458
[10]:https://github.com/curl/curl/pull/1847
[11]:http://netlify.com/
[12]:https://www.netlify.com/open-source/
[13]:https://wiki.debian.org/AptPreferences
[14]:https://mirrorer.alioth.debian.org/
[15]:https://wiki.debian.org/DebianRepository/UseThirdParty
[16]:https://www.aptly.info/
