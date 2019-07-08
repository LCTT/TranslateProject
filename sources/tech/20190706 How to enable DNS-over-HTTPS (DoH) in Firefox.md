[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to enable DNS-over-HTTPS (DoH) in Firefox)
[#]: via: (https://www.zdnet.com/article/how-to-enable-dns-over-https-doh-in-firefox/)
[#]: author: (Catalin Cimpanu https://www.zdnet.com/meet-the-team/us/catalin.cimpanu/)

How to enable DNS-over-HTTPS (DoH) in Firefox
======

The DNS-over-HTTPS (DoH) protocol is currently the talk of the town, and the Firefox browser is the only one to support it.

However, the feature is not enabled by default for Firefox users, who will have to go through many hoops and modify multiple settings before they can get the DoH up and running.

But before we go into a step-by-step tutorial on how someone can enable DoH support in Firefox, let's describe what it does first.

### How DNS-over-HTTPS works

The DNS-over-HTTPS protocol works by taking a domain name that a user has typed in their browser and sending a query to a DNS server to learn the numerical IP address of the web server that hosts that specific site.

This is how normal DNS works, too. However, DoH takes the DNS query and sends it to a DoH-compatible DNS server (resolver) via an encrypted HTTPS connection on port 443, rather than plaintext on port 53.

This way, DoH hides DNS queries inside regular HTTPS traffic, so third-party observers won't be able to sniff traffic and tell what DNS queries users have run and infer what websites they are about to access.

Further, a secondary feature of DNS-over-HTTPS is that the protocol works at the app level. Apps can come with internally hardcoded lists of DoH-compatible DNS resolvers where they can send DoH queries.

This mode of operation bypasses the default DNS settings that exist at the OS level, which, in most cases are the ones set by local internet service providers (ISPs).

This also means that apps that support DoH can effectively bypass local ISPs traffic filters and access content that may be blocked by a local telco or local government -- and a reason why DoH is currently hailed as a boon for users' privacy and security.

This is one of the reasons that DoH has gained quite the popularity in less than two years after it launched, and a reason why a group of [UK ISPs nominated Mozilla for the award of 2019 Internet Vilain][1] for its plans to support the DoH protocol, which they said would thwart their efforts in filtering bad traffic.

As a response, and due to the complex situation in the UK where the government blocks access to copyright-infringing content, and where ISPs voluntarily block access to child abuse website, [Mozilla has decided not to enable this feature by default for British users][2].

The below step-by-step guide will show Firefox users in the UK and Firefox users all over the world how to enable the feature right now, and not wait until Mozilla enables it later down the road -- if it will ever do. There are two methods of enabling DoH support in Firefox.

### Method 1 - via the Firefox settings

**Step 1:** Go to the Firefox menu, choose **Tools** , and then **Preferences**. Optionally type **about:preferences** in the URL bar and press enter. This will open the Firefox prerences section.

**Step 2:** In the **General** section, scroll down to the **Network Settings** panel, and press the **Settings** button.

![DoH section in Firefox settings][3]

Image: ZDNet

**Step 3:** In the popup, scroll down and select " **Enable DNS over HTTPS** ," then configure your desired DoH resolver. You can use the built in Cloudflare resolver (a company with which Mozilla has [reached an agreement][4] to log less data about Firefox users), or use one of your choice, [from this list][4].

![DoH section in Firefox settings][5]![DoH section in Firefox settings][6]

Image: ZDNet

### Method 2 - via about:config

**Step 1:** Type **about:config** in the URL bar and press Enter to access Firefox's hidden configuration panel. Here users will need to enable and modify three settings.

**Step 2:** The first setting is **network.trr.mode**. This turns on DoH support. This setting supports four values:

  * 0 - Default value in standard Firefox installations (currently is 5, which means DoH is disabled)
  * 1 - DoH is enabled, but Firefox picks if it uses DoH or regular DNS based on which returns faster query responses
  * 2 - DoH is enabled, and regular DNS works as a backup
  * 3 - DoH is enabled, and regular DNS is disabled
  * 5 - DoH is disabled



A value of 2 works best.

![DoH in Firefox][5]![DoH in Firefox][7]

Image: ZDNet

**Step 3:** The second setting that needs to be modified is **network.trr.uri**. This is the URL of the DoH-compatible DNS server where Firefox will send DoH DNS queries. By default, Firefox uses Cloudflare's DoH service located at <https://mozilla.cloudflare-dns.com/dns-query>. However, users can use their own DoH server URL. They can select one from the many available servers, [from this list, here][8]. The reason why Mozilla uses Cloudflare in Firefox is because the companies [reached an agreement][4] following which Cloudflare would collect very little data on DoH queries coming from Firefox users.

![DoH in Firefox][5]![DoH in Firefox][9]

Image: ZDNet

**Step 4:** The third setting is optional and you can skip this one. But if things don't work, you can use this one as a backup for Step 3. The option is called **network.trr.bootstrapAddress** and is an input field where users can enter the numerical IP address of the DoH-compatible DNS resolver they entered in Step 3. For Cloudflare, that would be 1.1.1.1. For Google's service, that would be 8.8.8.8. If you used another DoH resolver's URL, you'll need to track down that server's IP and enter it here, if ever necesarry.

![DoH in Firefox][5]![DoH in Firefox][10]

Image: ZDNet

Normally, the URL entered in Step 3 should be enough, though.

Settings should apply right away, but in case they don't work, give Firefox a restart.

Article source: [Mozilla Wiki][11]


--------------------------------------------------------------------------------

via: https://www.zdnet.com/article/how-to-enable-dns-over-https-doh-in-firefox/

作者：[Catalin Cimpanu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.zdnet.com/meet-the-team/us/catalin.cimpanu/
[b]: https://github.com/lujun9972
[1]: https://www.zdnet.com/article/uk-isp-group-names-mozilla-internet-villain-for-supporting-dns-over-https/
[2]: https://www.zdnet.com/article/mozilla-no-plans-to-enable-dns-over-https-by-default-in-the-uk/
[3]: https://zdnet1.cbsistatic.com/hub/i/2019/07/07/df30c7b0-3a20-4de7-8640-3dea6d249a49/121bd379b6232e1e2a97c35ea8c7764e/doh-settings-1.png
[4]: https://developers.cloudflare.com/1.1.1.1/commitment-to-privacy/privacy-policy/firefox/
[5]:
[6]: https://zdnet3.cbsistatic.com/hub/i/2019/07/07/8608af28-2a28-4ff1-952b-9b6d2deb1ea6/b1fc322caaa2c955b1a2fb285daf0e42/doh-settings-2.png
[7]: https://zdnet1.cbsistatic.com/hub/i/2019/07/06/0232b3a7-82c6-4a6f-90c1-faf0c090254c/6db9b36509021c460fcc7fe825bb74c5/doh-1.png
[8]: https://github.com/curl/curl/wiki/DNS-over-HTTPS#publicly-available-servers
[9]: https://zdnet2.cbsistatic.com/hub/i/2019/07/06/4dd1d5c1-6fa7-4f5b-b7cd-b544748edfed/baa7a70ac084861d94a744a57a3147ad/doh-2.png
[10]: https://zdnet1.cbsistatic.com/hub/i/2019/07/06/8ec20a28-673c-4a17-8195-16579398e90a/538fe8420f9b24724aeb4a6c8d4f0f0f/doh-3.png
[11]: https://wiki.mozilla.org/Trusted_Recursive_Resolver
