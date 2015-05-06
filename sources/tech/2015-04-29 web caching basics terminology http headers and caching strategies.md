Web Caching Basics: Terminology, HTTP Headers, and Caching Strategies
=====================================================================

### Introduction

Intelligent content caching is one of the most effective ways to improve
the experience for your site's visitors. Caching, or temporarily storing
content from previous requests, is part of the core content delivery
strategy implemented within the HTTP protocol. Components throughout the
delivery path can all cache items to speed up subsequent requests,
subject to the caching policies declared for the content.

In this guide, we will discuss some of the basic concepts of web content
caching. This will mainly cover how to select caching policies to ensure
that caches throughout the internet can correctly process your content.
We will talk about the benefits that caching affords, the side effects
to be aware of, and the different strategies to employ to provide the
best mixture of performance and flexibility.

What Is Caching? 
----------------

Caching is the term for storing reusable responses in order to make
subsequent requests faster. There are many different types of caching
available, each of which has its own characteristics. Application caches
and memory caches are both popular for their ability to speed up certain
responses.

Web caching, the focus of this guide, is a different type of cache. Web
caching is a core design feature of the HTTP protocol meant to minimize
network traffic while improving the perceived responsiveness of the
system as a whole. Caches are found at every level of a content's
journey from the original server to the browser.

Web caching works by caching the HTTP responses for requests according
to certain rules. Subsequent requests for cached content can then be
fulfilled from a cache closer to the user instead of sending the request
all the way back to the web server.

Benefits
--------

Effective caching aids both content consumers and content providers.
Some of the benefits that caching brings to content delivery are:

-   **Decreased network costs**: Content can be cached at various points
    in the network path between the content consumer and content origin.
    When the content is cached closer to the consumer, requests will not
    cause much additional network activity beyond the cache.
-   **Improved responsiveness**: Caching enables content to be retrieved
    faster because an entire network round trip is not necessary. Caches
    maintained close to the user, like the browser cache, can make this
    retrieval nearly instantaneous.
-   **Increased performance on the same hardware**: For the server where
    the content originated, more performance can be squeezed from the
    same hardware by allowing aggressive caching. The content owner can
    leverage the powerful servers along the delivery path to take the
    brunt of certain content loads.
-   **Availability of content during network interruptions**: With
    certain policies, caching can be used to serve content to end users
    even when it may be unavailable for short periods of time from the
    origin servers.

Terminology
-----------

When dealing with caching, there are a few terms that you are likely to
come across that might be unfamiliar. Some of the more common ones are
below:

-   **Origin server**: The origin server is the original location of the
    content. If you are acting as the web server administrator, this is
    the machine that you control. It is responsible for serving any
    content that could not be retrieved from a cache along the request
    route and for setting the caching policy for all content.
-   **Cache hit ratio**: A cache's effectiveness is measured in terms of
    its cache hit ratio or hit rate. This is a ratio of the requests
    able to be retrieved from a cache to the total requests made. A high
    cache hit ratio means that a high percentage of the content was able
    to be retrieved from the cache. This is usually the desired outcome
    for most administrators.
-   **Freshness**: Freshness is a term used to describe whether an item
    within a cache is still considered a candidate to serve to a client.
    Content in a cache will only be used to respond if it is within the
    freshness time frame specified by the caching policy.
-   **Stale content**: Items in the cache expire according to the cache
    freshness settings in the caching policy. Expired content is
    "stale". In general, expired content cannot be used to respond to
    client requests. The origin server must be re-contacted to retrieve
    the new content or at least verify that the cached content is still
    accurate.
-   **Validation**: Stale items in the cache can be validated in order
    to refresh their expiration time. Validation involves checking in
    with the origin server to see if the cached content still represents
    the most recent version of item.
-   **Invalidation**: Invalidation is the process of removing content
    from the cache before its specified expiration date. This is
    necessary if the item has been changed on the origin server and
    having an outdated item in cache would cause significant issues for
    the client.

There are plenty of other caching terms, but the ones above should help
you get started.

What Can be Cached? 
-------------------

Certain content lends itself more readily to caching than others. Some
very cache-friendly content for most sites are:

-   Logos and brand images
-   Non-rotating images in general (navigation icons, for example)
-   Style sheets
-   General Javascript files
-   Downloadable Content
-   Media Files

These tend to change infrequently, so they can benefit from being cached
for longer periods of time.

Some items that you have to be careful in caching are:

-   HTML pages
-   Rotating images
-   Frequently modified Javascript and CSS
-   Content requested with authentication cookies

Some items that should almost never be cached are:

-   Assets related to sensitive data (banking info, etc.)
-   Content that is user-specific and frequently changed

In addition to the above general rules, it's possible to specify
policies that allow you to cache different types of content
appropriately. For instance, if authenticated users all see the same
view of your site, it may be possible to cache that view anywhere. If
authenticated users see a user-sensitive view of the site that will be
valid for some time, you may tell the user's browser to cache, but tell
any intermediary caches not to store the view.

Locations Where Web Content Is Cached
-------------------------------------

Content can be cached at many different points throughout the delivery
chain:

-   **Browser cache**: Web browsers themselves maintain a small cache.
    Typically, the browser sets a policy that dictates the most
    important items to cache. This may be user-specific content or
    content deemed expensive to download and likely to be requested
    again.
-   **Intermediary caching proxies**: Any server in between the client
    and your infrastructure can cache certain content as desired. These
    caches may be maintained by ISPs or other independent parties.
-   **Reverse Cache**: Your server infrastructure can implement its own
    cache for backend services. This way, content can be served from the
    point-of-contact instead of hitting backend servers on each request.

Each of these locations can and often do cache items according to their
own caching policies and the policies set at the content origin.

Caching Headers
---------------

Caching policy is dependent upon two different factors. The caching
entity itself gets to decide whether or not to cache acceptable content.
It can decide to cache less than it is allowed to cache, but never more.

The majority of caching behavior is determined by the caching policy,
which is set by the content owner. These policies are mainly articulated
through the use of specific HTTP headers.

Through various iterations of the HTTP protocol, a few different
cache-focused headers have arisen with varying levels of sophistication.
The ones you probably still need to pay attention to are below:

-   **`Expires`**: The `Expires` header is very straight-forward,
    although fairly limited in scope. Basically, it sets a time in the
    future when the content will expire. At this point, any requests for
    the same content will have to go back to the origin server. This
    header is probably best used only as a fall back.
-   **`Cache-Control`**: This is the more modern replacement for the
    `Expires` header. It is well supported and implements a much more
    flexible design. In almost all cases, this is preferable to
    `Expires`, but it may not hurt to set both values. We will discuss
    the specifics of the options you can set with `Cache-Control` a bit
    later.
-   **`Etag`**: The `Etag` header is used with cache validation. The
    origin can provide a unique `Etag` for an item when it initially
    serves the content. When a cache needs to validate the content it
    has on-hand upon expiration, it can send back the `Etag` it has for
    the content. The origin will either tell the cache that the content
    is the same, or send the updated content (with the new `Etag`).
-   **`Last-Modified`**: This header specifies the last time that the
    item was modified. This may be used as part of the validation
    strategy to ensure fresh content.
-   **`Content-Length`**: While not specifically involved in caching,
    the `Content-Length` header is important to set when defining
    caching policies. Certain software will refuse to cache content if
    it does not know in advanced the size of the content it will need to
    reserve space for.
-   **`Vary`**: A cache typically uses the requested host and the path
    to the resource as the key with which to store the cache item. The
    `Vary` header can be used to tell caches to pay attention to an
    additional header when deciding whether a request is for the same
    item. This is most commonly used to tell caches to key by the
    `Accept-Encoding` header as well, so that the cache will know to
    differentiate between compressed and uncompressed content.

### An Aside about the Vary Header

The `Vary` header provides you with the ability to store different
versions of the same content at the expense of diluting the entries in
the cache.

In the case of `Accept-Encoding`, setting the `Vary` header allows for a
critical distinction to take place between compressed and uncompressed
content. This is needed to correctly serve these items to browsers that
cannot handle compressed content and is necessary in order to provide
basic usability. One characteristic that tells you that
`Accept-Encoding` may be a good candidate for `Vary` is that it only has
two or three possible values.

Items like `User-Agent` might at first glance seem to be a good way to
differentiate between mobile and desktop browsers to serve different
versions of your site. However, since `User-Agent` strings are
non-standard, the result will likely be many versions of the same
content on intermediary caches, with a very low cache hit ratio. The
`Vary` header should be used sparingly, especially if you do not have
the ability to normalize the requests in intermediate caches that you
control (which may be possible, for instance, if you leverage a content
delivery network).

How Cache-Control Flags Impact Caching
--------------------------------------

Above, we mentioned how the `Cache-Control` header is used for modern
cache policy specification. A number of different policy instructions
can be set using this header, with multiple instructions being separated
by commas.

Some of the `Cache-Control` options you can use to dictate your
content's caching policy are:

-   **`no-cache`**: This instruction specifies that any cached content
    must be re-validated on each request before being served to a
    client. This, in effect, marks the content as stale immediately, but
    allows it to use revalidation techniques to avoid re-downloading the
    entire item again.
-   **`no-store`**: This instruction indicates that the content cannot
    be cached in any way. This is appropriate to set if the response
    represents sensitive data.
-   **`public`**: This marks the content as public, which means that it
    can be cached by the browser and any intermediate caches. For
    requests that utilized HTTP authentication, responses are marked
    `private` by default. This header overrides that setting.
-   **`private`**: This marks the content as `private`. Private content
    may be stored by the user's browser, but must *not* be cached by any
    intermediate parties. This is often used for user-specific data.
-   **`max-age`**: This setting configures the maximum age that the
    content may be cached before it must revalidate or re-download the
    content from the origin server. In essence, this replaces the
    `Expires` header for modern browsing and is the basis for
    determining a piece of content's freshness. This option takes its
    value in seconds with a maximum valid freshness time of one year
    (31536000 seconds).
-   **`s-maxage`**: This is very similar to the `max-age` setting, in
    that it indicates the amount of time that the content can be cached.
    The difference is that this option is applied only to intermediary
    caches. Combining this with the above allows for more flexible
    policy construction.
-   **`must-revalidate`**: This indicates that the freshness information
    indicated by `max-age`, `s-maxage` or the `Expires` header must be
    obeyed strictly. Stale content cannot be served under any
    circumstance. This prevents cached content from being used in case
    of network interruptions and similar scenarios.
-   **`proxy-revalidate`**: This operates the same as the above setting,
    but only applies to intermediary proxies. In this case, the user's
    browser can potentially be used to serve stale content in the event
    of a network interruption, but intermediate caches cannot be used
    for this purpose.
-   **`no-transform`**: This option tells caches that they are not
    allowed to modify the received content for performance reasons under
    any circumstances. This means, for instance, that the cache is not
    able to send compressed versions of content it did not receive from
    the origin server compressed and is not allowed.

These can be combined in different ways to achieve various caching
behavior. Some mutually exclusive values are:

-   `no-cache`, `no-store`, and the regular caching behavior indicated
    by absence of either
-   `public` and `private`

The `no-store` option supersedes the `no-cache` if both are present. For
responses to unauthenticated requests, `public` is implied. For
responses to authenticated requests, `private` is implied. These can be
overridden by including the opposite option in the `Cache-Control`
header.

Developing a Caching Strategy
-----------------------------

In a perfect world, everything could be cached aggressively and your
servers would only be contacted to validate content occasionally. This
doesn't often happen in practice though, so you should try to set some
sane caching policies that aim to balance between implementing long-term
caching and responding to the demands of a changing site.

### Common Issues

There are many situations where caching cannot or should not be
implemented due to how the content is produced (dynamically generated
per user) or the nature of the content (sensitive banking information,
for example). Another problem that many administrators face when setting
up caching is the situation where older versions of your content are out
in the wild, not yet stale, even though new versions have been
published.

These are both frequently encountered issues that can have serious
impacts on cache performance and the accuracy of content you are
serving. However, we can mitigate these issues by developing caching
policies that anticipate these problems.

### General Recommendations

While your situation will dictate the caching strategy you use, the
following recommendations can help guide you towards some reasonable
decisions.

There are certain steps that you can take to increase your cache hit
ratio before worrying about the specific headers you use. Some ideas
are:

-   **Establish specific directories for images, css, and shared
    content**: Placing content into dedicated directories will allow you
    to easily refer to them from any page on your site.
-   **Use the same URL to refer to the same items**: Since caches key
    off of both the host and the path to the content requested, ensure
    that you refer to your content in the same way on all of your pages.
    The previous recommendation makes this significantly easier.
-   **Use CSS image sprites where possible**: CSS image sprites for
    items like icons and navigation decrease the number of round trips
    needed to render your site and allow your site to cache that single
    sprite for a long time.
-   **Host scripts and external resources locally where possible**: If
    you utilize javascript scripts and other external resources,
    consider hosting those resources on your own servers if the correct
    headers are not being provided upstream. Note that you will have to
    be aware of any updates made to the resource upstream so that you
    can update your local copy.
-   **Fingerprint cache items**: For static content like CSS and
    Javascript files, it may be appropriate to fingerprint each item.
    This means adding a unique identifier to the filename (often a hash
    of the file) so that if the resource is modified, the new resource
    name can be requested, causing the requests to correctly bypass the
    cache. There are a variety of tools that can assist in creating
    fingerprints and modifying the references to them within HTML
    documents.

In terms of selecting the correct headers for different items, the
following can serve as a general reference:

-   **Allow all caches to store generic assets**: Static content and
    content that is not user-specific can and should be cached at all
    points in the delivery chain. This will allow intermediary caches to
    respond with the content for multiple users.
-   **Allow browsers to cache user-specific assets**: For per-user
    content, it is often acceptable and useful to allow caching within
    the user's browser. While this content would not be appropriate to
    cache on any intermediary caching proxies, caching in the browser
    will allow for instant retrieval for users during subsequent visits.
-   **Make exceptions for essential time-sensitive content**: If you
    have content that is time-sensitive, make an exception to the above
    rules so that the out-dated content is not served in critical
    situations. For instance, if your site has a shopping cart, it
    should reflect the items in the cart immediately. Depending on the
    nature of the content, the `no-cache` or `no-store` options can be
    set in the `Cache-Control` header to achieve this.
-   **Always provide validators**: Validators allow stale content to be
    refreshed without having to download the entire resource again.
    Setting the `Etag` and the `Last-Modified` headers allow caches to
    validate their content and re-serve it if it has not been modified
    at the origin, further reducing load.
-   **Set long freshness times for supporting content**: In order to
    leverage caching effectively, elements that are requested as
    supporting content to fulfill a request should often have a long
    freshness setting. This is generally appropriate for items like
    images and CSS that are pulled in to render the HTML page requested
    by the user. Setting extended freshness times, combined with
    fingerprinting, allows caches to store these resources for long
    periods of time. If the assets change, the modified fingerprint will
    invalidate the cached item and will trigger a download of the new
    content. Until then, the supporting items can be cached far into the
    future.
-   **Set short freshness times for parent content**: In order to make
    the above scheme work, the containing item must have relatively
    short freshness times or may not be cached at all. This is typically
    the HTML page that calls in the other assisting content. The HTML
    itself will be downloaded frequently, allowing it to respond to
    changes rapidly. The supporting content can then be cached
    aggressively.

The key is to strike a balance that favors aggressive caching where
possible while leaving opportunities to invalidate entries in the future
when changes are made. Your site will likely have a combination of:

-   Aggressively cached items
-   Cached items with a short freshness time and the ability to
    re-validate
-   Items that should not be cached at all

The goal is to move content into the first categories when possible
while maintaining an acceptable level of accuracy.

Conclusion
----------

Taking the time to ensure that your site has proper caching policies in
place can have a significant impact on your site. Caching allows you to
cut down on the bandwidth costs associated with serving the same content
repeatedly. Your server will also be able to handle a greater amount of
traffic with the same hardware. Perhaps most importantly, clients will
have a faster experience on your site, which may lead them to return
more frequently. While effective web caching is not a silver bullet,
setting up appropriate caching policies can give you measurable gains
with minimal work.


---

作者: [Justin Ellingwood](https://www.digitalocean.com/community/users/jellingwood)

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

推荐：[royaso](https://github.com/royaso)
      
via:   https://www.digitalocean.com/community/tutorials/web-caching-basics-terminology-http-headers-and-caching-strategies

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出


