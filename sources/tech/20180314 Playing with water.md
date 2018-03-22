translating---geekpi

Playing with water
======
![H2o Flow gradient boosting job][1]

I'm currently taking a machine learning class and although it is an insane amount of work, I like it a lot. I initially had planned to use [R][2] to play around with the database I have, but the teacher recommended I use [H2o][3], a FOSS machine learning framework.

I was a bit sceptical at first since I'm already pretty good with R, but then I found out you could simply import H2o as an R library. H2o replaces most R functions by its own parallelized ones to cut down on processing time (no more `doParallel` calls) and uses an "external" server you have to run on the side instead of running R calls directly.

![H2o Flow gradient boosting model][4]

I was pretty happy with this situation, that is until I actually started using H2o in R. With the huge database I'm playing with, the library felt clunky and I had a hard time doing anything useful. Most of the time, I just ended up with long Java traceback calls. Much love.

I'm sure in the right hands using H2o as a library could have been incredibly powerful, but sadly it seems I haven't earned my black belt in R-fu yet.

![H2o Flow variable importance weights][5]

I was pissed for at least a whole day - not being able to achieve what I wanted to do - until I realised H2o comes with a WebUI called Flow. I'm normally not very fond of using web thingies to do important work like writing code, but Flow is simply incredible.

Automated graphing functions, integrated ETA when running resource intensive models, descriptions for each and every model parameters (the parameters are even divided in sections based on your familiarly with the statistical models in question), Flow seemingly has it all. In no time I was able to run 3 basic machine learning models and get actual interpretable results.

So yeah, if you've been itching to analyse very large databases using state of the art machine learning models, I would recommend using H2o. Try Flow at first instead of the Python or R hooks to see what it's capable of doing.

The only downside to all of this is that H2o is written in Java and depends on Java 1.7 to run... That, and be warned: it requires a metric fuckton of processing power and RAM. My poor server struggled quite a bit even with 10 available cores and 10Gb of RAM...

--------------------------------------------------------------------------------

via: https://veronneau.org/playing-with-water.html

作者：[Louis-Philippe Véronneau][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://veronneau.org/
[1]:https://veronneau.org/media/blog/2018-03-14/h2o_job.png (H2o Flow gradient boosting job)
[2]:https://en.wikipedia.org/wiki/R_(programming_language)
[3]:https://www.h2o.ai
[4]:https://veronneau.org/media/blog/2018-03-14/h2o_model.png (H2o Flow gradient boosting model)
[5]:https://veronneau.org/media/blog/2018-03-14/h2o_var_importance.png (H2o Flow variable importance weights)
