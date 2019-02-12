[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 confusing open source license scenarios and how to navigate them)
[#]: via: (https://opensource.com/article/19/1/open-source-license-scenarios)
[#]: author: (P.Kevin Nelson https://opensource.com/users/pkn4645)

4 confusing open source license scenarios and how to navigate them
======

Before you begin using a piece of software, make sure you fully understand the terms of its license.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_openisopen.png?itok=FjmDxIaL)

As an attorney running an open source program office for a Fortune 500 corporation, I am often asked to look into a product or component where there seems to be confusion as to the licensing model. Under what terms can the code be used, and what obligations run with such use? This often happens when the code or the associated project community does not clearly indicate availability under a [commonly accepted open source license][1]. The confusion is understandable as copyright owners often evolve their products and services in different directions in response to market demands. Here are some of the scenarios I commonly discover and how you can approach each situation.

### Multiple licenses

The product is truly open source with an [Open Source Initiative][2] (OSI) open source-approved license, but has changed licensing models at least once if not multiple times throughout its lifespan. This scenario is fairly easy to address; the user simply has to decide if the latest version with its attendant features and bug fixes is worth the conditions to be compliant with the current license. If so, great. If not, then the user can move back in time to a version released under a more palatable license and start from that fork, understanding that there may not be an active community for support and continued development.

### Old open source

This is a variation on the multiple licenses model with the twist that current licensing is proprietary only. You have to use an older version to take advantage of open source terms and conditions. Most often, the product was released under a valid open source license up to a certain point in its development, but then the copyright holder chose to evolve the code in a proprietary fashion and offer new releases only under proprietary commercial licensing terms. So, if you want the newest capabilities, you have to purchase a proprietary license, and you most likely will not get a copy of the underlying source code. Most often the open source community that grew up around the original code line falls away once the members understand there will be no further commitment from the copyright holder to the open source branch. While this scenario is understandable from the copyright holder's perspective, it can be seen as "burning a bridge" to the open source community. It would be very difficult to again leverage the benefits of the open source contribution models once a project owner follows this path.

### Open core

By far the most common discovery is that a product has both an open source-licensed "community edition" and a proprietary-licensed commercial offering, commonly referred to as open core. This is often encouraging to potential consumers, as it gives them a "try before you buy" option or even a chance to influence both versions of the product by becoming an active member of the community. I usually encourage clients to begin with the community version, get involved, and see what they can achieve. Then, if the product becomes a crucial part of their business plan, they have the option to upgrade to the proprietary level at any time.

### Freemium

The component is not open source at all, but instead it is released under some version of the "freemium" model. A version with restricted or time-limited functionality can be downloaded with no immediate purchase required. However, since the source code is usually not provided and its accompanying license does not allow perpetual use, the creation of derivative works, nor further distribution, it is definitely not open source. In this scenario, it is usually best to pass unless you are prepared to purchase a proprietary license and accept all attendant terms and conditions of use. Users are often the most disappointed in this outcome as it has somewhat of a deceptive feel.

### OSI compliant

Of course, the happy path I haven't mentioned is to discover the project has a single, clear, OSI-compliant license. In those situations, open source software is as easy as downloading and going forward within appropriate use.

Each of the more complex scenarios described above can present problems to potential development projects, but consultation with skilled procurement or intellectual property professionals with regard to licensing lineage can reveal excellent opportunities.

An earlier version of this article was published on [OSS Law][3] and is republished with the author's permission.


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/open-source-license-scenarios

作者：[P.Kevin Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pkn4645
[b]: https://github.com/lujun9972
[1]: https://opensource.org/licenses
[2]: https://opensource.org/licenses/category
[3]: http://www.pknlaw.com/2017/06/i-thought-that-was-open-source.html
