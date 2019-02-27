[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Emoji-Log: A new way to write Git commit messages)
[#]: via: (https://opensource.com/article/19/2/emoji-log-git-commit-messages)
[#]: author: (Ahmad Awais https://opensource.com/users/mrahmadawais)

Emoji-Log: A new way to write Git commit messages
======
Add context to your commits with Emoji-Log.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/emoji_tech_keyboard.jpg?itok=ncBNKZFl)

I'm a full-time open source developer—or, as I like to call it, an 🎩 open sourcerer. I've been working with open source software for over a decade and [built hundreds][1] of open source software applications.

I also am a big fan of the Don't Repeat Yourself (DRY) philosophy and believe writing better Git commit messages—ones that are contextual enough to serve as a changelog for your open source software—is an important component of DRY. One of the many workflows I've written is [Emoji-Log][2], a straightforward, open source Git commit log standard. It improves the developer experience (DX) by using emoji to create better Git commit messages.

I've used Emoji-Log while building the [VSCode Tips & Tricks repo][3], my 🦄 [Shades of Purple VSCode theme repo][4], and even an [automatic changelog][5] that looks beautiful.

### Emoji-Log's philosophy

I like emoji (which is, in fact, the plural of emoji). I like 'em a lot. Programming, code, geeks/nerds, open source… all of that is inherently dull and sometimes boring. Emoji help me add colors and emotions to the mix. There's nothing wrong with wanting to attach feelings to the 2D, flat, text-based world of code.

Instead of memorizing [hundreds of emoji][6], I've learned it's better to keep the categories small and general. Here's the philosophy that guides writing commit messages with Emoji-Log:

  1. **Imperative**
    * Make your Git commit messages imperative.
    * Write commit message like you're giving an order.
      * e.g., Use ✅ **Add** instead of ❌ **Added**
      * e.g., Use ✅ **Create** instead of ❌ **Creating**
  2. **Rules**
    * A small number of categories are easy to memorize.
    * Nothing more, nothing less
      * e.g. **📦 NEW** , **👌 IMPROVE** , **🐛 FIX** , **📖 DOC** , **🚀 RELEASE** , and **✅ TEST**
  3. **Actions**
    * Make Git commits based on actions you take.
    * Use a good editor like [VSCode][7] to commit the right files with commit messages.



### Writing commit messages

Use only the following Git commit messages. The simple and small footprint is the key to Emoji-Logo.

  1. **📦 NEW: IMPERATIVE_MESSAGE**
    * Use when you add something entirely new.
      * e.g., **📦 NEW: Add Git ignore file**
  2. **👌 IMPROVE: IMPERATIVE_MESSAGE**
    * Use when you improve/enhance piece of code like refactoring etc.
      * e.g., **👌 IMPROVE: Remote IP API Function**
  3. **🐛 FIX: IMPERATIVE_MESSAGE**
    * Use when you fix a bug. Need I say more?
      * e.g., **🐛 FIX: Case converter**
  4. **📖 DOC: IMPERATIVE_MESSAGE**
    * Use when you add documentation, like README.md or even inline docs.
      * e.g., **📖 DOC: API Interface Tutorial**
  5. **🚀 RELEASE: IMPERATIVE_MESSAGE**
    * Use when you release a new version. e.g., **🚀 RELEASE: Version 2.0.0**
  6. **✅ TEST: IMPERATIVE_MESSAGE**
    * Use when you release a new version.
      * e.g., **✅ TEST: Mock User Login/Logout**



That's it for now. Nothing more, nothing less.

### Emoji-Log functions

For quick prototyping, I have made the following functions that you can add to your **.bashrc** / **.zshrc** files to use Emoji-Log quickly.

```
#.# Better Git Logs.

### Using EMOJI-LOG (https://github.com/ahmadawais/Emoji-Log).



# Git Commit, Add all and Push — in one step.

function gcap() {
    git add . && git commit -m "$*" && git push
}

# NEW.
function gnew() {
    gcap "📦 NEW: $@"
}

# IMPROVE.
function gimp() {
    gcap "👌 IMPROVE: $@"
}

# FIX.
function gfix() {
    gcap "🐛 FIX: $@"
}

# RELEASE.
function grlz() {
    gcap "🚀 RELEASE: $@"
}

# DOC.
function gdoc() {
    gcap "📖 DOC: $@"
}

# TEST.
function gtst() {
    gcap "✅ TEST: $@"
}
```

To install these functions for the [fish shell][8], run the following commands:

```
function gcap; git add .; and git commit -m "$argv"; and git push; end;
function gnew; gcap "📦 NEW: $argv"; end
function gimp; gcap "👌 IMPROVE: $argv"; end;
function gfix; gcap "🐛 FIX: $argv"; end;
function grlz; gcap "🚀 RELEASE: $argv"; end;
function gdoc; gcap "📖 DOC: $argv"; end;
function gtst; gcap "✅ TEST: $argv"; end;
funcsave gcap
funcsave gnew
funcsave gimp
funcsave gfix
funcsave grlz
funcsave gdoc
funcsave gtst
```

If you prefer, you can paste these aliases directly in your **~/.gitconfig** file:

```
# Git Commit, Add all and Push — in one step.
cap = "!f() { git add .; git commit -m \"$@\"; git push; }; f"

# NEW.
new = "!f() { git cap \"📦 NEW: $@\"; }; f"
# IMPROVE.
imp = "!f() { git cap \"👌 IMPROVE: $@\"; }; f"
# FIX.
fix = "!f() { git cap \"🐛 FIX: $@\"; }; f"
# RELEASE.
rlz = "!f() { git cap \"🚀 RELEASE: $@\"; }; f"
# DOC.
doc = "!f() { git cap \"📖 DOC: $@\"; }; f"
# TEST.
tst = "!f() { git cap \"✅ TEST: $@\"; }; f"
```


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/emoji-log-git-commit-messages

作者：[Ahmad Awais][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mrahmadawais
[b]: https://github.com/lujun9972
[1]: https://github.com/ahmadawais
[2]: https://github.com/ahmadawais/Emoji-Log/
[3]: https://github.com/ahmadawais/VSCode-Tips-Tricks
[4]: https://github.com/ahmadawais/shades-of-purple-vscode/commits/master
[5]: https://github.com/ahmadawais/shades-of-purple-vscode/blob/master/CHANGELOG.md
[6]: https://gitmoji.carloscuesta.me/
[7]: https://VSCode.pro
[8]: https://en.wikipedia.org/wiki/Friendly_interactive_shell
