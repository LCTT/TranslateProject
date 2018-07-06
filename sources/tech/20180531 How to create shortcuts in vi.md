How to create shortcuts in vi
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documentation-type-keys-yearbook.png?itok=Q-ELM2rn)

Learning the [vi text editor][1] takes some effort, but experienced vi users know that after a while, using basic commands becomes second nature. It's a form of what is known as muscle memory, which in this case might well be called finger memory.

After you get a grasp of the main approach and basic commands, you can make editing with vi even more powerful and streamlined by using its customization options to create shortcuts. I hope that the techniques described below will facilitate your writing, programming, and data manipulation.

Before proceeding, I'd like to thank Chris Hermansen (who recruited me to write this article) for checking my draft with [Vim][2], as I use another version of vi. I'm also grateful for Chris's helpful suggestions, which I incorporated here.

First, let's review some conventions. I'll use <RET> to designate pressing the RETURN or ENTER key, and <SP> for the space bar. CTRL-x indicates simultaneously pressing the Control key and the x key (whatever x happens to be).

Set up your own command abbreviations with the `map` command. My first example involves the `write` command, used to save the current state of the file you're working on:
```
:w<RET>

```

This is only three keystrokes, but since I do it so frequently, I'd rather use only one. The key I've chosen for this purpose is the comma, which is not part of the standard vi command set. The command to set this up is:
```
:map , :wCTRL-v<RET>

```

The CTRL-v is essential since without it the <RET> would signal the end of the map, and we want to include the <RET> as part of the mapped comma. In general, CTRL-v is used to enter the keystroke (or control character) that follows rather than being interpreted literally.

In the above map, the part on the right will display on the screen as `:w^M`. The caret (`^`) indicates a control character, in this case CTRL-m, which is the system's form of <RET>.

So far so good—sort of. If I write my current file about a dozen times while creating and/or editing it, this map could result in a savings of 2 x 12 keystrokes. But that doesn't account for the keystrokes needed to set up the map, which in the above example is 11 (counting CTRL-v and the shifted character `:` as one stroke each). Even with a net savings, it would be a bother to set up the map each time you start a vi session.

Fortunately, there's a way to put maps and other abbreviations in a startup file that vi reads each time it is invoked: the `.exrc` file, or in Vim, the `.vimrc` file. Simply create this file in your home directory with a list of maps, one per line—without the colon—and the abbreviation is defined for all subsequent vi sessions until you delete or change it.

Before going on to a variation of the `map` command and another type of abbreviation method, here are a few more examples of maps that I've found useful for streamlining my text editing:
```
                                        Displays as



:map X :xCTRL-v<RET>                    :x^M



or



:map X ,:qCTRL-v<RET>                   ,:q^M

```

The above equivalent maps write and quit (exit) the file. The `:x` is the standard vi command for this, and the second version illustrates that a previously defined map may be used in a subsequent map.
```
:map v :e<SP>                   :e

```

The above starts the command to move to another file while remaining within vi; when using this, just follow the "v" with a filename, followed by <RET>.
```
:map CTRL-vCTRL-e :e<SP>#CTRL-v<RET>    :e #^M

```

The `#` here is the standard vi symbol for "the alternate file," which means the filename last used, so this shortcut is handy for switching back and forth between two files. Here's an example of how I use this:
```
map CTRL-vCTRL-r :!spell %>err &CTRL-v<RET>     :!spell %>err&^M

```

(Note: The first CTRL-v in both examples above is not needed in some versions of vi.) The `:!` is a way to run an external (non-vi) command. In this case (`spell`), `%` is the vi symbol denoting the current file, the `>` redirects the output of the spell-check to a file called `err`, and the `&` says to run this in the background so I can continue editing while `spell` completes its task. I can then type `verr<RET>` (using my previous shortcut, `v`, followed by `err`) to go the file of potential errors flagged by the `spell` command, then back to the file I'm working on with CTRL-e. After running the spell-check the first time, I can use CTRL-r repeatedly and return to the `err` file with just CTRL-e.

A variation of the `map` command may be used to abbreviate text strings while inputting. For example,
```
:map! CTRL-o \fI

:map! CTRL-k \fP

```

This will allow you to use CTRL-o as a shortcut for entering the `groff` command to italicize the word that follows, and this will allow you to use CTRL-k for the `groff` command reverts to the previous font.

Here are two other examples of this technique:
```
:map! rh rhinoceros

:map! hi hippopotamus

```

The above may instead be accomplished using the `ab` command, as follows (if you're trying these out in order, first use `unmap! rh` and `umap! hi`):
```
:ab rh rhinoceros

:ab hi hippopotamus

```

In the `map!` method above, the abbreviation immediately expands to the defined word when typed (in Vim), whereas with the `ab` method, the expansion occurs when the abbreviation is followed by a space or punctuation mark (in both Vim and my version of vi, where the expansion also works like this for the `map!` method).

To reverse any `map`, `map!`, or `ab` within a vi session, use `:unmap`, `:unmap!`, or `:unab`.

In my version of vi, undefined letters that are good candidates for mapping include g, K, q, v, V, and Z; undefined control characters are CTRL-a, CTRL-c, CTRL-k, CTRL-n, CTRL-o, CTRL-p, and CTRL-x; some other undefined characters are `#` and `*`. You can also redefine characters that have meaning in vi but that you consider obscure and of little use; for example, the X that I chose for two examples in this article is a built-in vi command to delete the character to the immediate left of the current character (easily accomplished by the two-key command `hx`).

Finally, the commands
```
:map<RET>

:map!<RET>

:ab

```

will show all the currently defined mappings and abbreviations.

I hope that all of these tips will help you customize vi and make it easier and more efficient to use.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/shortcuts-vi-text-editor

作者：[Dan Sonnenschein][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dannyman
[1]:http://ex-vi.sourceforge.net/
[2]:https://www.vim.org/
