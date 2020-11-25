[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Day 1: a confusing Rails error message)
[#]: via: (https://jvns.ca/blog/2020/11/09/day-1--a-little-rails-/)
[#]: author: (Julia Evans https://jvns.ca/)

Day 1: a confusing Rails error message
======

Today I started an Recurse Center batch! I got to meet a few people, and started on a tiny fun Rails project. I think I won’t talk too much about what the project actually is today, but here are some quick notes on a day with Rails:

### some notes on getting started

The main thing I learned about setting up a Rails project is that

  1. it uses sqlite by default, you have to tell it to use Postgres
  2. there are a ton of things that Rails includes by default that you can disable.



I installed and `rm -rf`’d Rails maybe 7 times before I was satisfied with it and ended up with this incantation:

```
rails new . -d postgresql --skip-sprockets --skip-javascript`
```

Basically because I definitely wanted to use Postgres and not sqlite, and skipping sprockets and javascript seemed to make installing Rails faster, and I figured I could install them later if I decided I wanted them.

### the official Rails guide is really good

I used 2 main resources for creating my starter Rails app:

  * DHH’s original Rails talk from 2005 <https://www.youtube.com/watch?v=Gzj723LkRJY> (which I didn’t watch this time, but I watched the last time I spent a day with Rails, and I found it pretty inspiring and helpful)
  * The official Rails “getting started” guide, which seems pretty short and clear <https://guides.rubyonrails.org/v5.0/getting_started.html>



### a mysterious error message: `undefined method 'user'`

I love bugs, so here’s a weird Rails error I ran into today! I had some code that looked like this:

```
@user = User.new(user_params)
@user.save
```

Pretty simple, right? But when that code ran, I got this baffling error message:

```
undefined method `user' for #<User:0x00007fb6f4012ab8> Did you mean? super
```

I was EXTREMELY confused about what was going on here because I hadn’t _called_ a method called `user`. I’d called `.save`. What???? I stayed confused and frustrated about this for maybe 20 minutes, and then finally I looked at my `User` model and found this code:

```
class User < ApplicationRecord
  has_secure_password

  validates :user, presence: true, uniqueness: true
end
```

`validates :user...` was _supposed_ to be some Rails magic validating that every `User` had a `username`, and that usernames had to be unique. But I’d made a typo, and I’d written `user` and not `username`. I fixed this and then everything worked! hooray!

I still don’t understand how I was supposed to debug this though: the stack trace told me the problem was with the `@user.save` line, and never mentioned that `validates :user` thing at all. I feel like there must be a way to debug this but I don’t know what it is.

The whole point of me playing with Rails is to see how the Rails magic plays out in practice so this was a fun bug to hit early on.

### a simple user management system

I decided I wanted users in my toy app. Some Googling showed me that there’s an extremely popular gem called [devise][1] that handles users. I found the README a little overwhelming and I knew that I wanted a very minimal user management system in my toy app, so instead I followed this guide called [Authentication from Scratch with Rails 5.2][2] which seems to be working out so far. Rails seems to already have a bunch of built in stuff for managing users – I was really surprised by how short that guide was and how little code I needed to write.

I learned while implementing users that Rails has a built in magical session management system (see [How Rails Sessions Work][3]. By default all the session data seems to be stored in a cookie on the user’s computer, though I guess you can also store the session data in a database if it gets too big for a cookie.

It’s definitely kind of strange to already have a session management system and cookies and users without quite knowing what’s going on exactly, but it’s also kind of fun! We’ll see how it goes.

### tomorrow: more rails!

Maybe tomorrow I can actually make some progress on implementing my fun rails app idea!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/09/day-1--a-little-rails-/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/heartcombo/devise
[2]: https://medium.com/@wintermeyer/authentication-from-scratch-with-rails-5-2-92d8676f6836
[3]: https://www.justinweiss.com/articles/how-rails-sessions-work/
