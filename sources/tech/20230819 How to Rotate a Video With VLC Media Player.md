[#]: subject: "How to Rotate a Video With VLC Media Player"
[#]: via: "https://itsfoss.com/rotate-video-vlc/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Rotate a Video With VLC Media Player
======

Sometimes, you come across videos displayed in the wrong orientation. Most probably, the videos taken using smartphone cameras may appear this way.

It's better viewed if you can rotate it to a convenient orientation.

The versatile VLC media player provides a method for rotating the videos. You can:

  * Rotate videos temporarily (you'll have to rotate again when you play it the next time)
  * Rotate videos permanently (videos will always be played in the new orientation)



Let's see how to achieve either of the two.

### Rotate the Video Temporarily in VLC

Let us see about rotating videos temporarily inside VLC. That is, after you have completed the process, it won't reflect on the actual file. This will be good for just viewing a file or testing it.

#### Rotate videos using preset values

In this method, you can rotate the video at 90, 180 and 270 degrees. This is what you would need most of the time.

Open VLC and select the video you want to rotate.

![Open File in VLC][1]

Click on **Tools** on the Main menu and go to **Effects and Filters**. You can also press the shortcut CTRL + E.

![Tools > Effects and Filters][2]

On the Effects and Filters page, select the **Video Effects** tab and inside that, go to **Geometry**. Now, check the transform checkbox.

![Set the Rotation][3]

A drop-down menu will be activated. From there, select the appropriate rotation you need, like 90 degrees, 180 degrees, horizontal flip, etc. It is possible to view the changes on VLC window.

Once satisfied with the changes, press **the Save** button to save the configuration with the selected orientation.

#### Rotate videos using custom values

Need to rotate the video to an orientation other than the available preset? VLC has an option for that too.

First, like in the previous step, open the media and then go to **Tools > Effects and Filters > Video Effects > Geometry**.

Now, click on the **rotate** checkbox, and you can see that an interactive circle slider has now been activated.

🚧

On irregular rotation values like 230 degree etc., some part will be removed anyway from the video.

![Irregular rotation][4]

Move the slider so that you get the correct rotation. You can see the changes appearing to the video on VLC window. Press the **Save** button to save that configuration once you are OK with your changes.

🚧

Remember, this configuration won't be applied to the video permanently at this stage. But, if you press save, the orientation will be applied temporarily to other videos played in VLC also.

### Permanently rotate a video

You know how to rotate a file temporarily. That step is also required to permanently save the video file changes.

#### Step 1: Transform the Video

This is the previous part. Open a video file and then make the rotation that you wanted. Once you confirm the rotation needed for a particular video, save that configuration as explained in the previous step.

#### Step 2: Save the Video

Now, open VLC and click on **Media > Convert/Save**. This can be without any video file opened, because we are not working on the currently opened video anyway.

![Click on Convert/Save][5]

On the next dialog box, select the file you want to rotate (the one you tested to confirm the required rotation in the previous step) using the **Add** button. Then press **Convert and Save**.

![Add Files to convert][6]

Next, select the video output you want and then click on the adjacent settings button as shown below.

![Click on Configuration button][7]

A profile settings window appears. On it, go to **Video Codec** and then **Filters** tab. Here, you have to apply filters as needed. One is **Rotate Video Filter** and another **Video transformation Filter**.

If you have applied fixed transformation to a video using the transform button, select the **Video transformation Filter**. On the other hand, if you have done some irregular rotation to the video, select **Rotate Video Filter**.

![Apply the Filters][8]

Once checked, press the **Save** button.

Now, select an output file location, where we want to save the converted file.

![Select Output file location][9]

A new file name should be given, which can be done by going into a directory of your choice and simply enter the name of your choice on the top bar.

💡

It is advised to give a new unique name to avoid overwriting of file and data loss.

![Give file name][10]

Press **Start** to start the conversion.

The conversion will take some time depending on your video. Once finished, you will get the rotated video to view on any video player.

🚧

Once you converted the video (be it permanent or temporary), it is good to turn off the applied rotation in ****Tools > Effects and Filters > Video Effects > Geometry****. Otherwise, the future videos played using VLC will appear rotated.

I hope you liked this VLC tip. Your suggestions and feedback are welcome.

Meanwhile, you can also learn this cool VLC tip and download subtitles automatically.

![][11]

--------------------------------------------------------------------------------

via: https://itsfoss.com/rotate-video-vlc/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/08/open-a-file-in-vlc.png
[2]: https://itsfoss.com/content/images/2023/08/effects-and-filters-in-main-menu.png
[3]: https://itsfoss.com/content/images/2023/08/rotate-video-in-transform.png
[4]: https://itsfoss.com/content/images/2023/08/rotate.png
[5]: https://itsfoss.com/content/images/2023/08/click-on-convert-and-save.png
[6]: https://itsfoss.com/content/images/2023/08/Add-files-to-convert.png
[7]: https://itsfoss.com/content/images/2023/08/click-on-config-button.png
[8]: https://itsfoss.com/content/images/2023/08/apply-filters.png
[9]: https://itsfoss.com/content/images/2023/08/give-an-output-file-name.png
[10]: https://itsfoss.com/content/images/2023/08/select-filename.png
[11]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
