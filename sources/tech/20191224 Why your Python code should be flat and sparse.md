[#]: collector: (lujun9972)
[#]: translator: (caiichenr)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why your Python code should be flat and sparse)
[#]: via: (https://opensource.com/article/19/12/zen-python-flat-sparse)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Why your Python code should be flat and sparse
======
This is part of a special series about the Zen of Python focusing on the
fifth and sixth principles: flatness and sparseness.
![Digital creative of a browser on the internet][1]

The [Zen of Python][2] is called that for a reason. It was never supposed to provide easy-to-follow guidelines for programming. The rules are specified tersely and are designed to engage the reader in deep thought.

In order to properly appreciate the Zen of Python, you must read it and then meditate upon the meanings. If the Zen was designed to be a set of clear rules, it would be a fault that it has rules that contradict each other. However, as a tool to help you meditate on the best solution, contradictions are powerful.

### Flat is better than nested.

Nowhere is the pressure to be "flat" more obvious than in Python's strong insistence on indentation. Other languages will often introduce an implementation that "cheats" on the nested structure by reducing indentation requirements. To appreciate this point, let's take a look at JavaScript.

JavaScript is natively async, which means that programmers write code in JavaScript using a lot of callbacks.


```
a(function(resultsFromA) {
  b(resultsFromA, function(resultsfromB) {
    c(resultsFromC, function(resultsFromC) {
      console.log(resultsFromC)
   }
  }
}
```

Ignoring the code, observe the pattern and the way indentation leads to a right-most point. This distinctive "arrow" shape is tough on the eye to quickly walk through the code, so it's seen as undesirable and even nicknamed "callback hell." However, in JavaScript, it is possible to "cheat" and not have indentation reflect nesting.


```
a(function(resultsFromA) {
b(resultsFromA,
  function(resultsfromB) {
c(resultsFromC,
  function(resultsFromC) {
    console.log(resultsFromC)
}}}
```

Python affords no such options to cheat: every nesting level in the program must be reflected in the indentation level. So deep nesting in Python _looks_ deeply nested. That makes "callback hell" was a worse problem in Python than in JavaScript: nesting callbacks mean indenting with no options to "cheat" with braces.

This challenge, in combination with the Zen principle, has led to an elegant solution by a library I worked on. In the [Twisted][3] framework, we came up with the _deferred_ abstraction, which would later inspire the popular JavaScript _promise_ abstraction. In this way, Python's unwavering commitment to clear code forces Python developers to discover new, powerful abstractions.


```
future_value = future_result()
future_value.addCallback(a)
future_value.addCallback(b)
future_value.addCallback(c)
```

(This might look familiar to modern JavaScript programmers: Promises were heavily influenced by Twisted's deferreds.)

### Sparse is better than dense.

The easiest way to make something less dense is to introduce nesting. This habit is why the principle of sparseness follows the previous one: after we have reduced nesting as much as possible, we are often left with _dense_ code or data structures. Density, in this sense, is jamming too much information into a small amount of code, making it difficult to decipher when something goes wrong.

Reducing that denseness requires creative thinking, and there are no simple solutions. The Zen of Python does not offer simple solutions. All it offers are ways to find what can be improved in the code, without always giving guidance for "how."

Take a walk. Take a shower. Smell the flowers. Sit in a lotus position and think hard, until finally, inspiration strikes. When you are finally enlightened, it is time to write the code.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-flat-sparse

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://www.python.org/dev/peps/pep-0020/
[3]: https://twistedmatrix.com/trac/
