5 Things to Look for When You Contract Out the Backend of Your App
======

![](https://ryanmccue.ca/content/images/2017/12/Copy-of-Copy-of-Copy-of-Copy-of-Copy-of-Electric-Love.png)

For many app developers, it can be hard to know what to do when it comes to the backend of your app. There are a few options, Firebase, throw together a quick Node API, contract it out. I am going to make a blog post soon weighing the pros and cons of each of these options, but for now, let's assume you want the API done professionally.

You are going to want to look for specific things before you give the contract to some freelancer or agency.

### 1. Documentation

Documentation is one of the most important pieces here, the API could be amazing, but if it is impossible to understand which endpoints are available, what parameters they provide, and what they respond with you won't have much luck integrating the API into your app. Surprisingly this is one of the pieces with most contractors get wrong.

So what are you looking for? First, make sure they understand the importance of documentation, this alone makes a huge difference. Second, the should preferably be using an open standard like [Swagger][1] for documentation. If they do both of these things, you should have documentation covered.

### 2. Communication

You know the saying "communication is key," well that applies to API development. This is harder to gauge, but sometimes a developer will get the contract, and then disappear. This doesn't mean they aren't working on it, but it means there isn't a good feedback loop to sort out problems before they get too large.

A good way to get around this is to have a weekly, or however often you want, meeting to go over progress and make sure the API is shaping up the way you want. Even if the meeting is just going over the endpoints and confirming they are returning the data you need.

### 3. Error Handling

Error handling is crucial, this basically means if there is an error on the backend, whether it's an invalid request or an unexpected internal server error, it will be handled properly and a useful response is given to the client. It's important that they are handled gracefully. Often this can get overlooked in the API development process.

This is a tricky thing to look out for, but by letting them know you expect useful error messages and maybe put it into the contract, you should get the error messages you need. This may seem like a small thing but being able to present the user of your app with the actual thing they've done wrong, like "Passwords must be between 6-64 characters" improves the UX immensely.

### 4. Database

This section may be a bit controversial, but I think that 90% of apps really just need a SQL database. I know NoSQL is sexy, but you get so many extra benefits from using SQL I feel that's what you should use for the backend of your app. Of course, there are cases where NoSQL is the better option, but broadly speaking you should probably just use a SQL database.

SQL adds so much added flexibility by being able to add, modify, and remove columns. The option to aggregate data with a simple query is also immensely useful. And finally, the ability to do transactions and be sure all your data is valid will help you sleep better at night.

The reason I say all the above is because I would recommend looking for someone who is willing to build your API with a SQL database.

### 5. Infrastructure

The last major thing to look for when contracting out your backend is infrastructure. This is essential because you want your app to scale. If you get 10,000 users join your app in one day for some reason, you want your backend to handle that. Using services like [AWS Elastic Beanstalk][2] or [Heroku][3] you can create APIs which will scale up automatically with load. That means if your app takes off overnight your API will scale with the load and not buckle under it.

Making sure your contractor is building it with scalability in mind is key. I wrote a [post on scalable APIs][4] if you're interested in learning more about a good AWS stack.

### Conclusion

It is important to get a quality backend when you contract it out. You're paying for a professional to design and build the backend of your app, so if they're lacking in any of the above points it will reduce the chance of success for but the backend, but for your app. If you make a checklist with these points and go over them with contractors, you should be able to weed out the under-qualified applicants and focus your attention on the contractors that know what they're doing.

--------------------------------------------------------------------------------

via: https://ryanmccue.ca/things-to-look-for-when-you-contract-out-the-backend-your-app/

作者：[Ryan McCue][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://ryanmccue.ca/author/ryan/
[1]:https://swagger.io/
[2]:https://aws.amazon.com/elasticbeanstalk/
[3]:https://www.heroku.com/
[4]:https://ryanmccue.ca/blueprint-for-simple-scalable-microservices/
