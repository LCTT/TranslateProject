Mitigating known security risks in open source libraries
============================================================

>Fixing vulnerable open source packages.


![Machine](https://d3tdunqjn7n0wj.cloudfront.net/360x240/machine-2881186_1920-aa3ebed0567d4ab0a107baa640661e35.jpg)

Machine (source: [Skitterphoto][9])


This is an excerpt from [Securing Open Source Libraries][13], by Guy Podjarny. 
[Read the preceding chapter][14] or [view the full report][15].


### Fixing Vulnerable Packages

Finding out if you’re using vulnerable packages is an important step, but it’s not the real goal. The real goal is to fix those issues!

This chapter focuses on all you should know about fixing vulnerable packages, including remediation options, tooling, and various nuances. Note that SCA tools traditionally focused on finding or preventing vulnerabilities, and most put little emphasis on fix beyond providing advisory information or logging an issue. Therefore, you may need to implement some of these remediations yourself, at least until more SCA solutions expand to include them.

There are several ways to fix vulnerable packages, but upgrading is the best choice. If that is not possible, patching offers a good alternative. The following sections discuss each of these options, and we will later take a look at what you can do in situations where neither of these solutions is possible.

### Upgrading

As I’ve previously stated, a vulnerability is a type of bug, and the best way to address a bug is to use a newer version where it is fixed. And so, the best way to fix a vulnerable dependency is to upgrade to a newer version. Statistically, most disclosed vulnerabilities are eventually fixed. In npm, 59% of reported vulnerabilities have a fix. In Maven, 90% are remediable, while that portion is 85% in RubyGems.[1][4] In other words, more often than not, there is a version of your library where the vulnerability is fixed.

Finding a vulnerable package requires knowledge of which versions are vulnerable. This means that, at the very least, every tool that finds issues can tell which versions are vulnerable, allowing you to look for newer versions of the library and upgrade. Most tools also take the minor extra step of determining the minimal fixed version, and noting it in the advisory.

Upgrading is therefore the best way to make a vulnerability go away. It’s technically easy (update a manifest or lock file), and it’s something dev teams are very accustomed to doing. That said, upgrading still holds some complexity.

### Major Upgrades

While most issues are fixed, very often the fix is only applied to the latest and greatest version of the library. If you’re still using an older version of the library, upgrading may mean switching to a new major version. Major upgrades are typically not backward compatible, introducing more risk and requiring more dev effort.

Another reason for fixing an issue only in the next major version is that sometimes fixing a vulnerability means reducing functionality. For instance, fixing a certain [XSS vulnerability in a jQuery 2.x codebase][5] requires a change to the way certain selectors are interpreted. The jQuery team determined too many people are relying on this functionality to deem this a non-breaking change, and so only fixed the vulnerability in their 3.x stream.

For these reasons, a major upgrade can often be difficult, but if you can accept it, it’s still the best way to fix a vulnerability.

### Indirect Dependency Upgrade

If you’re consuming a dependency directly, upgrading is relatively straightforward. But what happens when one of your dependencies is the one who pulled in the vulnerable package? Most dependencies are in fact indirect dependencies (a.k.a. transitive dependencies), making upgrades a bit more complex.

The cleanest way to perform an indirect upgrade is through a direct one. If your app uses `A@1`, which uses a vulnerable `B@1`, it’s possible that upgrading to `A@2` will trigger a downstream upgrade to `B@2` and fix the issue. Applying such an upgrade is easy (it’s essentially a direct upgrade), but discovering  _which_  upgrade to do (and whether one even exists) is time consuming. While not common, some SCA tools can determine and advise on the  _direct_  upgrades you need to make to fix an  _indirect_  vulnerability. If your tooling doesn’t support it, you’ll need to do the searching manually.

Old vulnerabilities in indirect libraries can often be fixed with a direct upgrade, but such upgrades are frequently unavailable for new issues. When a new vulnerability is disclosed, even if the offending package releases a fix right away, it takes a while for the dependency chain to catch up. If you can’t find a path to an indirect upgrade for a newly disclosed flaw, be sure to recheck frequently as one may show up soon. Once again, some SCA tools will do this monitoring for you and alert you when new remediations are available.


![The direct vulnerable EJS can be upgraded, but indirect instance cannot currently be upgraded](https://d3ansictanv2wj.cloudfront.net/sosl_0301-d3ce5b0bf64893e26ee74627bfba5300.png)
Figure 1-1. The direct vulnerable EJS can be upgraded, but indirect instance cannot currently be upgraded

### Conflicts

Another potential obstacle to upgrading is a conflict. Many languages, such as Ruby and Python, require dependencies to be global, and clients such as Ruby’s bundler and Python’s pip determine the mix of library versions that can co-exist. As a result, upgrading one library may trigger a conflict with another. While developers are adept at handling such conflicts, there are times when such issues simply cannot be resolved.

On the positive side, global dependency managers, such as Ruby’s bundler, allow the parent app to add a constraint. For instance, if a downstream `B@1` gem is vulnerable, you can add `B@^2` to your Gemfile, and have bundler sort out the surrounding impact. Adding such constraints is a safe and legitimate solution, as long as your ecosystem tooling can figure out a conflict-free combination of libraries.

### Is a Newer Version Always Safer?

The conversation about upgrading begs a question: can a vulnerability also be fixed by downgrading?

For the most part, the answer is no. Vulnerabilities are bugs, and bugs are typically fixed in a newer version, not an older one. In general, maintaining a good upgrade cadence and keeping your dependencies up to date is a good preventative measure to reduce the risk of vulnerabilities.

However, in certain cases, code changes or (more often) new features are the ones that trigger a vulnerability. In those cases, it’s indeed possible that downgrading will fix the discovered flaw. The advisory should give you the information you need about which versions are affected by the vulnerability. That said, note that downgrading a package puts you at higher risk of being exposed to new issues, and can make it harder to upgrade when that happens. I suggest you see downgrading as a temporary and rarely used remediation path.

### There Is No Fixed Version

Last on the list of reasons preventing you from upgrading to a safe version is such a version not existing in the first place!

While most vulnerabilities are fixed, many remain unfixed. This is sometimes a temporary situation—for instance, when a vulnerability was made public without waiting for a fix to be released. Other times, it may be a more long-term scenario, as many repositories fall into a poor maintenance state, and don’t fix reported issues nor accept community patches.

In the following sections I’ll discuss some options for when you cannot upgrade a vulnerability away.

### Patching

Despite all the complexity it may involve, upgrading is the best way to fix an issue. However, if you cannot upgrade, patching the vulnerability is the next best option.

Patching means taking a library as is, including its vulnerabilities, and then modifying it to fix a vulnerability it holds. Patching should apply the minimal set of changes to the library, so as to keep its functionality unharmed and only address the issue at hand.

Patching inevitably holds a certain amount of risk. When you use a package downloaded millions of time a month, you have some assurance that bugs in it will be discovered, reported, and often fixed. When you download that package and modify it, your version of the code will not be quite as battle tested.

Patching is therefore an exercise in risk management. What presents a greater risk: having the vulnerability, or applying the patch? For well-managed patches, especially for ones small in scope, I believe it’s almost always better to have a patch than a vulnerability.

It’s worth noting that patching application dependencies is a relatively new concept, but an old hat in the operating system world. When dealing with operating system dependencies, we’re accustomed to consuming a feed of fixes by running `apt-get upgrade` or an equivalent command, often remaining unaware of which issues we fixed. What most don’t know is that many of the fixes you pull down are in fact back-ported versions of the original OS author code changes, created and tested by Canonical, RedHat, and the like. A safe registry that feeds you the non-vulnerable variants of your dependencies doesn’t exist yet in the application libraries world, but patching is sometimes doable in other ways.

### Sourcing Patches

To create a patch, you first need to have a fix for the vulnerability! You could write one yourself, but patches are more often sourced from existing community fixes.

The first place to look for a patch is a new version of the vulnerable package. Most often the vulnerability  _was_  fixed by the maintainers of the library, but that fix may be in an out-of-reach indirect dependency, or perhaps was only fitted back into the latest major version. Those fixes can be extracted from the original repo and stored into their own patch file, as well as back-ported into older versions if need be.

Another common source for patches are external pull requests (PRs). Open source maintenance is a complicated topic, and it’s not uncommon for repos to go inactive. In such repos, you may find community pull requests that fix a vulnerability, have been commented on and perhaps vetted by others, but are not merged and published into the main stream. Such PRs are a good starting point—if not the full solution—for creating a patch. For instance, an XSS issue in the popular JavaScript Markdown parsing library marked had an [open fix PR][6] for nearly a year before it was incorporated into a new release. During this period, you could use the fix PR code to patch the issue in your apps.

Snyk maintains its own set of patches in its [open source database][7]. Most of those patches are captures or back-ports of original fixes, a few are packaged pull requests, and even fewer are written by the Snyk security research team.

### Depend on GitHub Hash

In very specific cases, you may be able to patch without storing any code changes. This is only possible if the vulnerable dependency is a direct dependency of your app, and the public repo holding the package has a commit that fixes the issue (often a pull request, as mentioned before).

If that’s the case, most package managers allow you to change your manifest file to point to the GitHub commit instead of naming your package and version. Git hashes are immutable, so you’ll know exactly what you’re getting, even if the pull request evolved. However, the commit may be deleted, introducing certain reliability concerns.

### Fork and Patch

When patching a vulnerability in a direct dependency, assuming you don’t want to depend on an external commit or have none to use, you can create one of your own. Doing so typically means forking the GitHub repository to a user you control, and patching it. Once done, you can modify your manifest to point to your fixed repository.

Forking is a fairly common way of fixing different bugs in dependencies, and also carries some nice reliability advantages, as the code you use is now in your own control. It has the downside of breaking off the normal version stream of the dependency, but it’s a decent short-term solution to vulnerabilities in direct dependencies. Unfortunately, forking is not a viable option for patching indirect dependencies.

### Static Patching at Build Time

Another opportunity to patch a dependency is during build time. This type of patching is more complicated, as it requires:

1.  Storing a patch in a file (often a  _.patch_  file, or an alternative JAR file with the issue fixed)

2.  Installing the dependencies as usual

3.  Determining where the dependency you’d like to patch was installed

4.  Applying the patch by modifying or swapping out the risky code

These steps are not trivial, but they’re also usually doable using package manager commands. If a vulnerability is worth fixing, and there are no easier means to fix it, this approach should be considered.

This is a classic problem for tools to address, as patches can be reused and their application can be repeated. However, at the time of this writing, Snyk is the only SCA tool that maintains patches in its DB and lets you apply them in your pipeline. I predict over time more and more tools will adopt this approach.

### Dynamic Patching at Boot Time

In certain programming languages, classes can also be modified at runtime, a technique often referred to as "monkey patching." Monkey patching can be used to fix vulnerabilities, though that practice has not become the norm in any ecosystem. The most prevalent use of monkey patching to fix vulnerabilities is in Ruby on Rails, where the Rails team has often released patches for vulnerabilities in the libraries it maintains.

### Other Remediation Paths

So far, I’ve stated upgrades are the best way to address a vulnerability, and patching the second best. However, what should you do when you cannot (or will not) upgrade nor patch?

In those cases, you have no choice but to dig deeper. You need to understand the vulnerability better, and how it plays into your application. If it indeed puts your application at notable risk, there are a few steps you can take.

### Removal

Removing a dependency is a very effective way of fixing its vulnerabilities. Unfortunately, you’ll be losing its functionality at the same time.

Dropping a dependency is often hard, as it by definition requires changes to your actual code. That said, such removal may turn out to be easy—for instance, when a dependency was used for convenience and can be rewritten instead, or when a comparable alternative exists in the ecosystem.

Easy or hard, removing a dependency should always be considered an option, and weighed against the risk of keeping it.

### External Mitigation

If you can’t fix the vulnerable code, you can try to block attacks that attempt to exploit it instead. Introducing a rule in a web app firewall, modifying the parts of your app that accept related user input, or even blocking a port are all potential ways to mitigate a vulnerability.

Whether you can mitigate and how to do so depends on the specific vulnerability and application, and in many cases such protection is impossible or high risk. That said, the most trivially exploited vulnerabilities, such as the March 2017 Struts2 RCE and ImageTragick, are often the ones most easily identified and blocked, so this approach is definitely worth exploring.

###### Tip

### Protecting Against Unknown Vulnerabilities

Once you’re aware of a known vulnerability, your best move is to fix it, and external mitigation is a last resort. However, security controls that protect against unknown vulnerabilities, ranging from web app firewalls to sandboxed processes to ensuring least privilege, can often protect you from known vulnerabilities as well.

### Log Issue

Last but not least, even if you choose not to remediate the issue, the least you can do is create an issue for it. Beyond its risk management advantages, logging the issue will remind you to re-examine the remediation options over time—for instance, looking for newly available upgrades or patches that can help.

If you have a security operations team, make sure to make them aware of vulnerabilities you are not solving right now. This information can prove useful when they triage suspicious behavior on the network, as such behavior may come down to this security hole being exploited.

### Remediation Process

Beyond the specific techniques, there are few broader guidelines when it comes to remediating issues.

### Ignoring Issues

If you choose not to fix an issue, or to fix it through a custom path, you’ll need to tell your SCA tool you did. Otherwise, the tool will continue to indicate this problem.

All OSS security tools support ignoring a vulnerability, but have slightly different capabilities. You should consider the following, and try to note that in your tool of choice:

*   Are you ignoring the issue because it doesn’t affect you (perhaps you’ve mitigated it another way) or because you’ve accepted the risk? This may reflect differently in your top-level reports.

*   Do you want to mute the issue indefinitely, or just "snooze" it? Ignoring temporarily is common for low-severity issues that don’t yet have an upgrade, where you’re comfortable taking the risk for a bit and anticipate an upgrade will show up soon.

*   Do you want to ignore all instances of this known vulnerability (perhaps it doesn’t apply to your system), or only certain vulnerable paths (which, after a careful vetting process, you’ve determined to be non-exploitable)?

Properly tagging the reason for muting an alert helps manage these vulnerabilities over time and across projects, and reduces the chance of an issue being wrongfully ignored and slipping through the cracks.

### Fix All Vulnerable Paths

For all the issues you’re not ignoring, remember that remediation has to be done for  _every vulnerable path_ .

This is especially true for upgrades, as every path must be assessed for upgrade separately, but also applies to patches in many ecosystems.

### Track Remediations Over Time

As already mentioned, a fix is typically issued for the vulnerable package first, and only later propagates through the dependency chain as other libraries upgrade to use the newer (and safer) version. Similarly, community or author code contributions are created constantly, addressing issues that weren’t previously fixable.

Therefore, it’s worth tracking remediation options over time. For ignored issues, periodically check if an easy fix is now available. For patched issues, track potential updates you can switch to. Certain SCA tools automate this tracking and notify you (or open automated pull requests) when such new remediations are available.

### Invest in Making Fixing Easy

The unfortunate reality is that new vulnerabilities in libraries are discovered all the time. This is a fact of life—code will have bugs, some of those bugs are security bugs (vulnerabilities), and some of those are disclosed. Therefore, you and your team should expect to get a constant stream of vulnerability notifications, which you need to act on.

If fixing these vulnerabilities isn’t easy, your team will not do it. Fixing these issues competes with many priorities, and its oh-so-easy to put off this invisible risk. If each alert requires a lot of time to triage and determine a fix for, the ensuing behavior would likely be to either put it off or try to convince yourself it’s not a real problem.

In the world of operating systems, fixing has become the default action. In fact, "patching your servers" means taking in a feed of fixes, often without ever knowing which vulnerabilities we fix. We should strive to achieve at least this level of simplicity when dealing with vulnerable app dependencies too.

Part of this effort is on tooling providers. SCA tools should let you fix vulnerabilities with a click or proactive pull requests, or patch them with a single command like `apt-get upgrade` does on servers. The other part of the effort is on you. Consider it a high priority to make vulnerability remediation easy, choose priority, choose your tools accordingly, and put in the effort to enrich or adapt those tools to fit your workflow.

### Summary

You should always keep in mind that finding these vulnerabilities isn’t the goal—fixing them is. Because fixing vulnerabilities is something your team will need to do often, defining the processes and tools to get that done is critical.

A great way to get started with remediation is to find vulnerabilities that can be fixed with a non-breaking upgrade, and get those upgrades done. While not entirely risk-free, these upgrades should be backward compatible, and getting these security holes fixed gets you off to a very good start.

[1][8]Stats based on vulnerabilities curated in the Snyk vulnerability DB.


This is an excerpt from [Securing Open Source Libraries][16], by Guy Podjarny. 
[Read the preceding chapter][17] or [view the full report][18].



-------------------------------------

作者简介：

Guy Podjarny (Guypo) is a web performance researcher/evangelist and Akamai's Web CTO, focusing primarily on Mobile and Front-End performance. As a researcher, Guy frequently runs large scale tests, exploring performance in the real world and matching it to how browsers behave, and was one of the first to highlight the performance implications of Responsive Web Design. Guy is also the author of Mobitest, a free mobile measurement tool, and contributes to various open source tools. Guy was previously the co-founder and CTO of blaze.io, ac...

--------------------------------------------------------------------------------

via: https://www.oreilly.com/ideas/mitigating-known-security-risks-in-open-source-libraries

作者：[ Guy Podjarny][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.oreilly.com/people/4dda0-guy-podjarny
[1]:https://www.safaribooksonline.com/home/?utm_source=newsite&utm_medium=content&utm_campaign=lgen&utm_content=security-post-safari-right-rail-cta
[2]:https://www.safaribooksonline.com/home/?utm_source=newsite&utm_medium=content&utm_campaign=lgen&utm_content=security-post-safari-right-rail-cta
[3]:https://www.safaribooksonline.com/home/?utm_source=newsite&utm_medium=content&utm_campaign=lgen&utm_content=security-post-safari-right-rail-cta
[4]:https://www.oreilly.com/ideas/mitigating-known-security-risks-in-open-source-libraries#id-xJ0u4SBFphz
[5]:https://snyk.io/vuln/npm:jquery:20150627
[6]:https://github.com/chjj/marked/pull/592
[7]:https://github.com/snyk/vulnerabilitydb
[8]:https://www.oreilly.com/ideas/mitigating-known-security-risks-in-open-source-libraries#id-xJ0u4SBFphz-marker
[9]:https://pixabay.com/en/machine-mill-industry-steam-2881186/
[10]:https://www.oreilly.com/ideas/mitigating-known-security-risks-in-open-source-libraries
[11]:https://www.oreilly.com/people/4dda0-guy-podjarny
[12]:https://www.oreilly.com/people/4dda0-guy-podjarny
[13]:https://www.safaribooksonline.com/library/view/securing-open-source/9781491996980/?utm_source=oreilly&utm_medium=newsite&utm_campaign=fixing-vulnerable-open-source-packages
[14]:https://www.oreilly.com/ideas/finding-vulnerable-open-source-packages?utm_source=oreilly&utm_medium=newsite&utm_campaign=fixing-vulnerable-open-source-packages
[15]:https://www.safaribooksonline.com/library/view/securing-open-source/9781491996980/?utm_source=oreilly&utm_medium=newsite&utm_campaign=fixing-vulnerable-open-source-packages
[16]:https://www.safaribooksonline.com/library/view/securing-open-source/9781491996980/?utm_source=oreilly&utm_medium=newsite&utm_campaign=fixing-vulnerable-open-source-packages
[17]:https://www.oreilly.com/ideas/finding-vulnerable-open-source-packages?utm_source=oreilly&utm_medium=newsite&utm_campaign=fixing-vulnerable-open-source-packages
[18]:https://www.safaribooksonline.com/library/view/securing-open-source/9781491996980/?utm_source=oreilly&utm_medium=newsite&utm_campaign=fixing-vulnerable-open-source-packages
[19]:https://pixabay.com/en/machine-mill-industry-steam-2881186/