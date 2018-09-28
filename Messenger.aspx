<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Messenger.aspx.vb" Inherits="WebMessenger.Messenger" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <%--<div class="text-center">
            <asp:Button ID="btnAddMile" CssClass="btn btn-success btn-default" runat="server" Text="Add Mile" />
        </div>--%>
      

        <div class="col-md-12 col-md-offset-2">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-2 control-label" for="txtMessDate">วันที่วิ่งงาน</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtMessDate" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtMessDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" for="lblNameAdd">ชื่อ</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtNameAdd" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                        <%--  <asp:Label ID="lblNameAdd" runat="server" Text="Label"></asp:Label>--%>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" for="txtTimeOutAdd">เวลาออก</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtTimeOutAdd" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                        <asp:MaskedEditExtender ID="MaskedEditExtender2" runat="server"
                            TargetControlID="txtTimeOutAdd" AcceptAMPM="false" MaskType="Time"
                            Mask="99:99" AutoComplete="False" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" for="txtMileOutAdd">เลขไมล์ออก</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtMileOutAdd" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" for="txtTimeInAdd">เวลาเข้า</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtTimeInAdd" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                        <asp:MaskedEditExtender ID="MaskedEditExtender3" runat="server"
                            TargetControlID="txtTimeInAdd" AcceptAMPM="false" MaskType="Time"
                            Mask="99:99" AutoComplete="False" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" for="txtMileInAdd">เลขไมล์เข้า</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtMileInAdd" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-md-12 text-center">
            <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
        </div>
        
            <div class="col-lg-12" style="padding-top:50px">
                <div class="table-responsive">
            <asp:Repeater ID="dgvMile" runat="server" OnItemDataBound="dgvMile_ItemDataBound">
                    <HeaderTemplate>
                        <table class="table table-striped table-bordered table-condensed" id="example1">
                            <thead style="background-color:#ffffff">
                            <th class="text-center">วันที่วิ่งงาน</th>
                            <th class="text-center">ชื่อ</th>
                            <th class="text-center">เวลาออก</th>
                            <th class="text-center">เลขไมล์ที่ออก</th>
                            <th class="text-center">เวลาเข้า</th>   
                            <th class="text-center">เลขไมล์เข้า</th>                                                            
                            <th class="text-center">Edit</th>                
                            </thead>
                    
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#ffffff"">
                            <td align="center"><asp:Label ID="lblMessDate" runat="server" Text="Label"></asp:Label></td>
                            <td align="center"><asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></td>
                            <td><asp:Label ID="lblTimeOut" runat="server" Text="Label"></asp:Label></td>
                            <td><asp:Label ID="lblMileOut" runat="server" Text="Label"></asp:Label></td>
                            <td><asp:Label ID="lblTimeIn" runat="server" Text="Label"></asp:Label></td>
                            <td align="center"><asp:Label ID="lblMileIn" runat="server" Text="Label"></asp:Label></td>                                           
                            <td class="text-center">
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-warning btn-sm" runat="server" OnClick="lnkEdit_Click"><i class="fa fa-pencil"></i></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
             
                    <FooterTemplate>
                        <tfoot>
                       <th>วันที่วิ่งงาน</th>
                       <th>ชื่อ</th>
                       <th>เวลาออก</th>
                       <th>เลขไมล์ที่ออก</th>
                       <th>เวลาเข้า</th>   
                       <th>เลขไมล์เข้า</th>                     
                       <th>Edit</th>
                        </tfoot>          
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
          </div>
        </div>
    

          <asp:Panel runat="server" ID="plMile" CssClass="modal" TabIndex="-1" role="dialog" aria-labelledby="myLabe1">
            <div class="modal-dialog modal-lg" role="dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Edit Mile</h4>
                    </div>
                   <asp:UpdatePanel ID="upMile" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            
                                <div class="modal-body">
                                
                                    <div class="form-horizontal col-md-offset-2">

                                        <div class="form-group">
                                            <label class="col-md-2 control-label " for="txtMessDate">วันที่วิ่งงาน</label>
                                            <div class="col-md-9">
                                                <asp:Label ID="lblMessDate" runat="server" Text="Label"></asp:Label>
                                                <%--  <asp:TextBox ID="txtMessDate_" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label " for="lblNameAdd">ชื่อ</label>
                                            <div class="col-md-6">
                                                <%-- <asp:TextBox ID="txtName" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>--%>
                                                <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label" for="txtTimeOutAdd">เวลาออก</label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtTimeOut" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                                                    TargetControlID="txtTimeOut" AcceptAMPM="false" MaskType="Time"
                                                    Mask="99:99" AutoComplete="False" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label " for="txtMileOutAdd">เลขไมล์ออก</label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtMileOut" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label" for="txtTimeInAdd">เวลาเข้า</label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtTimeIn" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                                <asp:MaskedEditExtender ID="MaskedEditExtender4" runat="server"
                                                    TargetControlID="txtTimeIn" AcceptAMPM="false" MaskType="Time"
                                                    Mask="99:99" AutoComplete="False" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label " for="txtMileInAdd">เลขไมล์เข้า</label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtMileIn" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>                                                       
                            </div>
                            
                          
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                <asp:Button ID="btnSaveChange" CssClass="btn btn-primary" runat="server" Text="Save Changes" OnClick="btnSaveChange_Click" />
                            </div>

                        </ContentTemplate>
                        <Triggers>                       
                            <asp:AsyncPostBackTrigger ControlID="btnSaveChange" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </asp:Panel>

      <%--   <div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalEditLabel" aria-hidden="true">
            <div class="modal-dialog card card-primary" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="myModalEditLabel">Edit Mile</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
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
                                 <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true" id="btn">Close</button>
                                <asp:Button ID="btnSaveChange" CssClass="btn btn-primary" runat="server" Text="Save Changes" OnClick="btnSaveChange_Click" />
                            </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>                
                            <asp:AsyncPostBackTrigger ControlID="btnSaveChange" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>--%>
        <%-- class="modal hind fade"--%>
      
    </form>
     <script type='text/javascript'>
         function openModal() {
             $('#myModalEdit').modal('show');
         }
    </script>

</asp:Content>
