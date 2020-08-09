[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 tips for securing your WordPress website)
[#]: via: (https://opensource.com/article/20/4/wordpress-security)
[#]: author: (Lucy Carney https://opensource.com/users/lucy-carney)

6 tips for securing your WordPress website
======
Even beginners can—and should—take these steps to protect their
WordPress sites against cyberattacks.
![A lock on the side of a building][1]

Already powering over 30% of the internet, WordPress is the fastest-growing content management system (CMS) in the world—and it's not hard to see why. With tons of customization available through coding and plugins, top-notch SEO, and a supreme reputation for blogging, WordPress has certainly earned its popularity.

However, with popularity comes other, less appealing attention. WordPress is a common target for intruders, malware, and cyberattacks—in fact, WordPress accounted for around [90% of hacked CMS platforms][2] in 2019.

Whether you're a first-time WordPress user or an experienced developer, there are important steps you can take to protect your WordPress website. The following six key tips will get you started.

### 1\. Choose reliable hosting

Hosting is the unseen foundation of all websites—without it, you can't publish your site online. But hosting does much more than simply host your site. It's also responsible for site speed, performance, and security.

The first thing to do is to check if a host includes SSL security in its plans.

SSL is an essential security feature for all websites, whether you're running a small blog or a large online store. You'll need a more [advanced SSL certificate][3] if you're accepting payments, but for most sites, the basic free SSL should be fine.

Other security features to look out for include:

  * Frequent, automatic offsite backups
  * Malware and antivirus scanning and removal
  * Distributed denial of service (DDoS) protection
  * Real-time network monitoring
  * Advanced firewall protection



In addition to these digital security features, it's worth thinking about your hosting provider's _physical_ security measures as well. These include limiting access to data centers with security guards, CCTV, and two-factor or biometric authentication.

### 2\. Use security plugins

One of the best—and easiest—ways of protecting your website's security is to install a security plugin, such as [Sucuri][4], which is an open source, GPLv2 licensed project. Security plugins are vitally important because they automate security, which means you can focus on running your site rather than committing all your time to fighting off online threats.

These plugins detect and block malicious attacks and alert you about any issues that require your attention. In short, they constantly work in the background to protect your site, meaning you don't have to stay awake 24/7 to fight off hackers, bugs, and other digital nasties.

A good security plugin will provide all the essential security features you need for free, but some advanced features require a paid subscription. For example, you'll need to pay if you want to unlock [Sucuri's website firewall][5]. Enabling a web application firewall (WAF) blocks common threats and adds an extra layer of security to your site, so it's a good idea to look for this feature when choosing a security plugin.

### 3\. Choose trustworthy plugins and themes

The joy of WordPress is that it is open source, so anyone and everyone can pitch in with themes and plugins that they've developed. This can also pose problems when it comes to picking a high-quality theme or plugin.

It serves to be cautious when picking a free theme or plugin, as some are poorly designed—or worse, may hide malicious code.

To avoid this, always source free themes and plugins from reputable sources, such as the WordPress library. Always read reviews and research the developer to see if they've built any other programs.

Outdated or poorly designed themes and plugins can leave "backdoors" open for attackers or bugs to get into your site, which is why it pays to be careful in your choices. However, you should also be wary of nulled or cracked themes. These are premium themes that have been compromised by hackers and are for sale illegally. You might buy a nulled theme believing that it's all above-board—only to have your site damaged by hidden malicious code.

To avoid nulled themes, don't get drawn in by discounted prices, and always stick to reputable stores, such as the official [WordPress directory][6]. If you're looking elsewhere, stick to large and trusted stores, such as [Themify][7], a theme and plugin store that has been running since 2010. Themify ensures all its WordPress themes pass the [Google Mobile-Friendly][8] test and are open source under the [GNU General Public License][9].

### 4\. Run regular updates

It's a fundamental WordPress rule: _always keep your site up to date._ However, it's a rule not everyone sticks to—in fact, only [43% of WordPress sites][10] are running the latest version.

The problem is that when your site becomes outdated, it becomes susceptible to glitches, bugs, intrusions, and crashes because it falls behind on security and performance fixes. Outdated sites can't fix bugs the same way as updated sites can, and attackers can tell which sites are outdated. This means they can search for the most vulnerable sites and attack accordingly.

This is why you should always run your site on the latest version of WordPress. And in order to keep your security at its strongest, you must update your plugins and themes as well as your core WordPress software.

If you choose a managed WordPress hosting plan, you might find that your provider will check and run updates for you—be clear whether your host offers software _and_ plugin updates. If not, you can install an open source plugin manager, such as the GPLv2-licensed [Easy Updates Manager plugin][11], as an alternative.

### 5\. Strengthen your logins

Aside from creating a secure WordPress website through carefully choosing your theme and installing security plugins, you also need to safeguard against unauthorized access through logins.

#### Password protection

The first and simplest way to strengthen your login security is to change your password—especially if you're using an [easily guessed phrase][12] such as "123456" or "qwerty."

Instead, try to use a long passphrase rather than a password, as they are harder to crack. The best way is to use a series of unrelated words strung together that you find easy to remember.

Here are some other tips:

  * Never reuse passwords
  * Don't include obvious words such as family members' names or your favorite football team
  * Never share your login details with anyone
  * Include capitals and numbers to add complexity to your passphrase
  * Don't write down or store your login details anywhere
  * Use a [password manager][13]



#### Change your login URL

It's a good idea to change your default login web address from the standard format: yourdomain.com/wp-admin. This is because hackers know this is the default URL, so you risk brute-force attacks by not changing it.

To avoid this, change the URL to something different. Use an open source plugin such as the GPLv2-licensed [WPS Hide Login][14] for safe, quick, and easy customization.

#### Apply two-factor authentication

For extra protection against unauthorized logins and brute-force attacks, you should add two-factor authentication. This means that even if someone _does_ get access to your login details, they'll need a code that's sent directly to your phone to gain access to your WordPress site's admin.

Adding two-factor authentication is pretty easy. Simply install yet another plugin—this time, search the WordPress Plugin Directory for "two-factor authentication," and select the plugin you want. One option is [Two Factor][15], a popular GPLv2 licensed project that has over 10,000 active installations.

#### Limit login attempts

WordPress tries to be helpful by letting you guess your login details as many times as you like. However, this is also helpful to hackers trying to gain unauthorized access to your WordPress site to release malicious code.

To combat brute-force attacks, install a plugin that limits login attempts and set how many guesses you want to allow.

### 6\. Disable file editing

This isn't such a beginner-friendly step, so don't attempt it unless you're a confident coder—and always back up your site first!

That said, disabling file editing _is_ an important measure if you're really serious about protecting your WordPress website. If you don't hide your files, it means anyone can edit your theme and plugin code straight from the admin area—which is dangerous if an intruder gets in.

To deny unauthorized access, go to your **wp-config.php** file and enter:


```
&lt;Files wp-config.php&gt;
order allow,deny
deny from all
&lt;/Files&gt;
```

Or, to remove the theme and plugin editing options from your WordPress admin area completely, edit your **wp-config.php** file by adding:


```
`define( 'DISALLOW_FILE_EDIT', true );`
```

Once you've saved and reloaded the file, the plugin and theme editors will disappear from your menus within the WordPress admin area, stopping anyone from editing your theme or plugin code—including you**.** Should you need to restore access to your theme and plugin code, just delete the code you added to your **wp-config.php** file when you disabled editing.

Whether you block unauthorized access or totally disable file editing, it's important to take action to protect your site's code. Otherwise, it's easy for unwelcome visitors to edit your files and add new code. This means an attacker could use the editor to gather data from your WordPress site or even use your site to launch attacks on others.

For an easier way of hiding your files, you can use a security plugin that will do it for you, such as Sucuri.

### WordPress security recap

WordPress is an excellent open source platform that should be enjoyed by beginners and developers alike without the fear of becoming a victim of an attack. Sadly, these threats aren't going anywhere anytime soon, so it's vital to stay on top of your site's security.

Using the measures outlined above, you can create a stronger, more secure level of protection for your WordPress site and ensure a much more enjoyable experience for yourself.

Staying secure is an ongoing commitment rather than a one-time checklist, so be sure to revisit these steps regularly and stay alert when building and using your CMS.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/wordpress-security

作者：[Lucy Carney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lucy-carney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: https://cyberforces.com/en/wordpress-most-hacked-cms
[3]: https://opensource.com/article/19/11/internet-security-tls-ssl-certificate-authority
[4]: https://wordpress.org/plugins/sucuri-scanner/
[5]: https://sucuri.net/website-firewall/
[6]: https://wordpress.org/themes/
[7]: https://themify.me/
[8]: https://developers.google.com/search/mobile-sites/
[9]: http://www.gnu.org/licenses/gpl.html
[10]: https://wordpress.org/about/stats/
[11]: https://wordpress.org/plugins/stops-core-theme-and-plugin-updates/
[12]: https://www.forbes.com/sites/kateoflahertyuk/2019/04/21/these-are-the-worlds-most-hacked-passwords-is-yours-on-the-list/#4f157c2f289c
[13]: https://opensource.com/article/16/12/password-managers
[14]: https://wordpress.org/plugins/wps-hide-login/
[15]: https://en-gb.wordpress.org/plugins/two-factor/
