<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Default.aspx.vb" Inherits="WebMessenger.Booking" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="form-horizontal">
            <div class="col-md-3">
                <div class="form-group">
                    <label class="col-md-4 control-label" for="txtDate1">วันที่ค้นหา</label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtDate1" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtDate1" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                   <label class="col-md-4 control-label" for="txtDate2">ถึงวันที่</label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtDate2" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" TargetControlID="txtDate2" Format="dd/MM/yyyy"></asp:CalendarExtender>

                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label class="col-md-4 control-label" for="txtSearchDate">สาขา</label>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlBranchSearch" runat="server" CssClass="form-control input-sm">
                            <asp:ListItem>ทุกสาขา</asp:ListItem>
                            <asp:ListItem>SPM</asp:ListItem>
                            <asp:ListItem>PTN</asp:ListItem>
                            <asp:ListItem>LKB</asp:ListItem>
                            <asp:ListItem>SBIA</asp:ListItem>
                            <asp:ListItem>CKT</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                       <label class="col-md-4 control-label" for="txtSearchDate">ผู้วิ่งงาน</label>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlMessengerSearch" runat="server" CssClass="form-control input-sm">
                            <asp:ListItem>ทุกคน</asp:ListItem>
                            <asp:ListItem>นาย ธเนศร์ จันทนมัฎฐะ</asp:ListItem>
                            <asp:ListItem>นาย อิสระพงศ์ ห้องสำเริง</asp:ListItem>
                            <asp:ListItem>นาย ประเสริฐ ไชยฉลาด</asp:ListItem>
                            <asp:ListItem>นาย ชัยยงค์ อนุตโร</asp:ListItem>
                            <asp:ListItem>นาย อนนท์ พงษ์ใหม่</asp:ListItem>
                            <asp:ListItem>มอร์เตอร์ไซด์รับจ้าง</asp:ListItem>
                            <asp:ListItem>นาย บุญมี พรมมาก</asp:ListItem>
                            <asp:ListItem>นาย อำนาจ สุขงาม</asp:ListItem>
                            <asp:ListItem>นาย สุทธิพงษ์ กายท้วม</asp:ListItem>
                            <asp:ListItem>นาย ณัฐพล ท่ากลาง</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-md-offset-11">
                <div>
                    <asp:Button ID="Button1" CssClass="btn btn-success btn-default" runat="server" Text="ค้นหา" />
                </div>
            </div>

        </div>
      
        <div class="col-lg-12" style="margin-top:20px">
            <div class="table-responsive">
                <asp:UpdatePanel ID="UpModal" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="ShowPageCommand" DataKeyNames="Recno" HeaderStyle-BackColor="#333333" HeaderStyle-ForeColor="White"
                         RowStyle-BackColor="#cccccc" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000" AllowPaging="true">
                        <Columns>

                            <asp:TemplateField HeaderText="เลขที่" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblRecno" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>

                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="วันที่ Booking" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblBookingDate" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="100" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ผู้ติดต่อ" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblCustomerName" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="300" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ที่อยู่" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblLocation" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="350" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ผู้สั่งงาน" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblBookingBy" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="100" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="สาขา" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblBranch" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ผู้วิ่งงาน" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblMessenger" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="190" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="สถานะ">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="100" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" Text="Edit" OnClick="lnkEdit_Click"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="70" HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" Text="Print" OnClick="lnkPrint_Click"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="70" HorizontalAlign="Center" />
                            </asp:TemplateField>

                        </Columns>
                        <PagerStyle HorizontalAlign="Right" CssClass="GridPager" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            </div>
            
        </div>
        <!-- Modal modal hind fade -->
     <%--   <div id="myModal" class="modal hind fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Edit Booking</h3>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                             
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" />
                            <asp:AsyncPostBackTrigger ControlID="btnSaveChange" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>--%>

    </form>
    <script type='text/javascript'>
        function openModal() {
            $('#myModal').modal('show');
        }

    </script>

</asp:Content>
