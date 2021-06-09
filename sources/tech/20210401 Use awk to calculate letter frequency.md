[#]: subject: (Use awk to calculate letter frequency)
[#]: via: (https://opensource.com/article/21/4/gawk-letter-game)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use awk to calculate letter frequency
======
Write an awk script to determine the most (and least) common letters in
a set of words.
![Typewriter keys in multicolor][1]

I recently started writing a game where you build words using letter tiles. To create the game, I needed to know the frequency of letters across regular words in the English language, so I could present a useful set of letter tiles. Letter frequency is discussed in various places, including [on Wikipedia][2], but I wanted to calculate the letter frequency myself.

Linux provides a list of words in the `/usr/share/dict/words` file, so I already have a list of likely words to use. The `words` file contains lots of words that I want, but a few that I don't. I wanted a list of all words that weren't compound words (no hyphens or spaces) or proper nouns (no uppercase letters). To get that list, I can run the `grep` command to pull out only the lines that consist solely of lowercase letters:


```
`$ grep  '^[a-z]*$' /usr/share/dict/words`
```

This regular expression asks `grep` to match patterns that are only lowercase letters. The characters `^` and `$` in the pattern represent the start and end of the line, respectively. The `[a-z]` grouping will match only the lowercase letters **a** to **z**.

Here's a quick sample of the output:


```
$ grep  '^[a-z]*$' /usr/share/dict/words | head
a
aa
aaa
aah
aahed
aahing
aahs
aal
aalii
aaliis
```

And yes, those are all valid words. For example, "aahed" is the past tense exclamation of "aah," as in relaxation. And an "aalii" is a bushy tropical shrub.

Now I just need to write a `gawk` script to do the work of counting the letters in each word, and then print the relative frequency of each letter it finds.

### Counting letters

One way to count letters in `gawk` is to iterate through each character in each input line and count occurrences of each letter **a** to **z**. The `substr` function will return a substring of a given length, such as a single letter, from a larger string. For example, this code example will evaluate each character `c` from the input:


```
{
    len = length($0); for (i = 1; i &lt;= len; i++) {
        c = substr($0, i, 1);
    }
}
```

If I start with a global string `LETTERS` that contains the alphabet, I can use the `index` function to find the location of a single letter in the alphabet. I'll expand the `gawk` code example to evaluate only the letters **a** to **z** in the input:


```
BEGIN { LETTERS = "abcdefghijklmnopqrstuvwxyz" }
 
{
    len = length($0); for (i = 1; i &lt;= len; i++) {
        c = substr($0, i, 1);
        ltr = index(LETTERS, c);
    }
}
```

Note that the index function returns the first occurrence of the letter from the `LETTERS` string, starting with 1 at the first letter, or zero if not found. If I have an array that is 26 elements long, I can use the array to count the occurrences of each letter. I'll add this to my code example to increment (using `++`) the count for each letter as it appears in the input:


```
BEGIN { LETTERS = "abcdefghijklmnopqrstuvwxyz" }
 
{
    len = length($0); for (i = 1; i &lt;= len; i++) {
        c = substr($0, i, 1);
        ltr = index(LETTERS, c);
 
        if (ltr &gt; 0) {
            ++count[ltr];
        }
    }
}
```

### Printing relative frequency

After the `gawk` script counts all the letters, I want to print the frequency of each letter it finds. I am not interested in the total number of each letter from the input, but rather the _relative frequency_ of each letter. The relative frequency scales the counts so that the letter with the fewest occurrences (such as the letter **q**) is set to 1, and other letters are relative to that.

I'll start with the count for the letter **a**, then compare that value to the counts for each of the other letters **b** to **z**:


```
END {
    min = count[1]; for (ltr = 2; ltr &lt;= 26; ltr++) {
        if (count[ltr] &lt; min) {
            min = count[ltr];
        }
    }
}
```

At the end of that loop, the variable `min` contains the minimum count for any letter. I can use that to provide a scale for the counts to print the relative frequency of each letter. For example, if the letter with the lowest occurrence is **q**, then `min` will be equal to the **q** count.

Then I loop through each letter and print it with its relative frequency. I divide each count by `min` to print the relative frequency, which means the letter with the lowest count will be printed with a relative frequency of 1. If another letter appears twice as often as the lowest count, that letter will have a relative frequency of 2. I'm only interested in integer values here, so 2.1 and 2.9 are the same as 2 for my purposes:


```
END {
    min = count[1]; for (ltr = 2; ltr &lt;= 26; ltr++) {
        if (count[ltr] &lt; min) {
            min = count[ltr];
        }
    }
 
    for (ltr = 1; ltr &lt;= 26; ltr++) {
        print substr(LETTERS, ltr, 1), int(count[ltr] / min);
    }
}
```

### Putting it all together

Now I have a `gawk` script that can count the relative frequency of letters in its input:


```
#!/usr/bin/gawk -f
 
# only count a-z, ignore A-Z and any other characters
 
BEGIN { LETTERS = "abcdefghijklmnopqrstuvwxyz" }
 
{
    len = length($0); for (i = 1; i &lt;= len; i++) {
        c = substr($0, i, 1);
        ltr = index(LETTERS, c);
 
        if (ltr &gt; 0) {
            ++count[ltr];
        }
    }
}
 
# print relative frequency of each letter
   
END {
    min = count[1]; for (ltr = 2; ltr &lt;= 26; ltr++) {
        if (count[ltr] &lt; min) {
            min = count[ltr];
        }
    }
 
    for (ltr = 1; ltr &lt;= 26; ltr++) {
        print substr(LETTERS, ltr, 1), int(count[ltr] / min);
    }
}
```

I'll save that to a file called `letter-freq.awk` so that I can use it more easily from the command line.

If you prefer, you can also use `chmod +x` to make the file executable on its own. The `#!/usr/bin/gawk -f` on the first line means Linux will run it as a script using the `/usr/bin/gawk` program. And because the `gawk` command line uses `-f` to indicate which file it should use as a script, you need that hanging `-f` so that executing `letter-freq.awk` at the shell will be properly interpreted as running `/usr/bin/gawk -f letter-freq.awk` instead.

I can test the script with a few simple inputs. For example, if I feed the alphabet into my `gawk` script, each letter should have a relative frequency of 1:


```
$ echo abcdefghijklmnopqrstuvwxyz | gawk -f letter-freq.awk
a 1
b 1
c 1
d 1
e 1
f 1
g 1
h 1
i 1
j 1
k 1
l 1
m 1
n 1
o 1
p 1
q 1
r 1
s 1
t 1
u 1
v 1
w 1
x 1
y 1
z 1
```

Repeating that example but adding an extra instance of the letter **e** will print the letter **e** with a relative frequency of 2 and every other letter as 1:


```
$ echo abcdeefghijklmnopqrstuvwxyz | gawk -f letter-freq.awk
a 1
b 1
c 1
d 1
e 2
f 1
g 1
h 1
i 1
j 1
k 1
l 1
m 1
n 1
o 1
p 1
q 1
r 1
s 1
t 1
u 1
v 1
w 1
x 1
y 1
z 1
```

And now I can take the big step! I'll use the `grep` command with the `/usr/share/dict/words` file and identify the letter frequency for all words spelled entirely with lowercase letters:


```
$ grep  '^[a-z]*$' /usr/share/dict/words | gawk -f letter-freq.awk
a 53
b 12
c 28
d 21
e 72
f 7
g 15
h 17
i 58
j 1
k 5
l 36
m 19
n 47
o 47
p 21
q 1
r 46
s 48
t 44
u 25
v 6
w 4
x 1
y 13
z 2
```

Of all the lowercase words in the `/usr/share/dict/words` file, the letters **j**, **q**, and **x** occur least frequently. The letter **z** is also pretty rare. Not surprisingly, the letter **e** is the most frequently used.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/gawk-letter-game

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-docdish-typewriterkeys-3.png?itok=NyBwMdK_ (Typewriter keys in multicolor)
[2]: https://en.wikipedia.org/wiki/Letter_frequency
