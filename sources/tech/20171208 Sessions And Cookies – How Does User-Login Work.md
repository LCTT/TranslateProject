translating by lujun9972
Sessions And Cookies – How Does User-Login Work?
======
Facebook, Gmail, Twitter we all use these websites every day. One common thing among them is that they all require you to log in to do stuff. You cannot tweet on twitter, comment on Facebook or email on Gmail unless you are authenticated and logged in to the service.

 [![gmail, facebook login page](http://www.theitstuff.com/wp-content/uploads/2017/10/Untitled-design-1.jpg)][1] 

So how does it work? How does the website authenticate us? How does it know which user is logged in and from where? Let us answer each of these questions below.

### How User-Login works?

Whenever you enter your username and password in the login page of a site, the information you enter is sent to the server. The server then validates your password against the password on the server. If it doesn’t match, you get an error of incorrect password. But if it matches, you get logged in.

### What happens when I get logged in?

When you get logged in, the web server initiates a session and sets a cookie variable in your browser. The cookie variable then acts as a reference to the session created. Confused? Let us simplify this.

### How does Session work?

When the username and password are right, the server initiates a session. Sessions have a really complicated definition so I like to call them ‘beginning of a relationship’.

 [![session beginning of a relationship or partnership](http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-9.png)][2] 

When the credentials are right, the server begins a relationship with you. Since the server cannot see like us humans, it sets a cookie in our browsers to identify our unique relationship from all the other relationships that other people have with the server.

### What is a Cookie?

A cookie is a small amount of data that the websites can store in your browser. You must have seen them here.

 [![theitstuff official facebook page cookies](http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-1-4.png)][3] 

So when you log in and the server has created a relationship or session with you, it takes the session id which is the unique identifier of that session and stores it in your browser in form of cookies.

### What’s the Point?

The reason all of this is needed is to verify that it’s you so that when you comment or tweet, the server knows who did that tweet or who did that comment.

As soon as you’re logged in, a cookie is set which contains the session id. Now, this session id is granted to the person who enters the correct username and password combination.

 [![facebook cookies in web browser](http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-2-3-e1508926255472.png)][4] 

So the session id is granted to the person who owns that account. Now whenever an activity is performed on that website, the server knows who it was by their session id.

### Keep me logged in?

The sessions have a time limit. Unlike the real world where relationships can last even without seeing the person for longer periods of time, sessions have a time limit. You have to keep telling the server that you are online by performing some or the other actions. If that doesn’t happen the server will close the session and you will be logged out.

 [![websites keep me logged in option](http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-3-3-e1508926314117.png)][5] 

But when we use the Keep me logged in feature on some websites, we allow them to store another unique variable in the form of cookies in our browsers. This unique variable is used to automatically log us in by checking it against the one on the server. When someone steals this unique identifier it is called as cookie stealing. They then get access to your account.

### Conclusion

We discussed how Login Systems work and how we are authenticated on a website. We also learned about what sessions and cookies are and how they are implemented in login mechanism.

I hope you guys have grasped that how User-Login works, and if you still have a doubt regarding anything, just drop in a comment and I’ll be there for you.

--------------------------------------------------------------------------------

via: http://www.theitstuff.com/sessions-cookies-user-login-work

作者：[Rishabh Kandari][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.theitstuff.com/author/reevkandari
[1]:http://www.theitstuff.com/wp-content/uploads/2017/10/Untitled-design-1.jpg
[2]:http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-9.png
[3]:http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-1-4.png
[4]:http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-2-3-e1508926255472.png
[5]:http://www.theitstuff.com/wp-content/uploads/2017/10/pasted-image-0-3-3-e1508926314117.png
