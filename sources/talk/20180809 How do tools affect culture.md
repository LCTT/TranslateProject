How do tools affect culture?
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o)

Most of the DevOps community talks about how tools don’t matter much. The culture has to change first, the argument goes, which might modify how the tools are used.

I agree and disagree with that concept. I believe the relationship between tools and culture is more symbiotic and bidirectional than unidirectional. I have discovered this through real-world transformations across several companies now. I admit it’s hard to determine whether the tools changed the culture or whether the culture changed how the tools were used.

### Violating principles

Some tools violate core principles of modern development and operations. The primary violation I have seen are tools that require GUI interactions. This often separates operators from the value pipeline in a way that is cognitively difficult to overcome. If everything in your infrastructure is supposed to be configured and deployed through a value pipeline, then taking someone out of that flow inherently changes their perspective and engagement. Making manual modifications also injects risk into the system that creates unpredictability and undermines the value of the pipeline.

I’ve heard it said that these tools are fine and can be made to work within the new culture, and I’ve tried this in the past. Screen scraping and form manipulation tools have been used to attempt automation with some systems I’ve integrated. This is very fragile and doesn’t work on all systems. It ultimately required a lot of manual intervention.

Another system from a large vendor providing integrated monitoring and ticketing solutions for infrastructure seemed to implement its API as an afterthought, and this resulted in the system being unable to handle the load from the automated system. This required constant manual recoveries and sometimes the tedious task of manually closing errant tickets that shouldn’t have been created or that weren’t closed properly.

The individuals maintaining these systems experienced great frustration and often expressed a lack of confidence in the overall DevOps transformation. In one of these instances, we introduced a modern tool for monitoring and alerting, and the same individuals suddenly developed a tremendous amount of confidence in the overall DevOps transformation. I believe this is because tools can reinforce culture and improve it when a similar tool that lacks modern capabilities would otherwise stymie motivation and engagement.

### Choosing tools

At the NAIC (National Association of Insurance Commissioners), we’ve adopted a practice of evaluating new and existing tools based on features we believe reinforce the core principles of our value pipeline. We currently have seven items on our list:

  * REST API provided and fully functional (possesses all application functionality)
  * Ability to provision immutably (can be installed, configured, and started without human intervention)
  * Ability to provide all configuration through static files
  * Open source code
  * Uses open standards when available
  * Offered as Software as a Service (SaaS) or hosted (we don't run anything)
  * Deployable to public cloud (based on licensing and cost)



This is a prioritized list. Each item gets rated green, yellow, or red to indicate how much each statement applies to a particular technology. This creates a visual that makes it quite clear how the different candidates compare to one another. We then use this to make decisions about which tools we should use. We don’t make decisions solely on these criteria, but they do provide a clearer picture and help us know when we’re sacrificing principles. Transparency is a core principle in our culture, and this system helps reinforce that in our decision-making process.

We use green, yellow, and red because there’s not normally a clear binary representation of these criteria within each tool. For example, some tools have an incomplete API, which would result in yellow being applied. If the tool uses open standards like OpenAPI and there’s no other applicable open standard, then it would receive green for “Uses open standards when available.” However, a tracing system that uses OpenAPI and not OpenTracing would receive a yellow rating.

This type of system creates a common understanding of what is valued when it comes to tool selection, and it helps avoid unknowingly violating core principles of your value pipeline. We recently used this method to select [GitLab][1] as our version control and continuous integration system, and it has drastically improved our culture for many reasons. I estimated 50 users for the first year, and we’re already over 120 in just the first few months.

The tools we used previously didn’t allow us to contribute back our own features, collaborate transparently, or automate so completely. We’ve also benefited from GitLab’s culture influencing ours. Its [handbook][2] and open communication have been invaluable to our growth. Tools, and the companies that make them, can and will influence your company’s culture. What are you willing to allow in?


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/how-tools-affect-culture

作者：[Dan Barker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/barkerd427
[1]:https://about.gitlab.com/
[2]:https://about.gitlab.com/handbook/
