[#]: subject: "Remixing Linux for blind and visually impaired users"
[#]: via: "https://opensource.com/article/22/9/linux-visually-impaired-users"
[#]: author: "Vojtech Polasek https://opensource.com/users/vpolasek"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Remixing Linux for blind and visually impaired users
======
Fegora, a Fedora project, is an unofficial Linux distribution aimed at visually impaired users.

When I was around 5 years old, my father brought home our first computer. From that moment on, I knew I wanted to pursue a career in computers. I haven't stopped hanging around them since. During high school, when considering which specific area I wanted to focus on, I started experimenting with hacking, and that was the moment I decided to pursue a career as a security engineer.

I'm now a software engineer on the security compliance team. I've been at Red Hat for over two years, and I work remotely in the Czech Republic. I've used Linux for about 12 years, mainly Arch Linux and Fedora, but I've also administered Debian, Gentoo, and Ubuntu in the past.

![Image of Vojtech][2]

Photo description: Black and white image of a smiling Vojtech, with a red frame around it and an illustrated paper airplane in the background.

Outside of my day job, I play blind football, and I'm involved in various projects connecting visually impaired and sighted people together, including working in a small NGO that runs activities for blind and visually impaired people. I'm also working on an accessible Fedora project currently called [Fegora][3], an unofficial Linux distribution aimed at visually impaired users.

### The assistive technology stack

When I use a smart device, I need several pieces of assistive technology. The first and most essential is called a *screen reader*. This is software that presents what's on the screen to blind or visually impaired people, either through speech or through braille (basically, it tries to serve as our eyes). It can read out notifications and tell me which button or page element I'm focusing on, allowing me to interact with graphical user interfaces.

Screen readers use speech synthesis to speak aloud what appears on the screen. There are a variety of speech synthesizers, and some voices are more "natural-sounding" than others. The one I use, Espeak, is not very natural-sounding, but it's lightweight and fast. It also supports almost all languages, including Czech (which I use).

Finally, I use a Braille display, a device that represents a line of text in Braille. I use this a lot, especially when I'm coding or doing code reviews. It's easier to grasp the structure of code when I can freely move from one code element to another by touch. I can also use its buttons to move the cursor to the character or area of the screen I'm interested in, and it has a Braille keyboard too if I want to use it.

### How I use assistive technology on a daily basis

When using a computer as a blind or visually impaired person, there are a couple of things that are relatively straightforward to do using the tech above. Personally, these are a few of the things I do every day:

* The text console is pretty much my favorite application. As a general rule, when something's in text, then blind people can read it with a screen reader (this doesn't hold true in all cases, but in most.) I mainly use the console for system management, text editing, and working with guidance and documentation.
* I browse the web and interact with websites.
* I code and do code reviews using VSCode and [Eclipse][4].
* I send emails and instant messages.
* I can use word processing software, like Google Docs (which is not open source, but common in the modern office) and [LibreOffice][5]. Google Docs developers have added a lot of keyboard shortcuts, which I can use to move around documents, jump to headings or into comments, and so on.
* I can play multimedia, usually. It depends on how the application is written. Some media players are more accessible than others.

### Possible but painful

This brings me to tasks that aren't so easy. I like to call these "possible but painful".

PDF files can be difficult. Sometimes I end up needing to use optical character recognition (OCR) software to convert images to text. For example, recently I needed to read a menu for a restaurant. They had the PDF of their menu on their website, but it had been flattened, and didn't have a text layer. For me, this shows up as a blank screen. I had to use an OCR application from my smartphone to extract the text for me. Not only is this an extra step, but the resulting "translation" of the text isn't always entirely accurate.

Viewing and creating a presentation can be problematic. To work around this, I create slides in HTML, using software such as [Pandoc][6], which can process [markdown][7] and convert it into slides. I've been using this for many years and it works well—it allows me total control of the resulting slides, because the markdown is just simple text.

Video games can be made more accessible by basing them on sound or text. However, playing games can be doubly challenging on Linux as not only would you need to find an accessible game, but most PC games are also native to Windows so you would be dealing with some compatibility issues as well.

Some websites and interfaces are more difficult to navigate than others. These issues are often quite easy to solve just by setting some attributes correctly. In general, lots of web content comes in the form of images, especially today. One of the easiest ways to make web content more accessible is to make sure that alternative text is added to images so that screen readers can read it out, and people who cannot distinguish the image have some idea what's there. Another thing I experience a lot is unlabeled controls: you know there's a button or a check box but you don't know what it does.

### The Fegora project optimises Linux for accessibility

Developers don't intentionally set out to build applications that aren't accessible. The problem is that they usually don't know how to test them. There aren't many blind Linux users, so there aren't many people testing the accessibility of applications and providing feedback. Therefore, developers don't produce accessible applications, and they don't get many users. And so the cycle continues.

This is one thing we hope to tackle with the Fegora project. We want to create a Fedora remix that's user-friendly for visually impaired and blind users. We hope it will attract more users, and that those users start discovering issues to report, which will hopefully be solved by other developers in the open source community.

So why are we doing this? Well, it's important to point out that Fedora is not an *inaccessible* distribution by design. It does have many accessibility tools available in the form of packages. But these aren't always present from the beginning, and there are a lot of small things which need to be configured before it can be proficiently used. This is something that can be discouraging to a beginner Fedora user.

We want Fegora to be as friendly and predictable for a blind user as possible. When a user launches a live image, the screen immediately starts being read as soon as a graphical user interface appears. All [environment variables][8] needed for accessibility are loaded and configured correctly.

Fegora brings the following changes, among others:

* Environment variables for accessibility are configured from the start.
* The Orca screen reader starts as soon as the graphical interface loads.
* A custom repo is added with extra voice synthesis and packaged software.
* Many alternative keyboard shortcuts have been added.
* There's a special script that can turn your monitor on and off. Many users do not need the monitor at all and having it off is a great power saver!

### So how can you help?

First, if you'd like to contribute to Fegora (or just spread the word), you can find out more on [our repository][9].

Additionally, when working on a team with someone who has a visual impairment, there might be some additional considerations depending on the accessibility tech being used. For example, it's not easy for us to listen to someone and read at the same time, because we are basically getting both things through audio, unless someone is very proficient with the Braille display.

Lastly, bear in mind that blind and visually impaired users consume the same end products as you do, whether that's presentation slides or websites or PDFs. When building products or creating content, your choices have a huge effect on accessibility and how easy it is for us to engage with the end result. Know that we are here, we love to use computers and technology, and we're often willing to help you test it, too.

![Image of Vojtech holding a football][10]

Image by: (Vojtech Polasek, CC BY-SA 4.0)

Image description: Vojtech holding a football. He is wearing a football uniform and protective goggles.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/linux-visually-impaired-users

作者：[Vojtech Polasek][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vpolasek
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/lightbulb_computer_person_general_.png
[2]: https://opensource.com/sites/default/files/2022-08/Vojtech.png
[3]: https://github.com/vojtapolasek/Fegora
[4]: https://opensource.com/article/20/12/eclipse
[5]: https://opensource.com/article/22/2/libreoffice-accessibility
[6]: https://opensource.com/article/18/9/intro-pandoc
[7]: https://opensource.com/article/19/9/introduction-markdown
[8]: https://opensource.com/article/19/8/what-are-environment-variables
[9]: https://github.com/vojtapolasek/Fegora
[10]: https://opensource.com/sites/default/files/2022-08/Vojtech%20holding%20a%20football.jpg
