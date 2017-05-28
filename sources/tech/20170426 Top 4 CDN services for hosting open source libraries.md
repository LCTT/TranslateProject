Top 4 CDN services for hosting open source libraries
============================================================

### Content delivery networks accelerate your website's images, CSS files, JS files, and other static content.


![Top 4 CDN services for hosting open source libraries](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/file_system.jpg?itok=s2b60oIB "Top 4 CDN services for hosting open source libraries")
>Image credits : [Open Clip Art Library][3], which released it explicitly into the **[public domain][1]** ([see here][4]). Modified by Jen Wike Huger.

A CDN, or content delivery network, is a network of strategically placed servers located around the world used for the purpose of delivering files faster to users. A traditional CDN will allow you to accelerate your website's images, CSS files, JS files, and any other piece of static content. This allows website owners to accelerate all of their own content as well as provide them with additional features and configuration options. These premium services typically require payment based on the amount of bandwidth a project uses.

However, if your project doesn't justify the cost of implementing a traditional CDN, the use of an open source CDN may be more suitable. Typically, these types of CDNs allow you to link to popular web-based libraries (CSS/JS frameworks, for example), which are then delivered to your web visitors from the free CDN's servers. Although CDN services for open source libraries do not allow you to upload your own content to their servers, they can help you accelerate libraries globally and improve your website's redundancy.

CDNs host projects on a vast network of servers, so website maintainers need to modify their asset links in the website's HTML code to reflect the open source CDN's URL followed by the path to the resource. Depending upon whether you're linking to a JavaScript or CSS library, the links you'll include will live in either a <script> or <link> tag.

Let's explore four popular CDN services for open source libraries.

### JsDelivr

[JsDelivr][5] is an open source CDN provider that uses the networks of premium CDN providers (KeyCDN, Stackpath, and Cloudflare) to deliver open source project assets. A few highlights of jsDelivr include:

*   Search from over 2,100 libraries

*   110 POP locations

*   CDN is accessible in Asia and China

*   API support

*   No traffic limits

*   Full HTTPS support

All snippets start off with the custom jsDelivr URL [https://cdn.jsdelivr.net/][6], and are then followed by the name of the project, version number, etc. You can also configure jsDelivr to generate the URL with the script tags and enable SRI (subresource Integrity) for added security.

### **Cdnjs**

[Cdnjs][7] is another popular open source CDN provider that's similar to jsDelivr. This service also offers an array of popular JavaScript and CSS libraries that you can choose from to link within your web project. This service is sponsored by CDN providers Cloudflare and [KeyCDN][8]. A few highlights of cdnjs include:

*   Search from over 2,900 libraries

*   Used by over 1 million websites

*   Supports HTTP/2

*   Supports HTTPS

Similar to jsDelivr, with cdnjs you also have the option to simply copy the asset URL with or without the script tag and SRI.

### Google Hosted Libraries

The [Google's Hosted Libraries][9] site allows you to link to popular JavaScript libraries that are hosted on Google's powerful open source CDN network. This open source CDN solution doesn't offer as many libraries or features as jsDelivr or cdnjs; however, a high level of reliability and trust can be expected when linking to Google's Hosted Libraries. A few highlights of Google's open source CDN include:

*   HTTPS support

*   Files are served with CORS and Timing-Allow headers

*   Offers the latest version of each library

All of Google's Hosted libraries files start with the URL [https://ajax.googleapis.com/][10], and are followed by the project's name, version number, and file name.

### Microsoft Ajax CDN

The [Microsoft Ajax Content Delivery Network][11] is quite similar to Google's Hosted Libraries in that it only hosts popular libraries. However, two major differences that separate Microsoft Ajax CDN from Google's Hosted Libraries are that Microsoft provides both CSS as well as JS libraries and also offers various versions of each library. A few highlights of the Microsoft Ajax CDN include:

*   HTTPS support

*   Previous versions of each library are often available

All Microsoft Ajax files begin with the URL [http://ajax.aspnetcdn.com/ajax/][12], and like the others, are followed by the library's name, version number, etc.

If your project or website isn't ready to take advantage of a premium CDN service, but you would still like to accelerate vital aspects of your site, then using an open source CDN can be a great solution. They allow you to accelerate the delivery of third-party libraries that would otherwise be delivered from your origin server causing unnecessary load and slower speeds for distant users.

 _Which open source CDN provider do you prefer to use and why?_

--------------------------------------------------------------------------------

作者简介：

Cody Arsenault - Cody is passionate about all things web performance, SEO and entrepreneurship. He is a web performance advocate at KeyCDN and works towards making the web faster.


------------


via: https://opensource.com/article/17/4/top-cdn-services

作者：[Cody Arsenault ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/codya
[1]:https://en.wikipedia.org/wiki/public_domain
[2]:https://opensource.com/article/17/4/top-cdn-services?rate=lgZwEmWt7QXtuMhB-lnHWQ-jxknQ0Kh4YOfqdFGer5w
[3]:https://en.wikipedia.org/wiki/Open_Clip_Art_Library
[4]:https://openclipart.org/share
[5]:http://www.jsdelivr.com/
[6]:https://cdn.jsdelivr.net/
[7]:https://cdnjs.com/
[8]:https://www.keycdn.com/
[9]:https://developers.google.com/speed/libraries/
[10]:https://ajax.googleapis.com/
[11]:https://www.asp.net/ajax/cdn
[12]:http://ajax.aspnetcdn.com/ajax/
[13]:https://opensource.com/user/128076/feed
[14]:https://opensource.com/users/codya
