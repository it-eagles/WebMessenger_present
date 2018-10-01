<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Default.aspx.vb" Inherits="WebMessenger.Booking" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <div class="row">
                <div class="form-horizontal">
            <div class="col-md-3">
                <div class="form-group">
                    <label class="col-md-4 control-label" for="txtDate1">วันที่ค้นหา</label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtDate1" CssClass="form-control" runat="server" autocomplete="off"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtDate1" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label class="col-md-4 control-label" for="txtDate2">ถึงวันที่</label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtDate2" CssClass="form-control" runat="server" autocomplete="off"></asp:TextBox>
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
            </div>
        </div>

            <div class="col-lg-12" style="margin-top: 20px">

            <div class="table-responsive">

               <%-- <asp:Repeater ID="dgvBooking" runat="server" OnItemDataBound="dgvBooking_ItemDataBound">
                    <HeaderTemplate>
                        <table class="table table-striped table-bordered table-condensed" id="example1">
                            <thead style="background-color:#ffffff">
                            <th class="text-center">Recno</th>
                            <th class="text-center">BookingDate</th>
                            <th class="text-center">CustomerName</th>
                            <th class="text-center">Location</th>
                            <th class="text-center">BookingBy</th>
                            <th class="text-center">Branch</th>
                            <th class="text-center">Messenger</th>
                            <th class="text-center">status</th>  
                            <th class="text-center">View/UpDate</th>                                        
                            <th class="text-center">Edit</th>
                            <th class="text-center">Print</th>

                            </thead>
                    
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#ffffff"">
                            <td align="center">
                                <asp:Label ID="lblRecno" runat="server"></asp:Label></td>
                            <td align="center">
                                <asp:Label ID="lblBookingDate" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblCustomerName" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblLocation" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblBookingBy" runat="server"></asp:Label></td>
                            <td align="center">
                                <asp:Label ID="lblBranch" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMessenger" runat="server"></asp:Label></td>
                            <td align="center">
                                <asp:Label ID="lblstatus" runat="server"></asp:Label></td>
                            <td class="text-center">
                                <asp:LinkButton ID="LinkButton3" CssClass="btn btn-info btn-sm" runat="server" OnClick="LinkButton3_Click"><i class="fa fa-info-circle"></i></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton4" CssClass="btn btn-success btn-sm" runat="server"><i class="fa  fa-level-up"></i></asp:LinkButton>
                            </td>
                            <td class="text-center">
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-warning btn-sm" runat="server" OnClick="lnkEdit_Click"><i class="fa fa-pencil"></i></asp:LinkButton>

                            </td>
                            <td class="text-center">
                                <asp:LinkButton ID="LinkButton2" CssClass="btn btn-default btn-sm" runat="server" OnClick="lnkPrint_Click"><i class="fa fa-print"></i></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
             
                    <FooterTemplate>
                        <tfoot>
                        <th>Recno</th>
                        <th>BookingDate</th>
                        <th>CustomerName</th>
                        <th>Location</th>
                        <th>BookingBy</th>
                        <th>Branch</th>
                        <th>Messenger</th>
                        <th>status</th>
                        <th>View/UpDate</th>      
                        <th>Edit</th>
                        <th>Print</th>
                        </tfoot>          
                        </table>
                    </FooterTemplate>
                </asp:Repeater>--%>

                   <asp:Repeater ID="dgvBooking" runat="server" OnItemDataBound="dgvBooking_ItemDataBound">
                    <HeaderTemplate>
                        <table class="table table-striped table-bordered table-condensed" id="example1">
                            <thead style="background-color:#ffffff">
                            <th class="text-center">Recno</th>
                            <th class="text-center">BookingDate</th>
                            <th class="text-center">CustomerName</th>
                            <th class="text-center">Location</th>
                            <th class="text-center">BookingBy</th>
                            <th class="text-center">Branch</th>
                            <th class="text-center">Messenger</th>
                            <th class="text-center">status</th>                                                             
                            <th class="text-center">Edit</th>
                            <th class="text-center">Print</th>

                            </thead>
                    
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#ffffff"">
                            <td align="center">
                                <asp:Label ID="lblRecno" runat="server"></asp:Label></td>
                            <td align="center">
                                <asp:Label ID="lblBookingDate" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblCustomerName" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblLocation" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblBookingBy" runat="server"></asp:Label></td>
                            <td align="center">
                                <asp:Label ID="lblBranch" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMessenger" runat="server"></asp:Label></td>
                            <td align="center">
                                <asp:Label ID="lblstatus" runat="server"></asp:Label></td>                       
                            <td class="text-center">
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-warning btn-sm" runat="server" OnClick="lnkEdit_Click"><i class="fa fa-pencil"></i></asp:LinkButton>

                            </td>
                            <td class="text-center">
                                <asp:LinkButton ID="LinkButton2" CssClass="btn btn-default btn-sm" runat="server" OnClick="lnkPrint_Click"><i class="fa fa-print"></i></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
             
                    <!--<FooterTemplate>
                        <tfoot>
                        <th>Recno</th>
                        <th>BookingDate</th>
                        <th>CustomerName</th>
                        <th>Location</th>
                        <th>BookingBy</th>
                        <th>Branch</th>
                        <th>Messenger</th>
                        <th>status</th>                          
                        <th>Edit</th>
                        <th>Print</th>
                        </tfoot>          
                        </table>
                    </FooterTemplate>-->
                </asp:Repeater>
            </div>
        </div>

        <asp:Panel ID="plbook" runat="server" CssClass="modal" TabIndex="-1" role="dialog" aria-labelledby="myLabe1">
            <div class="modal-dialog modal-lg" role="dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Select Delivery Code</h4>
                    </div>
                   <asp:UpdatePanel ID="upbook" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="modal-body">
                                <section class="content">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 " style="overflow: auto;">
                                            <div class="form-horizontal">
                                                <div class="col-md-10">

                                                    <div class="form-group text-center">
                                                        <label class="col-md-3 control-label " for="lblRecno">เลขที่</label>
                                                        <div class="col-md-9">
                                                            <%--<asp:Label ID="lblRecno" runat="server" Text="Label"></asp:Label>--%>
                                                            <asp:TextBox runat="server" ID="txtRecno" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label " for="txtBookingDate">ประจำวันที่</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox ID="txtBookingDate" Format="dd/MM/yyyy" CssClass="form-control" runat="server" autocomplete="off"></asp:TextBox>
                                                            <asp:CalendarExtender ID="txtBookingDate_CalendarExtender" Format="dd/MM/yyyy" runat="server" Enabled="True" TargetControlID="txtBookingDate"></asp:CalendarExtender>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label" for="txtBookingTime">เวลา</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox ID="txtBookingTime" CssClass="form-control " runat="server" autocomplete="off"></asp:TextBox>
                                                            <asp:MaskedEditExtender ID="txtBookingTime_MaskedEditExtender" runat="server"
                                                                TargetControlID="txtBookingTime" AcceptAMPM="false" MaskType="Time"
                                                                Mask="99:99" AutoComplete="False" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label" for="ddlBranch">สาขา</label>
                                                        <div class="col-md-9">
                                                            <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control ">
                                                                <asp:ListItem> </asp:ListItem>
                                                                <asp:ListItem>SPM</asp:ListItem>
                                                                <asp:ListItem>PTN</asp:ListItem>
                                                                <asp:ListItem>LKB</asp:ListItem>
                                                                <asp:ListItem>SBIA</asp:ListItem>
                                                                <asp:ListItem>CKT</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label" for="txtCustomerName">บริษัทผู้ติดต่อ</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox CssClass="form-control " ID="txtCustomerName" runat="server" autocomplete="off"></asp:TextBox>
                                                        </div>
                                                        <div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label" for="txtCusTel">โทร</label>
                                                        <div class="col-md-3">
                                                            <asp:TextBox CssClass="form-control " ID="txtCusTel" runat="server" autocomplete="off"></asp:TextBox>
                                                        </div>
                                                        <label class="col-md-2 control-label" for="txtContactPerson">ผู้ติดต่อ</label>
                                                        <div class="col-md-4">
                                                            <asp:TextBox CssClass="form-control " ID="txtContactPerson" runat="server" autocomplete="off"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label" for="txtLocation">ที่อยู่</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox CssClass="form-control " ID="txtLocation" runat="server" TextMode="MultiLine" autocomplete="off"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label" for="chkJobType">ลักษณะงาน</label>
                                                        <div class="col-md-9">

                                                            <label class="checkbox">
                                                                <input id="chkJobType1" runat="server" type="checkbox" value="" />วางบิล
                                                            </label>
                                                            <label class="checkbox">
                                                                <input id="chkJobType2" runat="server" type="checkbox" value="" />รับเช็ค
                                                            </label>
                                                            <label class="checkbox">
                                                                <input id="chkJobType3" runat="server" type="checkbox" value="" />รับ/ส่ง เอกสาร
                                                            </label>

                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label" for="txtJobDesc">รายละเอียดงาน</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox ID="txtJobDesc" runat="server" TextMode="MultiLine" CssClass="form-control " autocomplete="off"></asp:TextBox>

                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label" for="txtReceiveComback">สิ่งที่ต้องรับกลับ</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox CssClass="form-control " ID="txtReceiveComback" runat="server" autocomplete="off"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label" for="txtBookingBy">ผู้สั่งงาน</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox CssClass="form-control " ID="txtBookingBy" runat="server" autocomplete="off"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label" for="txtReceiveby">ผู้รับเอกสาร</label>
                                                        <div class="col-md-9">
                                                            <asp:TextBox CssClass="form-control " ID="txtReceiveby" runat="server" autocomplete="off"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label" for="ddlMessenger">ผู้วิ่งงาน</label>
                                                        <div class="col-md-9">
                                                            <asp:DropDownList ID="ddlMessenger" runat="server" CssClass="form-control ">
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
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </asp:Panel>

        <div id="myModal" class="modal hind fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Edit Mile</h3>
                    </div>
                </div>
            </div>
        </div>
    
    </form>
         <script type='text/javascript'>
             function openModal() {
                 $('#myModal').modal('show');
             }

    </script>
</asp:Content>
