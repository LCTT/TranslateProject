[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Don't like loops? Try Java Streams)
[#]: via: (https://opensource.com/article/20/2/java-streams)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Don't like loops? Try Java Streams
======
It's 2020 and time to learn about Java Streams.
![Person drinking a hat drink at the computer][1]

In this article, I will explain how to not write loops anymore.

What? Whaddaya mean, no more loops?

Yep, that's my 2020 resolution—no more loops in Java. Understand that it's not that loops have failed me, nor have they led me astray (well, at least, I can argue that point). Really, it is that I, a Java programmer of modest abilities since 1997 or so, must finally learn about all this new [Streams][2] stuff, saying "what" I want to do and not "how" I want to do it, maybe being able to parallelize some of my computations, and all that other good stuff.

I'm guessing that there are other Java programmers out there who also have been programming in Java for a decent amount of time and are in the same boat. Therefore, I'm offering my experiences as a guide to "how to not write loops in Java anymore."

### Find a problem worth solving

If you're like me, then the first show-stopper you run into is "right, cool stuff, but what am I solving for, and how do I apply this?" I realized that I can spot the perfect opportunity camouflaged as _Something I've Done Before_.

In my case, it's sampling land cover within a specific area and coming up with an estimate and a confidence interval around that estimate for the land cover across the whole area. The specific problem involves deciding whether an area is "forested" or not, given a specific legal definition: if at least 10% of the soil is covered over by tree crowns, then the area is considered to be forested; otherwise, it's something else.

![Image of land cover in an area][3]

It's a pretty esoteric example of a recurring problem; I'll grant you. But there it is. For the ecologists and foresters out there who are accustomed to cool temperate or tropical forests, 10% might sound kind of low, but in the case of dry areas with low-growing shrubs and trees, that's a reasonable number.

So the basic idea is: use images to stratify the area (i.e., areas completely devoid of trees, areas of predominantly small trees spaced quite far apart, areas of predominantly small trees spaced closer together, areas of somewhat larger trees), locate some samples in those strata, send the crew out to measure the samples, analyze the results, and calculate the proportion of soil covered by tree crowns across the area. Simple, right?

![Survey team assessing land cover][4]

### What the field data looks like

In the current project, the samples are rectangular areas 20 meters wide by 25 meters long, so 500 square meters each. On each patch, the field crew measured each tree: its species, its height, the maximum and minimum width of its crown, and the diameter of its trunk at trunk height (nominally 30cm above the ground). This information was collected, entered into a spreadsheet, and exported to a bar separated value (BSV) file for me to analyze. It looks like this:

Stratum# | Sample# | Tree# | Species | Trunk diameter (cm) | Crown diameter 1 (m) | Crown diameter 2 (m) | Height (m)
---|---|---|---|---|---|---|---
1 | 1 | 1 | Ac | 6 | 3.6 | 4.6 | 2.4
1 | 1 | 2 | Ac | 6 | 2.2 | 2.3 | 2.5
1 | 1 | 3 | Ac | 16 | 2.5 | 1.7 | 2.4
1 | 1 | 4 | Ac | 6 | 1.5 | 2.1 | 1.8
1 | 1 | 5 | Ac | 5 | 0.9 | 1.7 | 1.7
1 | 1 | 6 | Ac | 6 | 1.7 | 1.3 | 1.6
1 | 1 | 7 | Ac | 5 | 1.82 | 1.32 | 1.8
1 | 1 | 1 | Ac | 1 | 0.3 | 0.25 | 0.9
1 | 1 | 2 | Ac | 2 | 1.2 | 1.2 | 1.7

The first column is the stratum number (where 1 is "predominantly small trees spaced quite far apart," 2 is "predominantly small trees spaced closer together," and 3 is "somewhat larger trees"; we didn't sample the areas "completely devoid of trees"). The second column is the sample number (there are 73 samples altogether, located in the three strata in proportion to the area of each stratum). The third column is the tree number within the sample. The fourth is the two-letter species code, the fifth the trunk diameter (in this case, 10cm above ground or exposed roots), the sixth the smallest distance across the crown, the seventh the largest distance, and the eighth the height of the tree.

For the purposes of this exercise, I'm only concerned with the total amount of ground covered by the tree crowns—not the species, nor the height, nor the diameter of the trunk.

In addition to the measurement information above, I also have the areas of the three strata, also in a BSV:

stratum | hectares
---|---
1 | 114.89
2 | 207.72
3 | 29.77

### What I want to do (not how I want to do it)

In keeping with one of the main design goals of Java Streams, here is "what" I want to do:

  1. Read the stratum area BSV and save the data as a lookup table.
  2. Read the measurements from the measurement BSV file.
  3. Accumulate each measurement (tree) to calculate the total area of the sample covered by tree crowns.
  4. Accumulate the sample tree crown area values and count the number of samples to estimate the mean tree crown area coverage and standard error of the mean for each stratum.
  5. Summarize the stratum figures.
  6. Weigh the stratum means and standard errors by the stratum areas (looked up from the table created in step 1) and accumulate them to estimate the mean tree crown area coverage and standard error of the mean for the total area.
  7. Summarize the weighted figures.



Generally speaking, the way to define "what" with Java Streams is by creating a stream processing pipeline of function calls that pass over the data. So, yes, there is actually a bit of "how" that ends up creeping in… in fact, quite a bit of "how." But, it needs a very different knowledge base than the good, old fashioned loop.

I'll go through each of these steps in detail.

#### Build the stratum area table

The first job is to convert the stratum areas BSV file to a lookup table:


```
[String][5] fileName = "stratum_areas.bsv";
Stream&lt;String&gt; inputLineStream = Files.lines(Paths.get(fileName));  // (1)

final Map&lt;[Integer][6],Double&gt; stratumAreas =   // (2)
    inputLineStream     // (3)
        .skip(1)                   // (4)
        .map(l -&gt; l.split("\\\|"))  // (5)
        .collect(                  // (6)
            Collectors.toMap(      // (7)
                a -&gt; [Integer][6].parseInt(a[0]),  // (8)
                a -&gt; [Double][7].parseDouble(a[1]) // (9)
            )
        );
inputLineStream.close();   // (10)

[System][8].out.println("stratumAreas = " + stratumAreas);  // (11)
```

I'll take this a line or two at a time, where the numbers in comments following the lines above—e.g., _// (3)_— correspond to the numbers below:

  1. java.nio.Files.lines() gives a stream of strings corresponding to lines in the file.
  2. The goal is to create the lookup table, **stratumAreas**, which is a **Map&lt;Integer,Double&gt;**. Therefore, I can get the **double** value area for stratum 2 as **stratumAreas.get(2)**.
  3. This is the beginning of the stream "pipeline."
  4. Skip the first line in the pipeline since it's the header line containing the column names.
  5. Use **map()** to split the **String** input line into an array of **String** fields, with the first field being the stratum # and the second being the stratum area.
  6. Use **collect()** to [materialize the results][9].
  7. The materialized result will be produced as a sequence of **Map** entries.
  8. The key of each map entry is the first element of the array in the pipeline—the **int** stratum number. By the way, this is a _Java lambda_ expression—[an anonymous function][10] that takes an argument and returns that argument converted to an **int**.
  9. The value of each map entry is the second element of the array in the pipeline—the **double** stratum area.
  10. Don't forget to close the stream (file).
  11. Print out the result, which looks like: [code]`stratumAreas = {1=114.89, 2=207.72, 3=29.77}`
```
### Build the measurements table and accumulate the measurements into the sample totals

Now that I have the stratum areas, I can start processing the main body of data—the measurements. I combine the two tasks of building the measurements table and accumulating the measurements into the sample totals since I don't have any interest in the measurement data per se.
```


fileName = "sample_data_for_testing.bsv";
inputLineStream = Files.lines(Paths.get(fileName));

 final Map&lt;[Integer][6],Map&lt;[Integer][6],Double&gt;&gt; sampleValues =
    inputLineStream
        .skip(1)
        .map(l -&gt; l.split("\\\|"))
        .collect(                  // (1)
            Collectors.groupingBy(a -&gt; [Integer][6].parseInt(a[0]),     // (2)
                Collectors.groupingBy(b -&gt; [Integer][6].parseInt(b[1]), // (3)
                    Collectors.summingDouble(                      // (4)
                        c -&gt; {                                     // (5)
                            double rm = ([Double][7].parseDouble(c[5]) +
                                [Double][7].parseDouble(c[6]))/4d;      // (6)
                            return rm*rm * [Math][11].PI / 500d;         // (7)
                        })
                )
            )
        );
inputLineStream.close();

[System][8].out.println("sampleValues = " + sampleValues);  // (8)

```
Again, a line or two or so at a time:

  1. The first seven lines are the same in this task and the previous, except the name of this lookup table is **sampleValues**; and it is a **Map** of **Map**s.
  2. The measurement data is grouped into samples (by sample #), which are, in turn, grouped into strata (by stratum #), so I use **Collectors.groupingBy()** at the topmost level [to separate data][12] into strata, with **a[0]** here being the stratum number.
  3. I use **Collectors.groupingBy()** once more to separate data into samples, with **b[1]** here being the sample number.
  4. I use the handy **Collectors.summingDouble()** [to accumulate the data][13] for each measurement within the sample within the stratum.
  5. Again, a Java lambda or anonymous function whose argument **c** is the array of fields, where this lambda has several lines of code that are surrounded by **{** and **}** with a **return** statement just before the **}**.
  6. Calculate the mean crown radius of the measurement.
  7. Calculate the crown area of the measurement as a proportion of the total sample area and return that value as the result of the lambda.
  8. Again, similar to the previous task. The result looks like (with some numbers elided): [code]`sampleValues = {1={1=0.09083231861452731, 66=0.06088002082602869, ... 28=0.0837823490804228}, 2={65=0.14738326403381743, 2=0.16961183847374103, ... 63=0.25083064794883453}, 3={64=0.3306323635177101, 32=0.25911911184680053, ... 30=0.2642668470291564}}`
```



This output shows the **Map** of **Map**s structure clearly—there are three entries in the top level corresponding to the strata 1, 2, and 3, and each stratum has subentries corresponding to the proportional area of the sample covered by tree crowns.

#### Accumulate the sample totals into the stratum means and standard errors

At this point, the task becomes more complex; I need to count the number of samples, sum up the sample values in preparation for calculating the sample mean, and sum up the squares of the sample values in preparation for calculating the standard error of the mean. I may as well incorporate the stratum area into this grouping of data as well, as I'll need it shortly to weigh the stratum results together.

So the first thing to do is create a class, **StratumAccumulator**, to handle the accumulation and provide the calculation of the interesting results. This class implements **java.util.function.DoubleConsumer**, which can be passed to **collect()** to handle accumulation:


```
class StratumAccumulator implements DoubleConsumer {
    private double ha;
    private int n;
    private double sum;
    private double ssq;
    public StratumAccumulator(double ha) { // (1)
        this.ha = ha;
        this.n = 0;
        this.sum = 0d;
        this.ssq = 0d;
    }
    public void accept(double d) { // (2)
        this.sum += d;
        this.ssq += d*d;
        this.n++;
    }
    public void combine(StratumAccumulator other) { // (3)
        this.sum += other.sum;
        this.ssq += other.ssq;
        this.n += other.n;
    }
    public double getHa() {  // (4)
        return this.ha;
    }
    public int getN() {  // (5)
        return this.n;
    }
    public double getMean() {  // (6)
        return this.n &gt; 0 ? this.sum / this.n : 0d;
    }
    public double getStandardError() {  // (7)
        double mean = this.getMean();
        double variance = this.n &gt; 1 ? (this.ssq - mean*mean*n)/(this.n - 1) : 0d;
        return this.n &gt; 0 ? [Math][11].sqrt(variance/this.n) : 0d;
    }
}
```

Line-by-line:

  1. The constructor **StratumAccumulator(double ha)** takes an argument, the area of the stratum in hectares, which allows me to merge the stratum area lookup table into instances of this class.
  2. The **accept(double d)** method is used to accumulate the stream of double values, and I use it to:
a. Count the number of values.
b. Sum the values in preparation for computing the sample mean.
c. Sum the squares of the values in preparation for computing the standard error of the mean.
  3. The **combine()** method is used to merge substreams of **StratumAccumulator**s (in case I want to process in parallel).
  4. The getter for the area of the stratum
  5. The getter for the number of samples in the stratum
  6. The getter for the mean sample value in the stratum
  7. The getter for the standard error of the mean in the stratum



Once I have this accumulator, I can use it to accumulate the sample values pertaining to each stratum:


```
final Map&lt;[Integer][6],StratumAccumulator&gt; stratumValues =   // (1)
    sampleValues.entrySet().stream()   // (2)
        .collect(                      // (3)
            Collectors.toMap(          // (4)
                e -&gt; e.getKey(),       // (5)
                e -&gt; e.getValue().entrySet().stream()   // (6)
                    .map([Map.Entry][14]::getValue)           // (7)
                    .collect(          // (8)
                        () -&gt; new StratumAccumulator(stratumAreas.get(e.getKey())),   // (9)
                        StratumAccumulator::accept,     // (10)
                        StratumAccumulator::combine)    // (11)
            )
        );
```

Line-by-line:

  1. This time, I'm using the pipeline to build **stratumValues**, which is a **Map&lt;Integer,StratumAccumulator&gt;**, so **stratumValues.get(3)** will return the **StratumAccumulator** instance for stratum 3.
  2. Here, I'm using the **entrySet().stream()** method provided by **Map** to get a stream of (key, value) pairs; recall these are **Map**s of sample values by stratum.
  3. Again, I'm using **collect()** to gather the pipeline results by stratum…
  4. using **Collectors.toMap()** to generate a stream of **Map** entries…
  5. whose keys are the key of the incoming stream (that is, the stratum #)…
  6. and whose values are the Map of sample values, and I again use **entrySet().stream()** to convert to a stream of Map entries, one for each sample.
  7. Using **map()** to get the value of the sample **Map** entry; I'm not interested in the key by this point.
  8. Yet again, using **collect()** to accumulate the sample results into the **StratumAccumulator** instances.
  9. Telling **collect()** how to create a new **StratumAccumulator**—I need to pass the stratum area into the constructor here, so I can't just use **StratumAccumulator::new**.
  10. Telling **collect()** to use the **accept()** method of **StratumAccumulator** to accumulate the stream of sample values.
  11. Telling **collect()** to use the **combine()** method of **StratumAccumulator** to merge **StratumAccumulator** instances.



#### Summarize the stratum figures

Whew! After all of that, printing out the stratum figures is pretty straightforward:


```
stratumValues.entrySet().stream()
    .forEach(e -&gt; {
        StratumAccumulator sa = e.getValue();
        int n = sa.getN();
        double se66 = sa.getStandardError();
        double t = new TDistribution(n - 1).inverseCumulativeProbability(0.975d);
        [System][8].out.printf("stratum %d n %d mean %g se66 %g t %g se95 %g ha %g\n",
            e.getKey(), n, sa.getMean(), se66, t, se66 * t, sa.getHa());
    });
```

In the above, once again, I use **entrySet().stream()** to transform the **stratumValues** Map to a stream, and then apply the **forEach()** method to the stream. **ForEach()** is pretty much what it sounds like—a loop! But the business of finding the head of the stream, finding the next element, and checking to see if hits the end is all handled by Java Streams. So, I just get to say what I want to do for each record, which is basically to print it out.

My code looks a bit more complicated because I declare some local variables to hold some intermediate results that I use more than once—**n**, the number of samples, and **se66**, the standard error of the mean. I also calculate the inverse T value to [convert my standard error of the mean to a 95% confidence interval][15].

The result looks like this:


```
stratum 1 n 24 mean 0.0903355 se66 0.0107786 t 2.06866 se95 0.0222973 ha 114.890
stratum 2 n 38 mean 0.154612 se66 0.00880498 t 2.02619 se95 0.0178406 ha 207.720
stratum 3 n 11 mean 0.223634 se66 0.0261662 t 2.22814 se95 0.0583020 ha 29.7700
```

#### Accumulate the stratum means and standard errors into the total

Once again, the task becomes more complex, so I create a class, **TotalAccumulator**, to handle the accumulation and provide the calculation of the interesting results. This class implements **java.util.function.Consumer&lt;T&gt;**, which can be passed to **collect()** to handle accumulation:


```
class TotalAccumulator implements Consumer&lt;StratumAccumulator&gt; {
    private double ha;
    private int n;
    private double sumWtdMeans;
    private double ssqWtdStandardErrors;
    public TotalAccumulator() {
        this.ha = 0d;
        this.n = 0;
        this.sumWtdMeans = 0d;
        this.ssqWtdStandardErrors = 0d;
    }
    public void accept(StratumAccumulator sa) {
        double saha = sa.getHa();
        double sase = sa.getStandardError();
        this.ha += saha;
        this.n += sa.getN();
        this.sumWtdMeans += saha * sa.getMean();
        this.ssqWtdStandardErrors += saha * saha * sase * sase;
    }
    public void combine(TotalAccumulator other) {
        this.ha += other.ha;
        this.n += other.n;
        this.sumWtdMeans += other.sumWtdMeans;
        this.ssqWtdStandardErrors += other.ssqWtdStandardErrors;
    }
    public double getHa() {
        return this.ha;
    }
    public int getN() {
        return this.n;
    }
    public double getMean() {
        return this.ha &gt; 0 ? this.sumWtdMeans / this.ha : 0d;
    }
    public double getStandardError() {
        return this.ha &gt; 0 ? [Math][11].sqrt(this.ssqWtdStandardErrors) / this.ha : 0;
    }
}
```

I'm not going to go into much detail on this, since it's structurally pretty similar to **StratumAccumulator**. Of main interest:

  1. The constructor takes no arguments, which simplifies its use.
  2. The **accept()** method accumulates instances of **StratumAccumulator**, not **double** values, hence the use of the **Consumer&lt;T&gt;** interface.
  3. As for the calculations, they are assembling a weighted average of the **StratumAccumulator** instances, so they make use of the stratum areas, and the formulas might look a bit strange to anyone who's not used to stratified sampling.



As for actually carrying out the work, it's easy-peasy:


```
final TotalAccumulator totalValues =
    stratumValues.entrySet().stream()
        .map([Map.Entry][14]::getValue)
        .collect(TotalAccumulator::new, TotalAccumulator::accept, TotalAccumulator::combine);
```

Same old stuff as before:

  1. Use **entrySet().stream()** to convert the **stratumValue Map** entries to a stream.
  2. Use **map()** to replace the **Map** entries with their values—the instances of **StratumAccumulator**.
  3. Use **collect()** to apply the **TotalAccumulator** to the instances of **StratumAccumulator**.



#### Summarize the total figures

Getting the interesting bits out of the **TotalAccumulator** instance is also pretty straightforward:


```
int nT = totalValues.getN();
double se66T = totalValues.getStandardError();
double tT = new TDistribution(nT - stratumValues.size()).inverseCumulativeProbability(0.975d);
[System][8].out.printf("total n %d mean %g se66 %g t %g se95 %g ha %g\n",
    nT, totalValues.getMean(), se66T, tT, se66T * tT, totalValues.getHa());
```

Similar to the **StratumAccumulator**, I just call the relevant getters to pick out the number of samples **nT** and the standard error **se66T**. I calculate the T value **tT** (using "n – 3" here since there are three strata), and then I print the result, which looks like this:


```
`total n 73 mean 0.139487 se66 0.00664653 t 1.99444 se95 0.0132561 ha 352.380`
```

### In conclusion

Wow, that looks like a bit of a marathon. It feels like it, too. As is often the case, there is a great deal of information about how to use Java Streams, all illustrated with toy examples, which kind of help, but not really. I found that getting this to work with a real-world (albeit very simple) example was difficult.

Because I've been working in [Groovy][16] a lot lately, I kept finding myself wanting to accumulate into "maps of maps of maps" rather than creating accumulator classes, but I was never able to pull that off except in the case of totaling up the measurements in the sample. So, I worked with accumulator classes instead of maps of maps, and maps of accumulator classes instead of maps of maps of maps.

I don't feel like any kind of master of Java Streams at this point, but I do feel I have a pretty solid understanding of **collect()**, which is deeply important, along with various methods to reformat data structures into streams and to reformat stream elements themselves. So yeah, more to learn!

Speaking of collect(), in the examples I presented above, we can see moving from a very simple use of this fundamental method - using the Collectors.summingDouble() accumulation method - through defining an accumulator class that extends one of the pre-defined interfaces - in this case DoubleConsumer - to defining a full-blown accumulator of our own, used to accumulate the intermediate stratum class. I was tempted - sort of - to work backward and implement fully custom accumulators for the stratum and sample accumulators, but the point of this exercise was to learn more about Java Streams, not to become an expert in one single part of it all.

What's your experience with Java Streams? Done anything big and complicated yet? Please share it in the comments.

Optimizing your Java code requires an understanding of how the different elements in Java interact...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/java-streams

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: https://docs.oracle.com/javase/8/docs/api/java/util/stream/package-summary.html
[3]: https://opensource.com/sites/default/files/uploads/landcover.png (Image of land cover in an area)
[4]: https://opensource.com/sites/default/files/uploads/foresters.jpg (Survey team assessing land cover)
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+integer
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+double
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[9]: https://www.baeldung.com/java-8-collectors
[10]: https://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html
[11]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+math
[12]: https://www.baeldung.com/java-groupingby-collector
[13]: http://www.java2s.com/Tutorials/Java/java.util.stream/Collectors/Collectors.summingDouble_ToDoubleFunction_super_T_mapper_.htm
[14]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+map.entry
[15]: https://en.wikipedia.org/wiki/Standard_error
[16]: http://groovy-lang.org/
