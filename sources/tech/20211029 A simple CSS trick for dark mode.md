[#]: subject: "A simple CSS trick for dark mode"
[#]: via: "https://opensource.com/article/21/10/dark-themes-websites"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A simple CSS trick for dark mode
======
The ability to let your website adjust to the user's theme of choice is
a great accessibility feature.
![Text editor on a browser, in blue][1]

You're likely already familiar with media queries. They're in widespread use for making websites responsive. The `width` and `height` properties contain the viewport's dimensions. You then use CSS to render different layouts at different dimensions.

The [prefers-color-scheme media query][2] works the same way. The user can configure their operating system to use a light or dark theme. `Prefers-color-scheme` contains that value. The value is either `light` or `dark`, though the W3C spec states that it might support future values like `sepia`. I specify different values of CSS variables for both modes and let the user's OS decide.

### The prefers-color-scheme media queries

The two variations of the `prefers-color-scheme` media query are:


```
/* Light mode */
@media (prefers-color-scheme: light) {
   :root {
       --body-bg: #FFFFFF;
       --body-color: #000000;
   }
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
   :root {
       --body-bg: #000000;
       --body-color: #FFFFFF;
   }
}
```

In the above CSS, `--body-bg` and `--body-color` are [CSS variables][3]. As you can see, they contain different values for both modes. In the light theme, I'm setting a white background with black text. In the dark theme, I'm setting black background with white text.

Since the [spec][2] says that W3C might introduce future values, it makes sense to convert this CSS into a boolean.


```
/* Light mode */
:root {
   --body-bg: #FFFFFF;
   --body-color: #000000;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
   :root {
       --body-bg: #000000;
       --body-color: #FFFFFF;
   }
}
```

In the above code, I'm defining a light theme by default and converting it to the dark theme if the media query is `dark`. This way, any future values added to the media query will set the light theme by default.

### Using the CSS variables

Now that I have different values for different themes, I need to actually use them to style the page.


```
body {
   background: var(--body-bg);
   color: var(--body-color);
}
```

The [var() syntax][3] is how CSS uses variables. In the above code, I'm saying set the `background` to the value of `--body-bg` and set the `color` to the value of `--body-color`. Note that the values of these variables are coming from the media query. Meaning that the background and foreground color changes based on the OS's setting! 

This is the real power of the media query: Providing a consistent user experience from OS to the web page.

If you go to [findmymastodon.com][4] and switch your OS's theme, you'll see the transition from one theme to the other.

The [CSS Working Group][2] website also uses the same media queries. Change your OS theme, and the website switches themes to adjust.

### Conclusion

Notice that using `prefers-color-scheme` is no different from using a regular programming language. I define variables whose values change based on some logic. And those variables are then used for further operations.

The ability to let your website adjust to the user's theme of choice is a great accessibility feature. And it further blurs the line between desktop and web for the benefit of the user. The latest browser versions [support prefers-color-scheme][5], so you can begin experimenting today.

Happy coding.

* * *

_This article originally appeared on the [author's website][6] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/dark-themes-websites

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://drafts.csswg.org/mediaqueries-5/#prefers-color-scheme
[3]: https://www.w3.org/TR/css-variables-1/
[4]: https://findmymastodon.com/
[5]: https://caniuse.com/prefers-color-scheme
[6]: https://ayushsharma.in/2021/10/creating-light-and-dark-themes-for-websites-correctly-using-prefers-color-scheme
