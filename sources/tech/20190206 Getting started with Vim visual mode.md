[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Vim visual mode)
[#]: via: (https://opensource.com/article/19/2/getting-started-vim-visual-mode)
[#]: author: (Susan Lauber https://opensource.com/users/susanlauber)

Getting started with Vim visual mode
======
Visual mode makes it easier to highlight and manipulate text in Vim.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_code_keyboard_orange_hands.png?itok=G6tJ_64Y)

Ansible playbook files are text files in a YAML format. People who work regularly with them have their favorite editors and plugin extensions to make the formatting easier.

When I teach Ansible with the default editor available in most Linux distributions, I use Vim's visual mode a lot. It allows me to highlight my actions on the screen—what I am about to edit and the text manipulation task I'm doing—to make it easier for my students to learn.

### Vim's visual mode

When editing text with Vim, visual mode can be extremely useful for identifying chunks of text to be manipulated.

Vim's visual mode has three versions: character, line, and block. The keystrokes to enter each mode are:

  * Character mode: **v** (lower-case)
  * Line mode: **V** (upper-case)
  * Block mode: **Ctrl+v**



Here are some ways to use each mode to simplify your work.

### Character mode

Character mode can highlight a sentence in a paragraph or a phrase in a sentence. Then the visually identified text can be deleted, copied, changed, or modified with any other Vim editing command.

#### Move a sentence

To move a sentence from one place to another, start by opening the file and moving the cursor to the first character in the sentence you want to move.

![](https://opensource.com/sites/default/files/uploads/vim-visual-char1.png)

  * Press the **v** key to enter visual character mode. The word **VISUAL** will appear at the bottom of the screen.
  * Use the Arrow keys to highlight the desired text. You can use other navigation commands, such as **w** to highlight to the beginning of the next word or **$** to include the rest of the line.
  * Once the text is highlighted, press the **d** key to delete the text.
  * If you deleted too much or not enough, press **u** to undo and start again.
  * Move your cursor to the new location and press **p** to paste the text.



#### Change a phrase

You can also highlight a chunk of text that you want to replace.

![](https://opensource.com/sites/default/files/uploads/vim-visual-char2.png)

  * Place the cursor at the first character you want to change.
  * Press **v** to enter visual character mode.
  * Use navigation commands, such as the Arrow keys, to highlight the phrase.
  * Press **c** to change the highlighted text.
  * The highlighted text will disappear, and you will be in Insert mode where you can add new text.
  * After you finish typing the new text, press **Esc** to return to command mode and save your work.

![](https://opensource.com/sites/default/files/uploads/vim-visual-char3.png)

### Line mode

When working with Ansible playbooks, the order of tasks can matter. Use visual line mode to move a task to a different location in the playbook.

#### Manipulate multiple lines of text

![](https://opensource.com/sites/default/files/uploads/vim-visual-line1.png)

  * Place your cursor anywhere on the first or last line of the text you want to manipulate.
  * Press **Shift+V** to enter line mode. The words **VISUAL LINE** will appear at the bottom of the screen.
  * Use navigation commands, such as the Arrow keys, to highlight multiple lines of text.
  * Once the desired text is highlighted, use commands to manipulate it. Press **d** to delete, then move the cursor to the new location, and press **p** to paste the text.
  * **y** (yank) can be used instead of **d** (delete) if you want to copy the task.



#### Indent a set of lines

When working with Ansible playbooks or YAML files, indentation matters. A highlighted block can be shifted right or left with the **>** and **<** keys.

![]9https://opensource.com/sites/default/files/uploads/vim-visual-line2.png

  * Press **>** to increase the indentation of all the lines.
  * Press **<** to decrease the indentation of all the lines.



Try other Vim commands to apply them to the highlighted text.

### Block mode

The visual block mode is useful for manipulation of specific tabular data files, but it can also be extremely helpful as a tool to verify indentation of an Ansible playbook.

Tasks are a list of items and in YAML each list item starts with a dash followed by a space. The dashes must line up in the same column to be at the same indentation level. This can be difficult to see with just the human eye. Indentation of other lines within the task is also important.

#### Verify tasks lists are indented the same

![](https://opensource.com/sites/default/files/uploads/vim-visual-block1.png)

  * Place your cursor on the first character of the list item.
  * Press **Ctrl+v** to enter visual block mode. The words **VISUAL BLOCK** will appear at the bottom of the screen.
  * Use the Arrow keys to highlight the single character column. You can verify that each task is indented the same amount.
  * Use the Arrow keys to expand the block right or left to check whether the other indentation is correct.

![](https://opensource.com/sites/default/files/uploads/vim-visual-block2.png)

Even though I am comfortable with other Vim editing shortcuts, I still like to use visual mode to sort out what text I want to manipulate. When I demo other concepts during a presentation, my students see a tool to highlight text and hit delete in this "new to them" text only editor.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/getting-started-vim-visual-mode

作者：[Susan Lauber][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/susanlauber
[b]: https://github.com/lujun9972
