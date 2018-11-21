in which the cost of structured data is reduced
======
Last year I got the wonderful opportunity to attend [RacketCon][1] as it was hosted only 30 minutes away from my home. The two-day conference had a number of great talks on the first day, but what really impressed me was the fact that the entire second day was spent focusing on contribution. The day started out with a few 15- to 20-minute talks about how to contribute to a specific codebase (including that of Racket itself), and after that people just split off into groups focused around specific codebases. Each table had maintainers helping guide other folks towards how to work with the codebase and construct effective patch submissions.

![lensmen chronicles][2]

I came away from the conference with a great sense of appreciation for how friendly and welcoming the Racket community is, and how great Racket is as a swiss-army-knife type tool for quick tasks. (Not that it's unsuitable for large projects, but I don't have the opportunity to start any new large projects very frequently.)

The other day I wanted to generate colored maps of the world by categorizing countries interactively, and Racket seemed like it would fit the bill nicely. The job is simple: show an image of the world with one country selected; when a key is pressed, categorize that country, then show the map again with all categorized countries colored, and continue with the next country selected.

### GUIs and XML

I have yet to see a language/framework more accessible and straightforward out of the box for drawing1. Here's the entry point which sets up state and then constructs a canvas that handles key input and display:
```
(define (main path)
  (let ([frame (new frame% [label "World color"])]
               [categorizations (box '())]
               [doc (call-with-input-file path read-xml/document)])
    (new (class canvas%
                (define/override (on-char event)
                  (handle-key this categorizations (send event get-key-code)))
                (super-new))
         [parent frame]
         [paint-callback (draw doc categorizations)])
    (send frame show #t)))

```

While the class system is not one of my favorite things about Racket (most newer code seems to avoid it in favor of [generic interfaces][3] in the rare case that polymorphism is truly called for), the fact that classes can be constructed in a light-weight, anonymous way makes it much less onerous than it could be. This code sets up all mutable state in a [`box`][4] which you use in the way you'd use a `ref` in ML or Clojure: a mutable wrapper around an immutable data structure.

The world map I'm using is [an SVG of the Robinson projection][5] from Wikipedia. If you look closely there's a call to bind `doc` that calls [`call-with-input-file`][6] with [`read-xml/document`][7] which loads up the whole map file's SVG; just about as easily as you could ask for.

The data you get back from `read-xml/document` is in fact a [document][8] struct, which contains an `element` struct containing `attribute` structs and lists of more `element` structs. All very sensible, but maybe not what you would expect in other dynamic languages like Clojure or Lua where free-form maps reign supreme. Racket really wants structure to be known up-front when possible, which is one of the things that help it produce helpful error messages when things go wrong.

Here's how we handle keyboard input; we're displaying a map with one country highlighted, and `key` here tells us what the user pressed to categorize the highlighted country. If that key is in the `categories` hash then we put it into `categorizations`.
```
(define categories #hash((select . "eeeeff")
                         (#\1 . "993322")
                         (#\2 . "229911")
                         (#\3 . "ABCD31")
                         (#\4 . "91FF55")
                         (#\5 . "2439DF")))

(define (handle-key canvas categorizations key)
  (cond [(equal? #\backspace key) (swap! categorizations cdr)]
        [(member key (dict-keys categories)) (swap! categorizations (curry cons key))]
        [(equal? #\space key) (display (unbox categorizations))])
  (send canvas refresh))

```

### Nested updates: the bad parts

Finally once we have a list of categorizations, we need to apply it to the map document and display. We apply a [`fold`][9] reduction over the XML document struct and the list of country categorizations (plus `'select` for the country that's selected to be categorized next) to get back a "modified" document struct where the proper elements have the style attributes applied for the given categorization, then we turn it into an image and hand it to [`draw-pict`][10]:
```

(define (update original-doc categorizations)
  (for/fold ([doc original-doc])
            ([category (cons 'select (unbox categorizations))]
                       [n (in-range (length (unbox categorizations)) 0 -1)])
            (set-style doc n (style-for category))))

(define ((draw doc categorizations) _ context)
  (let* ([newdoc (update doc categorizations)]
                 [xml (call-with-output-string (curry write-xml newdoc))])
    (draw-pict (call-with-input-string xml svg-port->pict) context 0 0)))

```

The problem is in that pesky `set-style` function. All it has to do is reach deep down into the `document` struct to find the `n`th `path` element (the one associated with a given country), and change its `'style` attribute. It ought to be a simple task. Unfortunately this function ends up being anything but simple:
```

(define (set-style doc n new-style)
  (let* ([root (document-element doc)]
               [g (list-ref (element-content root) 8)]
               [paths (element-content g)]
               [path (first (drop (filter element? paths) n))]
               [path-num (list-index (curry eq? path) paths)]
               [style-index (list-index (lambda (x) (eq? 'style (attribute-name x)))
                                        (element-attributes path))]
                                        [attr (list-ref (element-attributes path) style-index)]
                                        [new-attr (make-attribute (source-start attr)
                                                                  (source-stop attr)
                                                                  (attribute-name attr)
                                                                  new-style)]
                                                                  [new-path (make-element (source-start path)
                                                                                          (source-stop path)
                                                                                          (element-name path)
                                                                                          (list-set (element-attributes path)
                                                                                                    style-index new-attr)
                                                                                          (element-content path))]
                                                                                          [new-g (make-element (source-start g)
                                                                                                               (source-stop g)
                                                                                                               (element-name g)
                                                                                                               (element-attributes g)
                                                                                                               (list-set paths path-num new-path))]
                                                                                                               [root-contents (list-set (element-content root) 8 new-g)])
    (make-document (document-prolog doc)
                   (make-element (source-start root)
                                 (source-stop root)
                                 (element-name root)
                                 (element-attributes root)
                                 root-contents)
                   (document-misc doc))))

```

The reason for this is that while structs are immutable, they don't support functional updates. Whenever you're working with immutable data structures, you want to be able to say "give me a new version of this data, but with field `x` replaced by the value of `(f (lookup x))`". Racket can [do this with dictionaries][11] but not with structs2. If you want a modified version you have to create a fresh one3.

### Lenses to the rescue?

![first lensman][12]

When I brought this up in the `#racket` channel on Freenode, I was helpfully pointed to the 3rd-party [Lens][13] library. Lenses are a general-purpose way of composing arbitrarily nested lookups and updates. Unfortunately at this time there's [a flaw][14] preventing them from working with `xml` structs, so it seemed I was out of luck.

But then I was pointed to [X-expressions][15] as an alternative to structs. The [`xml->xexpr`][16] function turns the structs into a deeply-nested list tree with symbols and strings in it. The tag is the first item in the list, followed by an associative list of attributes, then the element's children. While this gives you fewer up-front guarantees about the structure of the data, it does work around the lens issue.

For this to work, we need to compose a new lens based on the "path" we want to use to drill down into the `n`th country and its `style` attribute. The [`lens-compose`][17] function lets us do that. Note that the order here might be backwards from what you'd expect; it works deepest-first (the way [`compose`][18] works for functions). Also note that defining one lens gives us the ability to both get nested values (with [`lens-view`][19]) and update them.
```
(define (style-lens n)
  (lens-compose (dict-ref-lens 'style)
                second-lens
                (list-ref-lens (add1 (* n 2)))
                (list-ref-lens 10)))
```

Our `<path>` XML elements are under the 10th item of the root xexpr, (hence the [`list-ref-lens`][20] with 10) and they are interspersed with whitespace, so we have to double `n` to find the `<path>` we want. The [`second-lens`][21] call gets us to that element's attribute alist, and [`dict-ref-lens`][22] lets us zoom in on the `'style` key out of that alist.

Once we have our lens, it's just a matter of replacing `set-style` with a call to [`lens-set`][23] in our `update` function we had above, and then we're off:
```
(define (update doc categorizations)
  (for/fold ([d doc])
            ([category (cons 'select (unbox categorizations))]
             [n (in-range (length (unbox categorizations)) 0 -1)])
    (lens-set (style-lens n) d (list (style-for category)))))
```

![second stage lensman][24]

Often times the trade-off between freeform maps/hashes vs structured data feels like one of convenience vs long-term maintainability. While it's unfortunate that they can't be used with the `xml` structs4, lenses provide a way to get the best of both worlds, at least in some situations.

The final version of the code clocks in at 51 lines and is is available [on GitLab][25].

๛

--------------------------------------------------------------------------------

via: https://technomancy.us/185

作者：[Phil Hagelberg][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://technomancy.us/
[1]:https://con.racket-lang.org/
[2]:https://technomancy.us/i/chronicles-of-lensmen.jpg
[3]:https://docs.racket-lang.org/reference/struct-generics.html
[4]:https://docs.racket-lang.org/reference/boxes.html?q=box#%28def._%28%28quote._~23~25kernel%29._box%29%29
[5]:https://commons.wikimedia.org/wiki/File:BlankMap-World_gray.svg
[6]:https://docs.racket-lang.org/reference/port-lib.html#(def._((lib._racket%2Fport..rkt)._call-with-input-string))
[7]:https://docs.racket-lang.org/xml/index.html?q=read-xml#%28def._%28%28lib._xml%2Fmain..rkt%29._read-xml%2Fdocument%29%29
[8]:https://docs.racket-lang.org/xml/#%28def._%28%28lib._xml%2Fmain..rkt%29._document%29%29
[9]:https://docs.racket-lang.org/reference/for.html?q=for%2Ffold#%28form._%28%28lib._racket%2Fprivate%2Fbase..rkt%29._for%2Ffold%29%29
[10]:https://docs.racket-lang.org/pict/Rendering.html?q=draw-pict#%28def._%28%28lib._pict%2Fmain..rkt%29._draw-pict%29%29
[11]:https://docs.racket-lang.org/reference/dicts.html?q=dict-update#%28def._%28%28lib._racket%2Fdict..rkt%29._dict-update%29%29
[12]:https://technomancy.us/i/first-lensman.jpg
[13]:https://docs.racket-lang.org/lens/lens-guide.html
[14]:https://github.com/jackfirth/lens/issues/290
[15]:https://docs.racket-lang.org/pollen/second-tutorial.html?q=xexpr#%28part._.X-expressions%29
[16]:https://docs.racket-lang.org/xml/index.html?q=xexpr#%28def._%28%28lib._xml%2Fmain..rkt%29._xml-~3exexpr%29%29
[17]:https://docs.racket-lang.org/lens/lens-reference.html#%28def._%28%28lib._lens%2Fcommon..rkt%29._lens-compose%29%29
[18]:https://docs.racket-lang.org/reference/procedures.html#%28def._%28%28lib._racket%2Fprivate%2Flist..rkt%29._compose%29%29
[19]:https://docs.racket-lang.org/lens/lens-reference.html?q=lens-view#%28def._%28%28lib._lens%2Fcommon..rkt%29._lens-view%29%29
[20]:https://docs.racket-lang.org/lens/lens-reference.html?q=lens-view#%28def._%28%28lib._lens%2Fdata%2Flist..rkt%29._list-ref-lens%29%29
[21]:https://docs.racket-lang.org/lens/lens-reference.html?q=lens-view#%28def._%28%28lib._lens%2Fdata%2Flist..rkt%29._second-lens%29%29
[22]:https://docs.racket-lang.org/lens/lens-reference.html?q=lens-view#%28def._%28%28lib._lens%2Fdata%2Fdict..rkt%29._dict-ref-lens%29%29
[23]:https://docs.racket-lang.org/lens/lens-reference.html?q=lens-view#%28def._%28%28lib._lens%2Fcommon..rkt%29._lens-set%29%29
[24]:https://technomancy.us/i/second-stage-lensman.jpg
[25]:https://gitlab.com/technomancy/world-color/blob/master/world-color.rkt
