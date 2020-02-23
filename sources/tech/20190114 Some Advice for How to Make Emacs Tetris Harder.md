[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Some Advice for How to Make Emacs Tetris Harder)
[#]: via: (https://nickdrozd.github.io/2019/01/14/tetris.html)
[#]: author: (nickdrozd https://nickdrozd.github.io)

Some Advice for How to Make Emacs Tetris Harder
======

Did you know that Emacs comes bundled with an implementation of Tetris? Just hit M-x tetris and there it is:

![img](https://nickdrozd.github.io/assets/2019-01-14-tetris/tetris-normal.png)

This is often mentioned by Emacs advocates in text editor discussions. “Yeah, but can that other editor run Tetris?” I wonder, is that supposed to convince anyone that Emacs is superior? Like, why would anyone care that they could play games in their text editor? “Yeah, but can that other vacuum play mp3s?”

That said, Tetris is always fun. Like everything in Emacs, the source code is open for easy inspection and modifcation, so it’s possible to make it even more fun. And by more fun, I mean harder.

One of the simplest ways to make the game harder is to get rid of the next-block preview. No more sitting that S/Z block in a precarious position knowing that you can fill in the space with the next piece – you have to chance it and hope for the best. Here’s what it looks like with no preview (as you can see, without the preview I made some choices that turned out to have dire consequences):

![img](https://nickdrozd.github.io/assets/2019-01-14-tetris/tetris-no-preview.png)

The preview box is set with a function called tetris-draw-next-shape[1][2]:

```
(defun tetris-draw-next-shape ()
  (dotimes (x 4)
    (dotimes (y 4)
      (gamegrid-set-cell (+ tetris-next-x x)
                         (+ tetris-next-y y)
                         tetris-blank)))
  (dotimes (i 4)
    (let ((tetris-shape tetris-next-shape)
          (tetris-rot 0))
      (gamegrid-set-cell (+ tetris-next-x
                            (aref (tetris-get-shape-cell i) 0))
                         (+ tetris-next-y
                            (aref (tetris-get-shape-cell i) 1))
                         tetris-shape))))
```

First, we’ll introduce a flag to allow configuring next-preview[2][3]:

```
(defvar tetris-preview-next-shape nil
  "When non-nil, show the next block the preview box.")
```

Now the question is, how can we make tetris-draw-next-shape obey this flag? The obvious way would be to redefine it:

```
(defun tetris-draw-next-shape ()
  (when tetris-preview-next-shape
    ;; existing tetris-draw-next-shape logic
    ))
```

This is not an ideal solution. There will be two definitions of the same function floating around, which is confusing, and we’ll have to maintain our modified definition in case the upstream version changes.

A better approach is to use advice. Emacs advice is like a Python decorator, but even more flexible, since advice can be added to a function from anywhere. This means that we can modify the function without disturbing the original source file at all.

There are a lot of different ways to use Emacs advice ([check the manual][4]), but for now we’ll just stick with the advice-add function with the :around flag. The advising function takes the original function as an argument, and it might or might not execute it. In this case, we’ll say that the original should be executed only if the preview flag is non-nil:

```
(defun tetris-maybe-draw-next-shape (tetris-draw-next-shape)
  (when tetris-preview-next-shape
    (funcall tetris-draw-next-shape)))

(advice-add 'tetris-draw-next-shape :around #'tetris-maybe-draw-next-shape)
```

This code will modify the behavior of tetris-draw-next-shape, but it can be stored in your config files, safely away from the actual Tetris code.

Getting rid of the preview box is a simple change. A more drastic change is to make it so that blocks randomly stop in the air:

![img](https://nickdrozd.github.io/assets/2019-01-14-tetris/tetris-air.png)

In that picture, the red I and green T pieces are not falling, they’re set in place. This can make the game almost unplayably hard, but it’s easy to implement.

As before, we’ll first define a flag:

```
(defvar tetris-stop-midair t
  "If non-nil, pieces will sometimes stop in the air.")
```

Now, the way Emacs Tetris works is something like this. The active piece has x- and y-coordinates. On each clock tick, the y-coordinate is incremented (the piece moves down one row), and then a check is made for collisions. If a collision is detected, the piece is backed out (its y-coordinate is decremented) and set in place. In order to make a piece stop in the air, all we have to do is hack the detection function, tetris-test-shape.

It doesn’t matter what this function does internally – what matters is that it’s a function of no arguments that returns a boolean value. We need it to return true whenever it normally would (otherwise we risk weird collisions) but also at other times. I’m sure there are a variety of ways this could be done, but here is what I came up with:

```
(defun tetris-test-shape-random (tetris-test-shape)
  (or (and
       tetris-stop-midair
       ;; Don't stop on the first shape.
       (< 1 tetris-n-shapes )
       ;; Stop every INTERVAL pieces.
       (let ((interval 7))
         (zerop (mod tetris-n-shapes interval)))
       ;; Don't stop too early (it makes the game unplayable).
       (let ((upper-limit 8))
         (< upper-limit tetris-pos-y))
       ;; Don't stop at the same place every time.
       (zerop (mod (random 7) 10)))
      (funcall tetris-test-shape)))

(advice-add 'tetris-test-shape :around #'tetris-test-shape-random)
```

The hardcoded parameters here were chosen to make the game harder but still playable. I was drunk on an airplane when I decided on them though, so they might need some further tweaking.

By the way, according to my tetris-scores file, my top score is

```
01389	Wed Dec  5 15:32:19 2018
```

The scores in that file are listed up to five digits by default, so that doesn’t seem very good.

Exercises for the reader

1.  Using advice, modify Emacs Tetris so that it flashes the messsage “OH SHIT” under the scoreboard every time the block moves down. Make the size of the message proportional to the height of the block stack (when there are no blocks, the message should be small or nonexistent, and when the highest block is close to the ceiling, the message should be large).

2.  The version of tetris-test-shape-random given here has every seventh piece stop midair. A player could potentially figure out the interval and use it to their advantage. Modify it to make the interval random in some reasonable range (say, every five to ten pieces).

3.  For a different take on advising Tetris, try out [autotetris-mode][1].

4.  Come up with an interesting way to mess with the piece-rotation mechanics and then implement it with advice.

Footnotes
============================================================

[1][5] Emacs has just one big global namespace, so function and variable names are typically prefixed with their package name in order to avoid collisions.

[2][6] A lot of people will tell you that you shouldn’t use an existing namespace prefix and that you should reserve a namespace prefix for anything you define yourself, e.g. my/tetris-preview-next-shape. This is ugly and usually pointless, so I don’t do it.

--------------------------------------------------------------------------------

via: https://nickdrozd.github.io/2019/01/14/tetris.html

作者：[nickdrozd][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://nickdrozd.github.io
[b]: https://github.com/lujun9972
[1]: https://nullprogram.com/blog/2014/10/19/
[2]: https://nickdrozd.github.io/2019/01/14/tetris.html#fn.1
[3]: https://nickdrozd.github.io/2019/01/14/tetris.html#fn.2
[4]: https://www.gnu.org/software/emacs/manual/html_node/elisp/Advising-Functions.html
[5]: https://nickdrozd.github.io/2019/01/14/tetris.html#fnr.1
[6]: https://nickdrozd.github.io/2019/01/14/tetris.html#fnr.2
