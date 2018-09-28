<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="RegisterBooking.aspx.vb" Inherits="WebMessenger._Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="form-horizontal">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="form-horizontal">
            <fieldset>
                <legend class="">Register Booking
                </legend>
                <div class="col-md-12 col-md-offset-1">
                    <div class="form-group">
                        <label class="col-md-2 control-label text-left" for="txtBookingDate">ประจำวันที่</label>
                        <div class="col-md-6">

                            <asp:TextBox ID="txtBookingDate" CssClass="form-control " runat="server" autocomplete="off"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtBookingDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="txtBookingTime">เวลา</label>
                        <div class="col-md-6">
                            <%--      <input type="time" class="input-medium" runat="server" id="txtBookingTime" />--%>
                            <asp:TextBox ID="txtBookingTime" CssClass="form-control " runat="server" autocomplete="off"></asp:TextBox>
                            <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                                TargetControlID="txtBookingTime" AcceptAMPM="false" MaskType="Time"
                                Mask="99:99" AutoComplete="False" />

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2  control-label" for="ddlBranch">สาขา</label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control ">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>SPM</asp:ListItem>
                                <asp:ListItem>PTN</asp:ListItem>
                                <asp:ListItem>LKB</asp:ListItem>
                                <asp:ListItem>SBIA</asp:ListItem>
                                <asp:ListItem>CKT</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2  control-label" for="txtCustomerName">บริษัทผู้ติดต่อ</label>
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control " ID="txtCustomerName" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <button runat="server" class="btn btn-sm" type="button" autofocus="autofocus" onserverclick="Unnamed_ServerClick"><i class="fa fa-search"></i></button>
                            <a>ค้นหาบริษัทผู้ติดต่อ</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2  control-label" for="txtCusTel">โทร</label>
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control " ID="txtCusTel" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="txtContactPerson">ผู้ติดต่อ</label>
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control " ID="txtContactPerson" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2  control-label" for="txtLocation">ที่อยู่</label>
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control " ID="txtLocation" runat="server" TextMode="MultiLine"></asp:TextBox>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="chkJobType">ลักษณะงาน</label>
                        <div class="col-md-6">
                            
                                <label class="checkbox">
                                    <input id="chkJobType1" runat="server" type="checkbox" value="" />วางบิล
                                </label>
                                <label class="checkbox">
                                    <input id="chkJobType2" runat="server" type="checkbox" value="" />รับเช็ค
                                </label>
                                <label class="checkbox">
                                    <input id="chkJobType3" runat="server" type="checkbox" value="" />รับ/ส่ง เอกสาร
                                </label>
                                <label class="checkbox">
                                    <input id="chkJobType4" runat="server" type="checkbox" value="" />อื่นๆ
                                </label>
                          
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2  control-label" for="txtJobDesc">รายละเอียดงาน</label>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtJobDesc" runat="server" Height="78px" TextMode="MultiLine" CssClass="form-control "></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2  control-label" for="txtReceiveComback">สิ่งที่ต้องรับกลับ</label>
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control " ID="txtReceiveComback" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2  control-label" for="txtBookingBy">ผู้สั่งงาน</label>
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control " ID="txtBookingBy" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="txtReceiveby">ผู้รับเอกสาร</label>
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control " ID="txtReceiveby" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="text-center">
                            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Save" Width="102px" OnClientClick="Confirm()"/>
                            <input id="Reset1" class="btn" type="reset" value="Reset" />&nbsp;&nbsp;
                        </div>
                    </div>
                <%--    <div class="form-group">
                        <div class="col-md-3">
                            <input runat="server" id="txtTest" class="form-control" value="" autofocus="autofocus"/>
                            <input runat="server" id="txtTest1" class="form-control" value="" autofocus="autofocus"/>
                        </div>
                    </div>--%>
                </div>

                <%--             <div class="form-group">
                    <label class="col-md-2 col-md-offset-1 control-label" for="txtMessenger">ผู้วิ่งงาน</label>
                    <div class="col-md-9">
                        <asp:DropDownList ID="ddlMessenger" runat="server" Width="196px">
                            <asp:ListItem> </asp:ListItem>
                            <asp:ListItem>นายธเนศร์ จันทนมัฎฐะ</asp:ListItem>
                            <asp:ListItem>นายอิสระพงศ์ ห้องสำเริง</asp:ListItem>
                            <asp:ListItem>นายประเสริฐ ไชยฉลาด</asp:ListItem>
                            <asp:ListItem>นายชัยยงค์ อนุตโร</asp:ListItem>
                            <asp:ListItem>นายอนนท์ พงษ์ใหม่</asp:ListItem>
                            <asp:ListItem>มอร์เตอร์ไซด์รับจ้าง</asp:ListItem>
                            <asp:ListItem>นายเอกพล มูลม่อม</asp:ListItem>
                            <asp:ListItem>นายจีระพันธ์ เลี้ยงเจริญ</asp:ListItem>
                            <asp:ListItem>นายบุญมี พรมมาก</asp:ListItem>
                            <asp:ListItem>นายอำนาจ สุขงาม</asp:ListItem>
                            <asp:ListItem>นายสุทธิพงษ์ กายท้วม</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 col-md-offset-1 control-label" for="chkStatus">การตรวจงาน</label>
                    <div class="col-md-9">
                        <div class="form-inline">
                            <asp:CheckBox ID="chkStatus" runat="server" Text="ตรวจแล้ว" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 col-md-offset-1 control-label" for="RadioButton1">สถานะงาน</label>
                    <div class="col-md-9">
                        <div class="form-inline">
                            <asp:RadioButton ID="RadioButton1" runat="server" Text="สำเร็จ" />
                            <asp:RadioButton ID="RadioButton2" runat="server" Text="ไม่สำเร็จ" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 col-md-offset-1 control-label" for="txtRemark">เหตุผลที่งานไม่สำเร็จ</label>
                    <div class="col-md-9">
                        <asp:TextBox CssClass="input-medium" ID="txtRemark" runat="server" Width="300px"></asp:TextBox>
                    </div>
                </div>--%>
            </fieldset>
        </div>
        <asp:Panel ID="plProduct" runat="server" CssClass="modal" TabIndex="-1" role="dialog" aria-labelledby="myLabe1">
            <div class="modal-dialog modal-lg" role="dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Select Delivery Code</h4>
                    </div>
                    <asp:UpdatePanel ID="upProduct" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="modal-body">
                                <section class="content">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 " style="overflow: auto;">
                                            <asp:Repeater ID="showCustomer" runat="server" OnItemDataBound="showCustomer_ItemDataBound">
                                                <HeaderTemplate>
                                                    <table class="table table-sm">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">เลือก</th>
                                                                <th scope="col">บริษัทผู้ติดต่อ</th>
                                                                <th scope="col">ผู้ติดต่อ</th>
                                                                <th scope="col">โทร</th>

                                                            </tr>
                                                        </thead>
                                                </HeaderTemplate>

                                                <ItemTemplate>

                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="lnkSearch" runat="server" OnClick="lnkSearch_Click" CssClass="btn"><i class="fa fa-hand-pointer-o"></i></asp:LinkButton></td>
                                                        <td>
                                                            <asp:Label ID="lblCustomerName" runat="server" Text="Label"></asp:Label></td>

                                                        <td>
                                                            <asp:Label ID="lblContactPerson" runat="server" Text="Label"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="lblCusTel" runat="server" Text="Label"></asp:Label></td>
                                                    </tr>

                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <tfoot>
                                                        <tr>
                                                            <th scope="col">เลือก</th>
                                                            <th scope="col">บริษัทผู้ติดต่อ</th>
                                                            <th scope="col">ผู้ติดต่อ</th>
                                                            <th scope="col">โทร</th>
                                                        </tr>
                                                    </tfoot>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <script type="text/javascript">
            function Confirm() {
                var confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";
                if (confirm("คุณต้องการเก็บข้อมูลบริษัทผู้ติดต่อ หรือไม่ ?")) {
                    confirm_value.value = "Yes";
                } else {
                    confirm_value.value = "No";
                }
                document.forms[0].appendChild(confirm_value);
            }
        </script>

        <script type="text/javascript">
            $(document).ready(function(){
                $("#txtTest").keyup(function () {
                var value = $(this).val();
                $("#txtTest1").text(value);
            }).keyup();
            });
</script>
    </form>
</asp:Content>
