[#]: subject: (What does the Open-Closed Principle mean for refactoring?)
[#]: via: (https://opensource.com/article/21/7/open-closed-principle-refactoring)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

What does the Open-Closed Principle mean for refactoring?
======
Resolve the tension between protecting clients from unwanted changes and
extending the capabilities of services.
![Brain on a computer screen][1]

In his 1988 book, _[Object-Oriented Software Construction][2]_, professor [Bertrand Meyer][3] defined the [Open-Closed Principle][4] as:

> "A module will be said to be open if it is still available for extension. For example, it should be possible to add fields to the data structures it contains or new elements to the set of functions it performs.
>
> "A module will be said to be closed if it is available for use by other modules. This assumes that the module has been given a well-defined, stable description (the interface in the sense of information hiding)."

A more succinct way to put it would be:

> Software entities (classes, modules, functions, etc.) should be open for extension, but closed for modification.

Similarly (and in parallel to Meyer's findings), [Alistair Cockburn][5] defined the [Protected Variation][6] pattern:

> "Identify points of predicted variation and create a stable interface around them."

Both of these deal with volatility in software. When, as is always the case, you need to make some change to a software module, the ripple effects can be disastrous. The root cause of disastrous ripple effects is tight coupling, so the Open-Closed Principle and Protected Variation Pattern teach us how to properly decouple various modules, components, functions, and so forth.

### Does the Open-Closed Principle preclude refactoring?

If a module (i.e., a named block of code) must remain closed to any modifications, does that mean you're not allowed to touch it once it gets deployed? And if yes, wouldn't that eliminate any possibility of refactoring?

Without the ability to refactor the code, you are forced to adopt the Finality Principle. This holds that rework is not allowed (why would stakeholders agree to pay you to work again on something they already paid for?) and you must carefully craft your code, because you will get only one chance to do it right. This is in total contradiction to the discipline of refactoring.

If you are allowed to extend the deployed code but not change it, are you doomed to swim forever in the waterfall rivers? Being given only one shot at doing anything is a recipe for disaster.

Let's review the approach to solve this conundrum.

### How to protect clients from unwanted changes

Clients (meaning modules or functions that use some block of code) utilize some functionality by adhering to the protocol as originally implemented in the component or service. However, as the component or service inevitably changes, the original "partnership" between the service or component and various clients breaks down. Clients "discover" the change by breakage, which is always an unpleasant surprise that often ruins the initial trust.

Clients must be protected from those breakages. The only way to do so is by introducing a layer of abstraction between the clients and the service or component. In software engineering lingo, we call that layer of abstraction an "interface" (or an API).

Interfaces and APIs hide the implementation. Once you arrange for a service to be delivered via an interface or API, you free yourself from the worries of changing the implementation code. No matter how much you change the service's implementation, your clients remain blissfully unaffected.

That way, you are back to your comfortable world of iterations. You are now completely free to refactor, to rearrange the code, and to keep rearranging it in pursuit of a more optimal solution.

The thing in this arrangement that remains closed for modification is the interface or API. The volatility of an interface or API is the thing that threatens to break the established trust between the service and its clients. Interfaces and APIs must remain open for extension. And that extension happens behind the scenes—by refactoring and adding new capabilities while guaranteeing non-volatility of the public-facing protocol.

### How to extend capabilities of services

While services remain non-volatile from the client's perspective, they also remain open for business when it comes to enhancing their capabilities. This Open-Closed Principle is implemented through refactoring.

For example, if the first increment of the `OrderPayment` service offers mere bare-bones capabilities (e.g., able to process the order total and calculate sales tax), the next increment can be safely added by respecting the Open-Closed Principle. Without breaking the handshake between the clients and the `OrderPayment` service, you can refactor the implementation behind the `OrderPayment` API by adding new blocks of code.

So, the second increment could contain the ability to calculate shipping costs. And so on, you get the picture; you accomplish the Protected Variation Pattern by observing the Open-Closed Principle. It's all about carefully modeling business abstractions.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/open-closed-principle-refactoring

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_computer_solve_fix_tool.png?itok=okq8joti (Brain on a computer screen)
[2]: https://en.wikipedia.org/wiki/Object-Oriented_Software_Construction
[3]: https://en.wikipedia.org/wiki/Bertrand_Meyer
[4]: https://en.wikipedia.org/wiki/Open%E2%80%93closed_principle
[5]: https://en.wikipedia.org/wiki/Alistair_Cockburn
[6]: https://martinfowler.com/ieeeSoftware/protectedVariation.pdf
