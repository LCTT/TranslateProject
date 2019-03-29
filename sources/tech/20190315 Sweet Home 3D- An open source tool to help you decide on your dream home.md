[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Sweet Home 3D: An open source tool to help you decide on your dream home)
[#]: via: (https://opensource.com/article/19/3/tool-find-home)
[#]: author: (Jeff Macharyas (Community Moderator) )

Sweet Home 3D: An open source tool to help you decide on your dream home
======

Interior design application makes it easy to render your favorite house—real or imaginary.

![Houses in a row][1]

I recently accepted a new job in Virginia. Since my wife was working and watching our house in New York until it sold, it was my responsibility to go out and find a new house for us and our cat. A house that she would not see until we moved into it!

I contracted with a real estate agent and looked at a few houses, taking many pictures and writing down illegible notes. At night, I would upload the photos into a Google Drive folder, and my wife and I would review them simultaneously over the phone while I tried to remember whether the room was on the right or the left, whether it had a fan, etc.

Since this was a rather tedious and not very accurate way to present my findings, I went in search of an open source solution to better illustrate what our future dream house would look like that wouldn't hinge on my fuzzy memory and blurry photos.

[Sweet Home 3D][2] did exactly what I wanted it to do. Sweet Home 3D is available on Sourceforge and released under the GNU General Public License. The [website][3] is very informative, and I was able to get it up and running in no time. Sweet Home 3D was developed by Paris-based Emmanuel Puybaret of eTeks.

### Hanging the drywall

I downloaded Sweet Home 3D onto my MacBook Pro and added a PNG version of a flat floorplan of a house to use as a background base map.

From there, it was a simple matter of using the Rooms palette to trace the pattern and set the "real life" dimensions. After I mapped the rooms, I added the walls, which I could customize by color, thickness, height, etc.

![Sweet Home 3D floorplan][5]

Now that I had the "drywall" built, I downloaded various pieces of "furniture" from a large array that includes actual furniture as well as doors, windows, shelves, and more. Each item downloads as a ZIP file, so I created a folder of all my uncompressed pieces. I could customize each piece of furniture, and repetitive items, such as doors, were easy to copy-and-paste into place.

Once I had all my walls and doors and windows in place, I used the application's 3D view to navigate through the house. Drawing upon my photos and memory, I made adjustments to all the objects until I had a close representation of the house. I could have spent more time modifying the house by adding textures, additional furniture, and objects, but I got it to the point I needed.

![Sweet Home 3D floorplan][7]

After I finished, I exported the plan as an OBJ file, which can be opened in a variety of programs, such as [Blender][8] and Preview on the Mac, to spin the house around and examine it from various angles. The Video function was most useful, as I could create a starting point, draw a path through the house, and record the "journey." I exported the video as a MOV file, which I opened and viewed on the Mac using QuickTime.

My wife was able to see (almost) exactly what I saw, and we could even start arranging furniture ahead of the move, too. Now, all I have to do is load up the moving truck and head south.

Sweet Home 3D will also prove useful at my new job. I was looking for a way to improve the map of the college's buildings and was planning to just re-draw it in [Inkscape][9] or Illustrator or something. However, since I have the flat map, I can use Sweet Home 3D to create a 3D version of the floorplan and upload it to our website to make finding the bathrooms so much easier!

### An open source crime scene?

An interesting aside: according to the [Sweet Home 3D blog][10], "the French Forensic Police Office (Scientific Police) recently chose Sweet Home 3D as a tool to design plans [to represent roads and crime scenes]. This is a concrete application of the recommendation of the French government to give the preference to free open source solutions."

This is one more bit of evidence of how open source solutions are being used by citizens and governments to create personal projects, solve crimes, and build worlds.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/tool-find-home

作者：[Jeff Macharyas (Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/house_home_colors_live_building.jpg?itok=HLpsIfIL (Houses in a row)
[2]: https://sourceforge.net/projects/sweethome3d/
[3]: http://www.sweethome3d.com/
[4]: /file/426441
[5]: https://opensource.com/sites/default/files/uploads/virginia-house-create-screenshot.png (Sweet Home 3D floorplan)
[6]: /file/426451
[7]: https://opensource.com/sites/default/files/uploads/virginia-house-3d-screenshot.png (Sweet Home 3D floorplan)
[8]: https://opensource.com/article/18/5/blender-hotkey-cheat-sheet
[9]: https://opensource.com/article/19/1/inkscape-cheat-sheet
[10]: http://www.sweethome3d.com/blog/2018/12/10/customization_for_the_forensic_police.html
