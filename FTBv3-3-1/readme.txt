For furhter installation instructions, please visit http://wiki.freetextbox.com/

*********************************************
Requirements:
*********************************************
 - .NET Framework 1.1, 2.0, 3.5, or 4.0
 - IIS 5.0, 6.0, 7.0

*********************************************
Installation of dll
*********************************************
1. Copy the appropriate FreeTextBox.dll from Framework-X.X into your /bin/ folder

2. If you have a license file, copy FreeTextBox.lic into the /bin/ folder 
   next to FreeTextBox.dll

*********************************************
Installing the FreeTextBox support files
*********************************************

FreeTextBox uses JavaScript, images, and xml files. To correctly install FreeTextBox, 
you must install these files. FreeTextBox has two ways of accessing these files:

1. Internal Resources - All the images, javascript and xml can be streamed from inside the FreeTextBox.dll. 
   
For ASP.NET 1.0 and 1.0, you need to add the following httpHandler to web.config:

  <?xml version="1.0" encoding="utf-8" ?>
  <configuration>
   <system.web>
    <httpHandlers>
     <add verb="GET" path="FtbWebResource.axd" type="FreeTextBoxControls.AssemblyResourceHandler, FreeTextBox" />
    </httpHandlers>
   <system.web>
 <configuration>

For ASP.NET 4.0, you'll need to add <httpRuntime requestValidationMode="2.0" /> to allow HTML to be posted

<?xml version="1.0" encoding="utf-8" ?>
<configuration>
<system.web>			
  <httpRuntime requestValidationMode="2.0" />
</system.web> 
</configuration>


If you are attempting to use this method and having trouble, please view the source code of your page
and see where FtbWebResource.axd is being referenced. If it appears incorrect, please set
FreeTextBox.AssemblyResourceHandlerPath to the appropriate directory where you have set your web.config.


2. External Files - If you prefer not to use the internal JavaScript and image resources
   you can also have FreeTextBox link to external files which default to 
   ~/aspnet_client/FreeTextBox/.
   
   To use this, you need to do the following:

   - Tell FreeTextBox which kind of files to look for external resources: JavaScriptLocation=ExternalFile, ToolbarImages=ExternalFile, ButtonImagesLocation=ExternalFile
   - Set the SupportFolder property of your FreeTextBox instance to the directory where you copied the files. For example, if your website is stored at www.mysite.com/FreeTextBoxFiles/, you should set SupportFolder="/FreeTextBoxFiles/".

   <FTB:FreeTextBox id="FreeTextBox1" SupportFolder="~/myfolder/FreeTextBox" 
	JavaScriptLocation="ExternalFile"
	ToolbarImages="ExternalFile
	ButtonImagesLocation="ExternalFile"
	runat="server" />


*********************************************
Using FreeTextBox
*********************************************

To add FreeTextBox to an ASP.NET page, do the following:

1. Add the following lines to the top of your page:

   <@% Page ValidateRequest="false" %>
   <%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

2. Add the following code between <form runat="server"> tags:

   <FTB:FreeTextBox id="FreeTextBox1" runat="Server" />

Here's a complete example

   <@% Page ValidateRequest="false" %>
   <%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
   <!DOCTYPE html>
   <html>
   <head>
     <title>FreeTextBox Test</title>
   </head>
   <body>
     <form runat="server">
       <FTB:FreeTextBox id="FreeTextBox1" runat="Server" />
     </form>
   </body>
   </html>



*********************************************
Customizing FreeTextBox
*********************************************

FreeTextBox has as default set of buttons and dropdownlists in its toolbars. If you
would like to customize the buttons, there are three methods you can use.

1. ToolbarLayout String

This property accepts a string of ToolbarItem names. Use commas ( , ) to separate items. A pipe ( | ) will insert a ToolbarSeparator and a semicolon ( ; ) will start a new Toolbar.

The default way to configure toolbars is to use use the propery ToolbarLayout

 <@% Page ValidateRequest="false" %>
 <html>
 <body>
   <form runat="server">
     <FTB:FreeTextBox id="FreeTextBox1"
       ToolbarLayout="paragraphmenu,fontsizesmenu;bold,italic,underline|
        bulletedlist,numberedlist"
       runat="Server" />
   </form>
 </body>
 </html>

Valid values for ToolbarButtons and ToolbarDropDownLists are

 ParagraphMenu, FontFacesMenu, FontSizesMenu, FontForeColorsMenu, 
 FontForeColorPicker, FontBackColorsMenu, FontBackColorPicker, Bold, Italic, Underline,
 Strikethrough, Superscript, Subscript, InsertImageFromGallery, CreateLink, Unlink, 
 RemoveFormat, JustifyLeft, JustifyRight, JustifyCenter, JustifyFull, BulletedList, 
 NumberedList, Indent, Outdent, Cut, Copy, Paste, Delete, Undo, Redo, Print, Save, 
 ieSpellCheck, StyleMenu, SymbolsMenu, InsertHtmlMenu, InsertRule, InsertDate, 
 InsertTime, WordClean, InsertImage, InsertTable, EditTable, InsertTableRowBefore, 
 InsertTableRowAfter, DeleteTableRow, InsertTableColumnBefore, InsertTableColumnAfter, 
 DeleteTableColumn, InsertForm, InsertForm, InsertTextBox, InsertTextArea, 
 InsertRadioButton, InsertCheckBox, InsertDropDownList, InsertButton, InsertDiv, 
 InsertImageFromGallery, Preview, SelectAll, EditStyle

The following values are only available in Pro versions of FreeTextBox (or if running on localhost)

 FontForeColorPicker, FontBackColorPicker, EditTable
 InsertTableRowAfter, DeleteTableRow, InsertTableColumnBefore, InsertTableColumnAfter, 
 DeleteTableColumn, InsertForm, InsertForm, InsertTextBox, InsertTextArea, 
 InsertRadioButton, InsertCheckBox, InsertDropDownList, InsertButton, InsertDiv, 
 Preview, SelectAll, EditStyle, WordClean

2. Procedurally

You can define which toolbar items appear by adding ToolbarItems in much the same way that one would add DataGrid Columns to a DataGrid. In order to do this, set AutoGenerateToolbarLayoutFromString=false:

 <html>
 <body>
    <form runat="server">
        <FTB:FreeTextBox id="FreeTextBox1" AutoGenerateToolbarsFromString="false" runat="server" >
            <Toolbars>
                <FTB:Toolbar runat="server">
                    <FTB:ParagraphMenu runat="server" />
                    <FTB:FontSizesMenu runat="server" />
                </FTB:Toolbar>
                <FTB:Toolbar runat="server">
                    <FTB:Bold runat="server" />
                    <FTB:Italic runat="server" />
                    <FTB:Underline runat="server" />
                    <FTB:ToolbarSeparator runat="server" />
                    <FTB:BulletedList runat="server" />
                    <FTB:NumberedList runat="server" />
                </FTB:Toolbar>
                <FTB:Toolbar runat="server">
                    <FTB:InsertHtmlMenu runat="server">
                        <Items>
                            <FTB:ToolbarListItem Text="Cool1" Value="<b>lalala</b>" runat="server" />
                            <FTB:ToolbarListItem Text="Cool2" Value="<i>lalala</i>" runat="server" />
                            <FTB:ToolbarListItem Text="Cool3" Value="<u>lalala</u>" runat="server" />
                        </Items>
                    </FTB:InsertHtmlMenu>
                    <FTB:StyleMenu runat="server">
                        <Items>
                            <FTB:ToolbarListItem Text="Highlighed" Value="<b>Highlighed</b>" runat="server" />
                            <FTB:ToolbarListItem Text="SmallCaps" Value="<i>smallcaps</i>" runat="server" />
                        </Items>
                    </FTB:StyleMenu>
                </FTB:Toolbar>
            </Toolbars>
        </FTB:FreeTextBox>
    </form>
 </body>
 </html>

3. Code (Page_Load or Code Behind)

ToolbarButtons and ToolbarDropDownLists can also be set through code. You should set the property AutoGenerateToolbarsFromString to false if you want only the ToolbarItems you define.

 <script runat="server">
 void Page_Load(object Src, EventArgs E) {
    Toolbar toolbar1 = new Toolbar();
    toolbar1.Items.Add(new ParagraphMenu());
    toolbar1.Items.Add(new FontSizesMenu());


    FreeTextBox1.Toolbars.Add(toolbar1);


    Toolbar toolbar2 = new Toolbar();
    toolbar2.Items.Add(new Bold());
    toolbar2.Items.Add(new Italic());
    toolbar2.Items.Add(new Underline());
    toolbar2.Items.Add(new ToolbarSeparator());
    toolbar2.Items.Add(new BulletedList());
    toolbar2.Items.Add(new NumberedList());


    FreeTextBox1.Toolbars.Add(toolbar2);


    Toolbar toolbar3 = new Toolbar();
    StyleMenu styleMenu = new StyleMenu();
    styleMenu.Items.Add(new ToolbarListItem("Highlight","Highlight"));
    styleMenu.Items.Add(new ToolbarListItem("SmallCaps","smallcaps"));


    toolbar3.Items.Add(styleMenu);


    FreeTextBox1.Toolbars.Add(toolbar3);
 }
 </script>
 <html>
 <body>
    <form runat="server">
        <FTB:FreeTextBox id="FreeTextBox1" AutoGenerateToolbarsFromString="false" runat="server" />
    </form>
 </body>
 </html>
