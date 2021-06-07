[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to define a product in the open source software supply chain)
[#]: via: (https://opensource.com/article/20/10/defining-product-open-source)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux)

How to define a product in the open source software supply chain
======
Differentiation is what makes a product successful. Learn more in part
two of this series on open source in the software supply chain.
![Gift box opens with colors coming out][1]

In the first article in this series, "[Is open source a development model, business model, or something else?][2]" I introduced the concept that open source is part of the supply chain for software products. But to truly understand open source as a supply chain, you must have a decent understanding of what a product is. A product can be thought of as a business, and as legendary business guru [Peter Drucker][3] said, "The purpose of business is to create and keep a customer." Drucker's statement means a business or product must be useful enough to pay for, or it will fail. Product differentiation is the thing that creates and retains customers.

### What's in a software product?

Even in the stone age of 1999, when I started my career, the concept of software products existed—you could go to a store and purchase boxed copies of Red Hat Linux on compact discs (though floppies were still very much in use). The idea of software products existing might sound like a joke, and it is, but in the 1940s and 1950s (when computers, as we know them, were created), software was not a component of value that was bought and sold. There was no market for software. You couldn't buy it, sell it, or access it online.

Instead of buying software, the choice was to build or buy a physical computer; with either option, you wrote the software yourself for that specific computer.

> _That… specific… computer…_

No joke. In the early days of computers, software couldn't run anywhere except for the computer you wrote it on. In fact, in the early days, you couldn't even use the same programming language on two different computers. But, as computers evolved, system software, such as operating systems, assemblers, and compilers, were created. And with the advent of this system software, application code became more reusable and portable.

In the 1960s, cross-platform compilers and operating systems led to the concept of reusable code, such as macros and eventually libraries. At the beginning of every project, you built your own reusable functions and libraries. (Computer science courses still force you to do this so that you learn what's going on behind the scenes.) Concurrently, processors and operating systems standardized, enabling portability between computers.

In the early days, these components were used within single organizations (e.g., a government, university, company, etc.), but the desire to share software among organizations emerged quickly. If you're interested in understanding the history of code portability from the first computers to containers, see "Fatherlinux's" [Container portability][4] series or the [History of compiler construction][5] Wikipedia page. Suffice to say, code had to be portable before anyone could have software products, open source or even containers.

### Reusable and portable software

Once code became portable and shareable between organizations, the next logical step was to sell it. In these early days, having software that did _something useful_ was differentiating in the marketplace. This was a breakthrough because if you needed a calculator, a compiler, or a piece of word processing software, it became cheaper and easier to buy it than to write it. So software products were born.

This model really only worked to tackle general-purpose problems that a lot of people share—things like calculating numbers, writing documents, or compiling software; these are business problems. General-purpose software is great, but it doesn't elegantly solve specific problems related to business rules within a single industry or organization, although you can abuse Excel or Google Sheets pretty hard. For specific business problems, it's more efficient to write custom code. This need led to the rise of middleware, things like Java, service buses, and databases. Middleware was bought and sold to assist with custom software development.

Code portability led to a marketplace for software applications and middleware. Software companies began to provide competing solutions with differentiated value. You picked the compiler or the calculator that you wanted based on features. The existence of competing solutions was great for consumers because it drove software companies to create more specialized solutions, each with unique value. Whether a product is built on open source or not, it must provide unique value in the marketplace.

### Understanding differentiated value

To explain differentiated value, I'll use an analogy about automobiles. Families need cars, sport utility vehicles (SUVs), or minivans. They might want comfortable seats, infotainment systems, or safety features. They often have a preference on color. Each family is different and has specific needs, so the perfect automobile would be one that the family built together as a project.

Most families don't have the time, desire, money, or credit to buy all of the components necessary to build the perfect car from scratch, much less the time to maintain it over a given lifecycle. It wouldn't be an economical investment of time or money for a family. It would cost them way more, and take a long time to build. Instead, families buy automobiles from existing vendors, as a built solution to their transportation problem. Although the bought car will be imperfect, it will approximately meet their needs with much less time and money invested.

Automobile vendors put a solution together with undifferentiated and differentiated components. This includes everything from the motor, fuel injectors, tires, and seats in the car, to the buying experience at the dealership, the financing, and the service program while the car is owned. All of these features and experiences are a component of the solution that families buy when looking for an automobile. The combination of all these things is what produces something that is different and, hopefully, better in the marketplace. We call this _differentiation_. The more competing solutions, the more differentiation in the marketplace, and the better the chance that a family can find a car that matches their needs more approximately.

### Differentiation in open source

In a traditional manufactured product or service, there is a distinction between the value provided by the supplier and the value provided by the company selling directly to the consumer. You could make a further distinction between business-to-consumer (B2C) or business-to-business (B2B) products and services, but that's beyond the scope of this series.

The astute reader may already be thinking, "yeah, but with traditional products, the suppliers are also companies selling products with differentiation." This is completely true, and in this way, open source projects are no different. Community-driven, open source projects don't have the advantage of expensive marketing campaigns, focus groups, and sales teams to educate customers, but they must also differentiate themselves in the marketplace.

Differentiation is an important concept for product managers, developers, and even systems administrators. Even in a broader context, the output of any sort of knowledge work—code, writing, music, or art—differentiation is what brings value and meaning to our work. Differentiation is what creates value, whether it's a software product or service, labor, or even music.

In the next article, I'll dive deeper into how software product teams differentiate their solutions from the open source components provided by their suppliers. We'll even cover software as a service (SaaS).

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/defining-product-open-source

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1 (Gift box opens with colors coming out)
[2]: https://opensource.com/article/20/10/open-source-supply-chain
[3]: https://en.wikipedia.org/wiki/Peter_Drucker
[4]: http://crunchtools.com/container-portability-part-1/
[5]: https://en.wikipedia.org/wiki/History_of_compiler_construction
