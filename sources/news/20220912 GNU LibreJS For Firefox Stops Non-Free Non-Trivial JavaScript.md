[#]: subject: "GNU LibreJS For Firefox Stops Non-Free Non-Trivial JavaScript"
[#]: via: "https://www.opensourceforu.com/2022/09/gnu-librejs-for-firefox-stops-non-free-non-trivial-javascript/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GNU LibreJS For Firefox Stops Non-Free Non-Trivial JavaScript
======
A Firefox and Firefox-based browser extension called GNU LibreJS is intended to automatically block non-free non-trivial JavaScript. Compared to NoScript, GNU LibreJS operates similarly on first appearance. One of the primary difference characteristics is that NoScript blocks most JavaScript by default, while GNU LibreJS makes a distinction between non-free non-trivial JavaScript and free or trivial JavaScript.

The essay The JavaScript Trap by Richard Stallman served as the basis for GNU LibreJS. Stallman contends that non-free software, primarily written in JavaScript but also in other languages, is run by browsers. Many of these apps are proprietary or not open, and some of them are harmful or problematic. Stallman claims that a JavaScript programme used by Google Docs has a size of half a Megabyte. It is compressed, which makes it challenging to understand and analyse. Stallman refers to JavaScript code that monitors users as malware.

Stallman advises against running JavaScript that is regarded as being complicated or expensive. Scripts loaded from external pages, those that modify the DOM, and calls to eval are all examples of JavaScript code that fits the description. The GNU website publishes the complete list. When GNU LibreJS is installed in Firefox and other compatible browsers, it makes these distinctions for the user. It enables JavaScript that it deems trivial and prevents all JavaScript that it deems non-trivial.

The extension adds a toolbar icon that indicates how many blocked JavaScript references are present on the page. In addition to controls to change the status of the entire website or specific scripts or pieces of code, a click displays accepted and blocked JavaScript. An entire website, as well as specific scripts or code snippets, can be whitelisted or blacklisted. The extension remembers these across sessions. Options to show the JavaScript code are provided, as is an option to forget all custom settings or individual custom settings.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/gnu-librejs-for-firefox-stops-non-free-non-trivial-javascript/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
