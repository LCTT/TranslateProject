Introducing Flashback, an Internet mocking tool
============================================================

> Flashback is designed to mock HTTP and HTTPS resources, like web services and REST APIs, for testing purposes.

 ![Introducing Flashback, an Internet mocking tool](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/OSDC_Internet_Cables_520x292_0614_RD.png?itok=U4sZjWv5 "Introducing Flashback, an Internet mocking tool") 
>Image by : Opensource.com

At LinkedIn, we often develop web applications that need to interact with third-party websites. We also employ automatic testing to ensure the quality of our software before it is shipped to production. However, a test is only as useful as it is reliable.

With that in mind, it can be highly problematic for a test to have external dependencies, such as on a third-party website, for instance. These external sites may change without notice, suffer from downtime, or otherwise become temporarily inaccessible, as the Internet is not 100% reliable.

If one of our tests relies on being able to communicate with a third-party website, the cause of any failures is hard to pinpoint. A failure could be due to an internal change at LinkedIn, an external change made by the maintainers of the third-party website, or an issue with the network infrastructure. As you can imagine, there are many reasons why interactions with a third-party website may fail, so you may wonder, how will I deal with this problem?

The good news is that there are many Internet mocking tools that can help. One such tool is [Betamax][4]. It works by intercepting HTTP connections initiated by a web application and then later replaying them. For a test, Betamax can be used to replace any interaction over HTTP with previously recorded responses, which can be served very reliably.

Initially, we chose to use Betamax in our test automation at LinkedIn. It worked quite well, but we ran into a few problems:

*   For security reasons, our test environment does not have Internet access; however, as with most proxies, Betamax requires an Internet connection to function properly.
*   We have many use cases that require using authentication protocols, such as OAuth and OpenId. Some of these protocols require complex interactions over HTTP. In order to mock them, we needed a sophisticated model for capturing and replaying the requests.

To address these challenges, we decided to build upon ideas established by Betamax and create our own Internet mocking tool, called Flashback. We are also proud to announce that Flashback is now open source.

### What is Flashback?

Flashback is designed to mock HTTP and HTTPS resources, like web services and [REST][5] APIs, for testing purposes. It records HTTP/HTTPS requests and plays back a previously recorded HTTP transaction—which we call a "scene"—so that no external connection to the Internet is required in order to complete testing.

Flashback can also replay scenes based on the partial matching of requests. It does so using "match rules." A match rule associates an incoming request with a previously recorded request, which is then used to generate a response. For example, the following code snippet implements a basic match rule, where the test method "matches" an incoming request via [this URL][6].

HTTP requests generally contain a URL, method, headers, and body. Flashback allows match rules to be defined for any combination of these components. Flashback also allows users to add whitelist or blacklist labels to URL query parameters, headers, and the body.

For instance, in an OAuth authorization flow, the request query parameters may look like the following:

```
oauth_consumer_key="jskdjfljsdklfjlsjdfs",
      oauth_nonce="ajskldfjalksjdflkajsdlfjasldfja;lsdkj",
oauth_signature="asdfjaklsdjflasjdflkajsdklf",
oauth_signature_method="HMAC-SHA1",
oauth_timestamp="1318622958",
oauth_token="asdjfkasjdlfajsdklfjalsdjfalksdjflajsdlfa",
oauth_version="1.0"
```

Many of these values will change with every request because OAuth requires clients to generate a new value for **oauth_nonce** every time. In our testing, we need to verify values of **oauth_consumer_key, oauth_signature_method**, and **oauth_version** while also making sure that **oauth_nonce**, **oauth_signature**, **oauth_timestamp**, and **oauth_token** exist in the request. Flashback gives us the ability to create our own match rules to achieve this goal. This feature lets us test requests with time-varying data, signatures, tokens, etc. without any changes on the client side.

This flexible matching and the ability to function without connecting to the Internet are the attributes that separate Flashback from other mocking solutions. Some other notable features include:

*   Flashback is a cross-platform and cross-language solution, with the ability to test both JVM (Java Virtual Machine) and non-JVM (C++, Python, etc.) apps.
*   Flashback can generate SSL/TLS certificates on the fly to emulate secured channels for HTTPS requests.

### How to record an HTTP transaction

Recording an HTTP transaction for later playback using Flashback is a relatively straightforward process. Before we dive into the procedure, let us first lay out some terminology:

*   A** Scene** stores previously recorded HTTP transactions (in JSON format) that can be replayed later. For example, here is one sample [Flashback scene][1].     
*   The **Root Path** is the file path of the directory that contains the Flashback scene data.
*   A **Scene Name** is the name of a given scene.
*   A **Scene Mode** is the mode in which the scene is being used—either "record" or "playback."
*   A **Match Rule** is a rule that determines if the incoming client request matches the contents of a given scene.
*   **Flashback Proxy** is an HTTP proxy with two modes of operation, record and playback. 
*   **Host** and **port** are the proxy host and port.

In order to record a scene, you must make a real, external request to the destination, and the HTTPS request and response will then be stored in the scene with the match rule that you have specified. When recording, Flashback behaves exactly like a typical MITM (Man in the Middle) proxy—it is only in playback mode that the connection flow and data flow are restricted to just between the client and the proxy.

To see Flashback in action, let us create a scene that captures an interaction with example.org by doing the following:

1\. Check out the Flashback source code:

```
git clone https://github.com/linkedin/flashback.git
```

2\. Start the Flashback admin server:

```
./startAdminServer.sh -port 1234
```

3\. Start the [Flashback Proxy][7]. Note the Flashback above will be started in record mode on localhost, port 5555\. The match rule requires an exact match (match HTTP body, headers, and URL). The scene will be stored under **/tmp/test1**.

4\. Flashback is now ready to record, so use it to proxy a request to example.org:

```
curl http://www.example.org -x localhost:5555 -X GET
```

5\. Flashback can (optionally) record multiple requests in a single. To finish recording, [shut down Flashback][8].

6\. To verify what has been recorded, we can view the contents of the scene in the output directory (**/tmp/test1**). It should [contain the following][9].

It's also easy to [use Flashback in your Java code][10].

### How to replay an HTTP transaction

To replay a previously stored scene, use the same basic setup as is used when recording; the only difference is that you [set the "Scene Mode" to "playback" in Step 3 above][11].

One way to verify that the response is from the scene, and not the external source, is to disable your Internet connectivity temporarily when you go through Steps 1 through 6\. Another way is to modify your scene file and see if the response is the same as what you have in the file.

Here is [an example in Java][12].

### How to record and replay an HTTPS transaction

The process for recording and replaying an HTTPS transaction with Flashback is very similar to that used for HTTP transactions. However, special care needs to be given to the security certificates used for the SSL component of HTTPS. In order for Flashback to act as a MITM proxy, creating a Certificate Authority (CA) certificate is necessary. This certificate will be used during the creation of the secure channel between the client and Flashback, and will allow Flashback to inspect the data in HTTPS requests it proxies. This certificate should then be stored as a trusted source so that the client will be able to authenticate Flashback when making calls to it. For instructions on how to create a certificate, there are many resources [like this one][13] that can be quite helpful. Most companies have their own internal policies for administering and securing certificates—be sure to follow yours.

It is worth noting here that Flashback is intended to be used for testing purposes only. Feel free to integrate Flashback with your service whenever you need it, but note that the record feature of Flashback will need to store everything from the wire, then use it during the replay mode. We recommend that you pay extra attention to ensure that no sensitive member data is being recorded or stored inadvertently. Anything that may violate your company's data protection or privacy policy is your responsibility.

Once the security certificate is accounted for, the only difference between HTTP and HTTPS in terms of setup for recording is the addition of a few further parameters.

*   **RootCertificateInputStream**: This can be either a stream or file path that indicates the CA certificate's filename.
*   **RootCertificatePassphrase**: This is the passphrase created for the CA certificate.
*   **CertificateAuthority**: These are the CA certificate's properties.

[View the code used to record an HTTPS transaction][14] with Flashback, including the above terms.

Replaying an HTTPS transaction with Flashback uses the same process as recording. The only difference is that the scene mode is set to "playback." This is demonstrated in [this code][15].

### Supporting dynamic changes

In order to allow for flexibility in testing, Flashback lets you dynamically change scenes and match rules. Changing scenes dynamically allows for testing the same requests with different responses, such as success, **time_out**, **rate_limit**, etc. [Scene changes][16] only apply to scenarios where we have POSTed data to update the external resource. See the following diagram as an example.

 ![Scenarios where we have POSTed data to update the external resource.](https://opensource.com/sites/default/files/changingscenes.jpg "Scenarios where we have POSTed data to update the external resource.") 

Being able to [change the match rule][17] dynamically allows us to test complicated scenarios. For example, we have a use case that requires us to test HTTP calls to both public and private resources of Twitter. For public resources, the HTTP requests are constant, so we can use the "MatchAll" rule. However, for private resources, we need to sign requests with an OAuth consumer secret and an OAuth access token. These requests contain a lot of parameters that have unpredictable values, so the static MatchAll rule wouldn't work.

### Use cases

At LinkedIn, Flashback is mainly used for mocking different Internet providers in integration tests, as illustrated in the diagrams below. The first diagram shows an internal service inside a LinkedIn production data center interacting with Internet providers (such as Google) via a proxy layer. We want to test this internal service in a testing environment.

 ![Testing this internal service in a testing environment.](https://opensource.com/sites/default/files/testingenvironment.jpg "Testing this internal service in a testing environment.") 

The second and third diagrams show how we can record and playback scenes in different environments. Recording happens in our dev environment, where the user starts Flashback on the same port as the proxy started. All external requests from the internal service to providers will go through Flashback instead of our proxy layer. After the necessary scenes get recorded, we can deploy them to our test environment.

 ![After the necessary scenes get recorded, we can deploy them to our test environment.](https://opensource.com/sites/default/files/testenvironmentimage2.jpg "After the necessary scenes get recorded, we can deploy them to our test environment.") 

In the test environment (which is isolated and has no Internet access), Flashback is started on the same port as in the dev environment. All HTTP requests are still coming from the internal service, but the responses will come from Flashback instead of the Internet providers.

 ![Responses will come from Flashback instead of the Internet providers.](https://opensource.com/sites/default/files/flashbackresponsesimage.jpg "Responses will come from Flashback instead of the Internet providers.") 

### Future directions

We'd like to see if we can support non-HTTP protocols, such as FTP or JDBC, in the future, and maybe even give users the flexibility to inject their own customized protocol using the MITM proxy framework. We will continue improving the Flashback setup API to make supporting non-Java languages easier.

### Now available as an open source project

We were fortunate enough to present Flashback at GTAC 2015\. At the show, several members of the audience asked if we would be releasing Flashback as an open source project so they could use it for their own testing efforts.

### Google TechTalks: GATC 2015—Mock the Internet

<iframe allowfullscreen="" frameborder="0" height="315" src="https://www.youtube.com/embed/6gPNrujpmn0?origin=https://opensource.com&amp;enablejsapi=1" width="560" id="6gPNrujpmn0" data-sdi="true"></iframe>

We're happy to announce that Flashback is now open source and is available under a BSD (Berkeley Software Distribution) two-clause license. To get started, visit the [Flashback GitHub repo][18].

 _Originally posted on the [LinkedIn Engineering blog][2]. Reposted with permission._ 

### Acknowledgements

Flashback was created by [Shangshang Feng][19], [Yabin Kang][20], and [Dan Vinegrad][21], and inspired by [Betamax][22]. Special thanks to [Hwansoo Lee][23], [Eran Leshem][24], [Kunal Kandekar][25], [Keith Dsouza][26], and [Kang Wang][27] for help with code reviews. We would also thank our management—[Byron Ma][28], [Yaz Shimizu][29], [Yuliya Averbukh][30], [Christopher Hazlett][31], and [Brandon Duncan][32]—for their support in the development and open sourcing of Flashback.

--------------------------------------------------------------------------------

作者简介：

Shangshang Feng - Shangshang is senior software engineer in LinkedIn's NYC office. He spent the last three and half years working on a gateway platform at LinkedIn. Before LinkedIn, he worked on infrastructure teams at Thomson Reuters and ViewTrade securities.

---------

via: https://opensource.com/article/17/4/flashback-internet-mocking-tool

作者：[ Shangshang Feng][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/shangshangfeng
[1]:https://gist.github.com/anonymous/17d226050d8a9b79746a78eda9292382
[2]:https://engineering.linkedin.com/blog/2017/03/flashback-mocking-tool
[3]:https://opensource.com/article/17/4/flashback-internet-mocking-tool?rate=Jwt7-vq6jP9kS7gOT6f6vgwVlZupbyzWsVXX41ikmGk
[4]:https://github.com/betamaxteam/betamax
[5]:https://en.wikipedia.org/wiki/Representational_state_transfer
[6]:https://gist.github.com/anonymous/91637854364287b38897c0970aad7451
[7]:https://gist.github.com/anonymous/2f5271191edca93cd2e03ce34d1c2b62
[8]:https://gist.github.com/anonymous/f899ebe7c4246904bc764b4e1b93c783
[9]:https://gist.github.com/sf1152/c91d6d62518fe62cc87157c9ce0e60cf
[10]:https://gist.github.com/anonymous/fdd972f1dfc7363f4f683a825879ce19
[11]:https://gist.github.com/anonymous/ae1c519a974c3bc7de2a925254b6550e
[12]:https://gist.github.com/anonymous/edcc1d60847d51b159c8fd8a8d0a5f8b
[13]:https://jamielinux.com/docs/openssl-certificate-authority/introduction.html
[14]:https://gist.github.com/anonymous/091d13179377c765f63d7bf4275acc11
[15]:https://gist.github.com/anonymous/ec6a0fd07aab63b7369bf8fde69c1f16
[16]:https://gist.github.com/anonymous/1f1660280acb41277fbe2c257bab2217
[17]:https://gist.github.com/anonymous/0683c43f31bd916b76aff348ff87f51b
[18]:https://github.com/linkedin/flashback
[19]:https://www.linkedin.com/in/shangshangfeng
[20]:https://www.linkedin.com/in/benykang
[21]:https://www.linkedin.com/in/danvinegrad/
[22]:https://github.com/betamaxteam/betamax
[23]:https://www.linkedin.com/in/hwansoo/
[24]:https://www.linkedin.com/in/eranl/
[25]:https://www.linkedin.com/in/kunalkandekar/
[26]:https://www.linkedin.com/in/dsouzakeith/
[27]:https://www.linkedin.com/in/kang-wang-44960b4/
[28]:https://www.linkedin.com/in/byronma/
[29]:https://www.linkedin.com/in/yazshimizu/
[30]:https://www.linkedin.com/in/yuliya-averbukh-818a41/
[31]:https://www.linkedin.com/in/chazlett/
[32]:https://www.linkedin.com/in/dudcat/
[33]:https://opensource.com/user/125361/feed
[34]:https://opensource.com/users/shangshangfeng
