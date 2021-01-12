[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: (sss)
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Research log: gene signatures and connectivity map)
[#]: via: (https://www.jtolio.com/2015/11/research-log-gene-signatures-and-connectivity-map)
[#]: author: (jtolio.com https://www.jtolio.com/)

Research log: gene signatures and connectivity map
======

Happy Thanksgiving everyone!

### Context

This is the third post in my continuing series on my attempts at research. Previously we talked about:

  * [what I’m doing, cell states, and microarrays][1]
  * and then [more about microarrays and R][2].



By the end of last week we had discussed how to get a table of normalized gene expression intensities that looks like this:

```
ENSG00000280099_at            0.15484421
ENSG00000280109_at            0.16881395
ENSG00000280178_at           -0.19621641
ENSG00000280316_at            0.08622216
ENSG00000280401_at            0.15966256
ENSG00000281205_at           -0.02085352
...
```

The reason for doing this is to figure out which genes are related, and perhaps more importantly, what a cell is even doing.

_Summary:_ new post, also, I’m bringing back the short section summaries.

### Cell lines

The first thing to do when trying to figure out what cells are doing is to choose a cell. There’s all sorts of cells. Healthy brain cells, cancerous blood cells, bruised skin cells, etc.

For any experiment, you’ll need a control to eliminate noise and apply statistical tests for validity. If you don’t use a control, the effect you’re seeing may not even exist, and so for any experiment with cells, you will need a control cell.

Cells often divide, which means that a cell, once chosen, will duplicate itself for you in the presence of the appropriate resources. Not all cells divide ad nauseam which provides some challenges, but many cells under study luckily do.

So, a _cell line_ is simply a set of cells that have all replicated from a specific chosen initial cell. Any set of cells from a cell line will be as identical as possible (unless you screwed up! geez). They will be the same type of cell with the same traits and behaviors, at least, as much as possible.

_Summary:_ a cell line is a large amount of cells that are as close to being the same as possible.

### Perturbagens

There are many things that might affect what a cell is doing. Drugs, agitation, temperature, disease, cancer, gene splicing, small molecules (maybe you give a cell more iron or calcium or something), hormones, light, Jello, ennui, etc. Given any particular cell line, giving a cell from that cell line one of these _perturbagens_, or, perturbing the cell in a specific way, when compared to a control will say what that cell does differently in the face of that perturbagen.

If you’d like to find out what exactly a certain type of cell does when you give it lemon lime soda, then you choose the right cell line, leave out some control cells and give the rest of the cells soda.

Then, you measure gene expression intensities for both the control cells and the perturbed cells. The _differential expression_ of genes between the perturbed cells and the controls cells is likely due to the introduction of the lemon lime soda.

Genes that end up getting expressed _more_ in the presence of the soda are considered _up-regulated_, whereas genes that end up getting expressed _less_ are considered _down-regulated_. The degree to which a gene is up or down regulated constitutes how much of an effect the soda may have had on that gene.

Of course, all of this has such a significant amount of experimental noise that you could find pretty much anything. You’ll need to replicate your experiment independently a few times before you publish that lemon lime soda causes increased expression in the [Sonic hedgehog gene][3].

_Summary:_ A perturbagen is something you introduce/do to a cell to change its behavior, such as drugs or throwing it at a wall or something. The wall perturbagen.

### Gene signature

For a given change or perturbagen to a cell, we now have enough to compute lists of up-regulated and down-regulated genes and the magnitude change in expression for each gene.

This gene expression pattern for some subset of important genes (perhaps the most changed in expression) is called a _gene signature_, and gene signatures are very useful. By comparing signatures, you can:

  * identify or compare cell states
  * find sets of positively or negatively correlated genes
  * find similar disease signatures
  * find similar drug signatures
  * find drug signatures that might counteract opposite disease signatures.



(That last bullet point is essentially where I’m headed with my research.)

_Summary:_ a gene signature is a short summary of the most important gene expression differences a perturbagen causes in a cell.

### Drugs!

The pharmaceutical industry is constantly on the lookout for new breakthrough drugs that might represent huge windfalls in cash, and drugs don’t always work as planned. Many drugs spend years in research and development, only to ultimately find poor efficacy or adoption. Sometimes drugs even become known [much more for their side-effects than their originally intended therapy][4].

The practical upshot is that there’s countless FDA-approved drugs that represent decades of work that are simply underused or even unused entirely. These drugs have already cleared many challenging regulatory hurdles, but are simply and quite literally cures looking for a disease.

If even just one of these drugs can be given a new lease on life for some yet-to-be-cured disease, then perhaps we can give some people new leases on life!

_Summary:_ instead of developing new drugs, there’s already lots of drugs that aren’t being used. Maybe we can find matching diseases!

### The Connectivity Map project

The [Broad Institute’s Connectivity Map project][5] isn’t particularly new anymore, but it represents a ground breaking and promising idea - we can dump a bunch of signatures into a database and construct all sorts of new hypotheses we might not even have thought to check before.

To prove out the ussssefulness of this idea, the Connectivity Map (or cmap) project chose 5 different cell lines (all cancer cells, which are easy to get to replicate!) and a library of FDA approved drugs, and then gave some cells these drugs.

They then constructed a database of all of the signatures they computed for each possible perturbagen they measured. Finally, they constructed a web interface where a user can upload a gene signature and get a result list back of all of the signatures they collected, ordered by the most to least similar. You can totally go sign up and [try it out][5].

This simple tool is surprisingly powerful. It allows you to find similar drugs to a drug you know, but it also allows you to find drugs that might counteract a disease you’ve created a signature for.

Ultimately, the project led to [a number of successful applications][6]. So useful was it that the Broad Institute has doubled down and created the much larger and more comprehensive [LINCS Project][7] that targets an order of magnitude more cell lines (77) and more perturbagens (42,532, compared to cmap’s 6100). You can sign up and use that one too!

_Summary_: building a system that supports querying signature connections has already proved to be super useful.

### Whew

Alright, I wrote most of this on a plane yesterday but since I should now be spending time with family I’m going to cut it short here.

Stay tuned for next week!

--------------------------------------------------------------------------------

via: https://www.jtolio.com/2015/11/research-log-gene-signatures-and-connectivity-map

作者：[jtolio.com][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.jtolio.com/
[b]: https://github.com/lujun9972
[1]: https://www.jtolio.com/writing/2015/11/research-log-cell-states-and-microarrays/
[2]: https://www.jtolio.com/writing/2015/11/research-log-r-and-more-microarrays/
[3]: https://en.wikipedia.org/wiki/Sonic_hedgehog
[4]: https://en.wikipedia.org/wiki/Sildenafil#History
[5]: https://www.broadinstitute.org/cmap/
[6]: https://www.broadinstitute.org/cmap/publications.jsp
[7]: http://www.lincscloud.org/
