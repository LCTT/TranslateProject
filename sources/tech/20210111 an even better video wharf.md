[#]: subject: "an even better video wharf"
[#]: via: "https://jao.io/blog/2021-01-11-an-even-better-video-wharf.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

an even better video wharf
======

A couple of days ago, [i was writing][1] about [embark][2] and my first experiment defining a new embarking to play remote video streams. Omar Antolín Camarena, embark's author, has been kind enough to not only read it, but comment on a couple of significant improvements that i think well deserve this follow-up.

First, you'll remember that we were defining a function to detect a video URL:

```

    (defun jao-video-finder ()
      "Check whether we're looking at a video URL.
    Return (video-url . <URL>) if so."
      (when-let ((url (thing-at-point-url-at-point)))
        (when (string-match-p jao-video-url-rx url)
          (cons 'video-url url))))

```

Once we've got a non-null `url` value, even if it's not a video URL, it's still certainly a URL, and embark has a `url` category, so we could save a new parsing by the default URL finder by saying:

```

    (when-let ((url (thing-at-point-url-at-point)))
      (cons (if (string-match-p jao-video-url-rx url) 'video-url 'url) url))

```

This has the potential drawback that we're overriding embark's finder, `embark-target-url-at-point`, and we might prefer to keep the latter.

Turns out that we can do that thanks to embark's _target transformers_. One can add to `embark-transformers-alist` an arbitrary function to be applied to a target of any given category, and embark will apply its actions to the transformed value. Omar calls this process, very aptly, a refinement of the target; here's how we would do it:

```

    (defun jao-refine-url-type (url)
      "Refine type of URL in case it is a video."
      (cons (if (string-match-p jao-video-url-rx url) 'video-url 'url) url))

    (add-to-list 'embark-transformer-alist '(url . jao-refine-url-type))

```

With this strategy, we don't need `jao-video-finder` at all, and it also makes lots of sense, conceptually, to have our `video-url` defined as a refinement rather than a new target[1][3]. Omar's second suggestion is also in line with this concept: surely we want all actions available for `url` also for our `video-url`, don't we? Well, that's exactly the reason why the `embark-define-keymap` macro we used to define our actions can inherit all the actions already defined in another keymap, using the `:parent` keyword[2][4]:

```

    (embark-define-keymap jao-video-url-map
      "Actions on URLs pointing to remote video streams."
      :parent embark-url-map
      ("p" jao-play-video-url))

    (add-to-list 'embark-keymap-alist '(video-url . jao-video-url-map))

```

It is worth noting that this ability to inherit a keymap is not really an embark add-on: vanilla Emacs keymaps already have it, via the standard function `set-keymap-parent`. You could actually define `jao-video-url-map` without using `embark-define-keymap` at all, and it'd work exactly the same.

So, our code has become shorter and more featureful: thanks, Omar!

### Footnotes:

[1][5]

There's a scenario where keeping jao-video-finder could make sense, namely, if we want to alter the URL detection function. For instance, i use emacs-w3m, and there often a URL is stored as a text property (the actual text being the link text). To retrieve the URL at point there, one needs to call `w3m-anchor`, and `embark-target-url-at-point` will miss it. For that scenario, i ended up writing (and using) `jao-video-finder` defined with:

```

    (when-let ((url (or (w3m-anchor) (thing-at-point-url-at-point))))
      (cons (if (string-match-p jao-video-url-rx url) 'video-url 'url) url))

```

Another way of accomplishing the same thing (with another tip of the hat to Omar) would be to add a specific finder for w3m anchors (and keep using the transformer for video-url):

```

    (defun jao-w3m-url-finder ()
      (when-let ((url (w3m-anchor)))
        (cons 'url url)))

    (add-to-list 'embark-target-finders #'jao-w3m-url-finder)

```

This way is more modular and, depending on your taste, more elegant. These functions are small and there's not a big difference between the two approaches, but if one keeps adding finders, things can easily get uglier with the former approach.

[2][6]

In my original example, i was adding also `browse-url` and `browse-url-firefox` to the video map. The former is no longer necessary, because it's already present in `embark-url-map`. If we wanted to make `browse-url-firefox` available to _all_ URLs, we could add it to `embark-url-map` (remember, embark's keymaps are just Emacs keymaps). That's yet another simple way of extending embark.

[Tags][7]: [emacs][8]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2021-01-11-an-even-better-video-wharf.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://jao.io/blog/2021-01-09-embarking-videos.html
[2]: https://github.com/oantolin/embark
[3]: tmp.VUqMT3Yft2#fn.1
[4]: tmp.VUqMT3Yft2#fn.2
[5]: tmp.VUqMT3Yft2#fnr.1
[6]: tmp.VUqMT3Yft2#fnr.2
[7]: https://jao.io/blog/tags.html
[8]: https://jao.io/blog/tag-emacs.html
