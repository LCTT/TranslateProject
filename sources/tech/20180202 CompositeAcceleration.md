CompositeAcceleration
======
### Composite acceleration in the X server

One of the persistent problems with the modern X desktop is the number of moving parts required to display application content. Consider a simple PresentPixmap call as made by the Vulkan WSI or GL using DRI3:

  1. Application calls PresentPixmap with new contents for its window

  2. X server receives that call and pends any operation until the target frame

  3. At the target frame, the X server copies the new contents into the window pixmap and delivers a Damage event to the compositor

  4. The compositor responds to the damage event by copying the window pixmap contents into the next screen pixmap

  5. The compositor calls PresentPixmap with the new screen contents

  6. The X server receives that call and either posts a Swap call to the kernel or delays any action until the target frame




This sequence has a number of issues:

  * The operation is serialized between three processes with at least three context switches involved.

  * There is no traceable relation between when the application asked for the frame to be shown and when it is finally presented. Nor do we even have any way to tell the application what time that was.

  * There are at least two copies of the application contents, from DRI3 buffer to window pixmap and from window pixmap to screen pixmap.




We'd also like to be able to take advantage of the multi-plane capabilities in the display engine (where available) to directly display the application contents.

### Previous Attempts

I've tried to come up with solutions to this issue a couple of times in the past.

#### Composite Redirection

My first attempt to solve (some of) this problem was through composite redirection. The idea there was to directly pass the Present'd pixmap to the compositor and let it copy the contents directly from there in constructing the new screen pixmap image. With some additional hand waving, the idea was that we could associate that final presentation with all of the associated redirected compositing operations and at least provide applications with accurate information about when their images were presented.

This fell apart when I tried to figure out how to plumb the necessary events through to the compositor and back. With that, and the realization that we still weren't solving problems inherent with the three-process dance, nor providing any path to using overlays, this solution just didn't seem worth pursuing further.

#### Automatic Compositing

More recently, Eric Anholt and I have been discussing how to have the X server do all of the compositing work by natively supporting ARGB window content. By changing compositors to place all screen content in windows, the X server could then generate the screen image by itself and not require any external compositing manager assistance for each frame.

Given that a primitive form of automatic compositing is already supported, extending that to support ARGB windows and having the X server manage the stack seemed pretty tractable. We would extend the driver interface so that drivers could perform the compositing themselves using a mixture of GPU operations and overlays.

This runs up against five hard problems though.

  1. Making transitions between Manual and Automatic compositing seamless. We've seen how well the current compositing environment works when flipping compositing on and off to allow full-screen applications to use page flipping. Lots of screen flashing and application repaints.

  2. Dealing with RGB windows with ARGB decorations. Right now, the window frame can be an ARGB window with the client being RGB; painting the client into the frame yields an ARGB result with the A values being 1 everywhere the client window is present.

  3. Mesa currently allocates buffers exactly the size of the target drawable and assumes that the upper left corner of the buffer is the upper left corner of the drawable. If we want to place window manager decorations in the same buffer as the client and not need to copy the client contents, we would need to allocate a buffer large enough for both client and decorations, and then offset the client within that larger buffer.

  4. Synchronizing window configuration and content updates with the screen presentation. One of the major features of a compositing manager is that it can construct complete and consistent frames for display; partial updates to application windows need never be shown to the user, nor does the user ever need to see the window tree partially reconfigured. To make this work with automatic compositing, we'd need to both codify frame markers within the 2D rendering stream and provide some method for collecting window configuration operations together.

  5. Existing compositing managers don't do this today. Compositing managers are currently free to paint whatever they like into the screen image; requiring that they place all screen content into windows would mean they'd have to buy in to the new mechanism completely. That could still work with older X servers, but the additional overhead of more windows containing decoration content would slow performance with those systems, making migration less attractive.




I can think of plausible ways to solve the first three of these without requiring application changes, but the last two require significant systemic changes to compositing managers. Ick.

### Semi-Automatic Compositing

I was up visiting Pierre-Loup at Valve recently and we sat down for a few hours to consider how to help applications regularly present content at known times, and to always know precisely when content was actually presented. That names just one of the above issues, but when you consider the additional work required by pure manual compositing, solving that one issue is likely best achieved by solving all three.

I presented the Automatic Compositing plan and we discussed the range of issues. Pierre-Loup focused on the last problem -- getting existing Compositing Managers to adopt whatever solution we came up with. Without any easy migration path for them, it seemed like a lot to ask.

He suggested that we come up with a mechanism which would allow Compositing Managers to ease into the new architecture and slowly improve things for applications. Towards that, we focused on a much simpler problem

> How can we get a single application at the top of the window stack to reliably display frames at the desired time, and to know when that doesn't occur.

Coming up with a solution for this led to a good discussion and a possible path to a broader solution in the future.

#### Steady-state Behavior

Let's start by ignoring how we start and stop this new mode and look at how we want applications to work when things are stable:

  1. Windows not moving around
  2. Other applications idle



Let's get a picture I can use to describe this:

[![][1]][1]

In this picture, the compositing manager is triple buffered (as is normal for a page flipping application) with three buffers:

  1. Scanout. The image currently on the screen

  2. Queued. The image queued to be displayed next

  3. Render. The image being constructed from various window pixmaps and other elements.




The contents of the Scanout and Queued buffers are identical with the exception of the orange window.

The application is double buffered:

  1. Current. What it has displayed for the last frame

  2. Next. What it is constructing for the next frame




Ok, so in the steady state, here's what we want to happen:

  1. Application calls PresentPixmap with 'Next' for its window

  2. X server receives that call and copies Next to Queued.

  3. X server posts a Page Flip to the kernel with the Queued buffer

  4. Once the flip happens, the X server swaps the names of the Scanout and Queued buffers.




If the X server supports Overlays, then the sequence can look like:

  1. Application calls PresentPixmap

  2. X server receives that call and posts a Page Flip for the overlay

  3. When the page flip completes, the X server notifies the client that the previous Current buffer is now idle.




When the Compositing Manager has content to update outside of the orange window, it will:

  1. Compositing Manager calls PresentPixmap

  2. X server receives that call and paints the Current client image into the Render buffer

  3. X server swaps Render and Queued buffers

  4. X server posts Page Flip for the Queued buffer

  5. When the page flip occurs, the server can mark the Scanout buffer as idle and notify the Compositing Manager




If the Orange window is in an overlay, then the X server can skip step 2.

#### The Auto List

To give the Compositing Manager control over the presentation of all windows, each call to PresentPixmap by the Compositing Manager will be associated with the list of windows, the "Auto List", for which the X server will be responsible for providing suitable content. Transitioning from manual to automatic compositing can therefore be performed on a window-by-window basis, and each frame provided by the Compositing Manager will separately control how that happens.

The Steady State behavior above would be represented by having the same set of windows in the Auto List for the Scanout and Queued buffers, and when the Compositing Manager presents the Render buffer, it would also provide the same Auto List for that.

Importantly, the Auto List need not contain only children of the screen Root window. Any descendant window at all can be included, and the contents of that drawn into the image using appropriate clipping. This allows the Compositing Manager to draw the window manager frame while the client window is drawn by the X server.

Any window at all can be in the Auto List. Windows with PresentPixmap contents available would be drawn from those. Other windows would be drawn from their window pixmaps.

#### Transitioning from Manual to Auto

To transition a window from Manual mode to Auto mode, the Compositing Manager would add it to the Auto List for the Render image, and associate that Auto List with the PresentPixmap request for that image. For the first frame, the X server may not have received a PresentPixmap for the client window, and so the window contents would have to come from the Window Pixmap for the client.

I'm not sure how we'd get the Compositing Manager to provide another matching image that the X server can use for subsequent client frames; perhaps it would just create one itself?

#### Transitioning from Auto to Manual

To transition a window from Auto mode to Manual mode, the Compositing manager would remove it from the Auto List for the Render image and then paint the window contents into the render image itself. To do that, the X server would have to paint any PresentPixmap data from the client into the window pixmap; that would be done when the Compositing Manager called GetWindowPixmap.

### New Messages Required

For this to work, we need some way for the Compositing Manager to discover windows that are suitable for Auto composting. Normally, these will be windows managed by the Window Manager, but it's possible for them to be nested further within the application hierarchy, depending on how the application is constructed.

I think what we want is to tag Damage events with the source window, and perhaps additional information to help Compositing Managers determine whether it should be automatically presenting those source windows or a parent of them. Perhaps it would be helpful to also know whether the Damage event was actually caused by a PresentPixmap for the whole window?

To notify the server about the Auto List, a new request will be needed in the Present extension to set the value for a subsequent PresentPixmap request.

### Actually Drawing Frames

The DRM module in the Linux kernel doesn't provide any mechanism to remove or replace a Page Flip request. While this may get fixed at some point, we need to deal with how it works today, if only to provide reasonable support for existing kernels.

I think about the best we can do is to set a timer to fire a suitable time before vblank and have the X server wake up and execute any necessary drawing and Page Flip kernel calls. We can use feedback from the kernel to know how much slack time there was between any drawing and the vblank and adjust the timer as needed.

Given that the goal is to provide for reliable display of the client window, it might actually be sufficient to let the client PresentPixmap request drive the display; if the Compositing Manager provides new content for a frame where the client does not, we can schedule that for display using a timer before vblank. When the Compositing Manager provides new content after the client, it would be delayed until the next frame.

### Changes in Compositing Managers

As described above, one explicit goal is to ease the burden on Compositing Managers by making them able to opt-in to this new mechanism for a limited set of windows and only for a limited set of frames. Any time they need to take control over the screen presentation, a new frame can be constructed with an empty Auto List.

### Implementation Plans

This post is the first step in developing these ideas to the point where a prototype can be built. The next step will be to take feedback and adapt the design to suit. Of course, there's always the possibility that this design will also prove unworkable in practice, but I'm hoping that this third attempt will actually succeed.

--------------------------------------------------------------------------------

via: https://keithp.com/blogs/CompositeAcceleration/

作者：[keithp][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://keithp.com
[1]:https://keithp.com/pictures/ca-steady.svg
