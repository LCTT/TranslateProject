[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Apply the Scientific Method to agile development)
[#]: via: (https://opensource.com/article/20/11/hypothesis-driven-development)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

Apply the Scientific Method to agile development
======
Hypothesis-driven development allows constant analysis of new
information to implement new insights (and deliver new customer value)
on an ongoing basis.
![Science lab with beakers][1]

> "The only way it’s all going to go according to plan is if you don’t learn anything." —Kent Beck

Experimentation is the foundation of the scientific method, which is a systematic means of exploring the world around us. But experimentation is not only reserved for the field of scientific research. It has a central place in the world of business too.

Most of us are by now familiar with the business methodology called [Minimum Viable Product (MVP)][2]. This Minimum Viable Product is basically just an experiment. By building and launching MVPs, business operations are engaging in a systematic means of exploring the markets.

If we look at market leaders today, we learn that they’re not doing projects anymore; the only thing they’re doing is experiments. Customer discovery and lean strategies are only used to test assumptions about the markets. Such an approach is equivalent to Test-Driven Development (TDD), which is the process we are intimately familiar with. In TDD, we write the hypothesis (the test) first. We then use that test to guide our implementation. Ultimately, product or service development is no different than TDD—we first write a hypothesis, then that hypothesis guides our implementation, which serves as measurable validation of the hypothesis.

### Information discovery

Back in the pre-agile days, requirements gathering was an important activity that used to always kick off the project. A bunch of subject matter experts (SMEs) would get assigned to the project and be tasked with gathering the requirements. After a prolonged period of upfront information discovery, the gathered requirements got reviewed and, if agreed upon, signed off and frozen. No more changes allowed!

Back then, it seemed a perfectly reasonable thing to do. The fly in the ointment always showed up once the build phase commenced. Sooner or later, as the project progresses, new information comes to light. Suddenly, what we initially viewed as incontrovertible truth gets challenged by the newly acquired information and evidence.

But the clincher was in the gated phases. Remember, once requirements get signed off, they get frozen—no more changes, no scope creep allowed—which means newly obtained market insights get willfully ignored.

Well, that’s kind of foolish neglect. The newly emerging evidence could be of critical importance to the health of the business operation. Can we afford to ignore it? Absolutely not! We have no choice but to embrace the change.

After a number of prominent fiascos in the industry, many software development projects switched to the agile approach. With agile, information discovery is partial. With agile, we never claim that we have gathered the requirements and are now ready to implement them. We discover information and implement it on an ongoing basis. We do it in tiny steps, keeping our efforts interruptible and steerable at all times.

### How to leverage the scientific method

The scientific method is empirical and consists of the following steps:

Step 1: Make and record careful observations.

Step 2: Perform orientation with regard to observed evidence.

Step 3: Formulate a hypothesis, including measurable indicators for hypothesis evaluation.

Step 4: Design an experiment that will enable testing of the hypothesis.

Step 5: Conduct the experiment (i.e., release the partial implementation).

Step 6: Collect the telemetry that results from running the experiment.

Step 7: Evaluate the results of the experiment.

Step 8: Accept or reject the hypothesis.

Step 9: Return to Step 1.

### How to formulate a hypothesis

When switching from project to experiments, the traditional user story framework (As a__I want to__so that__) has proven insufficient. The traditional user story format does not expose the signals needed in order to evaluate the outcomes. Instead, the old school user story format is focused on outputs.

The problem with doing an experiment without first formulating a hypothesis is that there is a danger of introducing a bias when interpreting the results of an experiment. Defining the measurable signals that will enable us to corroborate our hypothesis must be done before we conduct the experiment. That way, we can remain completely impartial when interpreting the results of the experiment. We cannot be swayed by wishful thinking.

The best way to proceed with formulating a hypothesis is to use the following format:

We believe [this capability] will result in [this outcome]. We will have the confidence to proceed when [we see a measurable signal].

### Working software is not a measure of progress

Output-based metrics and concepts (definition of "done," acceptance criteria, burndown charts, and velocity) are good for detecting working software but fall miserably when it comes to detecting if working software adds value.

"Done" only matters if it adds value. Working software that doesn’t add value cannot be declared "done."

### The forgotten column

Technology-centric projects break activities down into four columns:

  1. Backlog of ideas
  2. Analysis
  3. In progress
  4. Shipped



The above structure is based on the strong belief that all software that works is valuable. That focus must now shift toward continuously delivering real value, something that serves customers. Agilists value outcomes (value to the customers) over features.

The new breakdown for hypothesis-driven development looks something like this:

Ideas Backlog

|

Analysis

|

In Progress

|

Shipped

|

Achieved Desired Outcome

---|---|---|---|---

Hypothesis 11

Hypothesis 12

Hypothesis 13

Hypothesis 14

Hypothesis 15

Hypothesis 16

Hypothesis 17

Hypothesis 18

Hypothesis 19

|

Hypothesis 20

Hypothesis 21

|

Hypothesis 26

|

Hypothesis 2

Hypothesis 5

Hypothesis 9

Hypothesis 10

|

Hypothesis 1

Hypothesis 5

All eyes must remain on the Achieved Desired Outcome column.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/hypothesis-driven-development

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/science_experiment_beaker_lab.png?itok=plKWRhlU (Science lab with beakers)
[2]: https://en.wikipedia.org/wiki/Minimum_viable_product#:~:text=A%20minimum%20viable%20product%20%28MVP,feedback%20for%20future%20product%20development.&text=The%20concept%20can%20be%20used,developments%20of%20an%20existing%20product.
