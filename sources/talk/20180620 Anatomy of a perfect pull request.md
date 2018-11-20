Anatomy of a perfect pull request
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_science.png?itok=WDKARWGV)

Writing clean code is just one of many factors you should care about when creating a pull request.

Large pull requests cause a big overhead during the code review and can facilitate bugs in the codebase.

That's why you need to care about the pull request itself. It should be short, have a clear title and description, and do only one thing.

### Why should you care?

  * A good pull request will be reviewed quickly
  * It reduces bug introduction into codebase
  * It facilitates new developers onboarding
  * It does not block other developers
  * It speeds up the code review process and consequently, product development



### The size of the pull request

![](https://opensource.com/sites/default/files/uploads/devloper.png)

The first step to identifying problematic pull requests is to look for big diffs.

Several studies show that it is harder to find bugs when reviewing a lot of code.

In addition, large pull requests will block other developers who may be depending on the code.

#### How can we determine the perfect pull request size?

A [study of a Cisco Systems programming team][1] revealed that a review of 200-400 LOC over 60 to 90 minutes should yield 70-90% defect discovery.

With this number in mind, a good pull request should not have more than 250 lines of code changed.

![](https://opensource.com/sites/default/files/uploads/pull_request_size_view_time_0.png)

Image from [small business programming][2].

As shown in the chart above, pull requests with more than 250 lines of changes usually take more than one hour to review.

### Break down large pull requests into smaller ones

Feature breakdown is an art. The more you do it, the easier it gets.

What do I mean by feature breakdown?

Feature breakdown is understanding a big feature and breaking it into small pieces that make sense and that can be merged into the codebase piece by piece without breaking anything.

#### Learning by doing

Let’s say that you need to create a subscribe feature on your app. It's just a form that accepts an email address and saves it.

Without knowing how your app works, I can already break it into eight pull requests:

  * Create a model to save emails
  * Create a route to receive requests
  * Create a controller
  * Create a service to save it in the database (business logic)
  * Create a policy to handle access control
  * Create a subscribe component (frontend)
  * Create a button to call the subscribe component
  * Add the subscribe button in the interface



As you can see, I broke this feature into many parts, most of which can be done simultaneously by different developers.

### Single responsibility principle

The single responsibility principle (SRP) is a computer programming principle that states that every [module][3] or [class][4] should have responsibility for a single part of the [functionality][5] provided by the [software][6], and that responsibility should be entirely [encapsulated][7] by the class.

Just like classes and modules, pull requests should do only one thing.

Following the SRP reduces the overhead caused by revising a code that attempts to solve several problems.

Before submitting a PR for review, try applying the single responsibility principle. If the code does more than one thing, break it into other pull requests.

### Title and description matter

When creating a pull request, you should care about the title and the description.

Imagine that the code reviewer is joining your team today without knowing what is going on. He should be able to understand the changes.

![good_title_and_description.png][9]

What a good title and description look like

The image above shows [what a good title and description look like][10].

### The title of the pull request should be self-explanatory

The title should make clear what is being changed.

Here are some examples:

#### Make a useful description

  * Describe what was changed in the pull request
  * Explain why this PR exists
  * Make it clear how it does what it sets out to do— for example, does it change a column in the database? How is this done? What happens to the old data?
  * Use screenshots to demonstrate what has changed.



### Recap

#### Pull request size

The pull request must have a maximum of 250 lines of change.

#### Feature breakdown

Whenever possible, break pull requests into smaller ones.

#### Single Responsibility Principle

The pull request should do only one thing.

#### Title

Create a self-explanatory title that describes what the pull request does.

#### Description

Detail what was changed, why it was changed, and how it was changed.

_This article was originally posted at[Medium][11]. Reposted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/anatomy-perfect-pull-request

作者：[Hugo Dias][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/hugodias
[1]:https://smartbear.com/learn/code-review/best-practices-for-peer-code-review/
[2]:https://smallbusinessprogramming.com/optimal-pull-request-size/
[3]:https://en.wikipedia.org/wiki/Modular_programming
[4]:https://en.wikipedia.org/wiki/Class_%28computer_programming%29
[5]:https://en.wikipedia.org/wiki/Software_feature
[6]:https://en.wikipedia.org/wiki/Software
[7]:https://en.wikipedia.org/wiki/Encapsulation_(computer_programming)
[8]:/file/400671
[9]:https://opensource.com/sites/default/files/uploads/good_title_and_description.png (good_title_and_description.png)
[10]:https://github.com/rails/rails/pull/32865
[11]:https://medium.com/@hugooodias/the-anatomy-of-a-perfect-pull-request-567382bb6067
