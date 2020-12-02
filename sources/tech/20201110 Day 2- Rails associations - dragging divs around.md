[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Day 2: Rails associations & dragging divs around)
[#]: via: (https://jvns.ca/blog/2020/11/10/day-2--rails-associations---dragging-divs-around/)
[#]: author: (Julia Evans https://jvns.ca/)

Day 2: Rails associations & dragging divs around
======
null
Hello! Today was day 2 of building my toy project. Here are a few more notes on things that have been fun about Rails!

### the goal: make a refrigerator poetry forum

I wanted to make kind of a boring standard website to learn Rails, and that other people could interact with. Like a forum! But of course if people can actually type on a website that creates all kinds of problems (what if they’re spammers? or just mean?).

The first idea I came up with that would let people interact with the website but not actually be able to type things into it was a refrigerator poetry forum where you can write poems given only a fixed set of words.

So, that’s the plan!

My goal with this project is to find out if I want to use Rails for other small web projects (instead of what I usually do, which is use something more basic like Flask, or give up on having a backend at all and write everything in Javascript).

### how do you drag the words around? jQuery UI draggable!

I wanted people to be able to drag the words around, but I didn’t feel like writing a lot of Javascript. It turns out that this is SUPER easy – there’s a jQuery library to do it called “draggable”!

At first the dragging didn’t work on mobile, but there’s a hack to make jQuery UI work on mobile called [jQuery UI touch punch][1]. Here’s what it looks like (you can view source if you’re interested in seeing how it works, there’s very little code).

banana forest cake is

### a fun Rails feature: “associations”

I’ve never used a relational ORM before, and one thing I was excited about with Rails was to see what using Active Record is like! Today I learned about one of Rails’ ORM features: [associations][2]. Here’s what that’s about if you know absolutely nothing about ORMs like me.

In my forum, I have:

  * users
  * topics (I was going to call this “threads” but apparently that’s a reserved word in Rails so they’re called “topics” for now)
  * posts



When displaying a post, I need to show the username of the user who created the post. So I thought I might need to write some code to load the posts and load the user for each post like this: (in Rails, `Post.where` and `User.find` will run SQL statements and turn the results into Ruby objects)

```
@posts = Post.where(topic_id: id)
@posts.each do |post|
    user = User.find(post.user_id)
    post.user = user
end
```

This is no good though – it’s doing a separate SQL query for every post! I knew there was a better way, and I found out that it’s called [Associations][2]. That link is to the guide from <https://guides.rubyonrails.org>, which has treated me well so far.

Basically all I needed to do was:

  1. Add a `has_many :posts` line to the User model
  2. Add a `belongs_to :user` line to the Post model
  3. Rails now knows how to join these two tables even though I didn’t tell it what columns to join on! I think this is because I named the `user_id` column in the `posts` table according to the convention it expects.
  4. Do the exact same thing for `User` and `Topic` (a topic also `has_many :posts`)



And then my code to load every post along with its associated user becomes just one line! Here’s the line:

```
@posts = @topic.posts.order(created_at: :asc).preload(:user)
```

More importantly than it being just one line, instead of doing a separate query to get the user for each post, it gets all the users in 1 query. Apparently there are a bunch of [different ways][3] to do similar things in Rails (preload, eager load, joins, and includes?). I don’t know what all those are yet but maybe I’ll learn that later.

### a fun Rails feature: scaffolding!

Rails has this command line tool called `rails` and it does a lot of code generation. For example, I wanted to add a Topic model / controller. Instead of having to go figure out where to add all the code, I could just run:

```
rails generate scaffold Topic title:text
```

and it generated a bunch of code, so that I already had basic endpoints to create / edit / delete Topics. For example, here’s my [topic controller right now][4], most of which I did not write (I only wrote the highlighted 3 lines). I’ll probably delete a lot of it, but it feels kinda nice to have a starting point where I can expand on the parts I want and delete the parts I don’t want.

### database migrations!

The `rails` tool can also generate database migrations! For example, I decided I wanted to remove the `title` field from posts.

Here’s what I had to do:

```
rails generate migration RemoveTitleFromPosts title:string
rails db:migrate
```

That’s it – just run a couple of command line incantations! I ran a few of these migrations as I changed my mind about what I wanted my database schema to be and it’s been pretty straightforward so far – it feels pretty magical.

It got a tiny bit more interesting when I tried to add a `not null` constraint to a column where some of the fields in that column were null – the migration failed. But I could just fix the offending records and easily rerun the migration.

### that’s all for today!

tomorrow maybe I’ll put it on the internet if I make more progress.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/10/day-2--rails-associations---dragging-divs-around/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/furf/jquery-ui-touch-punch
[2]: https://guides.rubyonrails.org/association_basics.html
[3]: https://blog.bigbinary.com/2013/07/01/preload-vs-eager-load-vs-joins-vs-includes.html
[4]: https://github.com/jvns/refrigerator-forum/blob/776b3227cfd7004cb1efb00ec7e3f82a511cbdc4/app/controllers/topics_controller.rb#L13-L15
