[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 reasons to use the Atom text editor)
[#]: via: (https://opensource.com/article/20/12/atom)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 reasons to use the Atom text editor
======
Atom is a comprehensive environment that can accomplish tasks from basic
to complex, for users from beginners to veterans.
![Science lab with beakers][1]

Beautiful open source text editors are pretty common these days, between Adobe’s [Brackets][2], Microsoft’s [VSCode][3], and GitHub’s [Atom][4]. Each of these seem to offer similar experiences: a modern interface, easily installable plugins, and a big brand-name sponsor. And they’re all actually really good. So what sets Atom apart from any other hyper-modern text editor? Or from a classic old editor like [Vim][5] or [Emacs][6]?

![Atom terminal with white text on dark grey background][7]

I’ve used lots of text editors, and upon reflection, I have to admit that once you’ve seen one text editor, you’ve basically seen them all. When judging an editor’s efficacy, 80% of the requirements are satisfied as long as it does one thing: edit text. The other 20% are bonus conveniences, extra gizmos, and fanciful features. They’re nice to have but hardly essential.

I often come back to Atom, though, because, as a user of open source, I have the luxury of using an application just because I can. Here’s what I like about Atom.

### Beginner-friendly

One of my favorite things about Atom is that it feels pretty "normal." I can install Atom on anyone’s computer and they’re off and typing in no time. No new keyboard shortcuts to learn, no serious deviations from user interface conventions. If I take a few minutes to show them a few power features of the application, then they're quickly empowered to install new plugins and discover useful features they enjoy.

It’s just different enough to feel unique but "safe" enough to trick people into believing (and rightly so) they can use it. That’s a hard line to walk, but Atom manages it, and I appreciate it for that.

### Great extensions

When most requirements have been filled as soon as you launch the application, a major factor in "selling" an open source text editor is its extensions. My habitual editor is [GNU Emacs][8], which has a mind-boggling array of extensions so versatile that they can provide everything from an email client to a video game. That’s a hard act to top, and to be honest, I’ve yet to see the editor that can. It shows how important extensions can be, though, and Atom has a nice set of plugins.

There are extensions to add syntax highlighting for languages and formats, to add dynamic linting, and to integrate debuggers, runtime environments, video and music player controls, and much more.
You can practically make Atom the control hub for your desktop, so you rarely have to leave it.

### Language and syntax support

I’m a documented fan of [Docbook][9]. By extension, I’m a fan of its simplified front-end, Asciidoc. When I evaluate an editor, Docbook schema and Asciidoc support are two of my primary metrics. While XML support is relatively common, integration with a specific schema can be a tall order, and Asciidoc is still relatively obscure. Atom's community provides great support for my favorite formats.

Of course, I’ve already mentioned that Atom has great extensions in general, but syntax highlighting is an important feature regardless of what language you're typing. Once again, thanks to a vibrant community, the variety of syntax highlighter options in Atom’s package repository is one of the best.

### Easy theming

Atom makes generating your own style as easy as styling a website, so if you’re competent with CSS, you can make your own Atom theme. To create your own theme, navigate to the **Package** menu. If you don’t see a **Package** menu, press the **Alt** key first to reveal the top menu bar. In the **Package** menu, hover over **Package Generator** and then select **Generate Atom Syntax Theme**. This opens a new project called _my-theme-syntax_ by default. You can name it whatever you want, but it should end in `-syntax` according to Atom convention.

In your new theme project, locate these files: `base.less`, `colors.less`, and `syntax-variables.less`. These define how special keywords, and even background and foreground colors, are themed when your syntax is active. Because they all inherit values from a common template, it’s pretty easy to hack on. For example:


```
// Syntax styles

.syntax--comment {
  color: @light-gray;
}

.syntax--keyword {
  color: @purple;

  &amp;.syntax--control {
    color: @purple;
  }

  &amp;.syntax--operator {
    color: @syntax-text-color;
  }

  &amp;.syntax--other.syntax--special-method {
    color: @blue;
  }

  &amp;.syntax--other.syntax--unit {
    color: @orange;
  }
}
```

The values ending with two dashes, such as `.syntax--keyword`, are objects recognized by a syntax highlighting engine. If you want to develop your customizations further, of course, you can even create your own syntax definitions (although that’s more work than CSS theming). Read all about the ways to hack Atom at [flight-manual.atom.io][10].

### Flexible workflow

Atom has lots of features, and only a subset of them are activated by default. This means you get to decide how you prefer to work, whether you activate new extensions and use them to change Atom on a fundamental level, or you just open up Atom’s preferences and make small adjustments. You can use Atom for writing a fiction book or for writing Python code or technical documentation or anything else.

Even its Git integration doesn’t insist on what you might imagine would be the obvious repository (Github sponsors Atom). It doesn’t have an agenda, and it’s equally useful to everyone, regardless of audience.

## Installing

On Linux, Windows, and macOS, you can [install Atom from its website][11].

Alternately, on Linux, you can install Atom as a Flatpak from [Flathub][12].

If you want to build Atom yourself, you can also [compile it from its source code on Github][13].

## Try Atom

Atom could be your next text editor, notepad, and IDE. It’s easy to use, easy to configure, easy to extend, and it offers a great user experience. Download Atom today, and give it a try.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/atom

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/science_experiment_beaker_lab.png?itok=plKWRhlU (Science lab with beakers)
[2]: https://opensource.com/article/20/12/brackets
[3]: https://opensource.com/article/20/12/%C2%A0https://opensource.com/article/20/6/open-source-alternatives-vs-code
[4]: https://opensource.com/article/17/5/atom-text-editor-packages-writers
[5]: https://opensource.com/article/20/12/vi-text-editor
[6]: https://opensource.com/article/20/12/emacs
[7]: https://opensource.com/sites/default/files/uploads/atom-31_days-atom-opensource.png (Atom terminal with white text on dark grey background)
[8]: https://opensource.com/article/20/2/who-cares-about-emacs
[9]: https://opensource.com/article/17/9/docbook
[10]: https://flight-manual.atom.io/
[11]: https://atom.io
[12]: https://flathub.org/apps/details/io.atom.Atom
[13]: https://github.com/atom
