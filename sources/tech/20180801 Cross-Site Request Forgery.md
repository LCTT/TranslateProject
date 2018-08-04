Cross-Site Request Forgery
======
![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/understanding-csrf-cross-site-forgery_orig.jpg)
Security is a major concern when designing web apps. And I am not talking about DDOS protection, using a strong password or 2 step verification. I am talking about the biggest threat to a web app. It is known as **CSRF** short for **Cross Site Resource Forgery**.

### What is CSRF?

 [![csrf what is cross site forgery](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/csrf-what-is-cross-site-forgery_orig.jpg)][1] 

First thing first, **CSRF** is short for Cross Site Resource Forgery. It is commonly pronounced as sea-surf and often referred to as XSRF. CSRF is a type of attack where various actions are performed on the web app where the victim is logged in without the victim's knowledge. These actions could be anything ranging from simply liking or commenting on a social media post to sending abusive messages to people or even transferring money from the victim’s bank account.

### How CSRF works?

**CSRF** attacks try to bank upon a simple common vulnerability in all browsers. Every time, we authenticate or log in to a website, session cookies are stored in the browser. So whenever we make a request to the website these cookies are automatically sent to the server where the server identifies us by matching the cookie we sent with the server’s records. So that way it knows it’s us.

 [![cookies set by website chrome](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/cookies-set-by-website-chrome_orig.jpg)][2] 

This means that any request made by me, knowingly or unknowingly, will be fulfilled. Since the cookies are being sent and they will match the records on the server, the server thinks I am making that request.

​

CSRF attacks usually come in form of links. We may click them on other websites or receive them as email. On clicking these links, an unwanted request is made to the server. And as I previously said, the server thinks we made the request and authenticates it.

#### A Real World Example

To put things into perspective, imagine you are logged into your bank’s website. And you fill up a form on the page at **yourbank.com/transfer** . You fill in the account number of the receiver as 1234 and the amount of 5,000 and you click on the submit button. Now, a request will be made to **yourbank.com/transfer/send?to=1234&amount=5000** . So the server will act upon the request and make the transfer. Now just imagine you are on another website and you click on a link that opens up the above URL with the hacker’s account number. That money is now transferred to the hacker and the server thinks you made the transaction. Even though you didn’t.

 [![csrf hacking bank account](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/csrf-hacking-bank-account_orig.jpg)][3] 

#### Protection against CSRF

CSRF protection is very easy to implement. It usually involves sending a token called the CSRF token to the webpage. This token is sent and verified on the server with every new request made. So malicious requests made by the server will pass cookie authentication but fail CSRF authentication. Most web frameworks provide out of the box support for preventing CSRF attacks and CSRF attacks are not as commonly seen today as they were some time back.

### Conclusion

CSRF attacks were a big thing 10 years back but today we don’t see too many of them. In the past, famous sites such as Youtube, The New York Times and Netflix have been vulnerable to CSRF. However, popularity and occurrence of CSRF attacks have decreased lately. Nevertheless, CSRF attacks are still a threat and it is important, you protect your website or app from it.


--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/understanding-csrf-cross-site-request-forgery

作者：[linuxandubuntu][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/csrf-what-is-cross-site-forgery_orig.jpg
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/cookies-set-by-website-chrome_orig.jpg
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/csrf-hacking-bank-account_orig.jpg
