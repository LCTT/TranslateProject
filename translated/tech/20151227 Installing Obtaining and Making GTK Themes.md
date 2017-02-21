获取、安装和制作 GTK 主题
----------------

非常多的桌面版 Linux 都支持主题。GUI（译者注：图形用户界面）独有的外观或者”风格“叫做主题。用户可以改变主题让桌面看起来与众不同。通常，用户也会更改图标。然而，主题和图标包是两个独立的实体。很多人想制作他们自己的主题，因此这是一篇关于GTK 主题的制作以及各种制作时必需的信息的文章。

**注意：** 这篇文章着重讨论 GTK3，但会稍微谈一下 GTK2、Metacity 等。本文不会讨论光标和图标。

**基本概念**
GIMP 工具包（简称 GTK）是一个用来创造在多种系统上（如此造就了 GTK 的跨平台）图形用户界面的构件工具包。GTK（[http://www.gtk.org/][17]）通常被错误地认为代表“GNOME 工具包”，但实际上它代表“GIMP 工具包”，因为最初创造它是为了给 GIMP 设计用户界面。GTK 是一个用 C 语言编写的面向对象工具包（GTK 本身不是一种语言）。GTK 遵循 LGPL协议完全开源。GTK 是一个使用广泛的图形用户界面工具包，它含有很多可用工具。

GTK 主题无法在基于 QT 的应用上使用。QT 主题需要在基于 QT 的应用上使用。

主题使用层叠样式表（CSS）来生成主题样式。这里的 CSS 和网站开发者在网页上使用的相同。然而它引用的 HTML 标签被 GTK 构件的专用标签代替。学习 CSS 对主题开发者来说很重要。

**主题存放位置**
主题可能会存储在“~/.themes”或者“/usr/share/themes”文件夹中。存放在“~/.themes”文件夹下的主题只有此 home 文件夹的所有者可以使用。而存放在“/usr/share/themes”文件夹下的全局主题可供所有用户使用。当执行 GTK 程序时，它会按照某种确定的顺序检查可用主题文件的列表。如果没有找到主题文件，它会尝试检查列表中的下一个文件。下述文字是 GTK3 程序检查时的顺序列表。
$XDG_CONFIG_HOME/gtk-3.0/gtk.css （另一写法 ~/.config/gtk-3.0/gtk.css）
~/.themes/NAME/gtk-3.0/gtk.css
$datadir/share/themes/NAME/gtk-3.0/gtk.css （另一写法 /usr/share/themes/name/gtk-3.0/gtk.css）

**注意：** ”NAME“是当前主题名称的占位符。

如果有两个主题名字相同，那么存放在用户 home 文件夹（~/.themes）里的主题会被使用。开发者测试存放在本地 home 文件夹的主题时可以好好的利用 GTK 的主题查找算法。

**主题引擎**
主题引擎是软件的一部分，用来改变图形用户界面构件的外观。引擎通过解析主题文件来了解应当绘制多少种构件。有些引擎随着主题被开发出来。每种引擎都有优点和缺点，还有些引擎添加了某些特性和特色。

从默认软件源中可以获取很多主题引擎。Debian 系的 Linux 发行版可以执行“apt-get install gtk2-engines-murrine gtk2-engines-pixbuf gtk3-engines-unico”命令来安装三种不同的引擎。很多引擎同时支持 GTK2 和 GTK3。以下述短列表为例。

*   gtk2-engines-aurora - Aurora GTK2 engine
*   gtk2-engines-pixbuf - Pixbuf GTK2 engine
*   gtk3-engines-oxygen - Engine port of the Oxygen widget style to GTK
*   gtk3-engines-unico - Unico GTK3 engine
*   gtk3-engines-xfce - GTK3 engine for Xfce

**创作 GTK3 主题**
开发者创作 GTK3 主题时，或者从空文件着手，或者将已有的主题作为模板。从现存主题着手可能会对新手有帮助。比如，开发者可以把主题复制到用户的 home 文件夹，然后编辑这些文件。

GTK3 主题的通用格式是新建一个以主题名字命名的文件夹。然后新建一个名为“gtk-3.0”的子目录，在子目录里新建一个名为“gtk.css”的文件。在文件“gtk.css“里，使用 CSS 代码写出主题的外观。为了测试将主题移动到 ~/.theme 里。使用新主题并在必要时进行改进。如果有需求，开发者可以添加额外的组件，使主题支持 GTK2，Openbox，Metacity，Unity等桌面环境。

为了阐明如何创造主题，我们会学习”Ambiance“主题，通常可以在 /usr/share/themes/Ambiance 找到它。此目录包含下面列出的子目录以及一个名为”index.theme“的文件。

*   gtk-2.0
*   gtk-3.0
*   metacity-1
*   unity

“**index.theme**”含有元数据（比如主题的名字）和一些重要的配置（比如按钮的布局）。下面是”Ambiance“主题的”index.theme“文件内容。

代码：
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

”**gtk-2.0**“目录包括支持 GTK2 的文件，比如文件”gtkrc“和文件夹”apps“。文件夹”apps“包括具体程序的 GTK 配置。文件”gtkrc“是 GTK2 部分的主要 CSS 文件。下面是 /usr/share/themes/Ambiance/gtk-2.0/apps/nautilus.rc 文件的内容。

代码:
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

”**gtk-3.0**“目录里是 GTK3 的文件。GTK3 使用”gtk.css“取代了"gtkrc"，作为主文件。对于 Ambiance 主题，此文件有一行‘@import url("gtk-main.css");’。”settings.ini“是重要的主题范围配置文件。GTK3 主题的”apps“目录和 GTK2 有同样的作用。”assets“目录里有单选按钮、多选框等的图像文件。下面是 /usr/share/themes/Ambiance/gtk-3.0/gtk-main.css 的内容。

代码:
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

”**metacity-1**“文件夹含有 Metacity 窗口管理器按钮（比如”关闭窗口“按钮）的图像文件。此目录还有一个名为”metacity-theme-1.xml“的文件，包括了主题的元数据（像开发者的名字）和主题设计。然而，主题的 Metacity 部分使用 XML 文件而不是 CSS 文件。

”**unity**“文件夹含有 Unity 按钮使用的 SVG 文件。除了 SVG 文件，这里没有其他的文件。

一些主题可能也会包含其他的目录。比如，“Clearlooks-Phenix”主题有名为”**openbox-3**”和“**xfwm4**“的文件夹。”openbox-3“文件夹仅有一个”themerc“文件，声明了主题配置和外观（下面有文件示例）。”xfwm4“目录含有几个 xpm 文件，几个 png 图像文件（在”png“文件夹里），一个”README“文件，还有个包含了主题配置的”themerc“文件（就像下面看到的那样）。
/usr/share/themes/Clearlooks-Phenix/xfwm4/themerc

代码：
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

代码：
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

**测试主题**
在创作主题时，测试主题并且微调代码对得到想要的样子是很有帮助的。有相当的开发者想要用到”主题预览器“这样的工具呢。幸运的是，已经有了。

*   GTK+ Change Theme - 这个程序可以更改 GTK 主题，开发者可以用它预览主题。这个程序由一个含有很多构件的窗口组成，因此可以为主题提供一个完整的预览。要安装它，只需输入命令”apt-get install gtk-chtheme“。
*   GTK Theme Switch - 用户可以使用它轻松的更换用户主题。测试主题时确保打开了一些应用，方便预览效果。要安装它，只需输入命令”apt-get install gtk-theme-switch“，然后在终端敲出”gtk-theme-switch2“即可运行。
*   LXappearance - 它可以更换主题，图标以及字体。
*   PyWF - 这是”The Widget Factory“的一个基于 Python 的可选组件。可以在[http://gtk-apps.org/content/show.php/PyTWF?content=102024][1]获取Pywf。
*   The Widget Factory - 这是一个古老的 GTK 预览器。要安装它，只需输入命令”apt-get install thewidgetfactory"，然后在终端敲出“twf”即可运行。

**主题下载**

*   Cinnamon - [http://gnome-look.org/index.php?xcontentmode=104][2]
*   Compiz - [http://gnome-look.org/index.php?xcontentmode=102][3]
*   GNOME Shell - [http://gnome-look.org/index.php?xcontentmode=191][4]
*   GTK2 - [http://gnome-look.org/index.php?xcontentmode=100][5]
*   GTK3 - [http://gnome-look.org/index.php?xcontentmode=167][6]
*   KDE/Qt - [http://kde-look.org/index.php?xcontentmode=8x9x10x11x12x13x14x15x16][7]
*   Linux Mint Themes - [http://linuxmint-art.org/index.php?xcontentmode=9x14x100][8]
*   Metacity - [http://gnome-look.org/index.php?xcontentmode=101][9]
*   Ubuntu Themes - [http://www.ubuntuthemes.org/][10]

**延伸阅读**

*   Graphical User Interface (GUI) Reading Guide - [http://www.linux.org/threads/gui-reading-guide.6471/][11]
*   GTK - [http://www.linux.org/threads/understanding-gtk.6291/][12]
*   Introduction to Glade - [http://www.linux.org/threads/introduction-to-glade.7142/][13]
*   Desktop Environment vs Window Managers - [http://www.linux.org/threads/desktop-environment-vs-window-managers.7802/][14]
*   Official GTK+ 3 Reference Manual - [https://developer.gnome.org/gtk3/stable/][15]
*   GtkCssProvider - [https://developer.gnome.org/gtk3/stable/GtkCssProvider.html][16]

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/installing-obtaining-and-making-gtk-themes.8463/

作者：[DevynCJohnson][a]
译者：[fuowang](https://github.com/fuowang)
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
