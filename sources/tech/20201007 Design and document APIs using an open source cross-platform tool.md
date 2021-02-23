[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Design and document APIs using an open source cross-platform tool)
[#]: via: (https://opensource.com/article/20/10/spec-first-development-apis)
[#]: author: (Greg Schier https://opensource.com/users/gregschier)

Design and document APIs using an open source cross-platform tool
======
Insomnia Designer makes spec-first development more accessible by
providing collaborative tools to organize, maintain, and validate API
specs.
![Computer laptop in space][1]

In the world of software-as-a-service (SaaS) and service-based architectures, it's not uncommon for companies to maintain dozens or even hundreds of APIs, often spanning multiple teams, programming languages, and environments. This variability makes it extremely difficult to see what's happening at a high level to prevent changes from having negative impacts.

It's estimated that 40% of large enterprises struggle with challenges to secure, scale, or ensure performance for APIs. Because of this, more and more companies are choosing to adopt a "spec-first development" approach by defining and documenting APIs in an external format like [OpenAPI][2]. Storing these documents together in a central location makes it much easier to design, discuss, and approve changes _before_ implementation.

In this tutorial, you'll use the recently released [Insomnia Designer][3] to document an API, explore it, and propose a change using a spec-first approach. Designer is a cross-platform, open source REST client that builds on top of Insomnia Core—a popular app for interacting with HTTP and GraphQL APIs—aiming to make spec-first development more accessible by providing collaborative tools to organize, maintain, and validate API specs. In essence, Core is best for exploring and debugging APIs while Designer is best for designing and documenting them.

In this how-to, you'll use the [Open Library API][4] as a base to have working examples to play with. You'll create a minimal OpenAPI spec to document the APIs, use Insomnia Designer to test and verify that what you've done is correct, and then make some design changes to the API using a spec-first approach.

### The spec-first workflow

Before you begin, you should understand the steps necessary to adopt a spec-first workflow. In spec-first development, a specification can be in one of two states:

  * **Published spec:** A specification that describes a currently published API exactly
  * **Proposal spec:** A draft specification that contains changes that need to be implemented



From this information, you can define a workflow for making changes to an API:

  1. Start with the published specification for the API
  2. Make changes to the specification to add or modify behavior
  3. Review the proposal spec to ensure the design is sufficient
  4. Implement changes in code to match the proposal
  5. Publish the proposal spec along with the API



Now that you understand the workflow for what you are trying to accomplish, open Insomnia Designer and start trying it out.

### Define the initial specification

Since you don't yet have a published specification for the Open Library API, you need to define one.

Start by creating a new blank document from the **Create** menu, give it a name, then click to the document to enter **Design View**. From here, you can start editing your spec.

![Create a new document][5]

(Greg Schier, [CC BY-SA 4.0][6])

The OpenAPI spec is most commonly written in [YAML][7] format and requires four top-level blocks to get started: `openapi`, `info`, `servers`, and `paths`. The following example defines each of these blocks with helpful comments to describe the purpose of each. Also, the `paths` block defines a route for `GET /recentchanges.json`:


```
# Specify that your document is the OpenAPI 3 format
openapi: 3.0.0

# Define high-level metadata for the API
info:
  version: 1.0.0
  title: Open Library API
  description: Open Library has a RESTful API
 
# Specify the base URL the API can be accessed from
servers:
  - url: <http://openlibrary.org>

# Define operations for the API. This will be where most
# of the work is done. The first route you'll be defining
# is `GET /recentchanges.json`
paths:
  /recentchanges.json:
    get:
      summary: Recent Changes
```

OpenAPI provides much more than what's visible here, such as the ability to define authentication, response formats, reusable components, and more.

After copying the specification above into Insomnia Designer, you'll see three columns:

  1. **Navigation sidebar (left):** Nested menu to make navigating larger documents easier
  2. **Spec editor (middle):** Text editor for editing the YAML document
  3. **Documentation preview:** Generated documentation to preview the specification



![Insomnia Designer UI with three columns][8]

(Greg Schier, [CC BY-SA 4.0][6])

Feel free to modify different parts of the specification to see what happens. As a safeguard, Insomnia Designer alerts you when you've done something wrong. For example, if you accidentally delete the colon on line 18, an error panel will display below the editor.

![Insomnia Designer UI error message][9]

(Greg Schier, [CC BY-SA 4.0][6])

Now that you have defined a specification, you can verify that your definition is correct by switching to **Debug** mode and sending a real request to the API. In Debug mode, you can see a single route was generated for the `GET /recentchanges.json` endpoint. Click the **Send** button beside the URL to execute the request and render the response in the right panel.

![Checking response in Insomnia Designer][10]

(Greg Schier, [CC BY-SA 4.0][6])

There you have it! You've successfully verified that the API specification you created matches the production API. Now you can move to the next step in the spec-first development workflow and propose a change.

### Create a proposal specification

According to the workflow outlined above, changes made to your API should first be defined in the specification. This has a number of benefits:

  * Specifications can be checked into a central source-code repository
  * Changes are easy to review and approve
  * APIs are defined in a single, consistent format
  * Unnecessary code changes are avoided



Go ahead and propose a change to your API. While in Debug mode, I noticed the API returned hundreds of results. To improve performance and usability, it would be useful to limit the number of results returned to a specific amount. A common way of doing this is to accept a `limit` parameter in the query section of the URL, so go ahead and modify your specification to add a `limit` parameter.

In OpenAPI, you can define this by adding a `parameters` block to the route**:**


```
# ...
paths:
  /recentchanges.json:
    get:
      summary: Recent Changes
     
      # Add parameter to limit the number of results
      parameters:
        - name: limit
          in: query
          description: Limit number of results
          required: true
          schema:
            type: integer
            example: 1
```

You can verify you defined it correctly by expanding the route within the preview and inspecting the parameters.

![Verifying spec definition in Insomnia][11]

(Greg Schier, [CC BY-SA 4.0][6])

### Review and implement the proposal

Now that you have created a proposal spec, you can have your team review and approve the changes. Insomnia Designer provides the ability to [sync API specifications to source control][12], allowing teams to review and approve changes to API specs the same way they do with source code.

For example, you might commit and push your proposed spec to a new branch in GitHub and create a pull request to await approval.

Because this is a tutorial on spec-first development, you won't implement the proposal yourself. The parameter you added is already supported by the API, however, so for the purpose of this article, use your imagination and pretend that your team has implemented the change.

### Verify the updated specification

Once the proposal has been implemented and deployed, you can switch to Debug mode, which will regenerate the requests based on your changes, and again verify that the spec matches the production API. To ensure the new query param is being sent, click the **Query** tab within Debug mode and observe that the `limit` parameter is set to your example value of `1`.

Once you send the request, you can verify that it returns only a single result. Change the `limit` to a different value or disable the query parameter (using the checkbox) to further verify things work as expected.

![Verifying things work as expected in Insomnia Designer][13]

(Greg Schier, [CC BY-SA 4.0][6])

### The power of spec-first development

This tutorial walked through a simplified example of spec-first development. In it, you created an OpenAPI specification, verified the specification matched the implementation, and simulated what it's like to propose a behavior change.

For a single API as simple as this demo, it may be difficult to see the full benefit of spec-first development. However, imagine being a product owner in a large organization managing hundreds of production APIs. Having well-documented specifications, accessible from a central location like Insomnia Designer, allows anyone within the organization to quickly get up to speed on any API.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/spec-first-development-apis

作者：[Greg Schier][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gregschier
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.2.md
[3]: https://insomnia.rest/products/designer
[4]: https://openlibrary.org/developers/api
[5]: https://opensource.com/sites/default/files/uploads/insomnia_newdocument.png (Create a new document)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://yaml.org/
[8]: https://opensource.com/sites/default/files/uploads/insomnia_columns.png (Insomnia Designer UI with three columns)
[9]: https://opensource.com/sites/default/files/uploads/insomnia_error.png (Insomnia Designer UI error message)
[10]: https://opensource.com/sites/default/files/uploads/insomnia_response.png (Checking response in Insomnia Designer)
[11]: https://opensource.com/sites/default/files/uploads/insomnia_verifydefinition.png (Verifying spec definition in Insomnia)
[12]: https://support.insomnia.rest/article/96-git-sync
[13]: https://opensource.com/sites/default/files/uploads/insomnia_limit.png (Verifying things work as expected in Insomnia Designer)
