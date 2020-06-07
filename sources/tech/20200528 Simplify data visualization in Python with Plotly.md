[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Simplify data visualization in Python with Plotly)
[#]: via: (https://opensource.com/article/20/5/plotly-python)
[#]: author: (Shaun Taylor-Morgan https://opensource.com/users/shaun-taylor-morgan)

Simplify data visualization in Python with Plotly
======
Plotly is a data plotting library with a clean interface designed to
allow you to build your own APIs.
![Colorful sound wave graph][1]

Plotly is a plotting ecosystem that allows you to make plots in [Python][2], as well as JavaScript and R. In this series of articles, I'm focusing on [plotting with Python libraries][3].

Plotly has three different Python APIs, giving you a choice of how to drive it:

  * An [object-oriented API][4] that feels similar to Matplotlib
  * A [data-driven API][5] that specifies plots by constructing dictionaries of JSON-like data
  * A ["Plotly Express" API][6] that gives you high-level plotting functions similar to Seaborn



I'll explore each of these APIs by making the same plot in each one: a grouped bar plot of historical UK election results.

### Making plots using Graph Objects

Plotly's object-oriented API is named graph_objects. It's somewhat similar to [Matplotlib's object-oriented API][7].

To create a multi-bar plot, you can construct a figure object containing four bar plots:


```
    # Import Plotly and our data
    import plotly.graph_objects as go
    from votes import wide as df

    # Get a convenient list of x-values
    years = df['year']
    x = list(range(len(years)))

    # Specify the plots
    bar_plots = [
      go.Bar(x=x, y=df['conservative'], name='Conservative', marker=go.bar.Marker(color='#0343df')),
      go.Bar(x=x, y=df['labour'], name='Labour', marker=go.bar.Marker(color='#e50000')),
      go.Bar(x=x, y=df['liberal'], name='Liberal', marker=go.bar.Marker(color='#ffff14')),
      go.Bar(x=x, y=df['others'], name='Others', marker=go.bar.Marker(color='#929591')),
    ]
   
    # Specify the layout
    layout = go.Layout(
      title=go.layout.Title(text="Election results", x=0.5),
      yaxis_title="Seats",
      xaxis_tickmode="array",
      xaxis_tickvals=list(range(27)),
      xaxis_ticktext=tuple(df['year'].values),
    )
       
    # Make the multi-bar plot
    fig = go.Figure(data=bar_plots, layout=layout)

    # Tell Plotly to render it
    fig.show()
```

Unlike in Matplotlib, there's no need to calculate the x-positions of the bars manually; Plotly takes care of that for you.

Here's the final plot:

![A multi-bar plot made using Graph Objects][8]

A multi-bar plot made using Graph Objects (© 2019 [Anvil][9])

### Making plots using Python data structures

You can also specify your plot using basic Python data structures with the same structure as the object-oriented API. This corresponds directly to the JSON API for Plotly's JavaScript implementation.


```
    # Specify the plots
    fig = {
        'data': [
            {'type': 'bar', 'x': x, 'y': df['conservative'], 'name': 'Conservative', 'marker': {'color': '#0343df'}},
            {'type': 'bar', 'x': x, 'y': df['labour'], 'name': 'Labour', 'marker': {'color': '#e50000'}},
            {'type': 'bar', 'x': x, 'y': df['liberal'], 'name': 'Liberal', 'marker': {'color': '#ffff14'}},
            {'type': 'bar', 'x': x, 'y': df['others'], 'name': 'Others', 'marker': {'color': '#929591'}},
        ],
        'layout': {
            'title': {'text': 'Election results', 'x': 0.5},
            'yaxis': {'title': 'Seats'},
            'xaxis': {
                'tickmode': 'array',
                'tickvals': list(range(27)),
                'ticktext': tuple(df['year'].values),
            }
        }
    }

    # Tell Plotly to render it
    pio.show(fig)
```

The final plot looks exactly the same as the previous plot:

![A multi-bar plot made using JSON-like data structures][10]

A multi-bar plot made using JSON-like data structures (© 2019 [Anvil][9])

### Making plots using Plotly Express

[Plotly Express][11] is a high-level API that wraps Graph Objects.

You can make a multi-bar plot in Plotly Express using (almost) a single line:


```
    # Import Plotly and our data
    import plotly.express as px
    from votes import long as df

    # Define the colourmap to get custom bar colours
    cmap = {
        'Conservative': '#0343df',
        'Labour': '#e50000',
        'Liberal': '#ffff14',
        'Others': '#929591',
    }
   
    # Make the plot!
    fig = px.bar(df, x="year", y="seats", color="party", barmode="group", color_discrete_map=cmap)
```

This makes use of the data in [Long Form][12], also known as "tidy data." The columns are year, party, and seats, rather than being split by party. It's very similar to making a multi-bar plot in [Seaborn][13].


```
&gt;&gt; print(long)
     year         party  seats
0    1922  Conservative    344
1    1923  Conservative    258
2    1924  Conservative    412
3    1929  Conservative    260
4    1931  Conservative    470
..    ...           ...    ...
103  2005        Others     30
104  2010        Others     29
105  2015        Others     80
106  2017        Others     59
107  2019        Others     72

[108 rows x 3 columns]
```

You can access the underlying Graph Objects API to make detailed tweaks. Add a title and a y-axis label:


```
    # Use the Graph Objects API to tweak our plot
    import plotly.graph_objects as go
    fig.layout = go.Layout(
        title=go.layout.Title(text="Election results", x=0.5),
        yaxis_title="Seats",
    )
```

And finally, ask Plotly to show it to you:


```
    # Tell Plotly to render it
    fig.show()
```

This runs a temporary web server on an unused port and opens the default web browser to view the plot (the webserver is immediately torn down).

Unfortunately, the result is not perfect. The x-axis is treated as an integer, so the groups are far apart and small. This makes it quite difficult to see trends.

![A multi-bar plot made using Plotly Express][14]

A multi-bar plot made using Plotly Express (© 2019 [Anvil][9])

You might try to encourage Plotly Express to treat the x-values as strings by casting them to strings. You might expect this to result in them being plotted with even spacing and lexical ordering. Unfortunately, you still get them helpfully spaced numerically. Setting the xaxis_tickvals does not work as it did in graph_objects, either.

Unlike the similar example in [Seaborn][13], in this case, the abstraction does not appear to provide sufficient [escape hatches][15] to provide things exactly how you want them. But perhaps you could write your _own_ API?

### Building your own Plotly API

Not happy with how Plotly does something? Build your own Plotly API!

At its core, Plotly is a JavaScript library that makes plots using [D3][16] and [stack.gl][17]. The JavaScript library has an interface that consumes JSON structures that specify plots. So you just need to output JSON structures that the JavaScript library likes to consume.

Anvil did that to create a Python Plotly API that works entirely in the browser.

![Plotly uses a JavaScript library to create plots, driven by libraries in other languages via JSON][18]

Plotly uses a JavaScript library to create plots, driven by libraries in other languages via JSON (© 2019 [Anvil][9])

In the Anvil version, you can use both the Graph Objects API and the Python data structure approach explained above. You run exactly the same commands, assigning the data and layout to a [Plot component][19] in your Anvil app.

Here's the multi-bar plot written in Anvil's client-side Python API:


```
# Import Anvil libraries
from ._anvil_designer import EntrypointTemplate
from anvil import *
import anvil.server

# Import client-side Plotly
import plotly.graph_objs as go

# This is an Anvil Form
class Entrypoint(EntrypointTemplate):
  def __init__(self, **properties):
    # Set Form properties and Data Bindings.
    self.init_components(**properties)

    # Fetch the data from the server
    data = anvil.server.call('get_election_data')
   
    #  Get a convenient list of x-values
    years = data['year']
    x = list(range(len(years)))

    # Specify the plots
    bar_plots = [
      go.Bar(x=x, y=data['conservative'], name='Conservative', marker=go.Marker(color='#0343df')),
      go.Bar(x=x, y=data['labour'], name='Labour', marker=go.Marker(color='#e50000')),
      go.Bar(x=x, y=data['liberal'], name='Liberal', marker=go.Marker(color='#ffff14')),
      go.Bar(x=x, y=data['others'], name='Others', marker=go.Marker(color='#929591')),
    ]
    # Specify the layout
    layout = {
      'title': 'Election results',
      'yaxis': {'title': 'Seats'},
      'xaxis': {
        'tickmode': 'array',
        'tickvals': list(range(27)),
        'ticktext': data['year'],
      },
    }

    # Make the multi-bar plot
    self.plot_1.data = bar_plots
    self.plot_1.layout = layout
```

The plotting logic is the same as above, but it's running _entirely in the web browser_—the plot is created by the Plotly JavaScript library on the user's machine! This is a big advantage over all the other [Python plotting libraries][3] in this series. All the other Python libraries need to run on a server.

Here's the interactive Plotly plot running in an Anvil app:

![The election plot on the web using Anvil's client-side-Python Plotly library][20]

The election plot on the web using Anvil's [client-side-Python][21] Plotly library (© 2019 [Anvil][9])

You can [copy this example][22] as an Anvil app (Note: Anvil requires registration to use).

Running Plotly in the frontend has another advantage: it opens up many more options for customizing interactive behavior.

### Customizing interactivity in Plotly

Plotly plots aren't just dynamic; you can customize their interactive behavior. For example, you can customize the format of tool-tips using hovertemplate in each bar plot:


```
    go.Bar(
      x=x,
      y=df['others'],
      name='others',
      marker=go.bar.Marker(color='#929591'),
      hovertemplate='Seats: &lt;b&gt;%{y}&lt;/b&gt;',
    ),
```

Here's what you get when you apply this to each bar plot:

![A multi-bar plot with custom tool-tips][23]

A multi-bar plot with custom tool-tips (© 2019 [Anvil][9])

This is useful, but it would be even better if you could execute any code you want when certain events happen—like when a user hovers over the bar and you want to display an information box about the relevant election. In Anvil's Plotly library, you can bind event handlers to events such as hover, which makes that sort of complex interactivity possible!

![A multi-bar plot with a hover event handler][24]

A multi-bar plot with a hover event handler (© 2019 [Anvil][9])

You can achieve this by binding a method to the plot's hover event:


```
  def plot_1_hover(self, points, **event_args):
    """This method is called when a data point is hovered."""
    i = points[0]['point_number']
    self.label_year.text = self.data['year'][i]
    self.label_con.text = self.data['conservative'][i]
    self.label_lab.text = self.data['labour'][i]
    self.label_lib.text = self.data['liberal'][i]
    self.label_oth.text = self.data['others'][i]
    url = f"<https://en.wikipedia.org/wiki/{self.data\['year'\]\[i\]}\_United\_Kingdom\_general\_election>"
    self.link_more_info.text = url
    self.link_more_info.url = url
```

This is a rather extreme level of interactivity, and from the developer's point of view, an extreme level of customizability. It's all thanks to Plotly's architecture—Plotly has a clean interface that is explicitly designed to allow you to build your own APIs. It would be helpful to see this kind of great design everywhere!

### Custom interactivity using Bokeh

You've seen how Plotly uses JavaScript to create dynamic plots, and you can edit them live in the browser using Anvil's client-side Python code.

Bokeh is another Python plotting library that outputs an HTML document you can embed in a web app and get similar dynamic features to those provided by Plotly. (That's "BOE-kay," if you're wondering how to pronounce it.)

Enjoy customizing charts and share tips and tricks in the comments below.

* * *

_This article is based on [How to make plots using Plotly][9] on Anvil's blog and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/plotly-python

作者：[Shaun Taylor-Morgan][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shaun-taylor-morgan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colorful_sound_wave.png?itok=jlUJG0bM (Colorful sound wave graph)
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/20/4/plot-data-python
[4]: tmp.c4bQMTUIxx#GraphObjects
[5]: tmp.c4bQMTUIxx#DataDrivenAPI
[6]: tmp.c4bQMTUIxx#PlotlyExpress
[7]: https://opensource.com/article/20/5/matplotlib-python
[8]: https://opensource.com/sites/default/files/uploads/plotly.png (A multi-bar plot made using Graph Objects)
[9]: https://anvil.works/blog/plotting-in-plotly
[10]: https://opensource.com/sites/default/files/uploads/plotly-pio.png (A multi-bar plot made using JSON-like data structures)
[11]: https://plot.ly/python/plotly-express/
[12]: https://anvil.works/blog/tidy-data
[13]: https://opensource.com/article/20/5/seaborn-visualization-python
[14]: https://opensource.com/sites/default/files/uploads/plotly-express.png (A multi-bar plot made using Plotly Express)
[15]: https://anvil.works/blog/escape-hatches-and-ejector-seats
[16]: https://d3js.org/
[17]: http://stack.gl/
[18]: https://opensource.com/sites/default/files/uploads/plotly-arch.png (Plotly uses a JavaScript library to create plots, driven by libraries in other languages via JSON)
[19]: https://anvil.works/docs/client/components/plots
[20]: https://opensource.com/sites/default/files/uploads/plotting-in-anvil.gif (The election plot on the web using Anvil's client-side-Python Plotly library)
[21]: https://anvil.works/docs/client/python
[22]: https://anvil.works/login?app-name=Plotting%20in%20Plotly&app-author=shaun%40anvil.works
[23]: https://opensource.com/sites/default/files/uploads/plotly-tooltips.png (A multi-bar plot with custom tool-tips)
[24]: https://opensource.com/sites/default/files/uploads/plotly-event-handling.gif (A multi-bar plot with a hover event handler)
