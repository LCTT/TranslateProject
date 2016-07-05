Advanced Image Processing with Python
======================================

![](http://www.cuelogic.com/blog/wp-content/uploads/2016/06/Image-Search-Engine.png)

Building an image processing search engine is no easy task. There are several concepts, tools, ideas and technologies that go into it. One of the major image-processing concepts is reverse image querying (RIQ) or reverse image search. Google, Cloudera, Sumo Logic and Birst are among the top organizations to use reverse image search. Great for analyzing images and making use of mined data, RIQ provides a very good insight into analytics.

### Top Companies and Reverse Image Search

There are many top tech companies that are using RIQ to best effect. For example, Pinterest first brought in visual search in 2014. It subsequently released a white paper in 2015, revealing the architecture. Reverse image search enabled Pinterest to obtain visual features from fashion objects and display similar product recommendations.

As is generally known, Google images uses reverse image search allowing users to upload an image and then search for connected images. The submitted image is analyzed and a mathematical model made out of it, by advanced algorithm use. The image is then compared with innumerable others in the Google databases before results are matched and similar results obtained.

**Here is a graph representation from the OpenCV 2.4.9 Features Comparison Report:**

![](http://www.cuelogic.com/blog/wp-content/uploads/2016/06/search-engine-graph.jpg)

### Algorithms & Python Libraries 

Before we get down to the workings of it, let us rush through the main elements that make building an image processing search engine with Python possible:

### Patented Algorithms

#### SIFT (Scale-Invariant Feature Transform) Algorithm

1. A patented technology with nonfree functionality that uses image identifiers in order to identify a similar image, even those clicked from different angles, sizes, depths and scale, that they are included in the search results. Check the detailed video on SIFT here.
2. SIFT correctly matches the search criteria with a large database of features from many images.
3. Matching same images with different viewpoints and matching invariant features to obtain search results is another SIFT feature. Read more about scale-invariant keypoints here.

#### SURF (Speeded Up Robust Features) Algorithm

1. [SURF][1] is also patented with nonfree functionality and a more ‘speeded’ up version of SIFT. Unlike SIFT, SURF approximates Laplacian of Gaussian (unlike SIFT) with Box Filter. 

2. SURF relies on the determinant of Hessian Matrix for both its location and scale.

3. Rotation invariance is not a requisite in many applications. So not finding this orientation speeds up the process.

4. SURF includes several features that the speed improved in each step. Three times faster than SIFT, SURF is great with rotation and blurring. It is not as great in illumination and viewpoint change though.

5. Open CV, a programming function library provides SURF functionalities. SURF.compute() and SURF. Detect() can be used to find descriptors and keypoints. Read more about SURF [here][2].

### Open Source Algorithms

#### KAZE Algorithm

1.KAZE is a open source 2D multiscale and novel feature detection and description algorithm in nonlinear scale spaces. Efficient techniques in Additive Operator Splitting (AOS) and variable conductance diffusion is used to build the nonlinear scale space.

2. Multiscale image processing basics are simple – Creating an image’s scale space while filtering original image with right function over enhancing time or scale.

#### AKAZE (Accelerated-KAZE) Algorithm

1. As the name suggests, this is a faster mode to image search, finding matching keypoints between two images. AKAZE uses a binary descriptor and nonlinear scale space that balances accuracy and speed.

#### BRISK (Binary Robust Invariant Scalable Keypoints) Algorithm

1. BRISK is great for description, keypoint detection and matching.

2. An algorithm that is highly adaptive, scale-space FAST-based detector along with a bit-string descriptor, helps speed up the search significantly.

3. Scale-space keypoint detection and keypoint description helps optimize the performance with relation to the task at hand.

#### FREAK (Fast Retina Keypoint)

1. This is a novel keypoint descriptor inspired by the human eye.A binary strings cascade is efficiently computed by an image intensity comparison. The FREAK algorithm allows faster computing with lower memory load as compared to BRISK, SURF and SIFT.

#### ORB (Oriented FAST and Rotated BRIEF)

1.A fast binary descriptor, ORB is resistant to noise and rotation invariant. ORB builds on the FAST keypoint detector and the BRIEF descriptor, elements attributed to its low cost and good performance.

2. Apart from the fast and precise orientation component, efficiently computing the oriented BRIEF, analyzing variance and co-relation of oriented BRIEF features, is another ORB feature.

### Python Libraries

#### Open CV

1. OpenCV is available for both academic and commercial use. A open source machine learning and computer vision library, OpenCV makes it easy for organizations to utilize and modify code.

2. Over 2500 optimized algorithms, including state-of-the-art machine learning and computer vision algorithms serve various image search purposes – face detection, object identification, camera movement tracking, finding similar images from image database, following eye movements, scenery recognition, etc.

3. Top companies like Google, IBM, Yahoo, IBM, Sony, Honda, Microsoft and Intel make wide use of OpenCV.

4. OpenCV uses Python, Java, C, C++ and MATLAB interfaces while supporting Windows, Linux, Mac OS and Android.

#### Python Imaging Library (PIL)

1. The Python Imaging Library (PIL) supports several file formats while providing image processing and graphics solutions.The open source PIL adds image processing capabilities to your Python interpreter.
2. The standard procedure for image manipulation include image enhancing, transparency and masking handling, image filtering, per-pixel manipulation, etc.

For detailed statistics and graphs, view the OpenCV 2.4.9 Features Comparison Report [here][3]. 

### Building an Image Search Engine

An image search engine helps pick similar images from a prepopulated set of image base. The most popular among these is Google’s well known image search engine. For starters, there are various approaches to build a system like this. To mention a few:

1.Using image extraction, image description extraction, meta data extraction and search result extraction to build an image search engine.
2. Define your image descriptor, dataset indexing, define your similarity metric and then search and rank.
3. Select image to be searched, select directory for carrying out search, search directory for all pictures, create picture feature index, evaluate same feature for search picture, match pictures in search and obtain matched pictures.

Our approach basically began with comparing grayscaled versions of the images, gradually moving on to complex feature matching algorithms like SIFT and SURF, and then finally settling down to am open source solution called BRISK. All these algorithms give efficient results with minor changes in performance and latency. An engine built on these algorithms have numerous applications like analyzing graphic data for popularity statistics, identification of objects in graphic contents, and many more.

**Example**: An image search engine needs to be build by an IT company for a client. So if a brand logo image is submitted in the search, all related brand image searches show up as results. The obtained results can also be used for analytics by the client, allowing them to estimate the brand popularity as per the geographic location. Its still early days though, RIQ or reverse image search has not been exploited to its full extent yet.

This concludes our article on building an image search engine using Python. Check our blog section out for the latest on technology and programming.

Statistics Source: OpenCV 2.4.9 Features Comparison Report (computer-vision-talks.com)

(Guidance and additional inputs by Ananthu Nair.)

--------------------------------------------------------------------------------

via: http://www.cuelogic.com/blog/advanced-image-processing-with-python/

作者：[Snehith Kumbla][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.cuelogic.com/blog/author/snehith-kumbla/
[1]: http://docs.opencv.org/3.0-beta/doc/py_tutorials/py_feature2d/py_surf_intro/py_surf_intro.html
[2]: http://www.vision.ee.ethz.ch/~surf/eccv06.pdf
[3]: https://docs.google.com/spreadsheets/d/1gYJsy2ROtqvIVvOKretfxQG_0OsaiFvb7uFRDu5P8hw/edit#gid=10
