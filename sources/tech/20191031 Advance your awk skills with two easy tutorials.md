[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Advance your awk skills with two easy tutorials)
[#]: via: (https://opensource.com/article/19/10/advanced-awk)
[#]: author: (Dave Neary https://opensource.com/users/dneary)

Advance your awk skills with two easy tutorials
======
Go beyond one-line awk scripts with mail merge and word counting.
![a checklist for a team][1]

Awk is one of the oldest tools in the Unix and Linux user's toolbox. Created in the 1970s by Alfred Aho, Peter Weinberger, and Brian Kernighan (the A, W, and K of the tool's name), awk was created for complex processing of text streams. It is a companion tool to sed, the stream editor, which is designed for line-by-line processing of text files. Awk allows more complex structured programs and is a complete programming language.

This article will explain how to use awk for more structured and complex tasks, including a simple mail merge application.

### Awk program structure

An awk script is made up of functional blocks surrounded by **{}** (curly brackets). There are two special function blocks, **BEGIN** and **END**, that execute before processing the first line of the input stream and after the last line is processed. In between, blocks have the format:


```
`pattern { action statements }`
```

Each block executes when the line in the input buffer matches the pattern. If no pattern is included, the function block executes on every line of the input stream.

Also, the following syntax can be used to define functions in awk that can be called from any block:


```
`function name(parameter list) { statements }`
```

This combination of pattern-matching blocks and functions allows the developer to structure awk programs for reuse and readability.

### How awk processes text streams

Awk reads text from its input file or stream one line at a time and uses a field separator to parse it into a number of fields. In awk terminology, the current buffer is a _record_. There are a number of special variables that affect how awk reads and processes a file:

  * **FS** (field separator): By default, this is any whitespace (spaces or tabs)
  * **RS** (record separator): By default, a newline (**\n**)
  * **NF** (number of fields): When awk parses a line, this variable is set to the number of fields that have been parsed
  * **$0:** The current record
  * **$1, $2, $3, etc.:** The first, second, third, etc. field from the current record
  * **NR** (number of records): The number of records that have been parsed so far by the awk script



There are many other variables that affect awk's behavior, but this is enough to start with.

### Awk one-liners

For a tool so powerful, it's interesting that most of awk's usage is basic one-liners. Perhaps the most common awk program prints selected fields from an input line from a CSV file, a log file, etc. For example, the following one-liner prints a list of usernames from **/etc/passwd**:


```
`awk -F":" '{print $1 }' /etc/passwd`
```

As mentioned above, **$1** is the first field in the current record. The **-F** option sets the FS variable to the character **:**.

The field separator can also be set in a BEGIN function block:


```
`awk 'BEGIN { FS=":" } {print $1 }' /etc/passwd`
```

In the following example, every user whose shell is not **/sbin/nologin** can be printed by preceding the block with a pattern match:


```
`awk 'BEGIN { FS=":" } ! /\/sbin\/nologin/ {print $1 }' /etc/passwd`
```

### Advanced awk: Mail merge

Now that you have some of the basics, try delving deeper into awk with a more structured example: creating a mail merge.

A mail merge uses two files, one (called in this example **email_template.txt**) containing a template for an email you want to send:


```
From: Program committee &lt;[pc@event.org][2]&gt;
To: {firstname} {lastname} &lt;{email}&gt;
Subject: Your presentation proposal

Dear {firstname},

Thank you for your presentation proposal:
  {title}

We are pleased to inform you that your proposal has been successful! We
will contact you shortly with further information about the event
schedule.

Thank you,
The Program Committee
```

And the other is a CSV file (called **proposals.csv**) with the people you want to send the email to:


```
firstname,lastname,email,title
Harry,Potter,[hpotter@hogwarts.edu][3],"Defeating your nemesis in 3 easy steps"
Jack,Reacher,[reacher@covert.mil][4],"Hand-to-hand combat for beginners"
Mickey,Mouse,[mmouse@disney.com][5],"Surviving public speaking with a squeaky voice"
Santa,Claus,[sclaus@northpole.org][6],"Efficient list-making"
```

You want to read the CSV file, replace the relevant fields in the first file (skipping the first line), then write the result to a file called **acceptanceN.txt**, incrementing **N** for each line you parse.

Write the awk program in a file called **mail_merge.awk**. Statements are separated by **;** in awk scripts. The first task is to set the field separator variable and a couple of other variables the script needs. You also need to read and discard the first line in the CSV, or a file will be created starting with _Dear firstname_. To do this, use the special function **getline** and reset the record counter to 0 after reading it.


```
BEGIN {
  FS=",";
  template="email_template.txt";
  output="acceptance";
  getline;
  NR=0;
}
```

The main function is very straightforward: for each line processed, a variable is set for the various fields—**firstname**, **lastname**, **email**, and **title**. The template file is read line by line, and the function **sub** is used to substitute any occurrence of the special character sequences with the value of the relevant variable. Then the line, with any substitutions made, is output to the output file.

Since you are dealing with the template file and a different output file for each line, you need to clean up and close the file handles for these files before processing the next record.


```
{
        # Read relevant fields from input file
        firstname=$1;
        lastname=$2;
        email=$3;
        title=$4;

        # Set output filename
        outfile=(output NR ".txt");

        # Read a line from template, replace special fields, and
        # print result to output file
        while ( (getline ln &lt; template) &gt; 0 )
        {
                sub(/{firstname}/,firstname,ln);
                sub(/{lastname}/,lastname,ln);
                sub(/{email}/,email,ln);
                sub(/{title}/,title,ln);
                print(ln) &gt; outfile;
        }

        # Close template and output file in advance of next record
        close(outfile);
        close(template);
}
```

You're done! Run the script on the command line with:


```
`awk -f mail_merge.awk proposals.csv`
```

or


```
`awk -f mail_merge.awk < proposals.csv`
```

and you will find text files generated in the current directory.

### Advanced awk: Word frequency count

One of the most powerful features in awk is the associative array. In most programming languages, array entries are typically indexed by a number, but in awk, arrays are referenced by a key string. You could store an entry from the file _proposals.txt_ from the previous section. For example, in a single associative array, like this:


```
        proposer["firstname"]=$1;
        proposer["lastname"]=$2;
        proposer["email"]=$3;
        proposer["title"]=$4;
```

This makes text processing very easy. A simple program that uses this concept is the idea of a word frequency counter. You can parse a file, break out words (ignoring punctuation) in each line, increment the counter for each word in the line, then output the top 20 words that occur in the text.

First, in a file called **wordcount.awk**, set the field separator to a regular expression that includes whitespace and punctuation:


```
BEGIN {
        # ignore 1 or more consecutive occurrences of the characters
        # in the character group below
        FS="[ .,:;()&lt;&gt;{}@!\"'\t]+";
}
```

Next, the main loop function will iterate over each field, ignoring any empty fields (which happens if there is punctuation at the end of a line), and increment the word count for the words in the line.


```
{
        for (i = 1; i &lt;= NF; i++) {
                if ($i != "") {
                        words[$i]++;
                }
        }
}
```

Finally, after the text is processed, use the END function to print the contents of the array, then use awk's capability of piping output into a shell command to do a numerical sort and print the 20 most frequently occurring words:


```
END {
        sort_head = "sort -k2 -nr | head -n 20";
        for (word in words) {
                printf "%s\t%d\n", word, words[word] | sort_head;
        }
        close (sort_head);
}
```

Running this script on an earlier draft of this article produced this output:


```
[[dneary@dhcp-49-32.bos.redhat.com][7]]$ awk -f wordcount.awk &lt; awk_article.txt
the     79
awk     41
a       39
and     33
of      32
in      27
to      26
is      25
line    23
for     23
will    22
file    21
we      16
We      15
with    12
which   12
by      12
this    11
output  11
function        11
```

### What's next?

If you want to learn more about awk programming, I strongly recommend the book [_Sed and awk_][8] by Dale Dougherty and Arnold Robbins.

One of the keys to progressing in awk programming is mastering "extended regular expressions." Awk offers several powerful additions to the sed [regular expression][9] syntax you may already be familiar with.

Another great resource for learning awk is the [GNU awk user guide][10]. It has a full reference for awk's built-in function library, as well as lots of examples of simple and complex awk scripts.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/advanced-awk

作者：[Dave Neary][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dneary
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: mailto:pc@event.org
[3]: mailto:hpotter@hogwarts.edu
[4]: mailto:reacher@covert.mil
[5]: mailto:mmouse@disney.com
[6]: mailto:sclaus@northpole.org
[7]: mailto:dneary@dhcp-49-32.bos.redhat.com
[8]: https://www.amazon.com/sed-awk-Dale-Dougherty/dp/1565922255/book
[9]: https://en.wikibooks.org/wiki/Regular_Expressions/POSIX-Extended_Regular_Expressions
[10]: https://www.gnu.org/software/gawk/manual/gawk.html
