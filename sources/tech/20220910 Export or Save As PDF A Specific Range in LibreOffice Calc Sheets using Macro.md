[#]: subject: "Export or Save As PDF A Specific Range in LibreOffice Calc Sheets using Macro"
[#]: via: "https://www.debugpoint.com/export-or-save-as-pdf-a-specific-range-in-libreoffice-calc-sheets-using-macro/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Export or Save As PDF A Specific Range in LibreOffice Calc Sheets using Macro
======
A simple program to show you how you can export range from LibreOffice as pdf using macro.

Exporting a LO sheet’s content to PDF is often necessary because of the wide use of PDF files for distributions, reporting etc. In the earlier tutorial, I showed how to export [an entire sheet’s content to a pdf file][1]. In this tutorial, I will show how to export a specific range (e.g. A1:B2 etc.) as a content of a pdf file.

How to export an entire sheet to pdf tutorial can be found [here][2].

### Export A Range from Sheet as PDF Using Macro in LibreOffice

I have source data like this (see below).

The pdf should contain the colour and values from A1 to I3 range, and the pdf file name should contain the current Date, the Sheet Name (i.e. in this example, ‘mySheet’) and a fixed value from a cell (i.e. in this example B5).

The reason I have added all these types of cells is to show you that all formatting is preserved when you export the entire range to PDF.

![Source LO Sheet][3]

### Details of the Macro

There are two parts to this macro.

First, to prepare the pdf file name dynamically based on a specific value. The pdf file includes the sheet name, a value from B5 cell and the date. Below is a piece of code that does this part:

```
dim fileName
   fileName = ThisComponent.Sheets(0).Name & _
   "_ratie_" & ThisComponent.Sheets(0).getCellRangebyName("B5").String & _
   "_" & Replace(Date,"/","-") & ".pdf"
```

**[update#1]**One of our readers asked about how to get the Active sheet name, Or the name of the current Calc sheet selected. To get the current active selected sheet’s name, use the below code:

```
fileName = ThisComponent.getCurrentController.getActiveSheet.Name
```

Now, create an `Frame` object and dispatcher object to Uno service `com.sun.star.frame.DispatchHelper`, which would help to export the pdf via function.

Create an empty file as well, in any path of your own and close the file.

```
' change the path below as per your needs
   path ="file:///home/arindam/" & fileName
   Open path For Append As #1
   Close #1
```

Now, it’s time to put the content inside the pdf.

To do that, we need to use Filters. Filters are the types and value pairs that can be put in an array and passed to executeDispatch function as an argument. The types are pre-defined, and when passed they will be processed as what they are supposed to do.

In this example, we need to pass the filename and the Range of LO Sheet, which needed to be printed only in the pdf, nothing else from the active sheet. The in-built Filter property `FilterData` to be used here.

```
document = ThisComponent.CurrentController.Frame
   dispatcher = createUnoService("com.sun.star.frame.DispatchHelper")
   
   oSheet =  ThisComponent.CurrentController.getActiveSheet()
   oCellRange = oSheet.getCellRangeByName("A1:I3")
   
   dim aFilterData(0) as new com.sun.star.beans.PropertyValue
   aFilterData(0).Name = "Selection"
   aFilterData(0).Value = oCellRange

   dim args1(1) as new com.sun.star.beans.PropertyValue
   args1(0).Name = "URL"
   args1(0).Value = "file:///home/arindam/" & fileName  ' change the path below as per your needs
   
   args1(1).Name = "FilterData"
   args1(1).Value = aFilterData()
```

Now pass this argument to the `executeDispatch` function as an argument.

```
dispatcher.executeDispatch(document, ".uno:ExportDirectToPDF", "", 0, args1())
```

### Running the Macro

Here is the pdf file that is created with the range of contents for this tutorial:

![PDF File Created After Run][4]

![Run – pdf Contents][5]

### Complete Macro

```
Sub ExportRangeToPDF()
   dim document as object
   dim dispatcher as object
   dim fileName
   fileName = ThisComponent.Sheets(0).Name & _
   					"_ratie_" &  ThisComponent.Sheets(0).getCellRangebyName("B5").String & _
   					 "_" & Replace(Date,"/","-") & ".pdf"
   document = ThisComponent.CurrentController.Frame
   dispatcher = createUnoService("com.sun.star.frame.DispatchHelper")
   
   oSheet =  ThisComponent.CurrentController.getActiveSheet()
   oCellRange = oSheet.getCellRangeByName("A1:I3")
   
   dim aFilterData(0) as new com.sun.star.beans.PropertyValue
   aFilterData(0).Name = "Selection"
   aFilterData(0).Value = oCellRange
 
   ' change the path below as per your needs
   path ="file:///home/arindam/" & fileName
   Open path For Append As #1
   Close #1
 
   dim args1(1) as new com.sun.star.beans.PropertyValue
   args1(0).Name = "URL"
   args1(0).Value = "file:///home/arindam/" & fileName  ' change the path below as per your needs
   
   args1(1).Name = "FilterData"
   args1(1).Value = aFilterData()
 
   dispatcher.executeDispatch(document, ".uno:ExportDirectToPDF", "", 0, args1())
End Sub
```

If you face any problem running this, drop a comment using the comment box below.

#### References

* [Filters][6]
* [Filter list][7]
* [service mediaDescriptor][8]

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/export-or-save-as-pdf-a-specific-range-in-libreoffice-calc-sheets-using-macro/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/export-or-save-as-pdf-in-libreoffice-calc-sheets-using-macro/
[2]: http://www.debugpoint.com/2014/10/export-or-save-as-pdf-in-libreoffice-calc-sheets-using-macro/
[3]: https://www.debugpoint.com/wp-content/uploads/2015/08/Source-LO-Sheet.png
[4]: https://www.debugpoint.com/wp-content/uploads/2015/08/PDF-File-Created-After-Run.png
[5]: https://www.debugpoint.com/wp-content/uploads/2015/08/Run-pdf-Contents.png
[6]: https://wiki.openoffice.org/wiki/API/Tutorials/PDF_export#PDF_Export_filter_data
[7]: https://wiki.openoffice.org/wiki/Framework/Article/Filter/FilterList_OOo_3_0
[8]: https://www.openoffice.org/api/docs/common/ref/com/sun/star/document/MediaDescriptor.html
