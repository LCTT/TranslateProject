[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NGT: A library for high-speed approximate nearest neighbor search)
[#]: via: (https://opensource.com/article/19/10/ngt-open-source-library)
[#]: author: (Masajiro Iwasaki https://opensource.com/users/masajiro-iwasaki)

NGT: A library for high-speed approximate nearest neighbor search
======
NGT is a high-performing, open source deep learning library for
large-scale and high-dimensional vectors.
![Houses in a row][1]

Approximate nearest neighbor ([ANN][2]) search is used in deep learning to make a best guess at the point in a given set that is most similar to another point. This article explains the differences between ANN search and traditional search methods and introduces [NGT][3], a top-performing open source ANN library developed by [Yahoo! Japan Research][4].

### Nearest neighbor search for high-dimensional data

Different search methods are used for different data types. For example, full-text search is for text data, content-based image retrieval is for images, and relational databases are for data relationships. Deep learning models can easily generate vectors from various kinds of data so that the vector space has embedded relationships among source data. This means that if two source data are similar, the two vectors from the data will be located near each other in the vector space. Therefore, all you have to do is search the vectors instead of the source data.

Moreover, the vectors not only represent the text and image characteristics of the source data, but they also represent products, human beings, organizations, and so forth. Therefore, you can search for similar documents and images as well as products with similar attributes, human beings with similar skills, clothing with similar features, and so on. For example, [Yahoo! Japan][5] provides a similarity-based fashion-item search using NGT.

![Nearest neighbour search][6]

Since the number of dimensions in deep learning models tends to increase, ANN search methods are indispensable when searching for more than several million high-dimensional vectors. ANN search methods allow you to search for neighbors to the specified query vector in high-dimensional space.

There are many nearest-neighbor search methods to choose from. [ANN Benchmarks][7] evaluates the best-known ANN search methods, including Faiss (Facebook), Flann, and Hnswlib. According to this benchmark, NGT achieves top-level performance.

### NGT algorithms

The NGT index combines a graph and a tree. This result is a very good search performance, with the graph's vertices representing searchable objects. Neighboring vertices are connected by edges.

This animation shows how a graph is constructed.

![NGT graph construction][8]

In the search procedure, neighboring vertices to the specified query can be found descending the graph. Densely connected vertices enable users to explore the graph effectively.

![NGT graph][9]

NGT provides a command-line tool, along with C, C++, and Python APIs. This article focuses on the command-line tool and the Python API.

### Using NGT with the command-line tool

#### Linux installation

Download the [latest version of NGT][10] as a ZIP file and install it on Linux with:


```
unzip NGT-x.x.x.zip
cd NGT-x.x.x
mkdir build
cd build
cmake ..
make
make install
```

Since NGT libraries are installed in **/usr/local/lib(64)** by default, add the directory to the search path:


```
export PATH="$PATH:/opt/local/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
```

#### Sample dataset generation

Before you can search for a large-scale dataset, you must generate an NGT dataset. As an example, [download the][11] [fastText][11] [dataset][11] from the [fastText website][12], then convert it to the NGT registration format with:


```
curl -O <https://dl.fbaipublicfiles.com/fasttext/vectors-english/wiki-news-300d-1M-subword.vec.zip>
unzip wiki-news-300d-1M-subword.vec.zip
tail -n +2 wiki-news-300d-1M-subword.vec | cut -d " " -f 2- &gt; objects.ssv
```

**Objects.ssv** is a registration file that has 1 million objects. One object in the file is extracted as a query:


```
`head -10000 objects.ssv | tail -1 > query.ssv`
```

#### Index construction

An **ngt_index** can be constructed using the following command:


```
`ngt create -d 300 -D c index objects.ssv`
```

_-d_ specifies the number of dimensions of the vector. _-D c_ means using cosine similarity.

#### Approximate nearest neighbor search

The **ngt_index** can be searched for with the queries using:


```
`ngt search -n 10 index query.ssv`
```

**-n** specifies the number of resulting objects.

The search results are:


```
Query No.1
Rank    ID      Distance
1       10000   0
2       21516   0.184495
3       201860  0.240375
4       71865   0.241284
5       339589  0.267265
6       485158  0.280977
7       7961    0.283865
8       924513  0.286571
9       28870   0.286654
10      395274  0.290466
Query Time= 0.000972628 (sec), 0.972628 (msec)
Average Query Time= 0.000972628 (sec), 0.972628 (msec), (0.000972628/1)
```

Please see the [NGT command-line README][13] for more information.

### Using NGT from Python

Although NGT has C and C++ APIs, the [ngtpy][14] Python binding for NGT is the simplest option for programming.

#### Installing ngtpy

Install the Python binding (ngtpy) through PyPI with:


```
`pip3 install ngt`
```

#### Sample dataset generation

Generate data files for Python sample programs from the sample data set you downloaded by using this code:


```
dataset_path = 'wiki-news-300d-1M-subword.vec'
with open(dataset_path, 'r') as fi, open('objects.tsv', 'w') as fov,
open('words.tsv', 'w') as fow:
    n, dim = map(int, fi.readline().split())
    fov.write('{0}¥t{1}¥n'.format(n, dim))
    for line in fi:
        tokens = line.rstrip().split(' ')
        fow.write(tokens[0] + '¥n')
        fov.write('{0}¥n'.format('¥t'.join(tokens[1:])))
```

#### Index construction

Construct the NGT index with:


```
import ngtpy

index_path = 'index'
with open('objects.tsv', 'r') as fin:
    n, dim = map(int, fin.readline().split())
    ngtpy.create(index_path, dim, distance_type='Cosine') # create an index
    index = ngtpy.Index(index_path) # open the index
    print('inserting objects...')
    for line in fin:
        object = list(map(float, line.rstrip().split('¥t')))
        index.insert(object) # insert objects
print('building objects...')
index.build_index()
print('saving the index...')
index.save()
```

#### Approximate nearest neighbor search

Here is an example ANN search program:


```
import ngtpy

print('loading words...')
with open('words.tsv', 'r') as fin:
    words = list(map(lambda x: x.rstrip('¥n'), fin.readlines()))

index = ngtpy.Index('index', zero_based_numbering = False) # open index
query_id = 10000
query_object = index.get_object(query_id) # get the object for a query

result = index.search(query_object) # aproximate nearest neighbor search
print('Query={}'.format(words[query_id - 1]))
print('Rank¥tID¥tDistance¥tWord')
for rank, object in enumerate(result):
    print('{}¥t{}¥t{:.6f}¥t{}'.format(rank + 1, object[0], object[1], words[object[0] - 1]))
```

And here are the search results, which are the same as the NGT command-line option's results:


```
loading words...
Query=Horse
Rank    ID      Distance        Word
1       10000   0.000000        Horse
2       21516   0.184495        Horses
3       201860  0.240375        Horseback
4       71865   0.241284        Horseman
5       339589  0.267265        Prancing
6       485158  0.280977        Horsefly
7       7961    0.283865        Dog
8       924513  0.286571        Horsing
9       28870   0.286654        Pony
10      395274  0.290466        Blood-Horse
```

For more information, please see [ngtpy README][14].

Approximate nearest neighbor (ANN) principles are important features for analyzing data. Learning how to use it in your own projects, or to make sense of data that you're analyzing, is a powerful way to make correlations and interpret information. With NGT, you can use ANN in whatever way you require, or build upon it to add custom features.

Introduction to Apache Hadoop, an open source software framework for storage and large scale...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/ngt-open-source-library

作者：[Masajiro Iwasaki][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/masajiro-iwasaki
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/house_home_colors_live_building.jpg?itok=HLpsIfIL (Houses in a row)
[2]: https://en.wikipedia.org/wiki/Nearest_neighbor_search#Approximate_nearest_neighbor
[3]: https://github.com/yahoojapan/NGT
[4]: https://research-lab.yahoo.co.jp/en/
[5]: https://www.yahoo.co.jp/
[6]: https://opensource.com/sites/default/files/browser-visual-search_new.jpg (Nearest neighbour search)
[7]: https://github.com/erikbern/ann-benchmarks
[8]: https://opensource.com/sites/default/files/uploads/ngt_movie2.gif (NGT graph construction)
[9]: https://opensource.com/sites/default/files/uploads/ngt_movie1.gif (NGT graph)
[10]: https://github.com/yahoojapan/NGT/releases/latest
[11]: https://dl.fbaipublicfiles.com/fasttext/vectors-english/wiki-news-300d-1M-subword.vec.zip
[12]: https://fasttext.cc/
[13]: https://github.com/yahoojapan/NGT/blob/master/bin/ngt/README.md
[14]: https://github.com/yahoojapan/NGT/blob/master/python/README-ngtpy.md
