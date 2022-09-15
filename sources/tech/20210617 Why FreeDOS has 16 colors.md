[#]: subject: (Why FreeDOS has 16 colors)
[#]: via: (https://opensource.com/article/21/6/freedos-sixteen-colors)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (gpchn)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Why FreeDOS has 16 colors
======
Why does text only come in this limited palette, and why does FreeDOS
use those colors and shades, instead of some other colors? The answer,
like many things in technology, is because of history.
![Person typing on a 1980's computer][1]

If you've looked carefully at FreeDOS, you've probably noticed that text only comes in a limited range of colors—sixteen text colors, and eight background colors. This is similar to how Linux displays text color—you might be able to change _what text colors are used_ in a Linux terminal, but you're still stuck with just sixteen text colors and eight background colors.

![terminal colors][2]

DOS text comes in 16 colors and 8 background colors
(Jim Hall, [CC-BY SA 4.0][3])

Why does text only come in this limited palette, and why does FreeDOS use _those_ colors and shades, instead of some other colors? The answer, like many things in technology, is because of _history_.

### The origins of PC color

To explain why text only comes in sixteen colors, let me tell you a story about the first IBM Personal Computer. Parts of this story may be somewhat apocryphal, but the basics are close enough.

IBM released the Personal Computer 5150 (the "IBM PC") in 1981. The PC used a simple monitor screen that displayed text in green. Because this display only worked with one color, it was dubbed _monochrome_ (the "IBM 5151 monochrome display," with the IBM Monochrome Display Adapter card, or "MDA").

That same year, IBM released an updated version of the PC that sported an amazing technical achievement—color! The new IBM 5153 color display relied on a new IBM Color Graphics Adapter, or "CGA." And it is because of this original CGA that all DOS text inherited their colors.

But before we go there, we first need to understand something about color. When we talk about colors on a computer screen, we're talking about mixing different values of the three _primary_ light colors—red, green, and blue. You can mix together different levels (or "brightnesses") of red, green, and blue light to create almost any color. Mix just red and blue light, and you get magenta. Mix blue and green, and you get cyan or aqua. Mix all colors equally, and you get white. Without any light colors, you see black (an absence of color).

![light colors][4]

Mix red, green, and blue light to get different colors
(Jim Hall, [CC-BY SA 4.0][3])

The IBM 5153 color display presented color to the user by lighting up tiny red, green, and blue phosphor dots on a cathode ray tube (a "CRT"). These tiny dots were arranged very close together and in a pattern where a triad of red, green, and blue dots would form a "pixel." By controlling which phosphor dots were lit at one time, the IBM 5153 color display could show different colored pixels.

![CRT pixels][5]

Each red, green, and blue triad is a single pixel
(Jim Hall, [CC-BY SA 4.0][3])

By the way, even modern displays use this combination of red, green, and blue dots to represent colors. The difference in modern computers is that instead of tiny phosphor dots, each pixel uses a triad of red, green, and blue LED lights—usually arranged side by side. The computer can turn each LED light on or off to mix the red, green, and blue colors in each pixel.

![LCD pixels][6]

Each red, green, and blue triad is a single pixel
(Jim Hall, [CC-BY SA 4.0][3])

### Defining CGA colors

The IBM engineers realized they could display several colors by mixing each red, green, and blue pixels. In the simplest case, you could assume each red, green, and blue dot in a single-pixel was either "on" or "off." And as any computer programmer will tell you, you can represent "on" and "off" as binary—ones (1=on) and zeroes (0=off).

Representing red, green, and blue with ones or zeroes means you can combine up to eight colors, from 000 (red, green, and blue are all off) to 111 (red, green, and blue are all on). Note that the bit pattern goes like "RGB," so RGB=001 is blue (only blue is on) and RGB=011 is cyan (both green and blue are on):

| | | | | ----------- | | | 000 Black | | | 001 Blue | | | 010 Green | | | 011 Cyan | | | 100 Red | | | 101 Magenta | | | 110 Yellow | | | 111 White |

But that's just the simplest case. A particularly clever IBM engineer realized you could double the number of colors from eight to sixteen simply by adding another bit. So instead of a bit pattern like RGB, we can use a bit pattern like iRGB. We'll call this extra "i" bit the "intensity" bit because if we set the "intensity" bit to 1 (on), then we'll light up the red, green, and blue phosphor dots at full brightness; if the "intensity" bit is 0 (off) we can use some mid-level brightness.

And with that simple fix, now CGA could display sixteen colors! For the sake of simplicity, the IBM engineers referred to the high-intensity colors as the "bright" versions of the regular color names. So "red" pairs with "bright red," and "magenta" pairs with "bright magenta."

| | | | | | | ------------ | | ------------------- | | | 0000 Black | | 1000 Bright Black | | | 0001 Blue | | 1001 Bright Blue | | | 0010 Green | | 1010 Bright Green | | | 0011 Cyan | | 1011 Bright Cyan | | | 0100 Red | | 1100 Bright Red | | | 0101 Magenta | | 1101 Bright Magenta | | | 0110 Yellow | | 1110 Bright Yellow | | | 0111 White | | 1111 Bright White |

Oh no! But wait! This isn't actually sixteen colors. If you notice iRGB=0000 (black) and iRGB=1000 (bright black), they are both the same _black_. There's no color to make "bright," so they are just both regular black. This means we only have fifteen colors, not the sixteen we were hoping for.

But IBM has clever engineers working for them, and they realized how to fix this to get sixteen colors. Rather than implement a straight RGB to iRGB, IBM actually implemented a _modified_ iRGB scheme. With this change, IBM set four levels of brightness for each phosphor dot: completely off, one-third brightness, two-thirds brightness, and full brightness. If the "intensity" bit was turned off, then each red, green, and blue phosphor dot would light up at two-thirds brightness. If you set the "intensity" bit on, any zeroes in the RGB colors would be lit at one-third brightness, and any ones in the RGB colors would be lit at full brightness.

Let me describe this to you another way, using web color code representation. If you are familiar with the HTML colorspace, you probably know that you can represent colors using #RGB, where RGB represents a combination of red, green, and blue values, each between the hexadecimal values 0 through F. So using IBM's modified iRGB definition, iRGB=0001 is #00a (blue) and iRGB=1001 is #55f (bright blue) because with high-intensity colors, all zeroes in RGB=001 are lit at one-third brightness (around "5" on the 0 to F scale) and all ones in RGB=001 are lit at two-third brightness (about "A" on the 0 to F scale).

| | | | | | | ------------ | | ------------------- | | | 0000 Black | | 1000 Bright Black | | | 0001 Blue | | 1001 Bright Blue | | | 0010 Green | | 1010 Bright Green | | | 0011 Cyan | | 1011 Bright Cyan | | | 0100 Red | | 1100 Bright Red | | | 0101 Magenta | | 1101 Bright Magenta | | | 0110 Yellow | | 1110 Bright Yellow | | | 0111 White | | 1111 Bright White |

And with those colors, we are finally done! We have a full spectrum of colors from iRGB=0000 (black) to iRGB=1111 (bright white) and every color in between. Like a rainbow of colors, this is beautiful.

Except, no. Wait. Something's wrong here. We can't actually replicate all of the colors of the rainbow yet. The handy mnemonic we learned in grade school was ROYGBIV, to help us remember that a rainbow has colors from red, orange, yellow, green, blue, indigo, and violet. Our modified iRGB color scheme includes red, yellow, green, and blue—and we can "fake" it for indigo and "violet." But we're missing orange. Oh no!

![rainbow][7]

A beautiful rainbow - which unfortunately contains orange 
([Paweł Fijałkowski][8], public domain)

To fix this, the smart IBM engineers made one final fix for RGB=110. The high-intensity color (iRGB=1110) lit up the red and green phosphor dots at full brightness to make yellow. But at the low-intensity color (iRGB=0110), they lit the red at two-thirds brightness and the green at one-third brightness. This turned iRGB=0110 into an orange color—although it was later dubbed "brown" because IBM had to mess up the standard names somewhere.

| | | | | | | ------------ | | ------------------- | | | 0000 Black | | 1000 Bright Black | | | 0001 Blue | | 1001 Bright Blue | | | 0010 Green | | 1010 Bright Green | | | 0011 Cyan | | 1011 Bright Cyan | | | 0100 Red | | 1100 Bright Red | | | 0101 Magenta | | 1101 Bright Magenta | | | 0110 Brown | | 1110 Yellow | | | 0111 White | | 1111 Bright White |

And that's how CGA—and by extension, DOS—got the sixteen colors! And in case you're curious, that's also why there's a "bright black" color, even though it's just a shade of gray.

### Representing colors (bits and bytes)

But you may wonder: why can DOS only display eight background colors if it can display sixteen text colors? For that, we need to take a quick diversion into how computers passed color information to the CGA card.

In brief, the CGA card expected each character's text color and background color to be encoded in a single byte packet. That's eight bits. So where do the eight bits come from?

We just learned how iRGB (four bits) generates the sixteen colors. Text color uses iRGB, or four bits. The background color is limited to the eight low-intensity colors (RGB, or three bits). Together, that makes only seven bits. Where is the missing eighth bit?

The final bit was reserved for perhaps the DOS era's most important user interface element—blinking text. While the blinking text might be annoying today, throughout the early 1980s, blinking text was the friendly way to represent critical information such as error messages.

Adding this "blink" bit to the three background color bits (RGB) and the four text color bits (iRGB) makes eight bits or a byte! Computers like to count in full bytes, making this a convenient way to package color (and blink) information to the computer.

Thus, the full byte to represent color (and blink) was `Bbbbffff`, where `ffff` is the iRGB bit pattern for the text color (from 0 to 15), `bbb` is the RGB bit pattern for the low-intensity background color (from 0 to 7), and `B` is the "blink" bit.

The limit of sixteen text colors and eight background colors continues to this day. Certainly, DOS is stuck with this color palette, but even Linux terminal emulators like GNOME Terminal remain constrained to sixteen text colors and eight background colors. Sure, a Linux terminal might let you change the specific colors used, but you're still limited to sixteen text colors and eight background colors. And for that, you can thank DOS and the original IBM PC. You're welcome!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-sixteen-colors

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://opensource.com/sites/default/files/uploads/16colors.png (DOS text comes in 16 colors and 8 background colors)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/rgb.svg_.png (Mix red, green, and blue light to get different colors)
[5]: https://opensource.com/sites/default/files/uploads/crt.svg_.png (Each red, green, and blue triad is a single pixel)
[6]: https://opensource.com/sites/default/files/uploads/lcd.svg_.png (Each red, green, and blue triad is a single pixel)
[7]: https://opensource.com/sites/default/files/uploads/rainbow.jpg (A beautiful rainbow - which unfortunately contains orange )
[8]: https://www.pexels.com/photo/landscape-photography-of-field-with-wind-mill-with-rainbow-1253748/
