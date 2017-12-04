Why microservices are a security issue
============================================================

### Maybe you don't want to decompose all your legacy applications into microservices, but you might consider starting with your security functions.

![Why microservices are a security issue](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_security_cc.png?itok=3V07Lpko "Why microservices are a security issue")
Image by : Opensource.com

I struggled with writing the title for this post, and I worry that it comes across as clickbait. If you've come to read this because it looked like clickbait, then sorry.[1][5]I hope you'll stay anyway: there are lots of fascinating[2][6] points and many[3][7]footnotes. What I  _didn't_  mean to suggest is that microservices cause [security][15]problems—though like any component, of course, they can—but that microservices are appropriate objects of interest to those involved with security. I'd go further than that: I think they are an excellent architectural construct for those concerned with security.

And why is that? Well, for those of us with a [systems security][16] bent, the world is an interesting place at the moment. We're seeing a growth in distributed systems, as bandwidth is cheap and latency low. Add to this the ease of deploying to the cloud, and more architects are beginning to realise that they can break up applications, not just into multiple layers, but also into multiple components within the layer. Load balancers, of course, help with this when the various components in a layer are performing the same job, but the ability to expose different services as small components has led to a growth in the design, implementation, and deployment of  _microservices_ .

More on Microservices

*   [How to explain microservices to your CEO][1]

*   [Free eBook: Microservices vs. service-oriented architecture][2]

*   [Secured DevOps for microservices][3]

So, [what exactly is a microservice][23]? I quite like [Wikipedia's definition][24], though it's interesting that security isn't mentioned there.[4][17] One of the points that I like about microservices is that, when well-designed, they conform to the first two points of Peter H. Salus' description of the [Unix philosophy][25]:

1.  Write programs that do one thing and do it well.

2.  Write programs to work together.

3.  Write programs to handle text streams, because that is a universal interface.

The last of the three is slightly less relevant, because the Unix philosophy is generally used to refer to standalone applications, which often have a command instantiation. It does, however, encapsulate one of the basic requirements of microservices: that they must have well-defined interfaces.

By "well-defined," I don't just mean a description of any externally accessible APIs' methods, but also of the normal operation of the microservice: inputs and outputs—and, if there are any, side-effects. As I described in a previous post, "[5 traits of good systems architecture][18]," data and entity descriptions are crucial if you're going to be able to design a system. Here, in our description of microservices, we get to see why these are so important, because, for me, the key defining feature of a microservices architecture is decomposability. And if you're going to decompose[5][8] your architecture, you need to be very, very clear which "bits" (components) are going to do what.

And here's where security starts to come in. A clear description of what a particular component should be doing allows you to:

*   Check your design

*   Ensure that your implementation meets the description

*   Come up with reusable unit tests to check functionality

*   Track mistakes in implementation and correct them

*   Test for unexpected outcomes

*   Monitor for misbehaviour

*   Audit actual behaviour for future scrutiny

Now, are all these things possible in a larger architecture? Yes, they are. But they become increasingly difficult where entities are chained together or combined in more complex configurations. Ensuring  _correct_  implementation and behaviour is much, much easier when you've got smaller pieces to work together. And deriving complex systems behaviours—and misbehaviours—is much more difficult if you can't be sure that the individual components are doing what they ought to be.

It doesn't stop here, however. As I've mentioned on many [previous occasions][19], writing good security code is difficult.[7][9] Proving that it does what it should do is even more difficult. There is every reason, therefore, to restrict code that has particular security requirements—password checking, encryption, cryptographic key management, authorisation, etc.—to small, well-defined blocks. You can then do all the things that I've mentioned above to try to make sure it's done correctly.

And yet there's more. We all know that not everybody is great at writing security-related code. By decomposing your architecture such that all security-sensitive code is restricted to well-defined components, you get the chance to put your best security people on that and restrict the danger that J. Random Coder[8][10] will put something in that bypasses or downgrades a key security control.

It can also act as an opportunity for learning: It's always good to be able to point to a design/implementation/test/monitoring tuple and say: "That's how it should be done. Hear, read, mark, learn, and inwardly digest.[9][11]"

Should you go about decomposing all of your legacy applications into microservices? Probably not. But given all the benefits you can accrue, you might consider starting with your security functions.

* * *

1Well, a little bit—it's always nice to have readers.

2I know they are: I wrote them.

3Probably less fascinating.

4At the time this article was written. It's entirely possible that I—or one of you—may edit the article to change that.

5This sounds like a gardening term, which is interesting. Not that I really like gardening, but still.[6][12]

6Amusingly, I first wrote, "…if you're going to decompose your architect…," which sounds like the strapline for an IT-themed murder film.

7Regular readers may remember a reference to the excellent film  _The Thick of It_ .

8Other generic personae exist; please take your pick.

9Not a cryptographic digest: I don't think that's what the original writers had in mind.

 _This article originally appeared on [Alice, Eve, and Bob—a security blog][13] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/microservices-are-security-issue

作者：[Mike Bursell ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mikecamel
[1]:https://blog.openshift.com/microservices-how-to-explain-them-to-your-ceo/?intcmp=7016000000127cYAAQ&src=microservices_resource_menu1
[2]:https://www.openshift.com/promotions/microservices.html?intcmp=7016000000127cYAAQ&src=microservices_resource_menu2
[3]:https://opensource.com/business/16/11/secured-devops-microservices?src=microservices_resource_menu3
[4]:https://opensource.com/article/17/11/microservices-are-security-issue?rate=GDH4xOWsgYsVnWbjEIoAcT_92b8gum8XmgR6U0T04oM
[5]:https://opensource.com/article/17/11/microservices-are-security-issue#1
[6]:https://opensource.com/article/17/11/microservices-are-security-issue#2
[7]:https://opensource.com/article/17/11/microservices-are-security-issue#3
[8]:https://opensource.com/article/17/11/microservices-are-security-issue#5
[9]:https://opensource.com/article/17/11/microservices-are-security-issue#7
[10]:https://opensource.com/article/17/11/microservices-are-security-issue#8
[11]:https://opensource.com/article/17/11/microservices-are-security-issue#9
[12]:https://opensource.com/article/17/11/microservices-are-security-issue#6
[13]:https://aliceevebob.com/2017/10/31/why-microservices-are-a-security-issue/
[14]:https://opensource.com/user/105961/feed
[15]:https://opensource.com/tags/security
[16]:https://aliceevebob.com/2017/03/14/systems-security-why-it-matters/
[17]:https://opensource.com/article/17/11/microservices-are-security-issue#4
[18]:https://opensource.com/article/17/10/systems-architect
[19]:https://opensource.com/users/mikecamel
[20]:https://opensource.com/users/mikecamel
[21]:https://opensource.com/users/mikecamel
[22]:https://opensource.com/article/17/11/microservices-are-security-issue#comments
[23]:https://opensource.com/resources/what-are-microservices
[24]:https://en.wikipedia.org/wiki/Microservices
[25]:https://en.wikipedia.org/wiki/Unix_philosophy
