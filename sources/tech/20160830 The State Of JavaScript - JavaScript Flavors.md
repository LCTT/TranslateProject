The State Of JavaScript: JavaScript Flavors
===========


One thing that distinguishes JavaScript from other programming languages is that JavaScript isn’t just one language: it’s actually more like a family of closely related cousins.

What started with CoffeeScript back in 2009 has become an explosion of choice over the past couple years: ES6, TypeScript, Elm… they all have their strengths, and they all compile down to good old JavaScript.

So after last week’s look at front-end frameworks, let’s look at what the State Of JavaScript survey can tell us about JavaScript Flavors.

Disclaimer: these are preliminary results extracted from a partial dataset. They’re just a way for me to share some insights while I take my time to come up with the best way to present the complete results.

Note: if you haven’t taken the survey yet, now would be the perfect time to do it! It’ll only take 10 minutes and you can come back here after :)

### Awareness

First, I wanted to find out the percentage of respondents that were aware of each of the six options’ existence:

- Good Old Plain JavaScript: 97%
- ES6: 98%
- CoffeeScript: 99%
- TypeScript: 98%
- Elm: 66%
- ClojureScript: 77%

You would expect that “Good Old Plain JavaScript” would score 100% awareness, but I imagine some people couldn’t resist the temptation of picking “I’ve never heard of JavaScript” in a JavaScript survey…

ES6, CoffeeScript, and TypeScript all have near-perfect awareness, which surprised me since TypeScript isn’t quite as widespread as the other two.

Elm and ClojureScript on the other hand have much lower scores, which makes sense since they’re more tied to their own ecosystems, and harder to use in existing apps.

### Interest

Next, let’s look at which flavors have been generating the most interest among developers who haven’t used them yet:

![](https://embed.chartblocks.com/1.0/?c=57c4dc599973d2525fee820a&referrer=https%3A%2F%2Fmedium.com%2Fmedia%2F63092db0523a37d9d33ce6c014d727f6%3FmaxWidth%3D700&t=3efc9491eba2ce2#)

Remember we’re looking at non-users here, so it makes sense that there would be very few people who haven’t used Plain JavaScript.

It’s interesting to look at ES6: a large proportion of developers have already jumped on the bandwagon, and almost all (89%) of those who haven’t yet want to learn it as well.

TypeScript and Elm are in the same boat: not many people have used them, but they have 53% and 58% interest scores respectively, which isn’t bad by any means.

If I had to guess, I’d say that both TypeScript and Elm might be having a hard time articulating their advantages to the average JavaScript developer. After all it’s hard to understand the advantages of something like static typing if all you know is JavaScript.

Also, few developers have used CoffeeScript, and apparently almost nobody wants to learn it. There goes my plan to write a 12-volume CoffeeScript Encyclopedia…

### Satisfaction

We now come to the key question: how many developers have used each specific flavor, and how many would use it again?

![](https://embed.chartblocks.com/1.0/?c=57c4e5f79973d29461ee820a&referrer=https%3A%2F%2Fmedium.com%2Fmedia%2F1fe4bbdf807f87883fa108e31c6927d5%3FmaxWidth%3D700&t=1061d2ab8fc9838#)


While plain JavaScript has larger usage numbers as expected, in terms of satisfaction the big winner here is ES6, and I think it’s safe to say it’s now the default way to write JavaScript apps.
TypeScript and Elm both also have similarly high satisfaction percentages, around 85%. And once more, poor CoffeeScript trails the poll with only 17% of developers willing to consider it again.

### Happiness

Finally, I asked people how happy they were with their current way of writing JavaScript:

![](https://embed.chartblocks.com/1.0/?c=57c4cd8c9973d2d95bee820a&referrer=https%3A%2F%2Fmedium.com%2Fmedia%2F538138b2d91d1fa99f1696bef4dd4d3f%3FmaxWidth%3D700&t=f53efb029ea4456#)


The high scores we saw in the previous question are confirmed here: with an average score of 3.96 overall, people are really happy with JavaScript as a language.

It’s hard to say if this is because of JavaScript’s recent improvements, or because maybe (just maybe) JavaScript isn’t as horrible a language as people make it to be. But it’s certainly comforting.

### Conclusions

If React and Vue were the clear winners last time, I would say that here it’s without a doubt ES6. This is not groundbreaking news by any means, but it’s nice to know the community is embracing the direction the language is taking.

It will be really interesting to ask these questions again a year or so from now, and see if TypeScript, Elm, and ClojureScript have made any progress.

Personally, I suspect this explosion of flavors is just the beginning, and that the way we write JavaScript a couple years from now might be quite different!

### Share the Word & Stay Tuned

When it comes to surveys like this one, more data equals better data! The more people take the survey, the more representative of the overall JavaScript community it will be.

So if you can, I encourage you to share the survey:

[On Twitter][1]

[On Facebook][2]

And if you’d like to know next time I publish results, [head to the survey homepage][3] and leave your email there to be notified!


--------------------------------------------------------------------------------

via: https://www.oreilly.com/ideas/spark-comparison-aws-vs-gcp?utm_source=dbweekly&utm_medium=email

作者：[Michael Li][a]  [Ariel M'Ndange-Pfupfu][b] 
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.oreilly.com/people/76a5b-michael-li
[b]: https://www.oreilly.com/people/Ariel-Mndange-Pfupfu
[1]: https://aws.amazon.com/
[2]: https://cloud.google.com/
[3]: https://www.thedataincubator.com/training.html?utm_source=OReilly&utm_medium=blog&utm_campaign=AWSvsGCP
