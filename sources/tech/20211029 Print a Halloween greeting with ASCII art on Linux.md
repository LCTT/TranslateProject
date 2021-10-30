[#]: subject: "Print a Halloween greeting with ASCII art on Linux"
[#]: via: "https://opensource.com/article/21/10/ascii-linux-halloween"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Print a Halloween greeting with ASCII art on Linux
======
Generate colorful ASCII art from a C program using either Linux or
FreeDOS.
![Happy Halloween ASCII art on FreeDOS][1]

Full-color ASCII art used to be quite popular on DOS, which could leverage the extended ASCII character set and its collection of drawing elements. You can add a little visual interest to your next FreeDOS program by adding ASCII art as a cool “welcome” screen or as a colorful “exit” screen with more information about the program.

But this style of ASCII art isn’t limited just to FreeDOS applications. You can use the same method in a Linux terminal-mode program. While Linux uses [ncurses][2] to control the screen instead of DOS’s [conio][3], the related concepts apply well to Linux programs. This article looks at how to generate colorful ASCII art from a C program.

### An ASCII art file

You can use a variety of tools to draw your ASCII art. For this example, I used an old DOS application called TheDraw, but you can find modern open source ASCII art programs on Linux, such as [Moebius][4] (Apache license) or [PabloDraw][5] (MIT license). It doesn’t matter what tool you use as long as you know what the saved data looks like.

Here’s part of a sample ASCII art file, saved as C source code. Note that the code snippet defines a few values: `IMAGEDATA_WIDTH` and `IMAGEDATA_DEPTH` define the number of columns and rows on the screen. In this case, it’s an 80x25 ASCII art “image.” `IMAGEDATA_LENGTH` defines the number of entries in the `IMAGEDATA` array. Each character in the ASCII art screen can be represented by two bytes of data: The character to display and a color attribute containing both the foreground and background colors for the character. For an 80x25 screen, where each character is paired with an attribute, the array contains 4000 entries (that’s 80 * 25 * 2 = 4000).


```
#define IMAGEDATA_WIDTH 80
#define IMAGEDATA_DEPTH 25
#define IMAGEDATA_LENGTH 4000
unsigned char IMAGEDATA [] = {
    '.', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,
    ' ', 0x08,  ' ', 0x08,  '.', 0x0F,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,
    ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  '.', 0x0F,
    ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,
    ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,  ' ', 0x08,
```

and so on for the rest of the array.

To display this ASCII art to the screen, you need to write a small program to read the array and print each character with the right colors.

### Setting a color attribute

The color attribute in this ASCII art file defines both the background and foreground color in a single byte, represented by hexadecimal values like `0x08` or `0x6E`. Hexadecimal turns out to be a compact way to express a color “pair” like this.

Character mode systems like ncurses on Linux or conio on DOS [can display only sixteen colors][6]. That’s sixteen possible text colors and eight background colors. Counting sixteen values (from 0 to 15) in binary requires only four bits:

  * `1111` is 16 in binary



And conveniently, hexadecimal can represent 0 to 15 with a single character: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, and F. So the value `F` in hexadecimal is the number 15, or `1111` in binary.

With color pairs, you can encode both the background and foreground colors in a single byte of eight bits. That’s four bits for the text color (0 to 15 or 0 to F in hexadecimal) and three bits for the background color (0 to 7 or 0 to E in hexadecimal). The leftover bit in the byte is not used here, so we can ignore it.

To convert the color pair or attribute into color values that your program can use, you’ll need to [use a bit mask][7] to specify only the bits used for the text color or background color. Using the OpenWatcom C Compiler on FreeDOS, you can write this function to set the colors appropriately from the color attribute:


```
void
textattr(int newattr)
{
  _settextcolor(newattr &amp; 15);         /* 0000xxxx */
  _setbkcolor((newattr &gt;&gt; 4) &amp; 7);     /* 0xxx0000 */
}
```

The `_settextcolor` function sets just the text color, and the `_setbkcolor` function sets the background color. Both are defined in `graph.h`. Note that because the color attribute included both the background color and the foreground color in a single byte value, the `textattr` function uses `&` (binary AND) to set a bit mask that isolates only the last four bits in the attribute. That’s where the color pair stores the values 0 to 15 for the foreground color.

To get the background color, the function first performs a bit shift to “push” the bits to the right. This puts the “upper” bits into the “lower” bit range, so any bits like `0xxx0000` become `00000xxx` instead. We can use another bit mask with 7 (binary `0111`) to pick out the background color value.

### Displaying ASCII art

The `IMAGEDATA` array contains the entire ASCII art screen and the color values for each character. To display the ASCII art to the screen, your program needs to scan the array, set the color attribute, then show the screen one character at a time.

Let’s leave room at the bottom of the screen for a separate message or prompt to the user. That means instead of displaying all 25 lines of an 80-column ASCII screen, I only want to show the first 24 lines.


```
  /* print one line less than the 80x25 that's in there:
     80 x 24 x 2 = 3840 */

  for (pos = 0; pos &lt; 3840; pos += 2) {
...
  }
```

Inside the `for` loop, we need to set the colors, then print the character. The OpenWatcom C Compiler provides a function `_outtext` to display text with the current color values. However, this requires passing a string and would be inefficient if we need to process each character one at a time, in case each character on a line requires a different color.

Instead, OpenWatcom has a similar function called `_outmem` that allows you to indicate how many characters to display. For one character at a time, we can provide a pointer to a character value in the `IMAGEDATA` array and tell `_outtext` to show just one character. That will display the character using the current color attributes, which is what we need.


```
  for (pos = 0; pos &lt; 3840; pos += 2) {
    ch = &amp;IMAGEDATA[pos];              /* pointer assignment */
    attr = IMAGEDATA[pos + 1];
 
    textattr(attr);
    _outmem(ch, 1);
  }
```

This updated `for` loop sets the character `ch` by assigning a pointer into the `IMAGEDATA` array. Next, the loop sets the text attributes, and then displays the character with `_outmem`.

### Putting it all together

With the `textattr` function and the `for` loop to process the array, we can write a full program to display the contents of an ASCII art file. For this example, save the ASCII art as `imgdata.inc` and include it in the source file with an `#include` statement.


```
#include &lt;stdio.h&gt;
#include &lt;conio.h&gt;
#include &lt;graph.h&gt;

#include "imgdata.inc"

void
textattr(int newattr)
{
  _settextcolor(newattr &amp; 15);         /* 0000xxxx */
  _setbkcolor((newattr &gt;&gt; 4) &amp; 7);     /* 0xxx0000 */
}

int
main()
{
  char *ch;
  int attr;
  int pos;

  if (_setvideomode(_TEXTC80) == 0) {
    fputs("Error setting video mode", stderr);
    return 1;
  }

  /* draw the array */

  _settextposition(1, 1);              /* top left */

  /* print one line less than the 80x25 that's in there:
     80 x 24 x 2 = 3840 */

  for (pos = 0; pos &lt; 3840; pos += 2) {
    ch = &amp;IMAGEDATA[pos];              /* pointer assignment */
    attr = IMAGEDATA[pos + 1];

    textattr(attr);
    _outmem(ch, 1);
  }

  /* done */

  _settextposition(25, 1);             /* bottom left */

  textattr(0x0f);
  _outtext("Press any key to quit");

  getch();

  textattr(0x00);
  return 0;
}
```

Compile the program using the OpenWatcom C Compiler on FreeDOS, and you’ll get a new program that displays this holiday message:

![Happy Halloween message in ASCII art][8]

Happy Halloween (Jim Hall, [CC-BY-SA 4.0][9])

Happy Halloween, everyone!

**[Download the INC code file here.][10]
[Download the C code file here.][11]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/ascii-linux-halloween

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos-halloween-4x3.jpg?itok=6e_42rs9 (Happy Halloween ASCII art on FreeDOS)
[2]: https://opensource.com/article/21/8/ncurses-linux
[3]: https://opensource.com/article/21/9/programming-dos-conio
[4]: https://blocktronics.github.io/moebius/
[5]: https://github.com/blocktronics/pablodraw
[6]: https://opensource.com/article/21/6/freedos-sixteen-colors
[7]: https://opensource.com/article/21/8/binary-bit-fields-masks
[8]: https://opensource.com/sites/default/files/freedos-halloween-4x3.png
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/imgdata.inc_.txt
[11]: https://opensource.com/sites/default/files/uploads/hallown.c.txt
