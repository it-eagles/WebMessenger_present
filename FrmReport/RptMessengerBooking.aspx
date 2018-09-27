<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RptMessengerBooking.aspx.vb" Inherits="WebMessenger.RptMessengerBooking" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <label class="control-label" for="txtDate1">จากวันที่ </label>
                    &nbsp;<asp:TextBox ID="txtDate1" CssClass="input-medium" runat="server" Width="80"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate1" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <label class="control-label" for="txtDate2">&nbsp;ถึงวันที่</label>&nbsp;
            <asp:TextBox ID="txtDate2" CssClass="input-medium" runat="server" Width="80"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDate2" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Report" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" ReportSourceID="CrystalReportSource1" ToolPanelView="None" Height="50px" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="~/Report/crMessengerBooking.rpt">
            </Report>
        </CR:CrystalReportSource>


    </form>
        <script src="Scripts/jquery-3.1.1.min.js"></script>
</body>
</html>
