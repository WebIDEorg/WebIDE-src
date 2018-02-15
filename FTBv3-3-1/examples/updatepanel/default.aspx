<%@ Page Language="C#" ValidateRequest="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral,
     PublicKeyToken=31bf3856ad364e35"
     Namespace="System.Web.UI" TagPrefix="asp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	protected void Button1_Click(object sender, EventArgs e)
	{
		TextBox1.Text = "updated: " + DateTime.Now.ToString();
           
	}


	protected void Button2_Click(object sender, EventArgs e)
	{
		FreeTextBox1.Text = "update me";
	}

	protected void Button3_Click(object sender, EventArgs e)
	{
		Literal1.Text = "<hr />Text: " + TextBox1.Text + "<hr />FTB: " + FreeTextBox1.Text;
	}

	protected void Button4_Click(object sender, EventArgs e)
	{
		UpdatePanel1.Visible = true;
	}

	protected void Button5_Click(object sender, EventArgs e)
	{
		Panel2.Visible = true;
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		FTB Update Panel<br />
		<br />
		<asp:ScriptManager ID="ScriptManager1" runat="server">
		</asp:ScriptManager>
    
    </div>
		&nbsp;
		<br />
		<strong>TEXT</strong>
		<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Show TextBox1 Panel" /><br />
		<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" Visible="False">
			<ContentTemplate>
				<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update TextBox1" /><br />
				<asp:TextBox ID="TextBox1" runat="server">initial text in the box</asp:TextBox>
			</ContentTemplate>
		</asp:UpdatePanel>
		<br />
		<strong>FREETEXTBOX</strong>
		<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" Visible="True">
			<ContentTemplate>
				<asp:Button ID="Button5" runat="server" Text="Show FTB1 Panel" OnClick="Button5_Click" /><br />
				<asp:Panel runat="server" id="Panel2" visible="false">
				<asp:Button ID="Button2" runat="server" Text="Update FTB" OnClick="Button2_Click" />
				<FTB:FreeTextBox ID="FreeTextBox1" runat="server" Text="initial FTB text" />
				</asp:Panel>
			</ContentTemplate>
		</asp:UpdatePanel>
		<br />
		<asp:Button ID="Button3" runat="server" Text="Full Postback" OnClick="Button3_Click" /><br />
		
		<asp:Literal ID="Literal1" runat="server" />
    </form>
</body>
</html>
