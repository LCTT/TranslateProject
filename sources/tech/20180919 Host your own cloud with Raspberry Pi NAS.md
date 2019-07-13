[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Host your own cloud with Raspberry Pi NAS)
[#]: via: (https://opensource.com/article/18/9/host-cloud-nas-raspberry-pi?extIdCarryOver=true)
[#]: author: (Manuel Dewald https://opensource.com/users/ntlx)

Host your own cloud with Raspberry Pi NAS
======

Protect and secure your data with a self-hosted cloud powered by your Raspberry Pi.

![Tree clouds][1]

In the first two parts of this series, we discussed the [hardware and software fundamentals][2] for building network-attached storage (NAS) on a Raspberry Pi. We also put a proper [backup strategy][3] in place to secure the data on the NAS. In this third part, we will talk about a convenient way to store, access, and share your data with [Nextcloud][4].

![Raspberry Pi NAS infrastructure with Nextcloud][6]

### Prerequisites

To use Nextcloud conveniently, you have to meet a few prerequisites. First, you should have a domain you can use for the Nextcloud instance. For the sake of simplicity in this how-to, we'll use **nextcloud.pi-nas.com**. This domain should be directed to your Raspberry Pi. If you want to run it on your home network, you probably need to set up dynamic DNS for this domain and enable port forwarding of ports 80 and 443 (if you go for an SSL setup, which is highly recommended; otherwise port 80 should be sufficient) from your router to the Raspberry Pi.

You can automate dynamic DNS updates from the Raspberry Pi using [ddclient][7].

### Install Nextcloud

To run Nextcloud on your Raspberry Pi (using the setup described in the [first part][2] of this series), install the following packages as dependencies to Nextcloud using **apt**.

```
sudo apt install unzip wget php apache2 mysql-server php-zip php-mysql php-dom php-mbstring php-gd php-curl
```

The next step is to download Nextcloud. [Get the latest release's URL][8] and copy it to download via **wget** on the Raspberry Pi. In the first article in this series, we attached two disk drives to the Raspberry Pi, one for current data and one for backups. Install Nextcloud on the data drive to make sure data is backed up automatically every night.
```
sudo mkdir -p /nas/data/nextcloud
sudo chown pi /nas/data/nextcloud
cd /nas/data/
wget <https://download.nextcloud.com/server/releases/nextcloud-14.0.0.zip> -O /nas/data/nextcloud.zip
unzip nextcloud.zip
sudo ln -s /nas/data/nextcloud /var/www/nextcloud
sudo chown -R www-data:www-data /nas/data/nextcloud
```

When I wrote this, the latest release (as you see in the code above) was 14. Nextcloud is under heavy development, so you may find a newer version when installing your copy of Nextcloud onto your Raspberry Pi.

### Database setup

When we installed Nextcloud above, we also installed MySQL as a dependency to use it for all the metadata Nextcloud generates (for example, the users you create to access Nextcloud). If you would rather use a Postgres database, you'll need to adjust some of the modules installed above.

To access the MySQL database as root, start the MySQL client as root:

```
sudo mysql
```

This will open a SQL prompt where you can insert the following commands—substituting the placeholder with the password you want to use for the database connection—to create a database for Nextcloud.
```
CREATE USER nextcloud IDENTIFIED BY '<insert-password-here>';
CREATE DATABASE nextcloud;
GRANT ALL ON nextcloud.* TO nextcloud;
```


You can exit the SQL prompt by pressing **Ctrl+D** or entering **quit**.

### Web server configuration

Nextcloud can be configured to run using Nginx or other web servers, but for this how-to, I decided to go with the Apache web server on my Raspberry Pi NAS. (Feel free to try out another alternative and let me know if you think it performs better.)

To set it up, configure a virtual host for the domain you created for your Nextcloud instance **nextcloud.pi-nas.com**. To create a virtual host, create the file **/etc/apache2/sites-available/001-nextcloud.conf** with content similar to the following. Make sure to adjust the ServerName to your domain and paths, if you didn't use the ones suggested earlier in this series.
```
<VirtualHost *:80>
ServerName nextcloud.pi-nas.com
ServerAdmin [admin@pi-nas.com][9]
DocumentRoot /var/www/nextcloud/

<Directory /var/www/nextcloud/>
AllowOverride None
</Directory>
</VirtualHost>
```


To enable this virtual host, run the following two commands.
```
a2ensite 001-nextcloud
sudo systemctl reload apache2
```


With this configuration, you should now be able to reach the web server with your domain via the web browser. To secure your data, I recommend using HTTPS instead of HTTP to access Nextcloud. A very easy (and free) way is to obtain a [Let's Encrypt][10] certificate with [Certbot][11] and have a cron job automatically refresh it. That way you don't have to mess around with self-signed or expiring certificates. Follow Certbot's simple how-to [instructions to install it on your Raspberry Pi][12]. During Certbot configuration, you can even decide to automatically forward HTTP to HTTPS, so visitors to **<http://nextcloud.pi-nas.com>** will be redirected to **<https://nextcloud.pi-nas.com>**. Please note, if your Raspberry Pi is running behind your home router, you must have port forwarding enabled for ports 443 and 80 to obtain Let's Encrypt certificates.

### Configure Nextcloud

The final step is to visit your fresh Nextcloud instance in a web browser to finish the configuration. To do so, open your domain in a browser and insert the database details from above. You can also set up your first Nextcloud user here, the one you can use for admin tasks. By default, the data directory should be inside the Nextcloud folder, so you don't need to change anything for the backup mechanisms from the [second part of this series][3] to pick up the data stored by users in Nextcloud.

Afterward, you will be directed to your Nextcloud and can log in with the admin user you created previously. To see a list of recommended steps to ensure a performant and secure Nextcloud installation, visit the Basic Settings tab in the Settings page (in our example: <https://nextcloud.pi-nas.com/>settings/admin) and see the Security & Setup Warnings section.

Congratulations! You've set up your own Nextcloud powered by a Raspberry Pi. Go ahead and [download a Nextcloud client][13] from the Nextcloud page to sync data with your client devices and access it offline. Mobile clients even provide features like instant upload of pictures you take, so they'll automatically sync to your desktop PC without wondering how to get them there.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/host-cloud-nas-raspberry-pi?extIdCarryOver=true

作者：[Manuel Dewald][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ntlx
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_tree_clouds.png?itok=b_ftihhP (Tree clouds)
[2]: https://opensource.com/article/18/7/network-attached-storage-Raspberry-Pi
[3]: https://opensource.com/article/18/8/automate-backups-raspberry-pi
[4]: https://nextcloud.com/
[5]: /file/409336
[6]: https://opensource.com/sites/default/files/uploads/nas_part3.png (Raspberry Pi NAS infrastructure with Nextcloud)
[7]: https://sourceforge.net/p/ddclient/wiki/Home/
[8]: https://nextcloud.com/install/#instructions-server
[9]: mailto:admin@pi-nas.com
[10]: https://letsencrypt.org/
[11]: https://certbot.eff.org/
[12]: https://certbot.eff.org/lets-encrypt/debianother-apache
[13]: https://nextcloud.com/install/#install-clients
