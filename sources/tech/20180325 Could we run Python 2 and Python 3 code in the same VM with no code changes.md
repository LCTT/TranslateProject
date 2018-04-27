Translating by MjSeven


Could we run Python 2 and Python 3 code in the same VM with no code changes?
======

Theoretically, yes. Zed Shaw famously jested that if this is impossible then Python 3 must not be Turing-complete. But in practice, this is unrealistic and I'll share why by giving you a few examples.

### What does it mean to be a dict?

Let’s imagine a Python 6 VM. It can read `module3.py` which was written for Python 3.6 but in this module it can import `module2.py` which was written for Python 2.7 and successfully use it with no issues. This is obviously toy code but let’s say that `module2.py` includes functions like:
```


def update_config_from_dict(config_dict):
 items = config_dict.items()
 while items:
 k, v = items.pop()
 memcache.set(k, v)

def config_to_dict():
 result = {}
 for k, v in memcache.getall():
 result[k] = v
 return result

def update_in_place(config_dict):
 for k, v in config_dict.items():
 new_value = memcache.get(k)
 if new_value is None:
 del config_dict[k]
 elif new_value != v:
 config_dict[k] = v

```

Now, when we want to use those functions from `module3`, we are faced with a problem: the dict type in Python 3.6 is different from the dict type in Python 2.7. In Python 2, dicts were unordered and their `.keys()`, `.values()`, `.items()` methods returned proper lists. That meant calling `.items()` created a copy of the state in the dictionary. In Python 3 those methods return dynamic views on the current state of the dictionary.

This means if `module3` called `module2.update_config_from_dict(some_dictionary)`, it would fail to run because the value returned by `dict.items()` in Python 3 isn’t a list and doesn’t have a `.pop()` method. The reverse is also true. If `module3` called `module2.config_to_dict()`, it would presumably return a Python 2 dictionary. Now calling `.items()` is suddenly returning a list so this code would not work correctly (which works fine with Python 3 dictionaries):
```


def main(cmdline_options):
 d = module2.config_to_dict()
 items = d.items()
 for k, v in items:
 print(f'Config from memcache: {k}={v}')
 for k, v in cmdline_options:
 d[k] = v
 for k, v in items:
 print(f'Config with cmdline overrides: {k}={v}')

```

Finally, using `module2.update_in_place()` would fail because the value of `.items()` in Python 3 now doesn’t allow the dictionary to change during iteration.

There’s more issues with this dictionary situation. Should a Python 2 dictionary respond `True` to `isinstance(d, dict)` on Python 3? If it did, it’d be a lie. If it didn’t, code would break anyway.

### Python should magically know types and translate!

Why can’t our Python 6 VM recognize that in Python 3 code we mean something else when calling `some_dict.keys()` than in Python 2 code? Well, Python doesn’t know what the author of the code thought `some_dict` should be when she was writing that code. There is nothing in the code that signifies whether it’s a dictionary at all. Type annotations weren’t there in Python 2 and, since they’re optional, even in Python 3 most code doesn’t use them yet.

At runtime, when you call `some_dict.keys()`, Python simply looks up an attribute on the object that happens to hide under the `some_dict` name and tries to run `__call__()` on that attribute. There’s some technicalities with method binding, descriptors, slots, etc. but this is the gist of it. We call this behavior “duck typing”.

Because of duck typing, the Python 6 VM would not be able to make compile-time decisions to translate calls and attribute lookups correctly.

### OK, so let’s make this decision at runtime instead

The Python 6 VM could implement this by tagging every attribute lookup with information “call comes from py2” or “call comes from py3” and make the object on the other side dispatch the right attribute. That would slow things down a lot and use more memory, too. It would require us to keep both versions of the given type in memory with a proxy used by user code. We would need to sync the state of those objects behind the user’s back, doubling the work. After all, the memory representation of the new dictionary is different than in Python 2.

If your head spun thinking about the problems with dictionaries, think about all the issues with Unicode strings in Python 3 and the do-it-all byte strings in Python 2.

### Is everything lost? Can’t Python 3 run old code ever?

Everything is not lost. Projects get ported to Python 3 every day. The recommended way to port Python 2 code to work on both versions of Python is to run [Python-Modernize][1] on your code. It will catch code that wouldn’t work on Python 3 and translate it to use the [six][2] library instead so it runs on both Python 2 and Python 3 after. It’s an adaptation of `2to3` which was producing Python 3-only code. `Modernize` is preferred since it provides a more incremental migration route. All this is outlined very well in the [Porting Python 2 Code to Python 3][3] document in the Python documentation.

But wait, didn’t you say a Python 6 VM couldn’t do this automatically? Right. `Modernize` looks at your code and tries to guess what’s going to be safe. It will make some changes that are unnecessary and miss others that are necessary. Famously, it won’t help you with strings. That transformation is not trivial if your code didn’t keep the boundaries between “binary data from outside” and “text data within the process”.

So, migrating big projects cannot be done automatically and involves humans running tests, finding problems and fixing them. Does it work? Yes, I helped [moving a million lines of code to Python 3][4] and the switch caused no incidents. This particular move regained 1/3 of memory on our servers and made the code run 12% faster. That was on Python 3.5. But Python 3.6 got quite a bit faster and depending on your workload you could maybe even achieve [a 4X speedup][5] .

### Dear Zed

Hi, man. I follow your story for over 10 years now. I’ve been watching when you were upset you were getting no credit for Mongrel even though the Rails ecosystem pretty much ran all on it. I’ve been there when you reimagined it and started the Mongrel 2 project. I was following your surprising move to use Fossil for it. I’ve seen you abruptly depart from the Ruby community with your “Rails is a Ghetto” post. I was thrilled when you started working on “Learn Python The Hard Way” and have been recommending it ever since. I met you in 2013 at [DjangoCon Europe][6] and we talked quite a bit about painting, singing and burnout. [This photo of you][7] is one of my first posts on Instagram.

You almost pulled another “Is a Ghetto” move with your [“The Case Against Python 3”][8] post. I think your heart is in the right place but that post caused a lot of confusion, including many people seriously thinking you believe Python 3 is not Turing-complete. I spent quite a few hours convincing people that you said so in jest. But given your very valuable contribution of “Learn Python The Hard Way”, I think it was worth doing that. Especially that you did update your book for Python 3. Thank you for doing that work. If there really are people in our community that called for blacklisting you and your book on the grounds of your post alone, call them out. It’s a lose-lose situation and it’s wrong.

For the record, no core Python dev thinks that the Python 2 -> Python 3 transition was smooth and well planned, [including Guido van Rossum][9]. Seriously, watch that video. Hindsight is 20/20 of course. In this sense we are in fact aggressively agreeing with each other. If we went to do it all over again, it would look differently. But at this point, [on January 1st 2020 Python 2 will reach End Of Life][10]. Most third-party libraries already support Python 3 and even started releasing Python 3-only versions (see [Django][11] or the [Python 3 Statement of the scientific projects][12]).

We are also aggressively agreeing on another thing. Just like you with Mongrel, Python core devs are volunteers who aren’t compensated for their work. Most of us invested a lot of time and effort in this project, and so [we are naturally sensitive][13] to dismissive and aggressive comments against their contribution. Especially if the message is both attacking the current state of affairs and calling for more free labor.

I hoped that by 2018 you’d let your 2016 post go. There were a bunch of good rebuttals. [I especially like eevee’s][14]. It specifically addresses the “run Python 2 alongside Python 3” scenario as not realistic, just like running Ruby 1.8 and Ruby 2.x in the same VM, or like running Lua 5.1 alongside 5.3. You can’t even run C binaries compiled against libc.so.5 with libc.so.6. What I find most surprising though is that you claimed that Python core is “purposefully” creating broken tools like 2to3, created by Guido in whose best interest it is for everybody to migrate as smoothly and quickly as possible. I’m glad that you backed out of that claim in your post later but you have to realize you antagonized people who read the original version. Accusations of deliberate harm better be backed by strong evidence.

But it seems like you still do that. [Just today][15] you said that Python core “ignores” attempts to solve the API problem, specifically `six`. As I wrote above, `six` is covered by the official porting guide in the Python documentation. More importantly, `six` was written by Benjamin Peterson, the release manager of Python 2.7. A lot of people learned to program thanks to you and you have a large following online. People will read a tweet like this and they will believe it at face value. This is harmful.

I have a suggestion. Let’s put this “Python 3 was poorly managed” dispute behind us. Python 2 is dying, we are slow to kill it and the process was ugly and bloody but it’s a one way street. Arguing about it is not actionable anymore. Instead, let’s focus on what we can do now to make Python 3.8 better than any other Python release. Maybe you prefer the role of an outsider looking in, but you would be much more impactful as a member of this community. Saying “we” instead of “they”.

--------------------------------------------------------------------------------

via: http://lukasz.langa.pl/13/could-we-run-python-2-and-python-3-code-same-vm/

作者：[Łukasz Langa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://lukasz.langa.pl
[1]:https://python-modernize.readthedocs.io/
[2]:http://pypi.python.org/pypi/six
[3]:https://docs.python.org/3/howto/pyporting.html
[4]:https://www.youtube.com/watch?v=66XoCk79kjM
[5]:https://twitter.com/llanga/status/963834977745022976
[6]:https://www.instagram.com/p/ZVC9CwH7G1/
[7]:https://www.instagram.com/p/ZXtdtUn7Gk/
[8]:https://learnpythonthehardway.org/book/nopython3.html
[9]:https://www.youtube.com/watch?v=Oiw23yfqQy8
[10]:https://mail.python.org/pipermail/python-dev/2018-March/152348.html
[11]:https://pypi.python.org/pypi/Django/2.0.3
[12]:http://python3statement.org/
[13]:https://www.youtube.com/watch?v=-Nk-8fSJM6I
[14]:https://eev.ee/blog/2016/11/23/a-rebuttal-for-python-3/
[15]:https://twitter.com/zedshaw/status/977909970795745281
