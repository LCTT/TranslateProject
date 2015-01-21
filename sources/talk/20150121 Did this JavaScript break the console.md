Did this JavaScript break the console?
---------

#Q:

Just doing some JavaScript stuff in google chrome (don't want to try in other browsers for now, in case this is really doing real damage) and I'm not sure why this seemed to break my console.

```javascript
>var x = "http://www.foo.bar/q?name=%%this%%";
<undefined
>x
```

After x (and enter) the console stops working... I restarted chrome and now when I do a simple

```javascript
console.clear();
```

It's giving me

```javascript
Console was cleared
```

And not clearing the console. Now in my scripts console.log's do not register and I'm wondering what is going on. 99% sure it has to do with the double percent signs (%%).

Anyone know what I did wrong or better yet, how to fix the console?

[A bug report for this issue has been filed here.][1]
Edit: Feeling pretty dumb, but I had Preserve log checked... That's why the console wasn't clearing.

#A:

As discussed in the comments, there are actually many different ways of constructing a string that causes this issue, and it is not necessary for there to be two percent signs in most cases.

```TXT
http://example.com/%
http://%%%
http://ab%
http://%ab
http://%zz
```

However, it's not just the presence of a percent sign that breaks the Chrome console, as when we enter the following well-formed URL, the console continues to work properly and produces a clickable link.

```TXT
http://ab%20cd
```

Additionally, the strings `http://%`, and `http://%%` will also print properly, since Chrome will not auto-link a URL-link string unless the [`http://`][2] is followed by at least 3 characters.

From here I hypothesized that the issue must be in the process of linking a URL string in the console, likely in the process of decoding a malformed URL. I remembered that the JavaScript function `decodeURI` will throw an exception if given a malformed URL, and since Chrome's developer tools are largely written in JavaScript, could this be the issue that is evidently crashing the developer console?

To test this theory, I ran Chrome by the command link, to see if any errors were being logged.

Indeed, the same error you would see if you ran decodeURI on a malformed URL (i.e. decodeURI('http://example.com/%')) was being printed to the console:

>[4810:1287:0107/164725:ERROR:CONSOLE(683)] "Uncaught URIError: URI malformed", source: chrome-devtools://devtools/bundled/devtools.js (683)
>So, I opened the URL 'chrome-devtools://devtools/bundled/devtools.js' in Chrome, and on line 683, I found the following.

```javascript
{var parsedURL=new WebInspector.ParsedURL(decodeURI(url));var origin;var folderPath;var name;if(parsedURL.isValid){origin=parsedURL.scheme+"://"+parsedURL.host;if(parsedURL.port)
```

As we can see, `decodeURI(url)` is being called on the URL without any error checking, thus throwing the exception and crashing the developer console.

A real fix for this issue will come from adding error handling to the Chrome console code, but in the meantime, one way to avoid the issue would be to wrap the string in a complex data type like an array to prevent parsing when logging.

```javascript
var x = "http://example.com/%";
console.log([x]);
```

Thankfully, the broken console issue does not persist once the tab is closed, and will not affect other tabs.

###Update:

Apparently, the issue can persist across tabs and restarts if Preserve Log is checked. Uncheck this if you are having this issue.

via:[stackoverflow](http://stackoverflow.com/questions/27828804/did-this-javascript-break-the-console/27830948#27830948)

作者：[Alexander O'Mara][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a:](http://stackoverflow.com/users/3155639/alexander-omara)
[1:](https://code.google.com/p/chromium/issues/detail?id=446975)
[2:](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/decodeURI)