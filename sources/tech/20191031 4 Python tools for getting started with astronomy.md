[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 Python tools for getting started with astronomy)
[#]: via: (https://opensource.com/article/19/10/python-astronomy-open-data)
[#]: author: (Gina Helfrich, Ph.D. https://opensource.com/users/ginahelfrich)

4 Python tools for getting started with astronomy
======
Explore the universe with NumPy, SciPy, Scikit-Image, and Astropy.
![Person looking up at the stars][1]

NumFOCUS is a nonprofit charity that supports amazing open source toolkits for scientific computing and data science. As part of the effort to connect Opensource.com readers with the NumFOCUS community, we are republishing some of the most popular articles from [our blog][2]. To learn more about our mission and programs, please visit [numfocus.org][3]. If you're interested in participating in the NumFOCUS community in person, check out a local [PyData event][4] happening near you.

* * *

### Astronomy with Python

Python is a great language for science, and specifically for astronomy. The various packages such as [NumPy][5], [SciPy][6], [Scikit-Image][7] and [Astropy][8] (to name but a few) are all a great testament to the suitability of Python for astronomy, and there are plenty of use cases. [NumPy, Astropy, and SciPy are NumFOCUS fiscally sponsored projects; Scikit-Image is an affiliated project.] Since leaving the field of astronomical research behind more than 10 years ago to start a second career as software developer, I have always been interested in the evolution of these packages. Many of my former colleagues in astronomy used most if not all of these packages for their research work. I have since worked on implementing professional astronomy software packages for instruments for the Very Large Telescope (VLT) in Chile, for example.

It struck me recently that the Python packages have evolved to such an extent that it is now fairly easy for anyone to build [data reduction][9] scripts that can provide high-quality data products. Astronomical data is ubiquitous, and what is more, it is almost all publicly available—you just need to look for it.

For example, ESO, which runs the VLT, offers the data for download on their site. Head over to [www.eso.org/UserPortal][10] and create a user name for their portal. If you look for data from the instrument SPHERE you can download a full dataset for any of the nearby stars that have exoplanet or proto-stellar discs. It is a fantastic and exciting project for any Pythonista to reduce that data and make the planets or discs that are deeply hidden in the noise visible.

I encourage you to download the ESO or any other astronomy imaging dataset and go on that adventure. Here are a few tips:

  1. Start off with a good dataset. Have a look at papers about nearby stars with discs or exoplanets and then search, for example: <http://archive.eso.org/wdb/wdb/eso/sphere/query>. Notice that some data on this site is marked as red and some as green. The red data is not publicly available yet — it will say under “release date” when it will be available.
  2. Read something about the instrument you are using the data from. Try and get a basic understanding of how the data is obtained and what the standard data reduction should look like. All telescopes and instruments have publicly available documents about this.
  3. You will need to consider the standard problems with astronomical data and correct for them:
    1. Data comes in FITS files. You will need **pyfits** or **astropy** (which contains pyfits) to read them into **NumPy** arrays. In some cases the data comes in a cube and you should to use **numpy.median **along the z-axis to turn them into 2-D arrays. For some SPHERE data you get two copies of the same piece of sky on the same image (each has a different filter) which you will need to extract using **indexing and slicing.**
    2. The master dark and bad pixel map. All instruments will have specific images taken as “dark frames” that contain images with the shutter closed (no light at all). Use these to extract a mask of bad pixels using **NumPy masked arrays** for this. This mask of bad pixels will be very important — you need to keep track of it as you process the data to get a clean combined image in the end. In some cases it also helps to subtract this master dark from all scientific raw images.
    3. Instruments will typically also have a master flat frame. This is an image or series of images taken with a flat uniform light source. You will need to divide all scientific raw images by this (again, using numpy masked array makes this an easy division operation).
    4. For planet imaging, the fundamental technique to make planets visible against a bright star rely on using a coronagraph and a technique known as angular differential imaging. To that end, you need to identify the optical centre on the images. This is one of the most tricky steps and requires finding some artificial helper images embedded in the images using **skimage.feature.blob_dog**.
  4. Be patient. It can take a while to understand the data format and how to handle it. Making some plots and histograms of the pixel data can help you to understand it. It is well worth it to be persistent! You will learn a lot about imaging data and processing.



Using the tools offered by NumPy, SciPy, Astropy, scikit-image and more in combination, with some patience and persistence, it is possible to analyse the vast amount of available astronomical data to produce some stunning results. And who knows, maybe you will be the first one to find a planet that was previously overlooked! Good luck!

_This article was originally published on the NumFOCUS blog and is republished with permission. It is based on [a talk][11] by [Ole Moeller-Nilsson][12], CTO at Pivigo. If you want to support NumFOCUS, you can donate [here][13] or find your local [PyData event][4] happening around the world._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/python-astronomy-open-data

作者：[Gina Helfrich, Ph.D.][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ginahelfrich
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/space_stars_cosmos_person.jpg?itok=XUtz_LyY (Person looking up at the stars)
[2]: https://numfocus.org/blog
[3]: https://numfocus.org
[4]: https://pydata.org/
[5]: http://numpy.scipy.org/
[6]: http://www.scipy.org/
[7]: http://scikit-image.org/
[8]: http://www.astropy.org/
[9]: https://en.wikipedia.org/wiki/Data_reduction
[10]: http://www.eso.org/UserPortal
[11]: https://www.slideshare.net/OleMoellerNilsson/pydata-lonon-finding-planets-with-python
[12]: https://twitter.com/olly_mn
[13]: https://numfocus.org/donate
