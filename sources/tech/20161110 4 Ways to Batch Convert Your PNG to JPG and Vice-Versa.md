# 4 Ways to Batch Convert Your PNG to JPG and Vice-Versa

In computing, Batch processing is the [execution of a series of tasks][11] in a program non-interactively. In this guide will offer you 4 simple ways to batch convert several `.PNG` images to `.JPG` and vice-versa using Linux command-line tools.

We will use convert command line tool in all the examples, however, you can as well make use of mogrify to achieve this.

The syntax for using convert is:

```
$ convert input-option input-file output-option output-file

```

And for mogrify is:

```
$ mogrify options input-file

```

Note: With mogrify, the original image file is replaced with the new image file by default, but it is possible to prevent this, by using certain options that you can find in the man page.

Below are the various ways to batch convert your all `.PNG` images to `.JPG` format, if you want to convert `.JPG`to `.PNG`, you can modify the commands according to your needs.

### 1\. Convert PNG to JPG Using ‘ls’ and ‘xargs’ Commands

The [ls command][10] allows you to list all your png images and xargs make it possible to build and execute a convert command from standard input to convert all `.png` images to `.jpg`.

```
----------- Convert PNG to JPG ----------- 
$ ls -1 *.png | xargs -n 1 bash -c 'convert "$0" "${0%.png}.jpg"'

----------- Convert JPG to PNG ----------- 
$ ls -1 *.jpg | xargs -n 1 bash -c 'convert "$0" "${0%.jpg}.png"'

```

Explanation about the options used in the above command.

1.  `-1` – flag tells ls to list one image per line.
2.  `-n` – specifies the maximum number of arguments, which is 1 for the case.
3.  `-c` – instructs bash to run the given command.
4.  `${0%.png}.jpg` – sets the name of the new converted image, the % sign helps to remove the old file extension.

[
 ![Convert PNG to JPG Format in Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-in-Linux.png) 
][9]

Convert PNG to JPG Format in Linux

I used `ls -ltr` command to [list all files by modified date and time][8].

Similarly, you can use above command to convert all your `.jpg` images to `.png` by tweaking the above command.

### 2\. Convert PNG to JPG Using GNU ‘Parallel’ Command

GNU Parallel enables a user to build and execute shell commands from standard input in parallel. Make sure you have GNU Parallel installed on your system, otherwise install it using the appropriate commands below:

```
$ sudo apt-get install parallel     [On Debian/Ubuntu systems]
$ sudo yum install parallel         [On RHEL/CentOS and Fedora]

```

Once Parallel utility installed, you can run the following command to convert all `.png` images to `.jpg` format from the standard input.

```
----------- Convert PNG to JPG ----------- 
$ parallel convert '{}' '{.}.jpg' ::: *.png

----------- Convert JPG to PNG -----------
$ parallel convert '{}' '{.}.png' ::: *.jpg

```

Where,

1.  `{}` – input line which is a replacement string substituted by a complete line read from the input source.
2.  `{.}` – input line minus extension.
3.  `:::` – specifies input source, that is the command line for the example above where *png or *jpg is the argument.

[
 ![Parallel Command - Converts All PNG Images to JPG Format](http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-Using-Parallel-Command.png) 
][7]

Parallel Command – Converts All PNG Images to JPG Format

Alternatively, you can as well use [ls][6] and parallel commands together to batch convert all your images as shown:

```
----------- Convert PNG to JPG ----------- 
$ ls -1 *.png | parallel convert '{}' '{.}.jpg'

----------- Convert JPG to PNG -----------
$ ls -1 *.jpg | parallel convert '{}' '{.}.png'

```

### 3\. Convert PNG to JPG Using ‘for loop’ Command

To avoid the hustle of writing a shell script, you can execute a `for loop` from the command line as follows:

```
----------- Convert PNG to JPG ----------- 
$ bash -c 'for image in *.png; do convert "$image" "${image%.png}.jpg"; echo “image $image converted to ${image%.png}.jpg ”; done'

----------- Convert JPG to PNG -----------
$ bash -c 'for image in *.jpg; do convert "$image" "${image%.jpg}.png"; echo “image $image converted to ${image%.jpg}.png ”; done'

```

Description of each option used in the above command:

1.  -c allows for execution of the for loop statement in single quotes.
2.  The image variable is a counter for number of images in the directory.
3.  For each conversion operation, the [echo command][1] informs the user that a png image has been converted to jpg format and vice-versa in the line $image converted to ${image%.png}.jpg”.
4.  “${image%.png}.jpg” creates the name of the converted image, where % removes the extension of the old image format.

[
 ![for loop - Convert PNG to JPG Format](http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-Using-for-loop-Command.png) 
][5]

for loop – Convert PNG to JPG Format

### 4\. Convert PNG to JPG Using Shell Script

If you do not want to make your command line dirty as in the previous example, write a small script like so:

Note: Appropriately interchange the `.png` and `.jpg` extensions as in the example below for conversion from one format to another.

```
#!/bin/bash
#convert
for image in *.png; do
        convert  "$image"  "${image%.png}.jpg"
        echo “image $image converted to ${image%.png}.jpg ”
done
exit 0 

```

Save it as `convert.sh` and make the script executable and then run it from within the directory that has your images.

```
$ chmod +x convert.sh
$ ./convert.sh

```
[
 ![Batch Image Convert Using Shell Script](http://www.tecmint.com/wp-content/uploads/2016/11/Batch-Image-Convert-Using-Shell-Script.png) 
][4]

Batch Image Convert Using Shell Script

In summary, we covered some important ways to batch convert `.png` images to `.jpg` format and vice-versa. If you want to optimize images, you can go through our guide that shows [how to compress png and jpg images in Linux][3].

You can as well share with us any other methods including [Linux command line tools][2] for converting images from one format to another on the terminal, or ask a question via the comment section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-image-conversion-tools/

作者：[Aaron Kili][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/echo-command-in-linux/
[2]:http://www.tecmint.com/tag/linux-tricks/
[3]:http://www.tecmint.com/optimize-and-compress-jpeg-or-png-batch-images-linux-commandline/
[4]:http://www.tecmint.com/wp-content/uploads/2016/11/Batch-Image-Convert-Using-Shell-Script.png
[5]:http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-Using-for-loop-Command.png
[6]:http://www.tecmint.com/tag/linux-ls-command/
[7]:http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-Using-Parallel-Command.png
[8]:http://www.tecmint.com/sort-ls-output-by-last-modified-date-and-time/
[9]:http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-in-Linux.png
[10]:http://www.tecmint.com/tag/linux-ls-command/
[11]:http://www.tecmint.com/using-shell-script-to-automate-linux-system-maintenance-tasks/
