translating by MZqk

11 awesome vi tips and tricks
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/keyboaord_enter_writing_documentation.jpg?itok=kKrnXc5h)

The [vi editor][1] is one of the most popular text editors on Unix and Unix-like systems, such as Linux. Whether you're new to vi or just looking for a refresher, these 11 tips will enhance how you use it.

### Editing

Editing a long script can be tedious, especially when you need to edit a line so far down that it would take hours to scroll to it. Here's a faster way.

  1. The command `:set number` numbers each line down the left side.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/setnum.png?itok=sFVA97mG)

You can directly reach line number 26 by opening the file and entering this command on the CLI: `vi +26 sample.txt`. To edit line 26 (for example), the command `:26` will take you directly to it.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/number.png?itok=d7FE0LL3)

### Fast navigation

  2. `i` changes your mode from "command" to "insert" and starts inserting text at the current cursor position.
  3. `a` does the same, except it starts just after the current cursor position.
  4. `o` starts the cursor position from the line below the current cursor position.



### Delete

If you notice an error or typo, being able to make a quick fix is important. Good thing vi has it all figured out.

Understanding vi's delete function so you don't accidentally press a key and permanently remove a line, paragraph, or more, is critical.

  5. `x` deletes the character under the cursor.
  6. `dd` deletes the current line. (Yes, the whole line!)



Here's the scary part: `30dd` would delete 30 lines starting with the current line! Proceed with caution when using this command.

### Search

You can search for keywords from the "command" mode rather than manually navigating and looking for a specific word in a plethora of text.

  7. `:/<keyword>` searches for the word mentioned in the `< >` space and takes your cursor to the first match.
  8. To navigate to the next instance of that word, type `n`, and keep pressing it until you get to the match you're looking for.



For example, in the image below I searched for `ssh`, and vi highlighted the beginning of the first result.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/ssh-search.png?itok=tJ-7FujH)

After I pressed `n`, vi highlighted the next instance.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/n-search.png?itok=wU-u3LiI)

### Save and exit

Developers (and others) will probably find this next command useful.

  9. `:x` saves your work and exits vi.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/x.png?itok=kfoHx84m)

  10. If you think every nanosecond is worth saving, here's a faster way to shift to terminal mode in vi. Instead of pressing `Shift+:` on the keyboard, you can press `Shift+q` (or Q, in caps) to access [Ex mode][2], but this doesn't really make any difference if you just want to save and quit by typing `x` (as shown above).



### Substitution

Here is a neat trick if you want to substitute every occurrence of one word with another. For example, if you want to substitute "desktop" with "laptop" in a large file, it would be monotonous and waste time to search for each occurrence of "desktop," delete it, and type "laptop."

  11. The command `:%s/desktop/laptop/g` would replace each occurrence of "desktop" with "laptop" throughout the file; it works just like the Linux `sed` command.



In this example, I replaced "root" with "user":

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/subs-command.png?itok=M8MN72sp)

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/subs-result.png?itok=34zzVdUt)

These tricks should help anyone get started using vi. Are there other neat tips I missed? Share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/top-11-vi-tips-and-tricks

作者：[Archit Modi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/architmodi
[1]:http://ex-vi.sourceforge.net/
[2]:https://en.wikibooks.org/wiki/Learning_the_vi_Editor/Vim/Modes#Ex-mode
