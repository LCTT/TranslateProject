MikeCoder Translating...

使用 OpenCV 识别图片中的猫
=======================================

![](http://www.pyimagesearch.com/wp-content/uploads/2016/05/cat_face_detector_result_04.jpg)

你知道 OpenCV 可以识别在图片中识别猫脸吗？还是在开箱即用的情况下，无需多余的附件。

我也不知道。

但是在看完'[Kendrick Tan broke the story][1]'这个故事之后, 我需要亲自体验一下...去看看到OpenCV 是如何在我没有察觉到的情况下，将这一个功能添加进了他的软件库。

作为这个博客的大纲，我将会展示如何使用 OpenCV 的猫检测器在图片中识别猫脸。同样的，你也可以在视频流中使用该技术。

> 想找这篇博客的源码？[请点这][2]。


### 使用 OpenCV 在图片中检测猫

如果你看一眼[OpenCV 的代码库][3]，尤其是在[haarcascades 目录][4](OpenCV 用来保存处理他对多种目标检测的Cascade预先训练的级联图像分类)， 你将会注意到这两个文件:

- haarcascade_frontalcatface.xml
- haarcascade_frontalcatface_extended.xml

这两个 Haar Cascade 文件都将被用来在图片中检测猫脸。实际上，我使用了相同的方式来生成这篇博客顶端的图片。

在做了一些调查工作之后，我发现训练这些记过并且将其提供给 OpenCV 仓库的是鼎鼎大名的 [Joseph Howse][5]，他在计算机视觉领域有着很高的声望。

在博客的剩余部分，我将会展示给你如何使用 Howse 的 Haar cascades 来检测猫。

让我们开工。新建一个叫 cat_detector.py 的文件，并且输入如下的代码:

### Detecting cats in images with OpenCVPython

```
# import the necessary packages
import argparse
import cv2
 
# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required=True,
	help="path to the input image")
ap.add_argument("-c", "--cascade",
	default="haarcascade_frontalcatface.xml",
	help="path to cat detector haar cascade")
args = vars(ap.parse_args())
```

Lines 2 and 3 import our necessary Python packages while Lines 6-12 parse our command line arguments. We only require a single argument here, the input `--image`  that we want to detect cat faces in using OpenCV.

We can also (optionally) supply a path our Haar cascade via the `--cascade`  switch. We’ll default this path to `haarcascade_frontalcatface.xml`  and assume you have the `haarcascade_frontalcatface.xml`  file in the same directory as your cat_detector.py  script.

Note: I’ve conveniently included the code, cat detector Haar cascade, and example images used in this tutorial in the “Downloads” section of this blog post. If you’re new to working with Python + OpenCV (or Haar cascades), I would suggest downloading the provided .zip file to make it easier to follow along.

Next, let’s detect the cats in our input image:

```
# load the input image and convert it to grayscale
image = cv2.imread(args["image"])
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
 
# load the cat detector Haar cascade, then detect cat faces
# in the input image
detector = cv2.CascadeClassifier(args["cascade"])
rects = detector.detectMultiScale(gray, scaleFactor=1.3,
	minNeighbors=10, minSize=(75, 75))
```

On Lines 15 and 16 we load our input image from disk and convert it to grayscale (a normal pre-processing step before passing the image to a Haar cascade classifier, although not strictly required).

Line 20 loads our Haar cascade from disk (in this case, the cat detector) and instantiates the cv2.CascadeClassifier  object.

Detecting cat faces in images with OpenCV is accomplished on Lines 21 and 22 by calling the detectMultiScale  method of the detector  object. We pass four parameters to the detectMultiScale  method, including:

1. Our image, gray , that we want to detect cat faces in.
2.A scaleFactor  of our [image pyramid][6] used when detecting cat faces. A larger scale factor will increase the speed of the detector, but could harm our true-positive detection accuracy. Conversely, a smaller scale will slow down the detection process, but increase true-positive detections. However, this smaller scale can also increase the false-positive detection rate as well. See the “A note on Haar cascades” section of this blog post for more information.
3. The minNeighbors  parameter controls the minimum number of detected bounding boxes in a given area for the region to be considered a “cat face”. This parameter is very helpful in pruning false-positive detections.
4. Finally, the minSize  parameter is pretty self-explanatory. This value ensures that each detected bounding box is at least width x height pixels (in this case, 75 x 75).

The detectMultiScale  function returns rects , a list of 4-tuples. These tuples contain the (x, y)-coordinates and width and height of each detected cat face.

Finally, let’s draw a rectangle surround each cat face in the image:

```
# loop over the cat faces and draw a rectangle surrounding each
for (i, (x, y, w, h)) in enumerate(rects):
	cv2.rectangle(image, (x, y), (x + w, y + h), (0, 0, 255), 2)
	cv2.putText(image, "Cat #{}".format(i + 1), (x, y - 10),
		cv2.FONT_HERSHEY_SIMPLEX, 0.55, (0, 0, 255), 2)
 
# show the detected cat faces
cv2.imshow("Cat Faces", image)
cv2.waitKey(0)
```

Given our bounding boxes (i.e., rects ), we loop over each of them individually on Line 25.

We then draw a rectangle surrounding each cat face on Line 26, while Lines 27 and 28 displays an integer, counting the number of cats in the image.

Finally, Lines 31 and 32 display the output image to our screen.

### Cat detection results

To test our OpenCV cat detector, be sure to download the source code to this tutorial using the “Downloads” section at the bottom of this post.

Then, after you have unzipped the archive, you should have the following three files/directories:

1. cat_detector.py : Our Python + OpenCV script used to detect cats in images.
2. haarcascade_frontalcatface.xml : The cat detector Haar cascade.
3. images : A directory of testing images that we’re going to apply the cat detector cascade to.

From there, execute the following command:

Detecting cats in images with OpenCVShell

```
$ python cat_detector.py --image images/cat_01.jpg
```

![](http://www.pyimagesearch.com/wp-content/uploads/2016/05/cat_face_detector_result_01.jpg)
>Figure 1: Detecting a cat face in an image, even with parts of the cat occluded 

Notice that we have been able to detect the cat face in the image, even though the rest of its body is obscured.

Let’s try another image:

```
python cat_detector.py --image images/cat_02.jpg
```

![](http://www.pyimagesearch.com/wp-content/uploads/2016/05/cat_face_detector_result_02.jpg)
>Figure 2: A second example of detecting a cat in an image with OpenCV, this time the cat face is slightly different 

This cat’s face is clearly different from the other one, as it’s in the middle of a “meow”. In either case, the cat detector cascade is able to correctly find the cat face in the image.

The same is true for this image as well:

```
$ python cat_detector.py --image images/cat_03.jpg
```

![](http://www.pyimagesearch.com/wp-content/uploads/2016/05/cat_face_detector_result_03.jpg)
>Figure 3: Cat detection with OpenCV and Python

Our final example demonstrates detecting multiple cats in an image using OpenCV and Python:

```
$ python cat_detector.py --image images/cat_04.jpg
```

![](http://www.pyimagesearch.com/wp-content/uploads/2016/05/cat_face_detector_result_04.jpg)
>Figure 4: Detecting multiple cats in the same image with OpenCV

Note that the Haar cascade can return bounding boxes in an order that you may not like. In this case, the middle cat is actually labeled as the third cat. You can resolve this “issue” by sorting the bounding boxes according to their (x, y)-coordinates for a consistent ordering.

#### A quick note on accuracy

It’s important to note that in the comments section of the .xml  files, Joseph Howe details that the cat detector Haar cascades can report cat faces where there are actually human faces.

In this case, he recommends performing both face detection and cat detection, then discarding any cat bounding boxes that overlap with the face bounding boxes.

#### A note on Haar cascades

First published in 2001 by Paul Viola and Michael Jones, [Rapid Object Detection using a Boosted Cascade of Simple Features][7], this original work has become one of the most cited papers in computer vision.

This algorithm is capable of detecting objects in images, regardless of their location and scale. And perhaps most intriguing, the detector can run in real-time on modern hardware.

In their paper, Viola and Jones focused on training a face detector; however, the framework can also be used to train detectors for arbitrary “objects”, such as cars, bananas, road signs, etc.

#### The problem?

The biggest problem with Haar cascades is getting the detectMultiScale  parameters right, specifically scaleFactor  and minNeighbors . You can easily run into situations where you need to tune both of these parameters on an image-by-image basis, which is far from ideal when utilizing an object detector.

The scaleFactor  variable controls your [image pyramid][8] used to detect objects at various scales of an image. If your scaleFactor  is too large, then you’ll only evaluate a few layers of the image pyramid, potentially leading to you missing objects at scales that fall in between the pyramid layers.

On the other hand, if you set scaleFactor  too low, then you evaluate many pyramid layers. This will help you detect more objects in your image, but it (1) makes the detection process slower and (2) substantially increases the false-positive detection rate, something that Haar cascades are known for.

To remember this, we often apply [Histogram of Oriented Gradients + Linear SVM detection][9] instead.

The HOG + Linear SVM framework parameters are normally much easier to tune — and best of all, HOG + Linear SVM enjoys a much smaller false-positive detection rate. The only downside is that it’s harder to get HOG + Linear SVM to run in real-time.

### Interested in learning more about object detection?

![](http://www.pyimagesearch.com/wp-content/uploads/2016/05/custom_object_detector_example.jpg)
>Figure 5: Learn how to build custom object detectors inside the PyImageSearch Gurus course.

If you’re interested in learning how to train your own custom object detectors, be sure to take a look at the PyImageSearch Gurus course.

Inside the course, I have 15 lessons covering 168 pages of tutorials dedicated to teaching you how to build custom object detectors from scratch.  You’ll discover how to detect road signs, faces, cars (and nearly any other object) in images by applying the HOG + Linear SVM framework for object detection.

To learn more about the PyImageSearch Gurus course (and grab 10 FREE sample lessons), just click the button below:

### Summary

In this blog post, we learned how to detect cats in images using the default Haar cascades shipped with OpenCV. These Haar cascades were trained and contributed to the OpenCV project by [Joseph Howse][9], and were originally brought to my attention [in this post][10] by Kendrick Tan.

While Haar cascades are quite useful, we often use HOG + Linear SVM instead, as it’s a bit easier to tune the detector parameters, and more importantly, we can enjoy a much lower false-positive detection rate.

I detail how to build custom HOG + Linear SVM object detectors to recognize various objects in images, including cars, road signs, and much more [inside the PyImageSearch Gurus course][11].

Anyway, I hope you enjoyed this blog post!

Before you go, be sure to signup for the PyImageSearch Newsletter using the form below to be notified when new blog posts are published.

--------------------------------------------------------------------------------

via: http://www.pyimagesearch.com/2016/06/20/detecting-cats-in-images-with-opencv/

作者：[Adrian Rosebrock][a]
译者：[译者ID](https://github.com/MikeCoder)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.pyimagesearch.com/author/adrian/
[1]: http://kendricktan.github.io/find-cats-in-photos-using-computer-vision.html
[2]: http://www.pyimagesearch.com/2016/06/20/detecting-cats-in-images-with-opencv/#
[3]: https://github.com/Itseez/opencv
[4]: https://github.com/Itseez/opencv/tree/master/data/haarcascades
[5]: http://nummist.com/
[6]: http://www.pyimagesearch.com/2015/03/16/image-pyramids-with-python-and-opencv/
[7]: https://www.cs.cmu.edu/~efros/courses/LBMV07/Papers/viola-cvpr-01.pdf
[8]: http://www.pyimagesearch.com/2015/03/16/image-pyramids-with-python-and-opencv/
[9]: http://www.pyimagesearch.com/2014/11/10/histogram-oriented-gradients-object-detection/
[10]: http://kendricktan.github.io/find-cats-in-photos-using-computer-vision.html
[11]: https://www.pyimagesearch.com/pyimagesearch-gurus/



