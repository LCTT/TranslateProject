translating by kimii
Bash Scripting: Learn to use REGEX (Basics)
======
Regular expressions or regex or regexp are basically strings of character that define a search pattern, they can be used for performing 'Search' or 'Search & Replace' operations as well as can be used to validate a condition like password policy etc.

Regex is a very powerful tool that is available at our disposal & best thing about using regex is that they can be used in almost every computer language. So if you are Bash Scripting or creating a Python program, we can use regex or we can also write a single line search query.

For this tutorial, we are going to learn some of regex basics concepts & how we can use them in Bash using 'grep', but if you wish to use them on other languages like python or C, you can just use the regex part. So let's start by showing an example for regex,

 **Ex-** A regex looks like

 **/t[aeiou]l/**

But what does this mean. It means that the mentioned regex is going to look for a word that starts with 't' , have any of the letters 'a e I o u ' in the middle & letter 'l' as the last word . It can be 'tel' 'tal' or 'til' / Match can be a separate word or part of another word like 'tilt', 'brutal' or 'telephone'.

 **Syntax for using regex with grep is**

 **$ grep "regex_search_term" file_location**

Don't worry if its getting over the mind, this was just an example to show what can be achieved with regex & believe me this was simplest of the example. We can achieve much much more from regex. We will now start regex with basics.

 **(Recommended Read: [Useful Linux Commands that you should know ][1])**

## **Regex Basics**

We will now start learning about some special characters that are known as MetaCharacters. They help us in creating more complex regex search term. Mentioned below is the list of basic metacharacters,

 **. or Dot** will match any character

 **[ ]** will match a range of characters

 **[^ ]** will match all character except for the one mentioned in braces

 ***** will match zero or more of the preceding items

 **+** will match one or more of the preceding items

 **? ** will match zero or one of the preceding items

 **{n}** will match  'n' numbers of preceding items

 **{n,}** will match  'n' number of or more of preceding items

 **{n m} ** will match between  'n' & 'm' number of items

 **{ ,m}** will match less than or equal to m number of items

 **\ ** is an escape character, used when we need to include one of the metcharacters is our search.

We will now discuss all these metacharatcters with examples.

### **. or Dot**

Its used to match any character that occurs in our search term. For example, we can use dot like

 **$ grep "d.g" file1**

This regex means we are looking for a word that starts with 'd', ends with 'g' & can have any character in the middle in the file named 'file_name'. Similarly we can use dot character any number of times for our search pattern, like

 **T ……h**

This search term will look for a word that starts with 'T', ends with 'h' & can have any six characters in the middle.

###  **[ ]**

Square braces are used to define a range of characters. For example, we need to search for some words in particular rather than matching any character,

 **$ grep "N[oen]n" file2**

here, we are looking for a word that starts with 'N', ends with 'n' & can only have either of 'o' or 'e' or 'n' in the middle . We can mention from a single to any number of characters inside the square braces.

We can also define ranges like 'a-e' or '1-18' as the list of matching characters inside square braces.

###  **[^ ]**

This is like the not operator for regex. While using [^ ], it means that our search will include all the characters except the ones mentioned inside the square braces. Example,

 **$ grep "St[^1-9]d" file3**

This means that we can have all the words that starts with 'St' , ends with letter 'd' & must not contain any number from 1 to 9.

Now up until now we were only using examples of regex that only need to look for single character in middle but what if we need to look to more than that. Let's say we need to locate all words that starts & ends with a character & can have any number of characters in the middle. That's where we use multiplier metacharacters i.e. + 20171202 docker - Use multi-stage builds.md comic core.md Dict.md lctt2014.md lctt2016.md LCTT翻译规范.md LICENSE published README.md sign.md sources translated 选题模板.txt 中文排版指北.md & ?.

{n}, {n. m}, {n , } or { ,m} are also some other multipliers metacharacters that we can use in our regex terms.

### * (asterisk)

The following example matches any number of occurrences of the letter k, including none:

 **$ grep "lak*" file4**

it means we can have a match with 'lake' or 'la' or 'lakkkkk'

### +

The following pattern requires that at least one occurrence of the letter k in the string be matched:

 **$ grep "lak+" file5**

here, k at least should occur once in our search, so our results can be 'lake' or 'lakkkkk' but not 'la'.


###  **?**

In the following pattern matches

 **$ grep "ba?b" file6**

the string bb or bab as with '?' multiplier we can have one or zero occurrence of the character.

###  **Very important Note:**

This is pretty important while using multipliers, suppose we have a regex

 **$ grep "S.*l" file7**

And we get results with 'small' , silly & than we also got 'Shane is a little to play ball'. But why did we get 'Shane is a little to play ball', we were only looking to words in our search so why did we get the complete sentence as our output.

That's because it satisfies our search criteria, it starts with letter 'S', has any number of characters in the middle & ends with letter 'l'. So what can we do to correct our regex, so that we only get words instead of whole sentences as our output.

We need to add ? Meta character in the regex,

 **$ grep "S.*?l" file7**

This will correct the behavior of our regex.

###  **\ or Escape characters**

\ is used when we need to include a character that is a metacharacter or has special meaning to regex. For example, we need to locate all the words ending with dot, so we can use

 **$ grep "S.*\\." file8**

This will search and match all the words that ends with a dot character.

We now have some basic idea of how the regex works with this regex basics tutorial. In our next tutorial, we will learn some advance concepts of regex. In meanwhile practice as much as you can, create regex and try to en-corporate them in your work as much as you can. & if having any queries or questions you can leave them in the comments below.

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/bash-scripting-learn-use-regex-basics/

作者：[SHUSAIN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/useful-linux-commands-you-should-know/
