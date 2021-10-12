[#]: subject: "Automate image processing with this Bash script"
[#]: via: "https://opensource.com/article/21/10/image-processing-bash-script"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Automate image processing with this Bash script
======
A script and ImageMagick make preparing images for publication quick and
easy.
![Polaroids and palm trees][1]

Writers not only work with words, they often have to work with images. Technical writing involves presenting a lot of screenshots to convey the technology and processes. Different publishing platforms may have various requirements for images, such as image format or file size.

As an IT consultant and systems engineer, I have written a lot of technical documentation as client deliverables, generally with Microsoft Word (.doc) as the required format. Any document can grow fast as content is added. In the early days, screenshots were often bitmaps (.bmp), which can have a very large file size. A document describing the installation of an operating system onto a server could end up being a very big file.

Downsizing the images without rendering them unreadable was a laborious exercise. Bitmaps could be converted to jpeg files and later png files. Editing continued to be a challenge even later when I switched my office suite to [LibreOffice][2]. Fortunately, most screenshot tools today save in smaller formats, such as png.

Opensource.com puts certain limits on images that are used in its articles. I developed a quick three-step method for preparing images for my articles. The first step is to be smart about the staging, such as resizing a window or changing a font. Two additional steps became very repetitive. Those are to ensure the image doesn't exceed the 600-pixel width limit and to apply a border.

### The prepimg.sh script

I wrote a Bash script called `prepimg.sh` to handle these tasks. This script uses two tools from the [ImageMagick][3] suite.

#### Resize the image

The screenshot utility saves the image to the `Pictures` directory with a generic name—something like `Screenshot-20210923222312.png`. My `prepimg.sh` script checks the pixel width of the files in this directory and resizes any that exceed the limit. This step uses the **identify** program from the ImageMagick suite to determine the width (%w).


```
$ identify -format %w Screenshot-20210903202655.png
1217
```

The width value is assigned to the variable `W` for use as a comparator to the limit of 600. The limit itself is configurable via the variable `$MAXWIDTH`. If the width is determined to exceed MAXWIDTH, then another ImageMagick program named **convert** is called to reduce the image's width. Here is the image processing function from my script:


```
     if [ "$W" -gt "$MAXWIDTH" ]
     then
         [[ $VERBOSE -gt 0 ]] &amp;&amp; echo "${1} is ${W} - reducing"
         convert -resize "${MAXWIDTH}" \
                 "${SCREENSHOTS}"/"${1}" \
                 "${READY}"/"${1}"
     
     ...    
```

The image is reduced in size as necessary and saved to a different directory defined by the `$READY` variable. In this case, the image is actually resized slightly smaller—598 pixels—to allow room for the addition of a border, which I show next.

#### Add a border to the image

Sometimes an image can appear to blend into the background of the web page. This is because the foreground color of the image out to its edge is the same color as the site's background. Here is an example:

![Image with no border blends into the background][4]

An image with no border. (CC BY-SA 4.0)

As you can see with the image above, it is impossible to tell where the edge of the image is. This problem isn't limited to the color white. It depends on each individual site and the theme colors it uses. So, if the background is red and the image edge is also red, this same problem occurs. My script solves this by using the **convert** tool. The _-border_ option adds a border to each image file with a size of 1 pixel. This option by itself would be enough but I also want to set the color by using the _-bordercolor_ option. Here is an example:


```
`convert -bordercolor black -border 1 Screenshot-20210903202655.png`
```

Below is the same image with a border. Doesn't that look nicer?

![Image with a border doesn't blend into background][5]

An image with a border. (CC BY-SA 4.0)

#### Your image is ready

I use a `for` loop to iterate through the screenshot directory. It calls the function `process_img` for each file. The function handles both width and border. The full code does some sanity checking such as ensuring the file is actually an image.


```
process_img() {
     # verify that file is an image file, and then get dimensions
     if file "${SCREENSHOTS}"/"${1}" | grep -qE 'image|bitmap'; then
         [[ $VERBOSE -gt 0 ]] &amp;&amp; echo "${1} is an image"
         W=$(identify -format %w "${SCREENSHOTS}"/"${1}")
     else
         echo "File ${SCREENSHOTS}/${1} is not an image."
         W=0
     fi
 
     # resize and border
     if [ "$W" -gt "$MAXWIDTH" ]
     then
         [[ $VERBOSE -gt 0 ]] &amp;&amp; echo "${1} is ${W} - reducing"
         convert -resize "${MAXWIDTH}" \
                 -bordercolor $BORDER \
                 -border 1 \
                 "${SCREENSHOTS}"/"${1}" \
                 "${READY}"/"${1}"
     else
         convert -bordercolor $BORDER \
                 -border 1 \
                 "${SCREENSHOTS}"/"${1}" \
                 "${READY}"/"${1}"
     fi
 }
```

The script's final step is to save the processed files in a sub-directory called `Ready`_,_ which is determined by the variable named `$READY`. This preserves the original files for further use.

### Usage

`Prepimg.sh` includes the expected help facility describing its arguments and their usage:


```
$ prepimg.sh -h
prepimg.sh Version 0.7 - written by Alan Formy-Duval
prepimg.sh [OPTIONS]
\--verbose, -v Be verbose
\--directory, -d Screenshot directory (default: /home/alan/Pictures/Screenshots)
\--ready, -r Ready directory (default: /home/alan/Pictures/Screenshots/Ready)
\--border, -b Border color (default: black)
```

### Code and conclusion

The code presented in the article is incomplete and should be considered pseudocode. You can view the complete script in my [Git][6] repository.

The ImageMagick suite is a powerful set of tools for manipulating images. You can do many more things in addition to the functions incorporated in my little script. Correspondent Jim Hall also recently wrote about using it to [resize][7] an image.

Whether you prefer Bash scripting or coding in another language such as C or Python, automation is a great help. Time after time, I've seen how a little bit of code can reduce so many headaches and allow us to make better use of our time.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/image-processing-bash-script

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/design_photo_art_polaroids.png?itok=SqPLgWxJ (Polaroids and palm trees)
[2]: https://www.libreoffice.org/
[3]: https://imagemagick.org/index.php
[4]: https://opensource.com/sites/default/files/noborder_example.png
[5]: https://opensource.com/sites/default/files/border_example.png
[6]: https://gitlab.com/alanfoss/prepimg
[7]: https://opensource.com/article/21/9/resize-image-linux
