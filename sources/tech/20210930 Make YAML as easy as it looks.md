[#]: subject: "Make YAML as easy as it looks"
[#]: via: "https://opensource.com/article/21/9/yaml-cheat-sheet"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Make YAML as easy as it looks
======
YAML looks simple so why is it so hard to write? Learn the two secrets
to YAML success.
![Person using a laptop][1]

If you've ever tried writing YAML, you may have been initially pleased with how apparently easy it looks. At first glance, the YAML that's often used for configuration files, Ansible playbooks, and flat-file databases looks more or less as intuitive as a shopping list. However, there's a lot of nuance in YAML's structure, and it conceals a dangerous secret: YAML is actually a highly precise, structured, and surprisingly strict language. The good news is that you only need to understand two things to know how YAML works.

The truth about YAML is that there are only two data structures in YAML: sequences and mappings. Those are two fancy names to represent what you'll discover are very familiar concepts. This article explains them both, and more importantly, how they work together to make YAML a powerful way to represent the data you care about.

### What's a YAML sequence?

A YAML sequence is a list. In its simplest form, there's one item per line, with each line beginning in a dash and a space.

Here's an example:


```
\---
\- Linux
\- BSD
\- Illumos
```

Different languages have different ways of representing this kind of data. In Python, for example, the same list can be written as `['Linux', 'BSD', 'Illumos']`. When you write a list in real life, for instance before you go shopping for groceries, you probably approximate a YAML sequence.

### What's a YAML mapping?

A YAML mapping is a key term combined with a definition for that term. A mapping in other languages is called a _key and value pair_ or a _dictionary_.

Here's an example:


```
\---
Kernel: Linux
CPU: AMD
RAM: '16 GB'
```

Different languages have different ways of representing this kind of data. [In Python][2], for example, the same data can be written as `{"Kernel": "Linux", "CPU": "AMD", "RAM": "16 GB"}`. In real life, you might use this kind of structure to plan, for instance, a game night with friends. One friend signs up to bring snacks, another signs up to bring a deck of cards, another a board game, and so on.

### Combing sequences and mappings

You now know the syntax of YAML. Sequences and mappings are the only two kinds of building blocks available in YAML, and anything you want to represent in YAML can be placed into either a sequence or a mapping.

Or both!

Yes, sequences and mappings can be combined and nested, which is one reason YAML often looks intuitive and yet feels complex all at once. There are only four possible combinations, though, and once you learn to see them, YAML starts to feel as easy as it looks.

### Mapping sequences

When you want one key term to have many values, you use a mapping of sequences. That is, you start with a mapping (keys), but you insert a list for the values:


```
\---
Linux:
 - Fedora
  - Slackware
BSD:
 - FreeBSD
  - NetBSD
```

In this sample code, **Linux** is the first key, and its value is a sequence, which contains **Fedora** and **Slackware**. The second key is **BSD**, which has a value of a sequence containing **FreeBSD** and **NetBSD**.

### Mapping of mappings

When you want one key term to have values that themselves have both keys and values, you use a mapping of mappings. That is, you start with a mapping (keys), but you insert another mapping for the values.

This one can be deceptive, but it reveals why special terminology is used in YAML: just because you create a list of mappings doesn't mean you've created a _sequence_. Here's a mapping of mappings:


```
\---
Desktop:
  CPU: RISC-V
  RAM: '32 GB'
Laptop:
  CPU: AMD
  RAM: '16 GB'
```

To most people, that looks like a list. And technically, it is a list. But it's important to recognize that it is _not_ a YAML sequence. It's a mapping, which contains mappings. Being a near-expert in YAML, you can spot the difference from the distinct lack of dashes.

Of all the constructs in Ansible playbooks, I find that this one tricks people the most. As humans, we like lists, and when we see a data structure that _is literally_ a list, most people are compelled to translate that into a YAML sequence. But in YAML, although a sequence is a list, a list is not always a sequence.

### Sequence of sequences

Just as you can nest mappings, you can nest a sequence into a sequence:


```
\---
\- [Linux, FreeBSD, Illumos]
\- [YAML, XML, JSON]
```

This is probably the least common data structure I encounter in real-world uses of YAML, but sometimes you need a list of lists.

### Sequence of mappings

You can also create a sequence that contains mappings. This isn't terribly common for the way humans sort data, but for computers it can be an important construct.

Here's an example:


```
\---
-
  CPU: AMD
  RAM: '16 GB'
-
  CPU: Intel
  RAM: '16 GB'
```

As YAML, this is possibly the least intuitive syntax. I find it clearer when rendered in Python:


```
`[{"CPU": "AMD", "RAM": "16 GB"}, {"CPU": "Intel", "RAM": "16 GB"}]`
```

The square brackets represent a list structure, and the list contains two dictionaries. Each dictionary contains key and value pairs.

### Build better YAML

Now you know the two components of YAML, and how they can be combined to represent complex  data structures. The question is: what will you build with YAML?

I use YAML, as many people do, for Ansible playbooks. I've also used it as an easy configuration format, as a character sheet for D&amp;D, as a representation of a directory structure required for project organization, and much more. As long as you get comfortable with the concepts of sequences and mappings, you might find YAML an easy format to write, read, and (provided the right library) to parse.

If you're finding yourself working with YAML often, download our **[YAML cheat sheet][3]** to help you visualize the basic data structures and their combinations and to help you remember some of the extra syntactical conventions available to you. With a little bit of practice, you'll find YAML really is as easy as it looks!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/yaml-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/21/3/dictionary-values-python
[3]: https://opensource.com/downloads/yaml-cheat-sheet
