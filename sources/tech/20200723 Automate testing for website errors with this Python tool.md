[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Automate testing for website errors with this Python tool)
[#]: via: (https://opensource.com/article/20/7/seodeploy)
[#]: author: (JR Oakes https://opensource.com/users/jroakes)

Automate testing for website errors with this Python tool
======
SEODeploy helps identify SEO problems in a website before they're
deployed.
![Computer screen with files or windows open][1]

As a technical search-engine optimizer, I'm often called in to coordinate website migrations, new site launches, analytics implementations, and other areas that affect sites' online visibility and measurement to limit risk. Many companies generate a substantial portion of monthly recurring revenue from users finding their products and services through search engines. Although search engines have gotten good at handling poorly formatted code, things can still go wrong in development that adversely affects how search engines index and display pages for users.

I've been part of manual processes attempting to mitigate this risk by reviewing staged changes for search engine optimization (SEO)-breaking problems. My team's findings determine whether the project gets the green light (or not) to launch. But this process is often inefficient, can be applied to only a limited number of pages, and has a high likelihood of human error.

The industry has long sought a usable and trustworthy way to automate this process while still giving developers and search-engine optimizers a meaningful say in what must be tested. This is important because these groups often have competing priorities in development sprints, with search-engine optimizers pushing for changes and developers needing to control regressions and unexpected experiences.

### Common SEO-breaking problems

Many websites I work with have tens of thousands of pages. Some have millions. It's daunting to understand how a development change might affect so many pages. In the world of SEO, you can see large, sitewide changes in how Google and other search engines show your pages from very minor and seemingly innocuous changes. It's imperative to have processes in place that catch these types of errors before they make it to production.

Below are a few examples of problems that I have seen in the last year.

#### Accidental noindex

A proprietary third-party SEO monitoring tool we use, [ContentKing][2], found this problem immediately after launch to production. This is a sneaky error because it's not visible in the HTML, rather it is hidden from view in the server response header, yet it can very quickly cause the loss of your search visibility.


```
HTTP/1.1 200 OK
Date: Tue May 25 2010 21:12:42 GMT
[...]
X-Robots-Tag: noindex
[...]
```

#### Canonical lower-casing

A change to production mistakenly lower-cased an entire website's [canonical link elements][3]. The change affected nearly 30,000 URLs. Before the update, the URLs were in title case (for instance, `/URL-Path/`). This is a problem because the canonical link element is a hint for Google about a webpage's true canonical URL version. This change caused many URLs to be removed from Google's index and re-indexed at the new uncased location (`/url-path/`). The impact was a loss of 10–15% of traffic and corruption of page metric data over the next few weeks.

#### Origin server regression

One website with a complex and novel implementation of React had a mysterious issue with regression of `origin.domain.com` URLs displaying for its origin content-delivery network server. It would intermittently output the origin host instead of the edge host in the site metadata (such as the canonical link element, URLs, and Open Graph links). The problem was found in the raw HTML and the rendered HTML. This impacted search visibility and the quality of shares on social media.

### Introducing SEODeploy

SEOs often use diff-testing tools to look at changes between sets of rendered and raw HTML. Diff testing is ideal because it allows certainty that the eye does not. You want to look for differences in how Google renders your page, not how users do. You want to look at what the raw HTML looks like, not the rendered HTML, as these are two separate processing steps for Google.

This led my colleagues and me to create [SEODeploy][4], a "Python library for automating SEO testing in deployment pipelines." Our mission was:

> To develop a tool that allowed developers to provide a few to many URL paths, and which allowed those paths to be diff tested on production and staging hosts, looking specifically for unanticipated regressions in SEO-related data.

SEODeploy's mechanics are simple: Provide a text file containing a newline-delimited set of paths, and the tool runs a series of modules on those paths, comparing production and staging URLs and reporting on any errors or messages (changes) it finds.

![SEODeploy overview][5]

(SEODeploy, [CC BY-SA 4.0][6])

The configuration for the tool and modules is just one YAML file, which can be customized based on anticipated changes.

![SEODeploy output][7]

(SEODeploy, [CC BY-SA 4.0][6])

The initial release includes the following core features and concepts:

  1. **Open source**: We believe deeply in sharing code that can be criticized, improved, extended, shared, and reused.
  2. **Modular**: There are many different stacks and edge cases in development for the web. The SEODeploy tool is conceptually simple, so modularity is used to control the complexity. We provide two built modules and an example module that outline the basic structure.
  3. **URL sampling:** Since it is not always feasible or efficient to test every URL, we included a method to randomly sample XML sitemap URLs or URLs monitored by ContentKing.
  4. **Flexible diff checking**: Web data is messy. The diff checking functionality tries to do a good job of converting this data to messages (changes) no matter the data type it's checking, including ext, arrays (lists), JSON objects (dictionaries), integers, floats, etc.
  5. **Automated**: A simple command-line interface is used to call the sampling and execution methods to make it easy to incorporate SEODeploy into existing pipelines.



### Modules

While the core functionality is simple, by design, modules are where SEODeploy gains features and complexity. The modules handle the harder task of getting, cleaning, and organizing the data collected from staging and production servers for comparison.

#### Headless module

The tool's [Headless module][8] is a nod to anyone who doesn't want to have to pay for a third-party service to get value from the library. It runs any version of Chrome and extracts rendered data from each comparison set of URLs.

The headless module extracts the following core data for comparison:

  1. SEO content, e.g., titles, headings, links, etc.
  2. Performance data from the Chrome Timings and Chrome DevTools Protocol (CDP) Performance APIs
  3. Calculated performance metrics including the Cumulative Layout Shift (CLS), a recently popular [Web Vital][9] released by Google
  4. Coverage data for CSS and JavaScript from the CDP Coverage API



The module includes functionality to handle authentication for staging, network speed presets (for better normalization of comparisons), as well as a method for handling staging-host replacement in staging comparative data. It should be fairly easy for developers to extend this module to collect any other data they want to compare per page.

#### Other modules

We created an [example module][10] for any developer who wants to use the framework to create a custom extraction module. Another module integrates with ContentKing. Note that the ContentKing module requires a subscription to ContentKing, while Headless can be run on any machine capable of running Chrome.

### Problems to solve

We have [plans][11] to extend and enhance the library but are looking for [feedback][12] from developers on what works and what doesn't meet their needs. A few of the issues and items on our list are:

  1. Dynamic timestamps create false positives for some comparison elements, especially schema.
  2. Saving test data to a database to enable reviewing historical deployment processes and testing changes against the last staging push.
  3. Enhancing the scale and speed of the extraction with a cloud infrastructure for rendering.
  4. Increasing testing coverage from the current 46% to 99%-plus.
  5. Currently, we rely on [Poetry][13] for dependency management, but we want to publish a PyPl library so it can be installed easily with `pip install`.
  6. We are looking for more issues and field data on usage.



### Get started

The project is [on GitHub][4], and we have [documentation][14] for most features.

We hope that you will clone SEODeploy and give it a go. Our goal is to support the open source community with a tool developed by technical search-engine optimizers and validated by developers and engineers. We've seen the time it takes to validate complex staging issues and the business impact minor changes can have across many URLs. We think this library can save time and de-risk the deployment process for development teams.

If you have questions, issues, or want to contribute, please see the project's [About page][15].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/seodeploy

作者：[JR Oakes][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jroakes
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://www.contentkingapp.com/
[3]: https://en.wikipedia.org/wiki/Canonical_link_element
[4]: https://github.com/locomotive-agency/SEODeploy
[5]: https://opensource.com/sites/default/files/uploads/seodeploy.png (SEODeploy overview)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/seodeploy_output.png (SEODeploy output)
[8]: https://locomotive-agency.github.io/SEODeploy/modules/headless/
[9]: https://web.dev/vitals/
[10]: https://locomotive-agency.github.io/SEODeploy/modules/creating/
[11]: https://locomotive-agency.github.io/SEODeploy/todo/
[12]: https://locomotive-agency.github.io/SEODeploy/about/#contact
[13]: https://python-poetry.org/
[14]: https://locomotive-agency.github.io/SEODeploy/
[15]: https://locomotive-agency.github.io/SEODeploy/about/
