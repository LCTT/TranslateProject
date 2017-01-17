fuowang翻译中

Installing, Obtaining, and Making GTK Themes
----------------

Many Linux desktops supporting themes. A theme is a particular appearance or "****" for the GUI. Users can change the theme to make the desktop look different. Usually, users also change the icons. However, the theme and icon-pack are two separate entities. Numerous people want to make their own theme, so here is an article about making GTK themes as well as various essential information.

**NOTE:** This article primarily focuses on GTK3, but it will discuss a little about GTK2, Metacity, and others. Cursors and icons will not be discussed in this article.

**Basic Concepts**
The GIMP ToolKit (GTK) is a widget-toolkit used to create GUIs on a variety of systems (thus making GTK cross-platform). GTK ([http://www.gtk.org/][17]) is commonly and incorrectly thought to stand for "GNOME ToolKit", but is actually stands for "GIMP ToolKit" because it was first created to design an user interface for GIMP. GTK is an object-oriented toolkit written in C (GTK itself is not a language). GTK is entirely open-source under the LGPL license. GTK is a widely used toolkit for GUIs and many tools are available for GTK.

Themes made for GTK will not work in Qt-based applications. A Qt-theme is needed to apply a theme to Qt applications.

The themes use Cascading Style-Sheets (CSS) to generate the theme's appearance. This is the same CSS that web-developers use on web-pages. However, instead of HTML tags being referenced, GTK widgets are specified. It is important that theme developers learn CSS.

**Theme Location**
Themes may be stored in "~/.themes" or "/usr/share/themes". Themes that are in "~/.themes" are only accessible to the owner of that home folder. While themes in "/usr/share/themes" are global-themes that are accessible by all users. When a GTK application executes, it has a list of possible theme files that it checks in a specific order. If the theme file is not found, then it will try the next file on the list. Below is the list in the order that GTK3 applications try to use.
$XDG_CONFIG_HOME/gtk-3.0/gtk.css (typically ~/.config/gtk-3.0/gtk.css)
~/.themes/NAME/gtk-3.0/gtk.css
$datadir/share/themes/NAME/gtk-3.0/gtk.css (typically /usr/share/themes/name/gtk-3.0/gtk.css)

**NOTE:** "NAME" is a placeholder for the name of the current theme.

If there are two themes with the same name, then the one in the user's home folder (~/.themes) will be used. Developers can take advantage of GTK's theme-seeking algorithm by testing new themes in their local home's theme directory.

**Theme Engines**
A "Theme engine" is a piece of software that changes the look of the GUI's widgets. The engine reads and uses the theme's files to know how the various widgets should be drawn. Some engines come with themes of their own. Each engine has its advantages and disadvantages, and some engines add special properties and features.

Many theme-engines can be obtained from the default repositories. Debian-based Linux distros can execute "apt-get install gtk2-engines-murrine gtk2-engines-pixbuf gtk3-engines-unico" to install three different engines. Many engines are available for both GTK2 and GTK3\. Below is a small list of examples.

*   gtk2-engines-aurora - Aurora GTK2 engine
*   gtk2-engines-pixbuf - Pixbuf GTK2 engine
*   gtk3-engines-oxygen - Engine port of the Oxygen widget style to GTK
*   gtk3-engines-unico - Unico GTK3 engine
*   gtk3-engines-xfce - GTK3 engine for Xfce

**Creating GTK3 Themes**
To create a GTK3 theme, developers can start with an empty file or they can use a pre-existing theme as a template. It may help beginners to start with a pre-existing theme. For instance, a theme can be copied to the user's home folder and then the developer can start editing the files.

The general format for a GTK3 theme is to create a folder named after the theme. Then, create a sub-directory called "gtk-3.0" and create a file inside of it named "gtk.css". In the "gtk.css" file, use CSS code to control how the theme will look. Move the theme to ~/.themes for testing purposes. Use the newly created theme and make changes as necessary. If desired, developers can add additional components to the theme for GTK2, Openbox, Metacity, Unity, etc.

To explain how to create themes, we will study the "Ambiance" theme, which is usually found at /usr/share/themes/Ambiance. This directory contains the below listed sub-directories and a file named "index.theme".

*   gtk-2.0
*   gtk-3.0
*   metacity-1
*   unity

"**index.theme**" contains metadata (such as the theme's name) and some important settings (such as the button layout). Below is the "index.theme" file for "Ambiance".

Code:
```
[Desktop Entry]
Type=X-GNOME-Metatheme
Name=Ambiance
Comment=Ubuntu Ambiance theme
Encoding=UTF-8

[X-GNOME-Metatheme]
GtkTheme=Ambiance
MetacityTheme=Ambiance
IconTheme=ubuntu-mono-dark
CursorTheme=DMZ-White
ButtonLayout=close,minimize,maximize:
X-Ubuntu-UseOverlayScrollbars=true
```

The "**gtk-2.0**" directory contains files for GTK2 such as a "gtkrc" file and an "apps" directory that contains application-specific GTK settings. The "gtkrc" file is the main CSS-file for the GTK2 portion of the theme. Below are the contents of /usr/share/themes/Ambiance/gtk-2.0/apps/nautilus.rc

Code:
```
# ==============================================================================
# NAUTILUS SPECIFIC SETTINGS
# ==============================================================================

style "nautilus_info_pane" {
   bg[NORMAL] = @bg_color
}

widget_class "*Nautilus*<GtkNotebook>*<GtkEventBox>" style "nautilus_info_pane"
widget_class "*Nautilus*<GtkButton>" style "notebook_button"
widget_class "*Nautilus*<GtkButton>*<GtkLabel>" style "notebook_button"
```

The "**gtk-3.0**" directory contains files for GTK3\. Instead of "gtkrc", GTK3 uses "gtk.css" as the main theme file. In the Ambiance theme, the file contains one line - '@import url("gtk-main.css");'. The "settings.ini" file contains important theme-wide settings. GTK3 themes use an "apps" directory for the same purpose as GTK2\. The "assets" directory contains images for radio buttons, check-boxes, etc. Below are the contents of /usr/share/themes/Ambiance/gtk-3.0/gtk-main.css

Code:
```
/*default color scheme */
@define-color bg_color #f2f1f0;
@define-color fg_color #4c4c4c;
@define-color base_color #ffffff;
@define-color text_color #3C3C3C;
@define-color selected_bg_color #f07746;
@define-color selected_fg_color #ffffff;
@define-color tooltip_bg_color #000000;
@define-color tooltip_fg_color #ffffff;

/* misc colors used by gtk+
 *
 * Gtk doesn't currently expand color variables for style properties. Thus,
 * gtk-widgets.css uses literal color names, but includes a comment containing
 * the name of the variable. Please remember to change values there as well
 * when changing one of the variables below.
 */
@define-color info_fg_color rgb (181, 171, 156);
@define-color info_bg_color rgb (252, 252, 189);
@define-color warning_fg_color rgb (173, 120, 41);
@define-color warning_bg_color rgb (250, 173, 61);
@define-color question_fg_color rgb (97, 122, 214);
@define-color question_bg_color rgb (138, 173, 212);
@define-color error_fg_color rgb (235, 235, 235);
@define-color error_bg_color rgb (223, 56, 44);
@define-color link_color @selected_bg_color;
@define-color success_color #4e9a06;
@define-color error_color #df382c;

/* theme common colors */
@define-color button_bg_color shade (@bg_color, 1.02); /*shade (#cdcdcd, 1.08);*/
@define-color notebook_button_bg_color shade (@bg_color, 1.02);
@define-color button_insensitive_bg_color mix (@button_bg_color, @bg_color, 0.6);
@define-color dark_bg_color #3c3b37;
@define-color dark_fg_color #dfdbd2;

@define-color backdrop_fg_color mix (@bg_color, @fg_color, 0.8);
@define-color backdrop_text_color mix (@base_color, @text_color, 0.8);
@define-color backdrop_dark_fg_color mix (@dark_bg_color, @dark_fg_color, 0.75);
/*@define-color backdrop_dark_bg_color mix (@dark_bg_color, @dark_fg_color, 0.75);*/
@define-color backdrop_selected_bg_color shade (@bg_color, 0.92);
@define-color backdrop_selected_fg_color @fg_color;

@define-color focus_color alpha (@selected_bg_color, 0.5);
@define-color focus_bg_color alpha (@selected_bg_color, 0.1);

@define-color shadow_color alpha(black, 0.5);

@define-color osd_fg_color #eeeeec;
@define-color osd_bg_color alpha(#202526, 0.7);
@define-color osd_border_color alpha(black, 0.7);

@import url("gtk-widgets-borders.css");
@import url("gtk-widgets-assets.css");
@import url("gtk-widgets.css");
@import url("apps/geary.css");
@import url("apps/unity.css");
@import url("apps/baobab.css");
@import url("apps/gedit.css");
@import url("apps/nautilus.css");
@import url("apps/gnome-panel.css");
@import url("apps/gnome-terminal.css");
@import url("apps/gnome-system-log.css");
@import url("apps/unity-greeter.css");
@import url("apps/glade.css");
@import url("apps/california.css");
@import url("apps/software-center.css");
@import url("public-colors.css");
```

The "**metacity-1**" folder contains images that the Metacity window-manager uses for buttons (such as the "close window" button). This directory also contains a file named "metacity-theme-1.xml" that contain's the theme's metadata (like the developer's name) and styling. However, the Metacity portion of the theme uses XML rather than CSS.

The "**unity**" directory contains SVG files that Unity uses for buttons. Besides the SVG files, there are no other files in this folder.

Some themes may contain other directories. For instance, "Clearlooks-Phenix" has a folder named "**openbox-3**" and "**xfwm4**". The "openbox-3" folder only contains a "themerc" file that declares the settings and appearance (a sample is seen below). The "xfwm4" directory contains *.xpm files, *.png images (in the "png" folder), a "README" file, and a "themerc" file which contains settings (as seen below).
/usr/share/themes/Clearlooks-Phenix/xfwm4/themerc

Code:
```
# Clearlooks XFWM4 by Casey Kirsle

show_app_icon=true
active_text_color=#FFFFFF
inactive_text_color=#939393
title_shadow_active=frame
title_shadow_inactive=false
button_layout=O|HMC
button_offset=2
button_spacing=2
full_width_title=true
maximized_offset=0
title_vertical_offset_active=1
title_vertical_offset_inactive=1
```

/usr/share/themes/Clearlooks-Phenix/openbox-3/themerc

Code:
```
!# Clearlooks-Evolving
!# Clearlooks as it evolves in gnome-git...
!# Last updated 09/03/10

# Fonts
# these are really halos, but who cares?

*.font: shadow=n
window.active.label.text.font:shadow=y:shadowtint=30:shadowoffset=1
window.inactive.label.text.font:shadow=y:shadowtint=00:shadowoffset=0
menu.items.font:shadow=y:shadowtint=0:shadowoffset=1

!# general stuff

border.width: 1
padding.width: 3
padding.height: 2
window.handle.width: 3
window.client.padding.width: 0
menu.overlap: 2
*.justify: center

!# lets set our damn shadows here, eh?

*.bg.highlight: 50
*.bg.shadow:  05

window.active.title.bg.highlight: 35
window.active.title.bg.shadow:  05

window.inactive.title.bg.highlight: 30
window.inactive.title.bg.shadow:  05

window.*.grip.bg.highlight: 50
window.*.grip.bg.shadow:  30

window.*.handle.bg.highlight: 50
window.*.handle.bg.shadow:  30

!# Menu settings

menu.border.color: #aaaaaa
menu.border.width: 1

menu.title.bg: solid flat
menu.title.bg.color: #E6E7E6
menu.title.text.color: #111111

menu.items.bg: Flat Solid
menu.items.bg.color: #ffffff
menu.items.text.color: #111111
menu.items.disabled.text.color: #aaaaaa

menu.items.active.bg: Flat Gradient splitvertical border

menu.items.active.bg.color: #97b8e2
menu.items.active.bg.color.splitTo: #a8c5e9

menu.items.active.bg.colorTo: #91b3de
menu.items.active.bg.colorTo.splitTo: #80a7d6
menu.items.active.bg.border.color: #4b6e99
menu.items.active.text.color: #ffffff

menu.separator.width: 1
menu.separator.padding.width: 0
menu.separator.padding.height: 3
menu.separator.color: #aaaaaa

!# set handles here and only the once?

window.*.handle.bg: Raised solid
window.*.handle.bg.color: #eaebec

window.*.grip.bg: Raised solid
window.*.grip.bg.color: #eaebec

!# Active

window.*.border.color: #585a5d

window.active.title.separator.color: #4e76a8

*.title.bg: Raised Gradient splitvertical
*.title.bg.color: #8CB0DC
*.title.bg.color.splitTo: #99BAE3
*.title.bg.colorTo: #86ABD9
*.title.bg.colorTo.splitTo: #7AA1D1

window.active.label.bg: Parentrelative
window.active.label.text.color: #ffffff

window.active.button.*.bg: Flat Gradient splitvertical Border

window.active.button.*.bg.color: #92B4DF
window.active.button.*.bg.color.splitTo: #B0CAEB
window.active.button.*.bg.colorTo: #86ABD9
window.active.button.*.bg.colorTo.splitTo: #769FD0

window.active.button.*.bg.border.color: #49678B
window.active.button.*.image.color: #F4F5F6

window.active.button.hover.bg.color: #b5d3ef
window.active.button.hover.bg.color.splitTo: #b5d3ef
window.active.button.hover.bg.colorTo: #9cbae7
window.active.button.hover.bg.colorTo.splitTo: #8caede
window.active.button.hover.bg.border.color: #4A658C
window.active.button.hover.image.color: #ffffff

window.active.button.pressed.bg: Flat solid Border
window.active.button.pressed.bg.color: #7aa1d2

window.active.button.hover.bg.border.color: #4A658C

!# inactive

!#window.inactive.border.color: #7e8285
window.inactive.title.separator.color: #96999d

window.inactive.title.bg: Raised Gradient splitvertical
window.inactive.title.bg.color: #E3E2E0
window.inactive.title.bg.color.splitTo: #EBEAE9
window.inactive.title.bg.colorTo: #DEDCDA
window.inactive.title.bg.colorTo.splitTo: #D5D3D1

window.inactive.label.bg: Parentrelative
window.inactive.label.text.color: #70747d

window.inactive.button.*.bg: Flat Gradient splitVertical Border
window.inactive.button.*.bg.color: #ffffff
window.inactive.button.*.bg.color.splitto: #ffffff
window.inactive.button.*.bg.colorTo: #F9F8F8
window.inactive.button.*.bg.colorTo.splitto: #E9E7E6
window.inactive.button.*.bg.border.color: #928F8B
window.inactive.button.*.image.color: #6D6C6C

!# osd (pop ups and what not, dock?)

osd.border.width: 1
osd.border.color:  #aaaaaa

osd.bg: flat border gradient splitvertical
osd.bg.color: #F0EFEE
osd.bg.color.splitto: #f5f5f4
osd.bg.colorTo: #EAEBEC
osd.bg.colorTo.splitto: #E7E5E4

osd.bg.border.color: #ffffff

osd.active.label.bg: parentrelative
osd.active.label.bg.color: #efefef
osd.active.label.bg.border.color: #9c9e9c
osd.active.label.text.color: #444

osd.inactive.label.bg: parentrelative
osd.inactive.label.text.color: #70747d

!# yeah whatever, this is fine anyhoo?
osd.hilight.bg: flat vertical gradient
osd.hilight.bg.color: #9ebde5
osd.hilight.bg.colorTo: #749dcf
osd.unhilight.bg: flat vertical gradient
osd.unhilight.bg.color: #BABDB6
osd.unhilight.bg.colorTo: #efefef
```

**Testing Themes**
When creating themes, it may be helpful to test it and tweak the code to get the desired appearance. Such developers may want to use some type of "theme-previewer". Thankfully, some exist.

*   GTK+ Change Theme - This program can change the GTK theme and allow developers to preview the theme. The program is composed of one window that contains many widgets, thus providing a complete preview for the theme. To install this program, type "apt-get install gtk-chtheme".
*   GTK Theme Switch - This program allows users to easily change the user's theme. Be sure to have some applications open to view and test the theme. To install this program, type "apt-get install gtk-theme-switch" and type "gtk-theme-switch2" in a terminal to run it.
*   LXappearance - This program can change themes, icons, and fonts.
*   PyWF - This is a Python-based alternative to "The Widget Factory". PyWF can be obtained at [http://gtk-apps.org/content/show.php/PyTWF?content=102024][1]
*   The Widget Factory - This is an old GTK-previewer. To install this program, type "apt-get install thewidgetfactory" and type "twf" in a terminal to run it.

**Theme Downloads**

*   Cinnamon - [http://gnome-look.org/index.php?xcontentmode=104][2]
*   Compiz - [http://gnome-look.org/index.php?xcontentmode=102][3]
*   GNOME Shell - [http://gnome-look.org/index.php?xcontentmode=191][4]
*   GTK2 - [http://gnome-look.org/index.php?xcontentmode=100][5]
*   GTK3 - [http://gnome-look.org/index.php?xcontentmode=167][6]
*   KDE/Qt - [http://kde-look.org/index.php?xcontentmode=8x9x10x11x12x13x14x15x16][7]
*   Linux Mint Themes - [http://linuxmint-art.org/index.php?xcontentmode=9x14x100][8]
*   Metacity - [http://gnome-look.org/index.php?xcontentmode=101][9]
*   Ubuntu Themes - [http://www.ubuntuthemes.org/][10]

**Further Reading**

*   Graphical User Interface (GUI) Reading Guide - [http://www.linux.org/threads/gui-reading-guide.6471/][11]
*   GTK - [http://www.linux.org/threads/understanding-gtk.6291/][12]
*   Introduction to Glade - [http://www.linux.org/threads/introduction-to-glade.7142/][13]
*   Desktop Environment vs Window Managers - [http://www.linux.org/threads/desktop-environment-vs-window-managers.7802/][14]
*   Official GTK+ 3 Reference Manual - [https://developer.gnome.org/gtk3/stable/][15]
*   GtkCssProvider - [https://developer.gnome.org/gtk3/stable/GtkCssProvider.html][16]

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/installing-obtaining-and-making-gtk-themes.8463/

作者：[DevynCJohnson][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linux.org/members/devyncjohnson.4843/
[1]:http://gtk-apps.org/content/show.php/PyTWF?content=102024
[2]:http://gnome-look.org/index.php?xcontentmode=104
[3]:http://gnome-look.org/index.php?xcontentmode=102
[4]:http://gnome-look.org/index.php?xcontentmode=191
[5]:http://gnome-look.org/index.php?xcontentmode=100
[6]:http://gnome-look.org/index.php?xcontentmode=167
[7]:http://kde-look.org/index.php?xcontentmode=8x9x10x11x12x13x14x15x16
[8]:http://linuxmint-art.org/index.php?xcontentmode=9x14x100
[9]:http://gnome-look.org/index.php?xcontentmode=101
[10]:http://www.ubuntuthemes.org/
[11]:http://www.linux.org/threads/gui-reading-guide.6471/
[12]:http://www.linux.org/threads/understanding-gtk.6291/
[13]:http://www.linux.org/threads/introduction-to-glade.7142/
[14]:http://www.linux.org/threads/desktop-environment-vs-window-managers.7802/
[15]:https://developer.gnome.org/gtk3/stable/
[16]:https://developer.gnome.org/gtk3/stable/GtkCssProvider.html
[17]:http://www.gtk.org/
