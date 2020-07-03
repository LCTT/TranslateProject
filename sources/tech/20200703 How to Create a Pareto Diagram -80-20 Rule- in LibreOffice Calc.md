[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Create a Pareto Diagram [80/20 Rule] in LibreOffice Calc)
[#]: via: (https://itsfoss.com/pareto-chart-libreoffice/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

How to Create a Pareto Diagram [80/20 Rule] in LibreOffice Calc
======

_**Brief: In this LibreOffice tip, you’ll learn to create the famous Pareto chart in Calc.**_

The [Pareto Principle][1], also known as the 80/20 Rule, The Law of the Vital Few and The Principle of Factor Sparsity, illustrates that 80% of effects arise from 20% of the causes – or in layman’s terms – 20% of your actions/activities will account for 80% of your results/outcomes.

Although the original observation is related to [economics][2], it can be widely adopted and used across all aspects of business, economics, mathematics, and processes. In computer science, the Pareto principle can be used in [software optimization][3].

Let me show you how to create a Pareto diagram in [LibreOffice][4] spreadsheet tool, i.e. Calc.

### Creating Pareto diagram in LibreOffice Calc

![][5]

To be able to create a Pareto diagram, you need these three basic elements:

  * The factors, ranked by the magnitude of their contribution
  * The factors expressed numerically
  * The cumulative-percent-of-total effect of the ranked factors



First, enter the data in a spreadsheet. Now let’s get started!

#### Step 1: Sort the data

Mark all rows from first to the last and at the **Data** tab click on the Sort option. At the **Sort Criteria** tab choose **Sort key 1** and change the entry to **Number of Errors** or whichever name you choose. Make sure to tick **Descending** and finally **OK**.

![][6]

#### Step 2: Create the Cumulative Percentage values

To calculate the cumulative percent of a total, you will need one formula for the first cell (C5) and a different formula for cells C6 and below.

**Generic formula for the first cell**

```
=amount/total
```

**In the example shown, the formula in C5 is:** =B5/$B$15

**Generic formula for the remaining cells**:

```
=(amount/total)+previous cell result
```

**In the example shown, the formula in C6 is:** =(B6/$B$15)+C5

By dragging the fill handle down, you will get the correct formulas for the remaining cells.

![][7]

#### Step 3: Create the Pareto diagram

To create the chart go to **Insert** tab and then click on the **Chart** option.

In the upcoming Chart Wizard choose the chart type **Column and Line** with **Number of lines** set to 1 and click Next.

![][8]

Select the correct data range **$A$4:$C$14** by either using your mouse in the data range selector or by entering it manually. Leave the settings **Data series in columns**, **First row as label**, **First column as label** and click Next.

![][9]

The following Data Series window should have everything filled in correctly, click Next.

![][10]

In the last window enter titles and remove the legend:

  * Title: Pareto chart
  * X axis: Error Type
  * Y axis: Number of Errors
  * Untick **Display legend**
  * click **Finish**.



![][11]

And this is the result:

![][12]

If the red line appears without any value, select it, then right click &gt; Format Data Series &gt; Align Data Series to Secondary y-Axis &gt; Click OK.

#### Step 4: Fine tune the chart

The range of the secondary y-axis is set to **0 – 120** , it needs to be up to **100**.

Double click on the secondary y-axis . In the **Scale** tab, untick **Automatic** and **enter 100** as the maximum value. Then click ok.

![][13]

All done!

![][14]

**Conclusion**

Using a Pareto chart to analyze problems in a business project allows focusing efforts towards the ones offering the most considerable improvement potential.

This is one of the many real-life scenario where I have used LibreOffice instead of other proprietary office software. I hope to share more LibreOffice tutorials on It’s FOSS. Meanwhile, you can [learn these rather hidden LibreOffice tips][15].

Which LibreOffice functionality do you use the most? Let us know at the comments below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/pareto-chart-libreoffice/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://betterexplained.com/articles/understanding-the-pareto-principle-the-8020-rule/
[2]: https://en.wikipedia.org/wiki/Pareto_principle#In_economics
[3]: https://en.wikipedia.org/wiki/Program_optimization#Bottlenecks
[4]: https://www.libreoffice.org/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/pareto-libreoffice.png?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/1.-sort-the-data.png?ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/2.-cumulative-percent.png?ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/3.chart_.png?ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/5.data-range.png?ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/6.data-series.png?fit=800%2C381&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/7.chart-elements.png?fit=800%2C381&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/8.Pareto-chart.png?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/9.fine-tune.png?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/10.final_.png?ssl=1
[15]: https://itsfoss.com/libreoffice-tips/
