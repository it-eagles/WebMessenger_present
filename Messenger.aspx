<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Messenger.aspx.vb" Inherits="WebMessenger.Messenger" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <br />
        <div class="text-center">
            <asp:Button ID="btnAddMile" CssClass="btn btn-success btn-default" runat="server" Text="Add Mile" />
        </div>
        <br />
        <div class="col-lg-12 col-lg-offset-2">
            <asp:UpdatePanel ID="UpModal" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ForeColor="Black" Width="800px"
                        OnPageIndexChanging="ShowPageCommand" DataKeyNames="MessDate,Name" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowPaging="True" PageSize="30">
                        <Columns>
                            <asp:TemplateField HeaderText="วันที่วิ่งงาน" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblMessDate" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>

                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="70" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ชื่อ" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="250" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="เวลาออก" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblTimeOut" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="เลขไมล์ออก" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblMileOut" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="เวลาเข้า" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblTimeIn" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="เลขไมล์เข้า" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblMileIn" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="70" />
                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" Text="Edit" OnClick="lnkEdit_Click"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="70" HorizontalAlign="Center" />
                            </asp:TemplateField>

                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="40px" />
                        <PagerSettings FirstPageText="First " LastPageText="Last " NextPageText="Next " PreviousPageText="Previous " />
                        <PagerStyle BackColor="White" ForeColor="#000099" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <%-- class="modal hind fade"--%>
        <div id="myModal" class="modal hind fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Edit Mile</h3>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <fieldset>
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="lblMessDate">วันที่วิ่งงาน</label>
                                            <div class="col-md-9">
                                                <asp:Label ID="lblMessDate" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="lblName">ชื่อ</label>
                                            <div class="col-md-9">
                                                  <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label" for="txtTimeOut">เวลาออก</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtTimeOut" CssClass="input-medium" runat="server" Width="50px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="txtBookingTime_MaskedEditExtender" runat="server"
                                                    TargetControlID="txtTimeOut" AcceptAMPM="false" MaskType="Time"
                                                    Mask="99:99" AutoComplete="False" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="txtMileOut">เลขไมล์ออก</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtMileOut" runat="server" Width="50px"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label" for="txtTimeIn">เวลาเข้า</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtTimeIn" CssClass="input-medium" runat="server" Width="50px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                                                    TargetControlID="txtTimeIn" AcceptAMPM="false" MaskType="Time"
                                                    Mask="99:99" AutoComplete="False" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="txtMileIn">เลขไมล์เข้า</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtMileIn" runat="server" Width="50px"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                </fieldset>
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                <asp:Button ID="btnSaveChange" CssClass="btn btn-primary" runat="server" Text="Save Changes" OnClick="btnSaveChange_Click" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" />
                            <asp:AsyncPostBackTrigger ControlID="btnSaveChange" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

         <%-- class="modal hind fade"--%>
        <div id="myModalAdd" class="modal hind fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabelAdd">Add Mile</h3>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <fieldset>
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="txtMessDate">วันที่วิ่งงาน</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtMessDate" runat="server"></asp:TextBox>
                                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtMessDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="lblNameAdd">ชื่อ</label>
                                            <div class="col-md-9">
                                              <%--  <asp:TextBox ID="txtName" runat="server"></asp:TextBox>--%>
                                                <asp:Label ID="lblNameAdd" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label" for="txtTimeOutAdd">เวลาออก</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtTimeOutAdd" CssClass="input-medium" runat="server" Width="50px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="MaskedEditExtender2" runat="server"
                                                    TargetControlID="txtTimeOutAdd" AcceptAMPM="false" MaskType="Time"
                                                    Mask="99:99" AutoComplete="False" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="txtMileOutAdd">เลขไมล์ออก</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtMileOutAdd" runat="server" Width="100px"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label" for="txtTimeInAdd">เวลาเข้า</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtTimeInAdd" CssClass="input-medium" runat="server" Width="50px"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="MaskedEditExtender3" runat="server"
                                                    TargetControlID="txtTimeInAdd" AcceptAMPM="false" MaskType="Time"
                                                    Mask="99:99" AutoComplete="False" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-offset-1 col-md-2 control-label " for="txtMileInAdd">เลขไมล์เข้า</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtMileInAdd" runat="server" Width="100px"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                </fieldset>
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAddMile" />
                            <asp:AsyncPostBackTrigger ControlID="btnSave" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

    </form>
    <script type='text/javascript'>
        function openModal() {
            $('#myModal').modal('show');
        }
        function openModalAdd() {
            $('#myModalAdd').modal('show');
        }

    </script>

</asp:Content>
