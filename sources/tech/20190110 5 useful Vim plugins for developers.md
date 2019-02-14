[#]: collector: (lujun9972)
[#]: translator: (pityonline)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 useful Vim plugins for developers)
[#]: via: (https://opensource.com/article/19/1/vim-plugins-developers)
[#]: author: (Ricardo Gerardi https://opensource.com/users/rgerardi)

5 useful Vim plugins for developers
======
Expand Vim's capabilities and improve your workflow with these five plugins for writing code.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh)

I have used [Vim][1] as a text editor for over 20 years, but about two years ago I decided to make it my primary text editor. I use Vim to write code, configuration files, blog articles, and pretty much everything I can do in plaintext. Vim has many great features and, once you get used to it, you become very productive.

I tend to use Vim's robust native capabilities for most of what I do, but there are a number of plugins developed by the open source community that extend Vim's capabilities, improve your workflow, and make you even more productive.

Following are five plugins that are useful when using Vim to write code in any programming language.

### 1. Auto Pairs

The [Auto Pairs][2] plugin helps insert and delete pairs of characters, such as brackets, parentheses, or quotation marks. This is very useful for writing code, since most programming languages use pairs of characters in their syntax—such as parentheses for function calls or quotation marks for string definitions.

In its most basic functionality, Auto Pairs inserts the corresponding closing character when you type an opening character. For example, if you enter a bracket **[** , Auto-Pairs automatically inserts the closing bracket **]**. Conversely, if you use the Backspace key to delete the opening bracket, Auto Pairs deletes the corresponding closing bracket.

If you have automatic indentation on, Auto Pairs inserts the paired character in the proper indented position when you press Return/Enter, saving you from finding the correct position and typing the required spaces or tabs.

Consider this Go code block for instance:

```
package main

import "fmt"

func main() {
    x := true
    items := []string{"tv", "pc", "tablet"}

    if x {
        for _, i := range items
    }
}
```

Inserting an opening curly brace **{** after **items** and pressing Return/Enter produces this result:

```
package main

import "fmt"

func main() {
    x := true
    items := []string{"tv", "pc", "tablet"}

    if x {
        for _, i := range items  {
            | (cursor here)
        }
    }
}
```

Auto Pairs offers many other options (which you can read about on [GitHub][3]), but even these basic features will save time.

### 2. NERD Commenter

The [NERD Commenter][4] plugin adds code-commenting functions to Vim, similar to the ones found in an integrated development environment (IDE). With this plugin installed, you can select one or several lines of code and change them to comments with the press of a button.

NERD Commenter integrates with the standard Vim [filetype][5] plugin, so it understands several programming languages and uses the appropriate commenting characters for single or multi-line comments.

The easiest way to get started is by pressing **Leader+Space** to toggle the current line between commented and uncommented. The standard Vim Leader key is the **\** character.

In Visual mode, you can select multiple lines and toggle their status at the same time. NERD Commenter also understands counts, so you can provide a count n followed by the command to change n lines together.

Other useful features are the "Sexy Comment," triggered by **Leader+cs** , which creates a fancy comment block using the multi-line comment character. For example, consider this block of code:

```
package main

import "fmt"

func main() {
    x := true
    items := []string{"tv", "pc", "tablet"}

    if x {
        for _, i := range items {
            fmt.Println(i)
        }
    }
}
```

Selecting all the lines in **function main** and pressing **Leader+cs** results in the following comment block:

```
package main

import "fmt"

func main() {
/*
 *    x := true
 *    items := []string{"tv", "pc", "tablet"}
 *
 *    if x {
 *        for _, i := range items {
 *            fmt.Println(i)
 *        }
 *    }
 */
}
```

Since all the lines are commented in one block, you can uncomment the entire block by toggling any of the lines of the block with **Leader+Space**.

NERD Commenter is a must-have for any developer using Vim to write code.

### 3. VIM Surround

The [Vim Surround][6] plugin helps you "surround" existing text with pairs of characters (such as parentheses or quotation marks) or tags (such as HTML or XML tags). It's similar to Auto Pairs but, instead of working while you're inserting text, it's more useful when you're editing text.

For example, if you have the following sentence:

```
"Vim plugins are awesome !"
```

You can remove the quotation marks around the sentence by pressing the combination **ds"** while your cursor is anywhere between the quotation marks:

```
Vim plugins are awesome !
```

You can also change the double quotation marks to single quotation marks with the command **cs"'** :

```
'Vim plugins are awesome !'
```

Or replace them with brackets by pressing **cs'[**

```
[ Vim plugins are awesome ! ]
```

While it's a great help for text objects, this plugin really shines when working with HTML or XML tags. Consider the following HTML line:

```
<p>Vim plugins are awesome !</p>
```

You can emphasize the word "awesome" by pressing the combination **ysiw <em>** while the cursor is anywhere on that word:

```
<p>Vim plugins are <em>awesome</em> !</p>
```

Notice that the plugin is smart enough to use the proper closing tag **< /em>**.

Vim Surround can also indent text and add tags in their own lines using **ySS**. For example, if you have:

```
<p>Vim plugins are <em>awesome</em> !</p>
```

Add a **div** tag with this combination: **ySS <div class="normal">**, and notice that the paragraph line is indented automatically.

```
<div class="normal">
        <p>Vim plugins are <em>awesome</em> !</p>
</div>
```

Vim Surround has many other options. Give it a try—and consult [GitHub][7] for additional information.

### 4\. Vim Gitgutter

The [Vim Gitgutter][8] plugin is useful for anyone using Git for version control. It shows the output of **Git diff** as symbols in the "gutter"—the sign column where Vim presents additional information, such as line numbers. For example, consider the following as the committed version in Git:

```
  1 package main
  2
  3 import "fmt"
  4
  5 func main() {
  6     x := true
  7     items := []string{"tv", "pc", "tablet"}
  8
  9     if x {
 10         for _, i := range items {
 11             fmt.Println(i)
 12         }
 13     }
 14 }
```

After making some changes, Vim Gitgutter displays the following symbols in the gutter:

```
    1 package main
    2
    3 import "fmt"
    4
_   5 func main() {
    6     items := []string{"tv", "pc", "tablet"}
    7
~   8     if len(items) > 0 {
    9         for _, i := range items {
   10             fmt.Println(i)
+  11             fmt.Println("------")
   12         }
   13     }
   14 }
```

The **-** symbol shows that a line was deleted between lines 5 and 6. The **~** symbol shows that line 8 was modified, and the symbol **+** shows that line 11 was added.

In addition, Vim Gitgutter allows you to navigate between "hunks"—individual changes made in the file—with **[c** and **]c** , or even stage individual hunks for commit by pressing **Leader+hs**.

This plugin gives you immediate visual feedback of changes, and it's a great addition to your toolbox if you use Git.

### 5\. VIM Fugitive

[Vim Fugitive][9] is another great plugin for anyone incorporating Git into the Vim workflow. It's a Git wrapper that allows you to execute Git commands directly from Vim and integrates with Vim's interface. This plugin has many features—check its [GitHub][10] page for more information.

Here's a basic Git workflow example using Vim Fugitive. Considering the changes we've made to the Go code block on section 4, you can use **git blame** by typing the command **:Gblame** :

```
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    1 package main
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    2
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    3 import "fmt"
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    4
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│_   5 func main() {
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    6     items := []string{"tv", "pc", "tablet"}
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    7
00000000 (Not Committed Yet 2018-12-05 18:55:00 -0500)│~   8     if len(items) > 0 {
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    9         for _, i := range items {
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│   10             fmt.Println(i)
00000000 (Not Committed Yet 2018-12-05 18:55:00 -0500)│+  11             fmt.Println("------")
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│   12         }
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│   13     }
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│   14 }
```

You can see that lines 8 and 11 have not been committed. Check the repository status by typing **:Gstatus** :

```
 1 # On branch master
  2 # Your branch is up to date with 'origin/master'.
  3 #
  4 # Changes not staged for commit:
  5 #   (use "git add <file>..." to update what will be committed)
  6 #   (use "git checkout -- <file>..." to discard changes in working directory)
  7 #
  8 #       modified:   vim-5plugins/examples/test1.go
  9 #
 10 no changes added to commit (use "git add" and/or "git commit -a")
--------------------------------------------------------------------------------------------------------
    1 package main
    2
    3 import "fmt"
    4
_   5 func main() {
    6     items := []string{"tv", "pc", "tablet"}
    7
~   8     if len(items) > 0 {
    9         for _, i := range items {
   10             fmt.Println(i)
+  11             fmt.Println("------")
   12         }
   13     }
   14 }
```

Vim Fugitive opens a split window with the result of **git status**. You can stage a file for commit by pressing the **-** key on the line with the name of the file. You can reset the status by pressing **-** again. The message updates to reflect the new status:

```
  1 # On branch master
  2 # Your branch is up to date with 'origin/master'.
  3 #
  4 # Changes to be committed:
  5 #   (use "git reset HEAD <file>..." to unstage)
  6 #
  7 #       modified:   vim-5plugins/examples/test1.go
  8 #
--------------------------------------------------------------------------------------------------------
    1 package main
    2
    3 import "fmt"
    4
_   5 func main() {
    6     items := []string{"tv", "pc", "tablet"}
    7
~   8     if len(items) > 0 {
    9         for _, i := range items {
   10             fmt.Println(i)
+  11             fmt.Println("------")
   12         }
   13     }
   14 }
```

Now you can use the command **:Gcommit** to commit the changes. Vim Fugitive opens another split that allows you to enter a commit message:

```
  1 vim-5plugins: Updated test1.go example file
  2 # Please enter the commit message for your changes. Lines starting
  3 # with '#' will be ignored, and an empty message aborts the commit.
  4 #
  5 # On branch master
  6 # Your branch is up to date with 'origin/master'.
  7 #
  8 # Changes to be committed:
  9 #       modified:   vim-5plugins/examples/test1.go
 10 #
```

Save the file with **:wq** to complete the commit:

```
[master c3bf80f] vim-5plugins: Updated test1.go example file
 1 file changed, 2 insertions(+), 2 deletions(-)
Press ENTER or type command to continue
```

You can use **:Gstatus** again to see the result and **:Gpush** to update the remote repository with the new commit.

```
  1 # On branch master
  2 # Your branch is ahead of 'origin/master' by 1 commit.
  3 #   (use "git push" to publish your local commits)
  4 #
  5 nothing to commit, working tree clean
```

If you like Vim Fugitive and want to learn more, the GitHub repository has links to screencasts showing additional functionality and workflows. Check it out!

### What's next?

These Vim plugins help developers write code in any programming language. There are two other categories of plugins to help developers: code-completion plugins and syntax-checker plugins. They are usually related to specific programming languages, so I will cover them in a follow-up article.

Do you have another Vim plugin you use when writing code? Please share it in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/vim-plugins-developers

作者：[Ricardo Gerardi][a]
选题：[lujun9972][b]
译者：[pityonline](https://github.com/pityonline)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rgerardi
[b]: https://github.com/lujun9972
[1]: https://www.vim.org/
[2]: https://www.vim.org/scripts/script.php?script_id=3599
[3]: https://github.com/jiangmiao/auto-pairs
[4]: https://github.com/scrooloose/nerdcommenter
[5]: http://vim.wikia.com/wiki/Filetype.vim
[6]: https://www.vim.org/scripts/script.php?script_id=1697
[7]: https://github.com/tpope/vim-surround
[8]: https://github.com/airblade/vim-gitgutter
[9]: https://www.vim.org/scripts/script.php?script_id=2975
[10]: https://github.com/tpope/vim-fugitive
