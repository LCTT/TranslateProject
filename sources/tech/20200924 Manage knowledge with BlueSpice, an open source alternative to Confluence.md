[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage knowledge with BlueSpice, an open source alternative to Confluence)
[#]: via: (https://opensource.com/article/20/9/bluespice)
[#]: author: (Martin Loschwitz https://opensource.com/users/martinloschwitzorg)

Manage knowledge with BlueSpice, an open source alternative to Confluence
======
BlueSpice is based on Wikipedia's MediaWiki but its features go far
beyond its noble ancestor.
![Digital images of a computer desktop][1]

Knowledge management is a key to success in modern enterprises—but it is not exactly easy to achieve. Keeping track of all relevant details across all employees is a huge challenge, especially in agile environments, which most companies say they are.

Most companies resort to buying wiki-like solutions, such as Confluence from Atlassian, which exposes them to the lock-in effect of proprietary software. But many would do well to consider [BlueSpice][2], an open source alternative to Atlassian Confluence that has a noble ancestry: it's based on Wikipedia's [MediaWiki][3].

### Basic and advanced features

![BlueSpice][4]

(Markus Feilner, [CC BY-SA 4.0][5])

For a wiki-like software to become a full-featured knowledge management system in an enterprise environment, it needs a lot of features. The ability to create documents is only one of them; the knowledge in them must be structured in a way that makes it easy for users to find the information they are looking for.

In addition, most companies have complex compliance rulesets that knowledge-management software must adhere to. Confluence has gained a lot of attention because it is particularly good on these items. But BlueSpice doesn't have anything to hide.

### Structural differences

A quick overview reveals that BlueSpice has a fundamentally different way of organizing itself internally than Confluence. Confluence's internal structure is based on Spaces—topic-specific, separate sub-units of a Confluence installation. Typically, individual teams in an organization get their own Spaces.

![BlueSpice Namespaces][6]

(Markus Feilner, [CC BY-SA 4.0][5])

Instead, BlueSpice follows MediaWiki's principle of Namespaces. A Namespace is specific for a certain kind of file, like images or audio files or blog posts, which are put into a distinct Namespace to separate them from the other content. BlueSpice also allows users to define content categories so that every page in the wiki can belong to multiple different categories. In stark contrast to Confluence, the typical data siloing that happens almost automatically in Confluence (due to its Spaces design) doesn't happen in BlueSpace. Small wiki installation users may not notice major differences. But in large environments, users will certainly notice a difference: Content is likely easier to find in BlueSpice than it would be in a wiki scattered into small spaces.

[BlueSpice Farm][7] is a subscription-based upgrade to the Free version that offers a nice feature for people migrating away from Confluence to BlueSpice. The Farm version allows multiple BlueSpice wikis to be connected to each other, effectively making them work like Spaces in Confluence. This will dramatically ease the burden of getting used to a new approach.

### Search engine

![BlueSpice search][8]

(Markus Feilner, [CC BY-SA 4.0][5])

BlueSpice's search function is powered by [ElasticSearch][9] in the background and, just like Confluence, it displays search results while the user is typing in the search term. ElasticSearch may impose some serious hardware requirements for the machine hosting the wiki, but the user benefits from having a truly open source search engine maintained by a vivid community. Also, just like in Confluence, users can narrow down their results while searching by specifying parameters such as a specific kind of result or author.

### Compliance

Confluence comes with a large set of compliance-related functionalities. Core features include connections to existing user directories, revision-proof content storage, and risk-assessment tools. BlueSpice mimics a lot of these features. The way certain features are implemented varies because of the different internal organizational structure BlueSpice uses.

First things first: BlueSpice not only _supports_ connections to existing user directories, including Active Directory or LDAP, it actually _requires_ using groups from these directories. Once it's connected to a central user directory, all authentication and authorization details must come out of that directory.

Regular Wikipedia users know about the ability to access every page's history. As a MediaWiki descendant, BlueSpice inherits that page-history feature. At any point in time, you can see the different revisions of a page and also identify the person who made each change to a page. Relevant pages can be monitored for changes, and reports can be generated on the changes over a specific period of time—a feature that helps keep auditors happy.

### WYSIWYG editor

![BlueSpice WYSIWYG editor][10]

(Markus Feilner, [CC BY-SA 4.0][5])

Central knowledge-management systems are not used only by geeks who speak markup languages; even non-technical staff must be able to use the system in an easy and concise way. While BlueSpice supports the usual [Wikipedia markup][11] editor, it also offers a WYSIWYG-like experience called VisualEditor. Its buttons and formatting tools will remind many people of familiar interfaces from tools such as LibreOffice.

### Extensions

Confluence users love the ability to extend the tool with external plugins. BlueSpice offers a similar capability through access to MediaWiki extensions. While BlueSpice doesn't have its own extension store just yet, it can easily use roughly 150 MediaWiki extensions for graphical highlighting, gaming, analytical functions, and more.

### Branding

A lot of companies want their central knowledge-management system to resemble the company's branding since it is a central place for employees. Given that MediaWiki is considered to have a rather conservative look and feel, you might wonder about adapting BlueSpice to corporate identity and corporate design requirements. Like Confluence, BlueSpice can be almost completely adapted to a company's brand standards and design requirements. While both Confluence and BlueSpice maintain a basic page structure, you can adjust central design elements such as headers, fonts, and the like. When it's done right, a BlueSpice theme will hardly remind users of MediaWiki at all.

### BlueSpice advantages

There are some areas where BlueSpice is superior to Confluence. For instance, many organizations need revision-proof tracking of changes in their central knowledge system for compliance reasons. This feature is built into BlueSpice, while achieving similar functionality in Confluence requires an extension. BlueSpice also comes with MediaWiki's Semantics extension built-in, effectively allowing users to query wiki pages for certain keywords. And last but not least, BlueSpice's Book extension can natively integrate manuals, product documentation, or other book contents into its contents.

### Open source license

Confluence has earned its merits for helping many companies introduce a central knowledge store in the form of wiki software. For open source enthusiasts, the software's proprietary nature might raise a red flag.

BlueSpice is a functional open source alternative to Confluence based on the well-proven MediaWiki software. It provides similar functionality while maintaining MediaWiki's open license. All features relevant for small and large enterprises are in BlueSpice. Organizations planning to introduce a centralized knowledge-management system might find BlueSpice to be a good alternative to its famous commercial competitor.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/bluespice

作者：[Martin Loschwitz][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/martinloschwitzorg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://bluespice.com/products/bluespice-free
[3]: https://www.mediawiki.org/wiki/MediaWiki
[4]: https://opensource.com/sites/default/files/uploads/bluespice_math-formula.jpg (BlueSpice)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/bluespice_organizationchart.jpg (BlueSpice Namespaces)
[7]: https://bluespice.com/products/bluespice-farm/
[8]: https://opensource.com/sites/default/files/uploads/bluespice_search_fulltext.jpg (BlueSpice search)
[9]: https://www.elastic.co/elasticsearch/
[10]: https://opensource.com/sites/default/files/uploads/bluespice_editor-2.jpg (BlueSpice WYSIWYG editor)
[11]: https://en.wikipedia.org/wiki/Help:Cheatsheet
