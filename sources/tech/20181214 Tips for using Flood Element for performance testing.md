[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tips for using Flood Element for performance testing)
[#]: via: (https://opensource.com/article/18/12/tips-flood-element-testing)
[#]: author: (Nicole van der Hoeven https://opensource.com/users/nicolevanderhoeven)

Tips for using Flood Element for performance testing
======
Get started with this powerful, intuitive load testing tool. 
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_sysadmin_cloud.png?itok=sUciG0Cn)

In case you missed it, there’s a new performance test tool on the block: [Flood Element][1]. It’s a scalable, browser-based tool that allows you to write scripts in JavaScript that interact with web pages like a real user would.

Browser Level Users is a [newer approach to load testing][2] that overcomes many of the common challenges we hear about traditional methods of testing. It offers:

  * Scripting that is akin to common functional tools like Selenium and easier to learn
  * More realistic results that are based on true browser performance rather than API response
  * The ability to test against all components of your web app, including things like JavaScript that are rendered via the browser



Given the above benefits, it’s a no-brainer to check out Flood Element for your web load testing, especially if you have struggled with existing tools like JMeter or HP LoadRunner.

Pairing Element with [Flood][3] turns it into a pretty powerful load test tool. We have a [great guide here][4] that you can follow if you’d like to get started. I’ve been using and testing Element for several months now, and I’d like to share some tips I’ve learned along the way.

### Initializing your script

You can always start from scratch, but the quickest way to get started is to type `element init myfirstelementtest` from your terminal, filling in your preferred project name.

You’ll then be asked to type the title of your test as well as the URL you’d like to script against. After a minute, you’ll see that a new directory has been created:

![](https://opensource.com/sites/default/files/uploads/image_1_-_new_directory.png)

Element will automatically create a file called **test.ts**. This file contains the skeleton of a script, along with some sample code to help you find a button and then click on it. But before you open it, let’s move on to…

### Choosing the right text editor

Scripting in Element is already pretty simple, but two things that help are syntax highlighting and code completion. Syntax highlighting will greatly improve the experience of learning a new test tool like Element, and code completion will make your scripting lightning-fast as you become more experienced. My text editor of choice is [Visual Studio Code][5], which has both of those features. It’s slick and clean, and it does the job.

Syntax highlighting is when the text editor intelligently changes the font color of your code according to its role in the programming language you’re using. Here’s a screenshot of the **test.ts** file we generated earlier in VS Code to show you what I mean:

![](https://opensource.com/sites/default/files/uploads/image_2_test.ts_.png)

This makes it easier to make sense of the code at a glance: Comments are in green, values and labels are in orange, etc.

Code completion is when you start to type something, and VS Code helpfully opens a context menu with suggestions for methods you can use.

![][6]

I love this because it means I don’t need to remember the exact name of the method. It also suggests names of variables you’ve already defined and highlights code that doesn’t make sense. This will help to make your tests more maintainable and readable for others, which is a great benefit as you look to scale your testing out in the future.

![](https://opensource.com/sites/default/files/image-4-element-visible-copy.gif)

### Taking screenshots

One of the most powerful features of Element is its ability to take screenshots. I find it immensely useful when debugging because sometimes it’s just easier to see what’s going on visually. With protocol-based tools, debugging can be a much more involved and technical process.

There are two ways to take screenshots in Element:

  1. Add a setting to automatically take a screenshot when an error is encountered. You can do this by setting `screenshotOnFailure` to "true" in `TestSettings`:



```
export const settings: TestSettings = {
        device: Device.iPadLandscape,
        userAgent: 'flood-chrome-test',
        clearCache: true,
        disableCache: true,
        screenshotOnFailure: true,
}
```

  2. Explicitly take a screenshot at a particular point in the script. You can do this by adding



```
await browser.takeScreenshot()
```

to your code.

### Viewing screenshots

Once you’ve taken screenshots within your tests, you will probably want to view them and know that they will be stored for future safekeeping. Whether you are running your test locally on have uploaded it to Flood to run with increased concurrency, Flood Element has you covered.

**Locally run tests**

Screenshots will be saved as .jpg files in a timestamped folder corresponding to your run. It should look something like this: **…myfirstelementtest/tmp/element-results/test/2018-11-20T135700.595Z/flood/screenshots/**. The screenshots will be uniquely named so that new screenshots, even for the same step, don’t overwrite older ones.

However, I rarely need to look up the screenshots in that folder because I prefer to see them in iTerm2 for MacOS. iTerm is an alternative to the terminal that works particularly well with Element. When you take a screenshot, iTerm actually shows it in-line:

![](https://opensource.com/sites/default/files/uploads/image_5_iterm_inline.png)

**Tests run in Flood**

Running an Element script on Flood is ideal when you need larger concurrency. Rather than accessing your screenshot locally, Flood will centralize the images into your account, so the images remain even after the cloud load injectors are destroyed. You can get to the screenshot files by downloading Archived Results:

![](https://opensource.com/sites/default/files/image_6_archived_results.png)

You can also click on a step on the dashboard to see a filmstrip of your test:

![](https://opensource.com/sites/default/files/uploads/image_7_filmstrip_view.png)

### Using logs

You may need to check out the logs for more technical debugging, especially when the screenshots don’t tell the whole story. Again, whether you are running your test locally or have uploaded it to Flood to run with increased concurrency, Flood Element has you covered.

**Locally run tests**

You can print to the console by typing, for example: `console.log('orderValues = ’ + orderValues)`

This will print the value of the variable `orderValues` at that point in the script. You would see this in your terminal if you’re running Element locally.

**Tests run in Flood**

If you’re running the script on Flood, you can either download the log (in the same Archived Results zipped file mentioned earlier) or click on the Logs tab:

![](https://opensource.com/sites/default/files/uploads/image_8_logs_tab.png)

### Fun with flags

Element comes with a few flags that give you more control over how the script is run locally. Here are a few of my favorites:

**Headless flag**

When in doubt, run Element in non-headless mode to see the script actually opening the web app on Chrome and interacting with the page. This is only possible locally, but there’s nothing like actually seeing for yourself what’s happening in real time instead of relying on screenshots and logs after the fact. To enable this mode, add the flag when running your test:

```
element run myfirstelementtest.ts --no-headless
```

**Watch flag**

Element will automatically close the browser window when it encounters an error or finishes the iteration. Adding `--watch` will leave the browser window open and then monitor the script. As soon as the script is saved, it will automatically run it in the same window from the beginning. Simply add this flag like the above example:

```
--watch
```

**Dev tools flag**

This opens a browser instance and runs the script with the Chrome Dev Tools open, allowing you to find locators for the next action you want to script. Simply add this flag as in the first example:

```
--dev-tools
```

For more flags, use `element run --help`.

### Try Element

You’ve just gotten a crash course on Flood Element and are ready to get started. [Download Element][1] to start writing functional test scripts and reusing them as load test scripts on Flood. If you don’t have a Flood account, you can easily sign up for a free trial [on the Flood website][7].

We’re proud to contribute to the open source community and can’t wait to have you try this new addition to the Flood line.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/tips-flood-element-testing

作者：[Nicole van der Hoeven][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nicolevanderhoeven
[b]: https://github.com/lujun9972
[1]: https://element.flood.io/
[2]: https://flood.io/blog/why-you-should-load-test-with-browsers/
[3]: https://flood.io/
[4]: https://help.flood.io/getting-started-with-load-testing/step-by-step-guide-flood-element
[5]: https://code.visualstudio.com/
[6]: https://flood.io/wp-content/uploads/2018/11/vscode-codecompletion2.gif
[7]: https://flood.io/load-performance-testing-tool/free-load-testing-trial/
