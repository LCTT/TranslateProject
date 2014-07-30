How to use awk command in Linux
================================================================================
Text processing is at the heart of Unix. From pipes to the /proc subsystem, the "everything is a file" philosophy pervades the operating system and all of the tools built for it. Because of this, getting comfortable with text-processing is one of the most important skills for an aspiring Linux system administrator, or even any power user, and awk is one of the most powerful text-processing tools available outside general-purpose programming languages.

The simplest awk task is selecting fields from stdin; if you never learn any more about awk than this, you'll still have at your disposal an extremely useful tool.

By default, awk separates input lines by whitespace. If you'd like to select the first field from input, you just need to tell awk to print out $1:

    $ echo 'one two three four' | awk '{print $1}'

> one

(Yes, the curly-brace syntax is a little weird, but I promise that's about as weird as it gets in this lesson.)

Can you guess how you'd select the second, third, or fourth fields? That's right, with $2, $3, and $4, respectively.

    $ echo 'one two three four' | awk '{print $3}' 

(Yes, the curly-brace syntax is a little weird, but I promise that's about as weird as it gets in this lesson.)

Can you guess how you'd select the second, third, or fourth fields? That's right, with $2, $3, and $4, respectively.

    $ echo 'one two three four' | awk '{print $3}' 

> three

Often when text munging, you need to create a specific format of data, and that covers more than just a single word. The good news is that awk makes it easy to print multiple fields, or even include static strings:

     $ echo 'one two three four' | awk '{print $3,$1}' 

> three one

----------

    $ echo 'one two three four' | awk '{print "foo:",$3,"| bar:",$1}' 

> foo: three | bar: one

Ok, but what if your input isn't separated by whitespace? Just pass awk the '-F' flag with your separator:

    $ echo 'one mississippi,two mississippi,three mississippi,four mississippi' | awk -F , '{print $4}' 

> four mississippi

Occasionally, you may find yourself working with data with a varied number of fields, and you just know you want the *last* one. awk prepopulates the $NF variable with the *number of fields*, so you can use it to grab the last element:

    $ echo 'one two three four' | awk '{print $NF}' 

> four

You can also do simple math on $NF, in case you need the next-to-last field:

    $ echo 'one two three four' | awk '{print $(NF-1)}' 

> three

Or even the middle field:

    $ echo 'one two three four' | awk '{print $((NF/2)+1)}' 

> three

    $ echo 'one two three four five' | awk '{print $((NF/2)+1)}' 

> three

While this is all very useful, you can get away with forcing sed, cut, and grep into a form to get these results, as well (albeit with a lot more work).

So, I'll leave you with one last introductory feature of awk, maintaining state across lines.

     $ echo -e 'one 1\ntwo 2' | awk '{print $2}' 

> 1
> 
> 2

    $ echo -e 'one 1\ntwo 2' | awk '{sum+=$2} END {print sum}' 

> 3

(The END indicates that we should only perform the following block **after** we finish processing every line.)

The case where I've used this is to sum up bytes from web server request logs. Imagine we have an access log that looks like this:

    $ cat requests.log 

> Jul 23 18:57:12 httpd[31950]: "GET /foo/bar HTTP/1.1" 200 344
> 
> Jul 23 18:57:13 httpd[31950]: "GET / HTTP/1.1" 200 9300
> 
> Jul 23 19:01:27 httpd[31950]: "GET / HTTP/1.1" 200 9300
> 
> Jul 23 19:01:55 httpd[31950]: "GET /foo/baz HTTP/1.1" 200 6401
> 
> Jul 23 19:02:31 httpd[31950]: "GET /foo/baz?page=2 HTTP/1.1" 200 6312

We know the last field is the number of bytes of the response. We've already learned how to extract them using print and $NF:

    $ < requests.log awk '{print $NF}' 

> 344
> 
> 9300
> 
> 9300
> 
> 6401
> 
> 6312

And so we can sum into a variable to gather the total number of bytes our webserver has served to clients during the timespan of our log:

    $ < requests.log awk '{totalBytes+=$NF} END {print totalBytes}' 

> 31657

If you're looking for more to do with awk, you can find used copies of [the original awk book][1] for under 15 USD on Amazon. You may also enjoy Eric Pement's [collection of awk one-liners][2].

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/use-awk-command-linux.html

作者：[James Pearson][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/james
[1]:http://www.amazon.com/gp/product/020107981X/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=020107981X&linkCode=as2&tag=xmodulo-20&linkId=6NW62B2WBRBXRFJB
[2]:http://www.pement.org/awk/awk1line.txt