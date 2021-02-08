[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bringing Some Order into a Collection of Photographs)
[#]: via: (https://opensourceforu.com/2019/10/bringing-some-order-into-a-collection-of-photographs/)
[#]: author: (Dr Anil Seth https://opensourceforu.com/author/anil-seth/)

Bringing Some Order into a Collection of Photographs
======

[![][1]][2]

_In this article, the author shares tips on managing photographs using different Internet resources and Python programming._

These days, it is very easy to let Google Photos or similar cloud based services manage your photos. You can keep clicking on the smartphone and the photos get saved. The tools for helping you find photos, especially based on the content, keep getting better. There is no cost to keeping all your photos as long as you are an amateur and not taking very high resolution images. And it is far easier to let the dozens of photos clicked by accident remain on the cloud, than to remove them!

Even if you are willing to delegate the task of managing photos to AI tools, there is still the challenge of what to do with the photos taken before the smartphone era. Broadly, the photos can be divided into two groups — those taken with digital cameras and the physical photo prints.
Each of the two categories will need to be handled and managed differently. First, consider the older physical photos.

**Managing physical photos in the digital era**

Photos can deteriorate over time. So, the sooner you digitise them, the better you will preserve your memories. Besides, it is far easier to share a memory digitally when the family members are scattered across the globe.

The first hard decision is related to the physical albums. Should you take photos out of albums for scanning and risk damaging the albums, or scan the album pages and then crop individual photos from the album pages? Scanning or imaging tools can help with the cropping of photos.
In this article, we assume that you are ready to deal with a collection of individual photos.

One of the great features of photo management software, both on the cloud and the desktop, is that they organise the photos by date. However, the only date associated with scanned photos is the date of scanning! It will be a while before the AI software will place the photos on a timeline by examining the age of the people in the photos. Currently, you will need to handle this aspect manually.

One would like to be able to store a date in the metadata of the image so every tool can use it.
Python has a number of packages to help you do this. A pretty easy one to use is pyexiv2. Here is a snippet of sample code to modify the date of an image:

```
import datetime
import pyexiv2
EXIF_DATE = ‘Exif.Image.DateTime’
EXIF_ORIG_DATE = ‘Exif.Photo.DateTimeOriginal’
def update_exif(filename,date):
try:
metadata=pyexiv2.ImageMetadata(filename)
metadata.read()
metadata[EXIF_DATE]=date
metadata[EXIF_ORIG_DATE]=date
metadata.write()
except:
print(“Error “ + f)
```

Most photo management software seem to use either of the two dates, whichever is available. While you are setting the date, you might as well set both! There can be various ways in which the date for the photo may be specified. You may find the following scheme convenient.
Sort the photos manually into directories, each with the name _yy-mm-dd_. If the date is not known, you might as well select an approximate date. If the month also is not known, set it to 01. Now, you can use the _os.walk_ function to iterate over the directories and files, and set the date for each file as just suggested above.

You may further divide the files into event based sub-directories, event_label, and use that to label photos, as follows:

```
LABEL = ‘Xmp.xmp.Label’
metadata[LABEL] = pyexiv2.XmpTag(LABEL,event_label)
```

This is only for illustration purposes. You can decide on how you would like to organise the photos and use what seems most convenient for you.

**Digital photos**
Digital photos have different challenges. It is so easy to keep taking photos that you are likely to have a lot of them. Unless you have been careful, you are likely to find that you have used different tools for downloading photos from digital cameras and smartphones, so the file names and directory names are not consistent. A convenient option is to use the date and time of an image from the metadata and rename files accordingly. An example code follows:

```
import os
import datetime
import pyexiv2
EXIF_DATE = ‘Exif.Image.DateTime’
EXIF_ORIG_DATE = ‘Exif.Photo.DateTimeOriginal’
def rename_file(p,f,fpref,ctr):
fold,fext = f.rsplit(‘.’,1) # separate the ext, e.g. jpg
fname = fpref + “-%04i”%ctr # add a serial number to ensure uniqueness
fnew = ‘.’.join((fname,fext))
os.rename(‘/’.join((p,f)),’/’.join((p,fnew)))

def process_files(path, files):
ctr = 0
for f in files:
try:
metadata=pyexiv2.ImageMetadata(‘/’.join((path,f)))
metadata.read()
if EXIF_ORIG_DATE in metadata.exif_keys:
datestamp = metadata[EXIF_ORIG_DATE].human_value
else:
datestamp = metadata[EXIF_DATE].human_value
datepref = ‘_’.join([ x.replace(‘:’,’-’) for x in datestamp.split(‘ ‘)])
rename_file(path,f,datepref,ctr)
ctr += 1
except:
print(‘Error in %s/%s’%(path,f))
for path, dirs, files in os.walk(‘.’): # work with current directory for convenience
if len(files) > 0:
process_files(path, files)
```

All the file names now have a consistent file name. Since the photo managing software provides a way to view the photos by time, it seems that organising the files into directories that have meaningful names may be preferable. You can move photos into directories/albums that are meaningful. The photo management software will let you view photos either by albums or by dates.

**Reducing clutter and duplicates**
Over time, my collection included multiple copies of the same photos. In the old days, to share photos easily, I used to even keep low resolution copies. Digikam has an excellent option of identifying similar photos. However, each photo needs to be handled individually. A very convenient tool for finding the duplicate files and managing them programmatically is *<http://www.jhnc.org/findimagedupes*/>. The output of this program contains each set of duplicate files on a separate line.

You can use the Python Pillow and Matplotlib packages to display the images. Use the image’s size to select the image with the highest resolution among the duplicates, retain that and delete the rest.
One thing is certain, though. After all the work is done, it is a pleasure to look at the photographs and relive all those old memories.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/bringing-some-order-into-a-collection-of-photographs/

作者：[Dr Anil Seth][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/anil-seth/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Gimp-6-Souping-up-photos.jpg?resize=696%2C492&ssl=1 (Gimp-6 Souping up photos)
[2]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Gimp-6-Souping-up-photos.jpg?fit=900%2C636&ssl=1
