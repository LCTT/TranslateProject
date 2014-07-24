How to manage DigitalOcean VPS droplets from the command line on Linux
================================================================================
[DigitalOcean][1] is one of the [hottest][2] new kids in the block in the cloud VPS hosting market. While not offering as comprehensive service portfolio as Amazon Web Services and the likes, DigitalOcean is already a strong contender for the best Linux-based cloud VPS service targeted at small businesses and developers, thanks to their competitive pricing and user-friendly management interface.

![](https://farm4.staticflickr.com/3841/14501627500_2ef275ac1c_z.jpg)

Whenever you need a web-facing server for your personal project, you can quickly spin up a "droplet" (nickname for a VPS instance at [DigitalOcean][3]). And kill it when it's not needed. No need to burn a hole in your pocket as you are charged for its up time. While DigitalOcean's web-based management interface is streamlined already, for those of you who are die-hard fans of command-line interface (CLI), there is a CLI-based droplet management tool called [Tugboat][4]. Thanks to this CLI tool, any complex droplet management task can easily be turned into a script.

In this tutorial, I am going to describe **how to use Tugboat to manage DigitalOcean dropets from the command line**.

### Install Tugboat on Linux ###

To install Tugboat on Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install ruby-dev
    $ sudo gem install tugboat 

To install Tugboat on Fedora:

    $ sudo yum install ruby-devel
    $ sudo gem install tugboat 

To install Tugboat on CentOS, first [install or upgrade to the latest Ruby][5], because on CentOS 6.5 and earlier, the default Ruby does not meet the minimum version requirement (1.9 and higher) for Tugboat. Once you install Ruby 1.9 and higher, install Tugboat as follows.

    $ sudo gem install tugboat 

### Configure Tugboat for the First Time ###

After installation, it's time to go through one-time configuration, which involves authorizing Tugboat to access your DigitalOcean account.

Go to [https://cloud.digitalocean.com/api_access][6], and create a new API key. Make a note of client ID and API key.

![](https://farm4.staticflickr.com/3836/14688299215_fd282a0142_z.jpg)

Start authorization process by running:

    $ tugboat authorize 

When prompted, enter your client ID and API key. It will ask you several other questions. You can accept default answers for now. We are going to customize the default settings later anyway.

[![](https://farm6.staticflickr.com/5596/14685122101_dba50fc86b_z.jpg)][7]

Now let's customize default droplet settings to reflect your typical use cases. For that, first check available droplet offerings (e.g., available images, regions, sizes).

Running the command below will show you a list of available droplet images. Pick a default image to use, and make a note of the corresponding ID.

    $ tugboat images --global 

![](https://farm3.staticflickr.com/2900/14688299175_e77e74fa1e_z.jpg)

Similarly, pick a default geographic location from available regions:

    $ tugboat regions

Also, choose a default droplet size from available RAM sizes:

    $ tugboat sizes 

![](https://farm4.staticflickr.com/3858/14501661238_4304e8bdfb_o.png)

Now put your default choices in ~/.tugboat. For example, here I customize my default settings to 512MB Ubuntu 14.04 x64 to be created in New York region. Set "ssh_user" to root if you want to enable SSH via key authentication, which will be described shortly.

    $ vi ~/.tugboat 

----------

    ---
    authentication:
      client_key: XXXXXXXXXXXXXXXXXXX
      api_key: XXXXXXXXXXXXXXXXXXXX
    ssh:
      ssh_user: root
      ssh_key_path: /home/dev/.ssh/id_rsa
      ssh_port: '22'
    defaults:
      region: '4'
      image: '3240036'
      size: '66'
      ssh_key: ''
      private_networking: 'false'
      backups_enabled: 'false'

### Create and Add SSH Key to DigitalOcean ###

A secure way to access your droplet instance is to SSH to the instance via [key authentication][8].

In fact, you can automatically enable key authentication for your droplets by registering your SSH public key with [DigitalOcean][9]. Here is how to do it.

First, generate a private/public SSH key pair (if you don't have one).

    $ ssh-keygen -t rsa -C "your@emailaddress.com"

Assuming that the generated key pair consists of: ~/.ssh/id_rsa (private key) and ~/.ssh/id_rsa.pub (public key), go ahead and upload your public key by running:

    $ tugboat add-key [name-of-your-key] 

You can give your key any name you like (e.g., "my-default-key"). When prompted, enter the path to your public key (e.g., /home/user/.ssh/id_rsa.pub). After key uploading is completed, verify the key is successfully added by running:

    $ tugboat keys 

![](https://farm4.staticflickr.com/3869/14501853397_3d3f4365b1_z.jpg)

The key should also appear in DigitalOcean's [SSH key page][10]. If you want the key to be automatically used for your droplets, add the ID of your key to ~/.tugboat.

    ssh_key: '182710'

### Basic Usage of Tugboat ###

Here are a few basic use cases of tugboat command line.

1. Create a new droplet with default settings.

    $ tugboat create <name-of-droplet>

2. Show a list of all active droplets.

    $ tugboat droplets

3. Display information about a droplet.

    $ tugboat info <name-of-droplet> 

[![](https://farm6.staticflickr.com/5593/14501627440_5835506d2a_z.jpg)][11]

4. Shutdown a droplet, and remove its image.

    $ tugboat destroy <name-of-droplet>

5. Shutdown a droplet, but keep its image

    $ tugboat halt <name-of-droplet>

6. Take a snapshot of a droplet. The droplet must be turned off first.

    $ tugboat snapshot <snapshot-name> <name-of-droplet>

7. Resize (increase or decrease the RAM size of) a droplet. The droplet must be shutdown first.

    $ tugboat resize <name-of-droplet> -s <image-id> 

If you want to know more about a particular command option, run:

    $ tugboat help <command> 

![](https://farm4.staticflickr.com/3900/14688013322_4fa6080c5e_z.jpg)

### Troubleshooting ###

1. When I run tugboat command, it fails with the following error.

    /usr/lib/ruby/site_ruby/1.8/rubygems/custom_require.rb:31:in `gem_original_require': /usr/lib/ruby/gems/1.8/gems/tugboat-0.2.0/lib/tugboat/cli.rb:12: syntax error, unexpected ':', expecting kEND (SyntaxError)

Tugboat requires Ruby 1.9 and higher. You need to upgrade Ruby to solve this problem. For CentOS, refer to [this tutorial][12].

2. When I try to install Tugboat with gem, I get the following error.

/usr/local/share/ruby/site_ruby/rubygems/core_ext/kernel_require.rb:55:in `require': cannot load such file -- json/pure (LoadError)

Install the following gem to fix the problem.

    $ sudo gem install json_pure 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/manage-digitalocean-vps-droplets-command-line-linux.html

原文作者：[Dan Nanni][a]

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/go/digitalocean
[2]:http://news.netcraft.com/archives/2013/12/11/digitalocean-now-growing-faster-than-amazon.html
[3]:http://xmodulo.com/go/digitalocean
[4]:https://github.com/pearkes/tugboat
[5]:http://ask.xmodulo.com/upgrade-ruby-centos.html
[6]:https://cloud.digitalocean.com/api_access
[7]:https://www.flickr.com/photos/xmodulo/14685122101/
[8]:http://xmodulo.com/2012/04/how-to-enable-ssh-login-without.html
[9]:http://xmodulo.com/go/digitalocean
[10]:https://cloud.digitalocean.com/ssh_keys
[11]:https://www.flickr.com/photos/xmodulo/14501627440/
[12]:http://ask.xmodulo.com/upgrade-ruby-centos.html