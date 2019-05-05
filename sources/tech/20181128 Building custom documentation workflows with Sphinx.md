[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Building custom documentation workflows with Sphinx)
[#]: via: (https://opensource.com/article/18/11/building-custom-workflows-sphinx)
[#]: author: ([Mark Meyer](https://opensource.com/users/ofosos))
[#]: url: ( )

Building custom documentation workflows with Sphinx
======
Create documentation the way that works best for you.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S)

[Sphinx][1] is a popular application for creating documentation, similar to JavaDoc or Jekyll. However, Sphinx's reStructured Text input allows for a higher degree of customization than those other tools.

This tutorial will explain how to customize Sphinx to suit your workflow. You can follow along using sample code on [GitHub][2].

### Some definitions

Sphinx goes far beyond just enabling you to style text with predefined tags. It allows you to shape and automate your documentation by defining new roles and directives. A role is a single word element that usually is rendered inline in your documentation, while a directive can contain more complex content. These can be contained in a domain.

A Sphinx domain is a collection of directives and roles as well as a few other things, such as an index definition. Your next Sphinx domain could be a specific programming language (Sphinx was developed to create Python's documentation). Or you might have a command line tool that implements the same command pattern (e.g., **tool <command> \--args**) over and over. You can document it with a custom domain, adding directives and indexes along the way.

Here's an example from our **recipe** domain:

```
The recipe contains `tomato` and `cilantro`.

.. rcp:recipe:: TomatoSoup
  :contains: tomato cilantro salt pepper  

  This recipe is a tasty tomato soup, combine all ingredients
  and cook.
```

Now that we've defined the recipe **TomatoSoup** , we can reference it anywhere in our documentation using the custom role **refef**. For example:

```
You can use the :rcp:reref:`TomatoSoup` recipe to feed your family.
```

This enables our recipes to show up in two indices: the first lists all recipes, and the second lists all recipes by ingredient.

### What's in a domain?

A Sphinx domain is a specialized container that ties together roles, directives, and indices, among other things. The domain has a name ( **rcp** ) to address its components in the documentation source. It announces its existence to Sphinx in the **setup()** method of the package. From there, Sphinx can find roles and directives, since these are part of the domain.

This domain also serves as the central catalog of objects in this sample. Using initial data, it defines two variables, **objects** and **obj2ingredient**. These contain a list of all objects defined (all recipes) and a hash that maps a canonical ingredient name to the list of objects.

```
initial_data = {
    'objects': [],  # object list
    'obj2ingredient': {},  # ingredient -> [objects]
}
```

The way we name objects is common across our extension. For each object created, the canonical name is **rcp. <typename>.<objectname>**, where **< typename>** is the Python type of the object, and **< objectname>** is the name the documentation writer gives the object. This enables the extension to use different object types that share the same name.

Having a canonical name and central place for our objects is a huge advantage. Both our indices and our cross-referencing code use this feature.

### Custom roles and directives

In our example, **.. rcp:recipe::** indicates a custom directive. You might think it's overly specific to create custom syntax for these items, but it illustrates the degree of customization you can get in Sphinx. This provides rich markup that structures documents and leads to better docs. Specialization allows us to extract information from our docs.

Our definition for this directive will provide minimal formatting, but it will be functional.

```
class RecipeNode(ObjectDescription):
  """A custom node that describes a recipe."""

  required_arguments = 1

  option_spec = {
    'contains': rst.directives.unchanged_required
  }
```

For this directive, **required_arguments** tells Sphinx to expect one parameter, the recipe name. **option_spec** lists the optional arguments, including their names. Finally, **has_content** specifies that there will be more reStructured Text as a child to this node.

We also implement multiple methods:

  * **handle_signature()** implements parsing the signature of the directive and passes on the object's name and type to its superclass
  * **add_taget_and_index()** adds a target (to link to) and an entry to the index for this node



### Creating indices

Both **IngredientIndex** and **RecipeIndex** are derived from Sphinx's **Index** class. They implement custom logic to generate a tuple of values that define the index. Note that **RecipeIndex** is a degenerate index that has only one entry. Extending it to cover more object types—and moving from a **RecipeDomain** to a **CookbookDomain** —is not yet part of the code.

Both indices use the method **generate()** to do their work. This method combines the information from our domain, sorts it, and returns it in a list structure that will be accepted by Sphinx. See the [Sphinx Domain API][3] page for more information.

The first time you visit the Domain API page, you may be a little overwhelmed by the structure. But our ingredient index is just a list of tuples, like **('tomato', 'TomatoSoup', 'test', 'rec-TomatoSoup',...)**.

### Referencing recipes

Adding cross-references is not difficult (but it's also not a given). Add an **XRefRole** to the domain and implement the method **resolve_xref()**. Having a custom role to reference a type allows us to unambiguously reference any object, even if two objects have the same name. If you look at the parameters of **resolve_xref()** in **Domain** , you'll see **typ** and **target**. These define the cross-reference type and its target name. We'll use **target** to resolve our destination from our domain's **objects** because we currently have only one type of node.

We can add the cross-reference role to **RecipeDomain** in the following way:

```
roles = {
    'reref': XRefRole()
}
```

There's nothing for us to implement. Defining a working **resolve_xref()** and attaching an **XRefRole** to the domain is all you need to do.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/building-custom-workflows-sphinx

作者：[Mark Meyer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ofosos
[b]: https://github.com/lujun9972
[1]: http://www.sphinx-doc.org/en/master/
[2]: https://github.com/ofosos/sphinxrecipes
[3]: https://www.sphinx-doc.org/en/master/extdev/domainapi.html#sphinx.domains.Index.generate
