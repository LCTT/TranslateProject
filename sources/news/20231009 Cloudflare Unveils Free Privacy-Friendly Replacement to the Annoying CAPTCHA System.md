[#]: subject: "Cloudflare Unveils Free Privacy-Friendly Replacement to the Annoying CAPTCHA System"
[#]: via: "https://news.itsfoss.com/cloudflare-captcha-replacement/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Cloudflare Unveils Free Privacy-Friendly Replacement to the Annoying CAPTCHA System
======
Cloudflare has finally come up with something that ends visual puzzles.
Cloudflare has been working on a privacy-focused alternative to the annoying CAPTCHA system since [last year][1].

The problem with the dreaded CAPTCHA (especially: Google's reCAPTCHA) is its ability to collect users' data (unnecessarily), add a delay to the experience, and make things inconvenient when navigating the web.

Sure, it was useful to some extent. It would be ignorant if I said it was not. However, as technology progresses and all the [tools to protect our privacy][2] thrive to offer seamless experiences, we also need a coherent system to protect websites from bots.

Interestingly, Cloudfare has managed to piece together a tech that **everyone can use for free as a replacement,** i.e., **Cloudflare Turnstile**. Like every Cloudflare offering, you get an “ _Enterprise_ ” plan with the ability to remove its branding and a few more things.

![\(Affiliate Link\)][3]

### Cloudflare Turnstile: No More CAPTCHAs!

With [Cloudflare Turnstile][4], you will no longer get any visual puzzles to solve, ever.

Initially, even its own privacy-focused CAPTCHA system displayed puzzles to some users.

Now, all of that has been replaced with their new product offering. All you need to do is to perform a single click to verify that you are a human:

![Source: Cloudflare blog][5]

To ascertain its privacy goals, Cloudflare explains:

> We also created Turnstile to be privacy focused. Turnstile meets [ePrivacy Directive][6], [GDPR][7] and [CCPA][8] compliance requirements, as well as the strict requirements of our own privacy commitments. In addition, Cloudflare's [FedRAMP Moderate authorized package][9], "Cloudflare for Government" now includes Turnstile. We don’t rely on tracking user data, like what other websites someone has visited, to determine if a user is a human or robot. Our business is protecting websites, not selling ads, so operators can deploy Turnstile knowing that their users’ data is safe.

In addition, Cloudflare believes that it is as effective or more than the CAPTCHA system without needing to offer users any interactive elements. It will protect websites from bot traffic, and fraud as well.

So, some of us may not even get the human verification challenge because of several background checks/analysis done by Cloudflare to detect suspicious behavior.

**What's more exciting?**

![][10]

All of this is for free. And, any website/platform that does not use Cloudflare as a firewall or CDN can choose to use it by adding **a few lines of code**.

[Cloudflare Turnstile][4]

**Suggested Read** 📖

![][11]

You can also migrate from [reCAPTCHA][12] and [hCAPTCHA][13] by following the instructions in its [official documentation][14].

For more technical details, you can check out [Cloudflare's announcement][15].

_💬 What do you think about Cloudflare's new system to block bots and improve the user experience without CAPTCHAs?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/cloudflare-captcha-replacement/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/cloudflare-pat/
[2]: https://itsfoss.com/privacy-tools/
[3]: https://proton.go2cloud.org/favicons/apple-touch-icon.png
[4]: https://www.cloudflare.com/en-in/products/turnstile/
[5]: https://news.itsfoss.com/content/images/2023/10/cloudflare-turnstile.gif
[6]: https://www.cloudflare.com/learning/privacy/what-is-eprivacy-directive/
[7]: https://www.cloudflare.com/learning/privacy/what-is-the-gdpr/
[8]: https://www.cloudflare.com/learning/privacy/what-is-the-ccpa/
[9]: https://marketplace.fedramp.gov/products/FR2000863987
[10]: https://news.itsfoss.com/content/images/2023/10/turnsite-dashboard.jpg
[11]: https://linuxhandbook.com/content/images/size/w256h256/2021/08/Linux-Handbook-New-Logo.png
[12]: https://www.google.com/recaptcha/about/
[13]: https://www.hcaptcha.com/
[14]: https://developers.cloudflare.com/turnstile/migration/
[15]: https://blog.cloudflare.com/turnstile-ga/
