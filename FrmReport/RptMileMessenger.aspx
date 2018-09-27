<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RptMileMessenger.aspx.vb" Inherits="WebMessenger.RptMileMessenger" %>

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
                    <br />
                    <label class="control-label" for="txtDate1">วันที่ </label>
                    &nbsp;
            <asp:TextBox ID="txtDate1" CssClass="input-medium" runat="server" Width="100"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate1" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    &nbsp;
                       </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <br />
        <div>
            <asp:Label ID="Label1" runat="server" Text="ผู้วิ่งงาน"></asp:Label>
            &nbsp;
            <asp:DropDownList ID="ddlMess" runat="server">
                <asp:ListItem>นาย ธเนศร์ จันทนมัฎฐะ</asp:ListItem>
                <asp:ListItem>นาย อิสระพงศ์ ห้องสำเริง</asp:ListItem>
                <asp:ListItem>นาย ประเสริฐ ไชยฉลาด</asp:ListItem>
                <asp:ListItem>นาย ชัยยงค์ อนุตโร</asp:ListItem>
                <asp:ListItem>นาย เอกพล มูลม่อม</asp:ListItem>
                <asp:ListItem>นาย จีระพันธ์ เลี้ยงเจริญ</asp:ListItem>
                <asp:ListItem>นาย บุญมี พรมมาก</asp:ListItem>
                <asp:ListItem>นาย อำนาจ สุขงาม</asp:ListItem>
                <asp:ListItem>นาย สุทธิพงษ์ กายท้วม</asp:ListItem>
                <asp:ListItem>นาย ณัฐพล แก้วตาด</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Report" />
        </div>
        <br />
        <br />
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" ReportSourceID="CrystalReportSource1" ToolPanelView="None" Height="50px" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="~/Report/crMileMessenger.rpt">
            </Report>
        </CR:CrystalReportSource>


    </form>
        <script src="Scripts/jquery-3.1.1.min.js"></script>
</body>
</html>
