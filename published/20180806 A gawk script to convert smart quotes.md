一个转换花引号的 gawk 脚本
======

> 下载我的 awk 秘籍。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_520x292_opensourceprescription.png?itok=gFrc_GTH)

我管理着一个个人网站，用手工编辑网站上的网页。由于网站上的页面并不多，这种方法对我很适合，可以让我对网站代码的细节一清二楚。

最近我升级了网站的设计样式，我决定把所有的普通引号都转换成“花引号”，即在打印材料中使用的那种引号：用 “” 来代替 ""。

手工修改所有的引号太耗时了，因此我决定将这个转换所有 HTML 文件中引号的过程自动化。不过通过程序或脚本来实现该功能需要费点劲。这个脚本需要知道何时将普通引号转换成花引号，并决定使用哪种引号（LCTT 译注：左引号还是右引号，单引号还是双引号）。

有多种方法可以转换引号。Greg Pittman 写过一个 [Python 脚本][1] 来修正文本中的花引号。而我自己使用 GNU [awk][2] (gawk) 来实现。

> 下载我的 awk 秘籍。[免费下载][3]。

开始之前，我写了一个简单的 gawk 函数来评估单个字符。若该字符是一个引号，这该函数判断是输出普通引号还是花引号。函数查看前一个字符；若前一个字符是空格，则函数输出左花引号。否则函数输出右花引号。脚本对单引号的处理方式也一样。

```
function smartquote (char, prevchar) {
        # print smart quotes depending on the previous character
        # otherwise just print the character as-is

        if (prevchar ~ /\s/) {
                # prev char is a space
                if (char == "'") {
                        printf("&lsquo;");
                }
                else if (char == "\"") {
                        printf("&ldquo;");
                }
                else {
                        printf("%c", char);
                }
        }
        else {
                # prev char is not a space
                if (char == "'") {
                        printf("&rsquo;");
                }
                else if (char == "\"") {
                        printf("&rdquo;");
                }
                else {
                        printf("%c", char);
                }
        }
}
```

这个 gawk 脚本的主体部分通过该函数处理 HTML 输入文件的一个个字符。该脚本在 HTML 标签内部逐字原样输出所有内容（比如，`<html lang="en">`）。在 HTML 标签外，脚本使用 `smartquote()` 函数来输出文本。`smartquote()` 函数来评估是输出普通引号还是花引号。

```
function smartquote (char, prevchar) {
        ...
}

BEGIN {htmltag = 0}

{
        # for each line, scan one letter at a time:

        linelen = length($0);

        prev = "\n";

        for (i = 1; i <= linelen; i++) {
                char = substr($0, i, 1);

                if (char == "<") {
                        htmltag = 1;
                }

                if (htmltag == 1) {
                        printf("%c", char);
                }
                else {
                        smartquote(char, prev);
                        prev = char;
                }

                if (char == ">") {
                        htmltag = 0;
                }
        }

        # add trailing newline at end of each line
        printf ("\n");
}
```

下面是一个例子：

```
gawk -f quotes.awk test.html > test2.html
```

其输入为：

```
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Test page</title>
  <link rel="stylesheet" type="text/css" href="/test.css" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width" />
</head>
<body>
  <h1><a href="/"><img src="logo.png" alt="Website logo" /></a></h1>
  <p>"Hi there!"</p>
  <p>It's and its.</p>
</body>
</html>
```

其输出为：

```
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Test page</title>
  <link rel="stylesheet" type="text/css" href="/test.css" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width" />
</head>
<body>
  <h1><a href="/"><img src="logo.png" alt="Website logo" /></a></h1>
  <p>&ldquo;Hi there!&rdquo;</p>
  <p>It&rsquo;s and its.</p>
</body>
</html>
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/gawk-script-convert-smart-quotes

作者：[Jim Hall][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
[1]:https://opensource.com/article/17/3/python-scribus-smart-quotes
[2]:https://opensource.com/downloads/cheat-sheet-awk-features
[3]:https://opensource.com/downloads/cheat-sheet-awk-features
