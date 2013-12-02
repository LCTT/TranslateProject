Security Headers on the Top 1,000,000 Websites: November 2013 Report
================================================================================
It has been almost exactly a year since we conducted the first top 1 million security headers report so it is a great time to re-run the analysis and see how well security header adoption is growing. As before, the latest Chrome and Firefox User-Agent strings were used to make requests to the top 1 million sites over both HTTP and HTTPS. Out of the 2,589,918 responses we had over 100,000 distinct security headers and values to analyze.

Comparing with previous scans, we had 514,288 URLs that matched the first run we did in November 2012 and 1,207,169 URLs that matched from March 2013. This time around we added yet another security header “X-XSS-Protection” due to a request from a commenter on this blog. Unfortunately, we did not store this header in any of the prior scans so we are unable to compare its adoption rate. 

### Changes, Additions and Removals Yearly Review ###

A total of 7,258 new security headers were added over the course of a year to the 514,288 URLs that existed in both data sets. As before, we see the largest increase in additions to X-Frame-Options and CORS headers. In a not so distant fourth we see Strict-Transport-Security steadily climbing with 538 new sites using the header. Even though X-Content-Security-Policy and X-WebKit-CSP are deprecated, we still see a small increase in their additions. Once again the highest used headers also end up having the highest number of removals with X-Frame-Options being removed from 365 sites over the course of the year.

![](http://www.veracode.com/blog/wp-content/uploads/2013/11/add_change_remove_11.12-11.131.png)

You may notice that the Content-Security-Policy header is missing from the yearly review, this is because it was not standardized when we first started this analysis. To see the adoption rate of the standardized CSP, we need to look at a comparison of the scan that was conducted in March 2013.

### Changes, Additions and Removals from March 2013 ###

We have a lot more URLs that matched since last March, yet surprisingly, the charts look extremely similar. 7,099 new security headers were added for the 1,207,169 URLs that matched between this run and March 2013. Of these sites, a disappointingly small number of 62 sites enabled Content-Security-Policy with 47 sites enabling the soon to be disabled X-Content-Security-Policy header.

![](http://www.veracode.com/blog/wp-content/uploads/2013/11/add_change_remove_03.13-11.13.png)

While it would be nice to see CSP’s adoption rates increase more, it is quite understandable as it is such a large undertaking for any website to create a compliant policy.

### November 2013 Results ###

#### X-XSS-Protection ####

This time around another header was added to the analysis. The Microsoft endorsed header was built to allow sites to control how Internet Explorer’s XSS Filtering feature is to be handled on a resource by resource basis. Valid values for X-XSS-Protection are as follows:

1. 0 – Disables XSS protections
1. 1 – Enables XSS protections, in IE the filter will attempt to sanitize potential malicious characters.
1. 1; mode=block – Enables XSS protections and instructs IE to block the response instead of sanitizing.
1. 1; report=[url] – Allows reports to be sent to the specified URL of potential XSS attempts. 

It should be noted that Google Chrome’s XSS Auditor will also be disabled if a resource responds with 0 as the value for the X-XSS-Protection header.

![](http://www.veracode.com/blog/wp-content/uploads/2013/11/x_xss_protection_11.13.png)

As previous readers will remember, invalid header values are a serious problem and X-XSS-Protection is no exception. Almost 480 sites incorrectly specified the value of “0; mode=block”. This means that 477 sites who think they are blocking XSS attacks are actively disabling the XSS protections built in to IE and Chrome. Please note that [YouTube][1] and [Blogspot][2] make up the majority of URLs using X-XSS-Protection with 14,210 for YouTube and 18,587 for Blogspot.

### X-Frame-Options ###

![](http://www.veracode.com/blog/wp-content/uploads/2013/11/x_frame_options_11.13.png)

X-Frame-Options is still holding strong with SAMEORIGIN being by far the largest setting with YouTube again taking up the majority with 14,178 URLs all of which are set to SAMEORIGIN. Along with the jump in sites using X-Frame-Options we are also seeing an increase in invalid values being configured.

### Cross Origin Request Sharing (CORS) Headers ###

Once again we looked at the two CORS headers Access-Control-Allow-Origin and Access-Control-Allow-Credentials.

![](http://www.veracode.com/blog/wp-content/uploads/2013/11/acao_11.13.png)

Unfortunately, we are still seeing a large number of sites incorrectly configuring Access-Control-Allow-Origin by specifying wildcards or multiple origins separated by various characters. As a reminder Access-Control-Allow-Origin only allows either * (wildcard value) or a single origin with a valid scheme specified.

As for Access-Control-Allow-Credentials, 1388 sites have set the value to true, 51 for false. Surprisingly, we identified 196 sites setting wildcard origin access but setting Access-Control-Allow-Credentials to true which is an invalid combination of settings.

### Strict-Transport-Security ###

Due to readers suggestions we have changed the long max-age value to be anything greater than 604800 seconds, or 7 days. Likewise, values below are considered to be a short max-age. [Facebook][3] and [Etsy][4] comprise 74 and 61 URLs respectively in the Max Age of 0 column. As a reminder, a header value of 0 clears the domain from the browser’s Strict Transport Security cache. Of the more interesting invalid values, a large number of sites incorrectly use ‘,’ as a delimiter between the max-age value and includeSubDomains directives. Unfortunately, both Firefox and Chrome are extremely strict in this regard and will refuse to add the site to the STS cache if the ‘,’ character is used instead of the RFC defined token of ‘;’. Once again, please check the RFCs before implementing any of these security headers.

![](http://www.veracode.com/blog/wp-content/uploads/2013/11/sts_11.131.png)

#### Content-Security-Policy ####

Content Security Policy continues to grow in usage but extremely slowly. Only 269 sites are using the [w3 specification’s Content-Security-Policy][5] header, with 95 of these URLs coming from Facebook. Interestingly, 584 sites are using X-Content-Security-Policy and 487 sites are using X-Webkit-CSP. It should be noted that these two headers are already considered deprecated but have yet to be disabled. Only an extremely small number of sites using the report-only versions of the CSP headers were observed. It would be expected that web site operators wishing to test out CSP would use the report only mode to determine how Content Security Policy would impact their site, yet we only see 24 sites using Content-Security-Policy-Report-Only.

![](http://www.veracode.com/blog/wp-content/uploads/2013/11/csp_11.13.png)

The most interesting result of the CSP analysis is the large number of sites which use CSP with the unsafe directives. It is assumed the reason unsafe-inline has such a high rate of usage is due to how extremely hard it is for developers to remove all inline script from web page elements. While disappointing to see, it is understandable to anyone who has attempted to enact a strict CSP policy.

### Conclusion ###

It is safe to say that we have a long way to go to making sure our sites use all available means to protect themselves. While security headers are only a small part of defense, applied appropriately they can and do help us all be more secure internet users. While encouraging to see the numbers increasing, we must keep in mind that less than 10% (199,350) of the 2,589,918 URLs analyzed have security headers. While strict adherence to RFCs is necessary, typos, combined with the rigidness of directive parsing, do not help site administrators or users when encountering these headers. While hope should not be given up on CSP, it’s extremely low adoption rate is rather concerning and it may be worth considering creation of tools to help create, verify and support site administrators that wish to adopt CSP.

As before, Veracode has released the raw data from this analysis, so feel free to download the November 2013 results here.

--------------------------------------------------------------------------------

via: http://www.veracode.com/blog/2013/11/security-headers-on-the-top-1000000-websites-november-2013-report/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.youtube.com/
[2]:http://www.blogspot.com/
[3]:http://www.facebook.com/
[4]:http://www.etsy.com/
[5]:http://www.w3.org/TR/CSP/