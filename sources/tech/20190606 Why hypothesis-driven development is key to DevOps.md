[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why hypothesis-driven development is key to DevOps)
[#]: via: (https://opensource.com/article/19/6/why-hypothesis-driven-development-devops)
[#]: author: (Brent Aaron Reed https://opensource.com/users/brentaaronreed/users/wpschaub)

Why hypothesis-driven development is key to DevOps
======
A hypothesis-driven development mindset harvests the core value of
feature flags: experimentation in production.
![gears and lightbulb to represent innovation][1]

The definition of DevOps, offered by [Donovan Brown][2] * _is_ "The union of **people** , **process** , and **products** to enable continuous delivery of **value** to our customers.*" It accentuates the importance of continuous delivery of value. Let's discuss how experimentation is at the heart of modern development practices.

![][3]

### Reflecting on the past

Before we get into hypothesis-driven development, let's quickly review how we deliver value using waterfall, agile, deployment rings, and feature flags.

In the days of _**waterfall**_ , we had predictable and process-driven delivery. However, we only delivered value towards the end of the development lifecycle, often failing late as the solution drifted from the original requirements, or our killer features were outdated by the time we finally shipped.

![][4]

Here, we have one release X and eight features, which are all deployed and exposed to the patiently waiting user. We are continuously delivering value—but with a typical release cadence of six months to two years, _the value of the features declines as the world continues to move on_. It worked well enough when there was time to plan and a lower expectation to react to more immediate needs.

The introduction of _**agile**_ allowed us to create and respond to change so we could continuously deliver working software, sense, learn, and respond.

![][5]

Now, we have three releases: X.1, X.2, and X.3. After the X.1 release, we improved feature 3 based on feedback and re-deployed it in release X.3. This is a simple example of delivering features more often, focused on working software, and responding to user feedback. _We are on the path of continuous delivery, focused on our key stakeholders: our users._

Using _**deployment rings**_ and/or _**feature flags**_ , we can decouple release deployment and feature exposure, down to the individual user, to control the exposure—the blast radius—of features. We can conduct experiments; progressively expose, test, enable, and hide features; fine-tune releases, and continuously pivot on learnings and feedback.

When we add feature flags to the previous workflow, we can toggle features to be ON (enabled and exposed) or OFF (hidden).

![][6]

Here, feature flags for features 2, 4, and 8 are OFF, which results in the user being exposed to fewer of the features. All features have been deployed but are not exposed (yet). _We can fine-tune the features (value) of each release after deploying to production._

_**Ring-based deployment**_ limits the impact (blast) on users while we gradually deploy and evaluate one or more features through observation. Rings allow us to deploy features progressively and have multiple releases (v1, v1.1, and v1.2) running in parallel.

![Ring-based deployment][7]

Exposing features in the canary and early-adopter rings enables us to evaluate features without the risk of an all-or-nothing big-bang deployment.

_**Feature flags**_ decouple release deployment and feature exposure. You "flip the flag" to expose a new feature, perform an emergency rollback by resetting the flag, use rules to hide features, and allow users to toggle preview features.

![Toggling feature flags on/off][8]

When you combine deployment rings and feature flags, you can progressively deploy a release through rings and use feature flags to fine-tune the deployed release.

> See [deploying new releases: Feature flags or rings][9], [what's the cost of feature flags][10], and [breaking down walls between people, process, and products][11] for discussions on feature flags, deployment rings, and related topics.

### Adding hypothesis-driven development to the mix

_**Hypothesis-driven development**_ is based on a series of experiments to validate or disprove a hypothesis in a [complex problem domain][12] where we have unknown-unknowns. We want to find viable ideas or fail fast. Instead of developing a monolithic solution and performing a big-bang release, we iterate through hypotheses, evaluating how features perform and, most importantly, how and if customers use them.

> **Template:** _**We believe**_ {customer/business segment} _**wants**_ {product/feature/service} _**because**_ {value proposition}.
>
> **Example:** _**We believe**_ that users _**want**_ to be able to select different themes _**because**_ it will result in improved user satisfaction. We expect 50% or more users to select a non-default theme and to see a 5% increase in user engagement.

Every experiment must be based on a hypothesis, have a measurable conclusion, and contribute to feature and overall product learning. For each experiment, consider these steps:

  * Observe your user
  * Define a hypothesis and an experiment to assess the hypothesis
  * Define clear success criteria (e.g., a 5% increase in user engagement)
  * Run the experiment
  * Evaluate the results and either accept or reject the hypothesis
  * Repeat



Let's have another look at our sample release with eight hypothetical features.

![][13]

When we deploy each feature, we can observe user behavior and feedback, and prove or disprove the hypothesis that motivated the deployment. As you can see, the experiment fails for features 2 and 6, allowing us to fail-fast and remove them from the solution. _**We do not want to carry waste that is not delivering value or delighting our users!**_ The experiment for feature 3 is inconclusive, so we adapt the feature, repeat the experiment, and perform A/B testing in Release X.2. Based on observations, we identify the variant feature 3.2 as the winner and re-deploy in release X.3. _**We only expose the features that passed the experiment and satisfy the users.**_

### Hypothesis-driven development lights up progressive exposure

When we combine hypothesis-driven development with progressive exposure strategies, we can vertically slice our solution, incrementally delivering on our long-term vision. With each slice, we progressively expose experiments, enable features that delight our users and hide those that did not make the cut.

But there is more. When we embrace hypothesis-driven development, we can learn how technology works together, or not, and what our customers need and want. We also complement the test-driven development (TDD) principle. TDD encourages us to write the test first (hypothesis), then confirm our features are correct (experiment), and succeed or fail the test (evaluate). _**It is all about quality and delighting our users** , as outlined in principles 1, 3, and 7_ of the [Agile Manifesto][14]:

  * Our highest priority is to satisfy the customers through early and continuous delivery of value.
  * Deliver software often, from a couple of weeks to a couple of months, with a preference to the shorter timescale.
  * Working software is the primary measure of progress.



More importantly, we introduce a new mindset that breaks down the walls between development, business, and operations to view, design, develop, deliver, and observe our solution in an iterative series of experiments, adopting features based on scientific analysis, user behavior, and feedback in production. We can evolve our solutions in thin slices through observation and learning in production, a luxury that other engineering disciplines, such as aerospace or civil engineering, can only dream of.

The good news is that hypothesis-driven development supports the empirical process theory and its three pillars: **Transparency** , **Inspection** , and **Adaption**.

![][15]

But there is more. Based on lean principles, we must pivot or persevere after we measure and inspect the feedback. Using feature toggles in conjunction with hypothesis-driven development, we get the best of both worlds, as well as the ability to use A|B testing to make decisions on feedback, such as likes/dislikes and value/waste.

### Remember:

Hypothesis-driven development:

  * Is about a series of experiments to confirm or disprove a hypothesis. Identify value!
  * Delivers a measurable conclusion and enables continued learning.
  * Enables continuous feedback from the key stakeholder—the user—to understand the unknown-unknowns!
  * Enables us to understand the evolving landscape into which we progressively expose value.



Progressive exposure:

  * Is not an excuse to hide non-production-ready code. _**Always ship quality!**_
  * Is about deploying a release of features through rings in production. _**Limit blast radius!**_
  * Is about enabling or disabling features in production. _**Fine-tune release values!**_
  * Relies on circuit breakers to protect the infrastructure from implications of progressive exposure. _**Observe, sense, act!**_



What have you learned about progressive exposure strategies and hypothesis-driven development? We look forward to your candid feedback.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/why-hypothesis-driven-development-devops

作者：[Brent Aaron Reed][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brentaaronreed/users/wpschaub
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M (gears and lightbulb to represent innovation)
[2]: http://donovanbrown.com/post/what-is-devops
[3]: https://opensource.com/sites/default/files/hypo-1_copy.png
[4]: https://opensource.com/sites/default/files/uploads/hyp0-2-trans.png
[5]: https://opensource.com/sites/default/files/uploads/hypo-3-trans.png
[6]: https://opensource.com/sites/default/files/uploads/hypo-4_0.png
[7]: https://opensource.com/sites/default/files/uploads/hypo-6-trans.png
[8]: https://opensource.com/sites/default/files/uploads/hypo-7-trans.png
[9]: https://opensource.com/article/18/2/feature-flags-ring-deployment-model
[10]: https://opensource.com/article/18/7/does-progressive-exposure-really-come-cost
[11]: https://opensource.com/article/19/3/breaking-down-walls-between-people-process-and-products
[12]: https://en.wikipedia.org/wiki/Cynefin_framework
[13]: https://opensource.com/sites/default/files/uploads/hypo-5-trans.png
[14]: https://agilemanifesto.org/principles.html
[15]: https://opensource.com/sites/default/files/uploads/adapt-transparent-inspect.png
