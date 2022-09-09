[#]: subject: "A beginner's guide to making a dark theme for a website"
[#]: via: "https://opensource.com/article/22/9/dark-theme-website"
[#]: author: "Sachin Samal https://opensource.com/users/sacsam005"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A beginner's guide to making a dark theme for a website
======
Learn how to program dark website themes using HTML, CSS variables, classes, and JavaScript methods.

![Digital creative of a browser on the internet][1]

Having a dark theme for your website is a common feature these days. There are various ways to add a dark theme to your website, and in this article, I demonstrate a beginner-friendly way of programming a dark theme for the web. Feel free to explore, make mistakes, and, more importantly, learn by manipulating the code in your own way.

![Display of both light and dark theme web pages][2]

Image by: (Sachin Samal, CC BY-SA 4.0)

### Icons

I like to provide a visual way for my users to discover the dark mode feature. You can include an easy set of icons by inserting the Font Awesome link in the `<head>` element of your HTML.

```
<!doctype html>
<html lang="en">
<head>
  <title>Toggle - Dark Theme</title>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
</head>
```

Inside your `<body>` tag, create a Font Awesome moon icon class, which you will switch to the Font Awesome sun icon class later using JavaScript. This icon allows users to switch from the default light theme to the dark theme and back again. In this case, you're changing from `fa-moon` while in the light theme to `fa-sun` while in the dark theme. In other words, the icon is always the opposite of the current mode.

```
<body>
  <div id="theme-btn" class="far fa-moon"></div>
</body>
```

Next, create a CSS class in your stylesheet. You'll append this using the JavaScript `add()` method to toggle between themes. The `toggle()` function adds or removes a class name from an element with JavaScript. This CSS code creates a `changeTheme` class, setting the background color to dark gray and the foreground color (that's the text) to light gray.

```
.changeTheme {
  background: #1D1E22;
  color: #eee;
}
```

### Toggle between themes

To toggle the appearance of the theme button and to apply the `changeTheme` class, use the `onclick()`, `toggle()`, `contains()`, `add()`, and `remove()` JavaScript methods inside your `<script>` tag:

```
<script>
    //gets the button by ID from your HTML element
    const themeBtn = document.getElementById("theme-btn");
    //when you click that button
    themeBtn.onclick = () => {
    //the default class "fa-moon" switches to "fa-sun" on toggle
      themeBtn.classList.toggle("fa-sun");
    //after the switch on toggle, if your button contains "fa-sun" class
      if (themeBtn.classList.contains("fa-sun")) {
    //onclicking themeBtn, the changeTheme styling will be applied to the body of your HTML
        document.body.classList.add("changeTheme");
      } else {
    // onclicking themeBtn, applied changeTheme styling will be removed
        document.body.classList.remove("changeTheme");
      }
    }
</script>
```

The complete code:

```
<!doctype html>
<html lang="en">
<head>
  <title>Toggle - Dark Theme</title>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
</head>
<style>
/* Toggle Dark Theme */
#theme-btn {
  font-size: 1.5rem;
  cursor: pointer;
  color: #596AFF;
}
#theme-btn:hover {
  color: #BB86FC;
}
.changeTheme {
  background: #1D1E22;
  color: #eee;
}
</style>
<body>
  <div id="theme-btn" class="far fa-moon"></div>
<script>
const themeBtn = document.getElementById("theme-btn");
themeBtn.onclick = () => {
  themeBtn.classList.toggle("fa-sun");
  if (themeBtn.classList.contains("fa-sun")) {
    document.body.classList.add("changeTheme");
  } else {
    document.body.classList.remove("changeTheme");
  }
}
</script>
</body>
</html>
```

### Complete themes

The code so far may not fully switch the theme of a complex website. For instance, your site might have a header, a main, and a footer, each with multiple divs and other elements. In that case, you could create a standard dark theme CSS class and append it to the desired web parts.

### Get familiar with your browser's console

To inspect your browser's console, on the webpage where you run this code, press `Ctrl+Shift+I` or right-click and select the `Inspect` option.

When you select `Elements` in the console and toggle your theme button, the browser gives you an indication of whether or not your JavaScript is working. In the console, you can see that the CSS class you appended using JavaScript is added and removed as you toggle.

![Use browser tools to test light and dark themes][3]

Image by: (Sachin Samal, CC BY-SA 4.0)

Add a navigation and card section to see how adding the CSS class name on an HTML element with JavaScript works.

### Example code for a dark theme

Here's some example code. You can alternately view it with a live preview [here][4].

```
<!doctype html>
<html lang="en">
<head>
  <title>Toggle - Dark Theme</title>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.7/css/all.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<style>
  #header {
    width: 100%;
    box-shadow: 0px 4px 10px rgba(52, 72, 115, 0.35);
  }
  nav {
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
  }
  .nav-menu {
    max-width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .nav-menu li {
    margin: 0 0.5rem;
    list-style: none;
    text-decoration: none;
  }
  .nav-menu li a {
    text-decoration: none;
    color: inherit;
  }
  h1 {
    text-align: center;
  }

  /* Toggle Dark Theme */
  #theme-btn {
    font-size: 1.5rem;
    cursor: pointer;
    color: #596AFF;
  }

  #theme-btn:hover {
    color: #BB86FC;
  }
  .changeTheme {
    background: #1D1E22;
    color: #eee;
  }
  /*-- Card Section --*/
  .card-section .card {
    border: none;
  }
  .card-body {
    box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px,
      rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
  }
  .card-body ul {
    margin: 0;
    padding: 0;
  }
  .card-body ul li {
    text-decoration: none;
    list-style-type: none;
    text-align: center;
    font-size: 14px;
  }
</style>

<body>
  <header id="header">
    <nav>
      <div id="theme-btn" class="far fa-moon"></div>
      <div class="navbar">
        <ul class="nav-menu">
          <li class="nav-item">
            <a class="nav-link fas fa-home" href="# "> Home
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <section>
    <h1>Beginner Friendly Dark Theme</h1>
  </section>

  <section class="card-section mt-3">
    <div class="container text-center">
      <div class="row">

        <div class="col-md-4 col-sm-12">
          <div class="card p-1 dark-theme">
            <div class="card-body">
              <h6>What is Lorem Ipsum?</h6>
              <ul>
                <li>Sed sit amet felis tellus.</li>
                <li>Sed sit amet felis tellus.</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="col-md-4 col-sm-12">
          <div class="card p-1 dark-theme">
            <div class="card-body">
              <h6>What is Lorem Ipsum?</h6>
              <ul>
                <li>Sed sit amet felis tellus.</li>
                <li>Sed sit amet felis tellus.</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="col-md-4 col-sm-12">
          <div class="card p-1 dark-theme">
            <div class="card-body">
              <h6>What is Lorem Ipsum?</h6>
              <ul>
                <li>Sed sit amet felis tellus.</li>
                <li>Sed sit amet felis tellus.</li>
              </ul>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>
  <script>
    const themeBtn = document.getElementById("theme-btn");
    const darkTheme = document.querySelectorAll(".dark-theme");
    themeBtn.onclick = () => {
      themeBtn.classList.toggle("fa-sun");
      if (themeBtn.classList.contains("fa-sun")) {
        document.body.classList.add("changeTheme");
        for (const theme of darkTheme) {
          theme.style.backgroundColor = "#1D1E22";
          theme.style.color = "#eee";
        }
      } else {
        document.body.classList.remove("changeTheme");
        for (const theme of darkTheme) {
          theme.style.backgroundColor = "#eee";
          theme.style.color = "#1D1E22";
        }
      }
    }
  </script>
  </body>
</html>
```

The `for...of` loop of JavaScript applies ".dark-theme" class styling properties to each `card` on the page, regardless of its position. It applies the theme to all web parts selected with `querySelectorAll()` in the `<script>` tag. Without this, the font and background color remain unchanged on toggle.

```
{
          theme.style.backgroundColor = "#eee";
          theme.style.color = "#1D1E22";
}
```

If you set `background-color` or any color property to the page, your dark theme would not work as expected. This is because the preset CSS style overrides the one yet to be appended. If you set the color of the HTML font to black, it stays the same in the dark theme, which you don't want. For example:

```
* {
  color: #000;
}
```

By adding this code in your CSS or in a `<style>` tag, you set the font color to black for all the HTML on the page. When you toggle the theme, the font stays black, which doesn't contrast with the dark background. The same goes for the background color. This is common if you've used, for instance, Bootstrap to create the `card` sections in the code above. When Bootstrap is used, the styling for each card comes from Bootstrap's `card.scss` styling, which sets `background-color` to white, which is more specific than a general CSS rule for the entire page, and so it takes precedence.

You must target such cases by using a JavaScript selector and set your desired `background-color` or `color` using `document.style.backgroundColor` or `document.style.color`properties.

### Dark theme with multiple web parts

Here's an [example of a personal portfolio][5] with a dark theme feature that may help you understand how to enable dark mode when you have multiple web parts.

These steps are a beginner-friendly approach to programming dark themes. Whether you target your HTML element in JavaScript by using `getElementById()` or `getElementByClassName()`, or with `querySelector()` or `querySelectorAll()`, depends on the content of your website, and how you want to program as a developer. The same is true with the selection of JavaScript `if…else` statements and loops. Feel free to choose your own method. As always, consider the constraints and flexibility of your programming approach. Good luck!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/dark-theme-website

作者：[Sachin Samal][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sacsam005
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/browser_web_internet_website.png
[2]: https://opensource.com/sites/default/files/2022-08/dark-theme.png
[3]: https://opensource.com/sites/default/files/2022-08/dark-theme_gif.gif
[4]: https://codepen.io/sacsam005/full/LYdMJgQ
[5]: https://codepen.io/sacsam005/pen/BaJmLwz
