Use Gstreamer and Python to rip CDs
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/cd-rip-2-816x345.jpg)

In a previous article, you learned how to use the MusicBrainz service to provide tag information for your audio files, using a simple Python script. This article shows you how to also script an all-in-one solution to copy your CDs down to a music library folder in your choice of formats.

Unfortunately, the powers that be make it impossible for Fedora to carry the necessary bits to encode MP3 in official repos. So that part is left as an exercise for the reader. But if you use a cloud service such as Google Play to host your music, this script makes audio files you can upload easily.

The script will record your CD down to one of the following file formats:

  * Uncompressed WAV, which you can further encode or play with.
  * Compressed but lossless FLAC. Lossless files preserve all the fidelity of the original audio.
  * Compressed, lossy Ogg Vorbis. Like MP3 and Apple’s AAC, Ogg Vorbis uses special algorithms and psychoacoustic properties to sound close to the original audio. However, Ogg Vorbis usually produces superior results to those other compressed formats at the same file sizes. You can[read more about it here][1] if you like technical details.



### The components

The first element of the script is a [GStreamer][2] pipeline. GStreamer is a full featured multimedia framework included in Fedora. It comes [installed by default in Workstation][3], too. GStreamer is used behind the scene by many multimedia apps in Fedora. It lets apps manipulate all kinds of video and audio files.

The second major component in this script is choosing, and using, a multimedia tagging library. In this case [the mutagen library][4] makes it easy to tag many kinds of multimedia files. The script in this article uses mutagen to tag Ogg Vorbis or FLAC files.

Finally, the script uses [Python’s argparse, part of the standard library][5], for some easy to use options and help text. The argparse library is useful for most Python scripts where you expect the user to provide parameters. This article won’t cover this part of the script in great detail.

### The script

You may recall [the previous article][6] that used MusicBrainz to fetch tag information. This script includes that code, with some tweaks to make it integrate better with the new functions. (You may find it easier to read this script if you copy and paste it into your favorite editor.)
```
#!/usr/bin/python3

import os, sys
import subprocess
from argparse import ArgumentParser
import libdiscid
import musicbrainzngs as mb
import requests
import json
from getpass import getpass

parser = ArgumentParser()
parser.add_argument('-f', '--flac', action='store_true', dest='flac',
 default=False, help='Rip to FLAC format')
parser.add_argument('-w', '--wav', action='store_true', dest='wav',
 default=False, help='Rip to WAV format')
parser.add_argument('-o', '--ogg', action='store_true', dest='ogg',
 default=False, help='Rip to Ogg Vorbis format')
options = parser.parse_args()

# Set up output varieties
if options.wav + options.ogg + options.flac > 1:
 raise parser.error("Only one of -f, -o, -w please")
if options.wav:
 fmt = 'wav'
 encoding = 'wavenc'
elif options.flac:
 fmt = 'flac'
 encoding = 'flacenc'
 from mutagen.flac import FLAC as audiofile
elif options.ogg:
 fmt = 'oga'
 quality = 'quality=0.3'
 encoding = 'vorbisenc {} ! oggmux'.format(quality)
 from mutagen.oggvorbis import OggVorbis as audiofile

# Get MusicBrainz info
this_disc = libdiscid.read(libdiscid.default_device())
mb.set_useragent(app='get-contents', version='0.1')
mb.auth(u=input('Musicbrainz username: '), p=getpass())

release = mb.get_releases_by_discid(this_disc.id, includes=['artists',
 'recordings'])
if release.get('disc'):
 this_release=release['disc']['release-list'][0]

 album = this_release['title']
 artist = this_release['artist-credit'][0]['artist']['name']
 year = this_release['date'].split('-')[0]

 for medium in this_release['medium-list']:
 for disc in medium['disc-list']:
 if disc['id'] == this_disc.id:
 tracks = medium['track-list']
 break

 # We assume here the disc was found. If you see this:
 # NameError: name 'tracks' is not defined
 # ...then the CD doesn't appear in MusicBrainz and can't be
 # tagged. Use your MusicBrainz account to create a release for
 # the CD and then try again.

 # Get cover art to cover.jpg
 if this_release['cover-art-archive']['artwork'] == 'true':
 url = 'http://coverartarchive.org/release/' + this_release['id']
 art = json.loads(requests.get(url, allow_redirects=True).content)
 for image in art['images']:
 if image['front'] == True:
 cover = requests.get(image['image'], allow_redirects=True)
 fname = '{0} - {1}.jpg'.format(artist, album)
 print('Saved cover art as {}'.format(fname))
 f = open(fname, 'wb')
 f.write(cover.content)
 f.close()
 break

for trackn in range(len(tracks)):
 track = tracks[trackn]['recording']['title']

 # Output file name based on MusicBrainz values
 outfname = '{:02} - {}.{}'.format(trackn+1, track, fmt).replace('/', '-')

 print('Ripping track {}...'.format(outfname))
 cmd = 'gst-launch-1.0 cdiocddasrc track={} ! '.format(trackn+1) + \
 'audioconvert ! {} ! '.format(encoding) + \
 'filesink location="{}"'.format(outfname)
 msgs = subprocess.getoutput(cmd)

 if not options.wav:
 audio = audiofile(outfname)
 print('Tagging track {}...'.format(outfname))
 audio['TITLE'] = track
 audio['TRACKNUMBER'] = str(trackn+1)
 audio['ARTIST'] = artist
 audio['ALBUM'] = album
 audio['DATE'] = year
 audio.save()

```

#### Determining output format

This part of the script lets the user decide how to format the output files:
```
parser = ArgumentParser()
parser.add_argument('-f', '--flac', action='store_true', dest='flac',
 default=False, help='Rip to FLAC format')
parser.add_argument('-w', '--wav', action='store_true', dest='wav',
 default=False, help='Rip to WAV format')
parser.add_argument('-o', '--ogg', action='store_true', dest='ogg',
 default=False, help='Rip to Ogg Vorbis format')
options = parser.parse_args()

# Set up output varieties
if options.wav + options.ogg + options.flac > 1:
 raise parser.error("Only one of -f, -o, -w please")
if options.wav:
 fmt = 'wav'
 encoding = 'wavenc'
elif options.flac:
 fmt = 'flac'
 encoding = 'flacenc'
 from mutagen.flac import FLAC as audiofile
elif options.ogg:
 fmt = 'oga'
 quality = 'quality=0.3'
 encoding = 'vorbisenc {} ! oggmux'.format(quality)
 from mutagen.oggvorbis import OggVorbis as audiofile

```

The parser, built from the argparse library, gives you a built in –help function:
```
$ ipod-cd --help
usage: ipod-cd [-h] [-b BITRATE] [-w] [-o]

optional arguments:
 -h, --help show this help message and exit
 -b BITRATE, --bitrate BITRATE
 Set a target bitrate
 -w, --wav Rip to WAV format
 -o, --ogg Rip to Ogg Vorbis format

```

The script allows the user to use -f, -w, or -o on the command line to choose a format. Since these are stored as True (a Python boolean value), they can also be treated as the integer value 1. If more than one is selected, the parser generates an error.

Otherwise, the script sets an appropriate encoding string to be used with GStreamer later in the script. Notice the Ogg Vorbis selection also includes a quality setting, which is then included in the encoding. Care to try your hand at an easy change? Try making a parser argument and additional formatting code so the user can select a quality value between -0.1 and 1.0.

Notice also that for each of the file formats that allows tagging (WAV does not), the script imports a different tagging class. This way the script can have simpler, less confusing tagging code later in the script. In this script, both Ogg Vorbis and FLAC are using classes from the mutagen library.

#### Getting CD info

The next section of the script attempts to load MusicBrainz info for the disc. You’ll find that audio files ripped with this script have data not included in the Python code here. This is because GStreamer is also capable of detecting CD-Text that’s included on some discs during the mastering and manufacturing process. Often, though, this data is in all capitals (like “TRACK TITLE”). MusicBrainz info is more compatible with modern apps and other platforms.

For more information on this section, [refer to the previous article here on the Magazine][6]. A few trivial changes appear here to make the script work better as a single process.

One item to note is this warning:
```
# We assume here the disc was found. If you see this:
# NameError: name 'tracks' is not defined
# ...then the CD doesn't appear in MusicBrainz and can't be
# tagged. Use your MusicBrainz account to create a release for
# the CD and then try again.

```

The script as shown doesn’t include a way to handle cases where CD information isn’t found. This is on purpose. If it happens, take a moment to help the community by [entering CD information on MusicBrainz][7], using your login account.

#### Ripping and labeling tracks

The next section of the script actually does the work. It’s a simple loop that iterates through the track list found via MusicBrainz.

First, the script sets the output filename for the individual track based on the format the user selected:
```
for trackn in range(len(tracks)):
 track = tracks[trackn]['recording']['title']

 # Output file name based on MusicBrainz values
 outfname = '{:02} - {}.{}'.format(trackn+1, track, fmt)

```

Then, the script calls a CLI GStreamer utility to perform the ripping and encoding process. That process turns each CD track into an audio file in your current directory:
```
 print('Ripping track {}...'.format(outfname))
 cmd = 'gst-launch-1.0 cdiocddasrc track={} ! '.format(trackn+1) + \
 'audioconvert ! {} ! '.format(encoding) + \
 'filesink location="{}"'.format(outfname)
 msgs = subprocess.getoutput(cmd)

```

The complete GStreamer pipeline would look like this at a command line:
```
gst-launch-1.0 cdiocddasrc track=1 ! audioconvert ! vorbisenc quality=0.3 ! oggmux ! filesink location="01 - Track Name.oga"

```

GStreamer has Python libraries to let you use the framework in interesting ways directly without using subprocess. To keep this article less complex, the script calls the command line utility from Python to do the multimedia work.

Finally, the script labels the output file if it’s not a WAV file. Both Ogg Vorbis and FLAC use similar methods in their mutagen classes. That means this code can remain very simple:
```
 if not options.wav:
 audio = audiofile(outfname)
 print('Tagging track {}...'.format(outfname))
 audio['TITLE'] = track
 audio['TRACKNUMBER'] = str(trackn+1)
 audio['ARTIST'] = artist
 audio['ALBUM'] = album
 audio['DATE'] = year
 audio.save()

```

If you decide to write code for another file format, you need to import the correct class earlier, and then perform the tagging correctly. You don’t have to use the mutagen class. For instance, you might choose to use eyed3 for tagging MP3 files. In that case, the tagging code might look like this:
```
...
# In the parser handling for MP3 format
from eyed3 import load as audiofile
...
# In the handling for MP3 tags
audio.tag.version = (2, 3, 0)
audio.tag.artist = artist
audio.tag.title = track
audio.tag.album = album
audio.tag.track_num = (trackn+1, len(tracks))
audio.tag.save()

```

(Note the encoding function is up to you to provide.)

### Running the script

Here’s an example output of the script:
```
$ ipod-cd -o
Ripping track 01 - Shout, Pt. 1.oga...
Tagging track 01 - Shout, Pt. 1.oga...
Ripping track 02 - Stars of New York.oga...
Tagging track 02 - Stars of New York.oga...
Ripping track 03 - Breezy.oga...
Tagging track 03 - Breezy.oga...
Ripping track 04 - Aeroplane.oga...
Tagging track 04 - Aeroplane.oga...
Ripping track 05 - Minor Is the Lonely Key.oga...
Tagging track 05 - Minor Is the Lonely Key.oga...
Ripping track 06 - You Can Come Round If You Want To.oga...
Tagging track 06 - You Can Come Round If You Want To.oga...
Ripping track 07 - I'm Gonna Haunt This Place.oga...
Tagging track 07 - I'm Gonna Haunt This Place.oga...
Ripping track 08 - Crash That Piano.oga...
Tagging track 08 - Crash That Piano.oga...
Ripping track 09 - Save Yourself.oga...
Tagging track 09 - Save Yourself.oga...
Ripping track 10 - Get on Home.oga...
Tagging track 10 - Get on Home.oga...

```

Enjoy burning your old CDs into easily portable audio files!


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-gstreamer-python-rip-cds/

作者：[Paul W. Frields][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/pfrields/
[1]:https://xiph.org/vorbis/
[2]:https://gstreamer.freedesktop.org/
[3]:https://getfedora.org/workstation
[4]:https://mutagen.readthedocs.io/en/latest/
[5]:https://docs.python.org/3/library/argparse.html
[6]:https://fedoramagazine.org/use-musicbrainz-get-cd-information/
[7]:https://musicbrainz.org/
