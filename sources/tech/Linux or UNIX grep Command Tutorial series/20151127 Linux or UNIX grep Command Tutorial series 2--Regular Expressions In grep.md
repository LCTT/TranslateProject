(translating by runningwater)
Regular Expressions In grep
================================================================================
How do I use the Grep command with regular expressions on a Linux and Unix-like operating systems?

Linux comes with GNU grep, which supports extended regular expressions. GNU grep is the default on all Linux systems. The grep command is used to locate information stored anywhere on your server or workstation.

### Regular Expressions ###

Regular Expressions is nothing but a pattern to match for each input line. A pattern is a sequence of characters. Following all are examples of pattern:

    ^w1
    w1|w2
    [^ ]

#### grep Regular Expressions Examples ####

Search for 'vivek' in /etc/passswd

    grep vivek /etc/passwd

Sample outputs:

    vivek:x:1000:1000:Vivek Gite,,,:/home/vivek:/bin/bash
    vivekgite:x:1001:1001::/home/vivekgite:/bin/sh
    gitevivek:x:1002:1002::/home/gitevivek:/bin/sh

Search vivek in any case (i.e. case insensitive search)

    grep -i -w vivek /etc/passwd

Search vivek or raj in any case

    grep -E -i -w 'vivek|raj' /etc/passwd

The PATTERN in last example, used as an extended regular expression.

### Anchors ###

You can use ^ and $ to force a regex to match only at the start or end of a line, respectively. The following example displays lines starting with the vivek only:

    grep ^vivek /etc/passwd

Sample outputs:

    vivek:x:1000:1000:Vivek Gite,,,:/home/vivek:/bin/bash
    vivekgite:x:1001:1001::/home/vivekgite:/bin/sh

You can display only lines starting with the word vivek only i.e. do not display vivekgite, vivekg etc:

    grep -w ^vivek /etc/passwd

Find lines ending with word foo:
grep 'foo$' filename

Match line only containing foo:

    grep '^foo$' filename

You can search for blank lines with the following examples:

    grep '^$' filename

### Character Class ###

Match Vivek or vivek:

    grep '[vV]ivek' filename

OR

    grep '[vV][iI][Vv][Ee][kK]' filename

You can also match digits (i.e match vivek1 or Vivek2 etc):

    grep -w '[vV]ivek[0-9]' filename

You can match two numeric digits (i.e. match foo11, foo12 etc):

    grep 'foo[0-9][0-9]' filename

You are not limited to digits, you can match at least one letter:

    grep '[A-Za-z]' filename

Display all the lines containing either a "w" or "n" character:

    grep [wn] filename

Within a bracket expression, the name of a character class enclosed in "[:" and ":]" stands for the list of all characters belonging to that class. Standard character class names are:

- [:alnum:] - Alphanumeric characters.
- [:alpha:] - Alphabetic characters
- [:blank:] - Blank characters: space and tab.
- [:digit:] - Digits: '0 1 2 3 4 5 6 7 8 9'.
- [:lower:] - Lower-case letters: 'a b c d e f g h i j k l m n o p q r s t u v w x y z'.
- [:space:] - Space characters: tab, newline, vertical tab, form feed, carriage return, and space.
- [:upper:] - Upper-case letters: 'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z'.

In this example match all upper case letters:

    grep '[:upper:]' filename

### Wildcards ###

You can use the "." for a single character match. In this example match all 3 character word starting with "b" and ending in "t":

    grep '\<b.t\>' filename

Where,

- \< Match the empty string at the beginning of word
- \> Match the empty string at the end of word.

Print all lines with exactly two characters:

    grep '^..$' filename

Display any lines starting with a dot and digit:

    grep '^\.[0-9]' filename

#### Escaping the dot ####

The following regex to find an IP address 192.168.1.254 will not work:

    grep '192.168.1.254' /etc/hosts

All three dots need to be escaped:

    grep '192\.168\.1\.254' /etc/hosts

The following example will only match an IP address:

    egrep '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}' filename

The following will match word Linux or UNIX in any case:

    egrep -i '^(linux|unix)' filename

### How Do I Search a Pattern Which Has a Leading - Symbol? ###

Searches for all lines matching '--test--' using -e option Without -e, grep would attempt to parse '--test--' as a list of options:

    grep -e '--test--' filename

### How Do I do OR with grep? ###

Use the following syntax:

    grep 'word1|word2' filename

OR

    grep 'word1\|word2' filename

### How Do I do AND with grep? ###

Use the following syntax to display all lines that contain both 'word1' and 'word2'

    grep 'word1' filename | grep 'word2'

### How Do I Test Sequence? ###

You can test how often a character must be repeated in sequence using the following syntax:

    {N}
    {N,}
    {min,max}

Match a character "v" two times:

    egrep "v{2}" filename

The following will match both "col" and "cool":

    egrep 'co{1,2}l' filename

The following will match any row of at least three letters 'c'.

    egrep 'c{3,}' filename

The following example will match mobile number which is in the following format 91-1234567890 (i.e twodigit-tendigit)

    grep "[[:digit:]]\{2\}[ -]\?[[:digit:]]\{10\}" filename

### How Do I Hightlight with grep? ###

Use the following syntax:

    grep --color regex filename

How Do I Show Only The Matches, Not The Lines?

Use the following syntax:

    grep -o regex filename

### Regular Expression Operator ###

注：表格
<table border=1>
  <tr>
    <th>Regex operator</th>
    <th>Meaning</th>
  </tr>
  <tr>
    <td>.</td>
    <td>Matches any single character.</td>
  </tr>
  <tr>
    <td>?</td>
    <td>The preceding item is optional and will be matched, at most, once.</td>
  </tr>
  <tr>
    <td>*</td>
    <td>The preceding item will be matched zero or more times.</td>
  </tr>
  <tr>
    <td>+</td>
    <td>The preceding item will be matched one or more times.</td>
  </tr>
  <tr>
    <td>{N}</td>
    <td>The preceding item is matched exactly N times.</td>
  </tr>
  <tr>
    <td>{N,}</td>
    <td>The preceding item is matched N or more times.</td>
  </tr>
  <tr>
    <td>{N,M}</td>
    <td>The preceding item is matched at least N times, but not more than M times.</td>
  </tr>
  <tr>
    <td>-</td>
    <td>Represents the range if it's not first or last in a list or the ending point of a range in a list.</td>
  </tr>
  <tr>
    <td>^</td>
    <td>Matches the empty string at the beginning of a line; also represents the characters not in the range of a list.</td>
  </tr>
  <tr>
    <td>$</td>
    <td>Matches the empty string at the end of a line.</td>
  </tr>
  <tr>
    <td>\b</td>
    <td>Matches the empty string at the edge of a word.</td>
  </tr>
  <tr>
    <td>\B</td>
    <td>Matches the empty string provided it's not at the edge of a word.</td>
  </tr>
  <tr>
    <td>\&lt;</td>
    <td>Match the empty string at the beginning of word.</td>
  </tr>
  <tr>
    <td>\&gt;</td>
    <td> Match the empty string at the end of word.</td>
  </tr>
</table>

#### grep vs egrep ####

egrep is the same as **grep -E**. It interpret PATTERN as an extended regular expression. From the grep man page:

       In basic regular expressions the meta-characters ?, +, {, |, (, and ) lose their special meaning; instead use the backslashed versions \?, \+, \{,
       \|, \(, and \).
       Traditional egrep did not support the { meta-character, and some egrep implementations support \{ instead, so portable scripts should avoid  {  in
       grep -E patterns and should use [{] to match a literal {.
       GNU grep -E attempts to support traditional usage by assuming that { is not special if it would be the start of an invalid interval specification.
       For example, the command grep -E '{1' searches for the two-character string {1 instead of reporting a syntax  error  in  the  regular  expression.
       POSIX.2 allows this behavior as an extension, but portable scripts should avoid it.

References:

- man page grep and regex(7)
- info page grep`

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/grep-regular-expressions/

作者：Vivek Gite
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出