<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EditBooking.aspx.vb" Inherits="WebMessenger.EditBooking" MasterPageFile="~/MasterPage.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" id="form1">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <fieldset>
            <div class="form-horizontal">
                <div class="col-md-10">
                    <div class="form-group text-center">
                        <label class="col-md-3 control-label " for="lblRecno">เลขที่</label>
                        <div class="col-md-9">
                            <%--<asp:Label ID="lblRecno" runat="server" Text="Label"></asp:Label>--%>
                            <asp:TextBox runat="server" ID="txtRecno" CssClass="form-control input-sm"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label " for="txtBookingDate">ประจำวันที่</label>
                        <div class="col-md-9">
                            <asp:TextBox ID="txtBookingDate" Format="dd/MM/yyyy" CssClass="form-control input-sm" runat="server" autocomplete="off"></asp:TextBox>
                            <asp:CalendarExtender ID="txtBookingDate_CalendarExtender" Format="dd/MM/yyyy" runat="server" Enabled="True" TargetControlID="txtBookingDate"></asp:CalendarExtender>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="txtBookingTime">เวลา</label>
                        <div class="col-md-9">
                            <asp:TextBox ID="txtBookingTime" CssClass="form-control input-sm" runat="server" autocomplete="off"></asp:TextBox>
                            <asp:MaskedEditExtender ID="txtBookingTime_MaskedEditExtender" runat="server"
                                TargetControlID="txtBookingTime" AcceptAMPM="false" MaskType="Time"
                                Mask="99:99" AutoComplete="False" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="ddlBranch">สาขา</label>
                        <div class="col-md-9">
                            <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control input-sm">
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
                            <asp:TextBox CssClass="form-control input-sm" ID="txtCustomerName" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="txtCusTel">โทร</label>
                        <div class="col-md-3">
                            <asp:TextBox CssClass="form-control input-sm" ID="txtCusTel" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                        <label class="col-md-2 control-label" for="txtContactPerson">ผู้ติดต่อ</label>
                        <div class="col-md-4">
                            <asp:TextBox CssClass="form-control input-sm" ID="txtContactPerson" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" for="txtLocation">ที่อยู่</label>
                        <div class="col-md-9">
                            <asp:TextBox CssClass="form-control input-sm" ID="txtLocation" runat="server" TextMode="MultiLine" autocomplete="off"></asp:TextBox>
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
                            <asp:TextBox ID="txtJobDesc" runat="server" TextMode="MultiLine" CssClass="form-control input-sm" autocomplete="off"></asp:TextBox>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="txtReceiveComback">สิ่งที่ต้องรับกลับ</label>
                        <div class="col-md-9">
                            <asp:TextBox CssClass="form-control input-sm" ID="txtReceiveComback" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="txtBookingBy">ผู้สั่งงาน</label>
                        <div class="col-md-9">
                            <asp:TextBox CssClass="form-control input-sm" ID="txtBookingBy" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="txtReceiveby">ผู้รับเอกสาร</label>
                        <div class="col-md-9">
                            <asp:TextBox CssClass="form-control input-sm" ID="txtReceiveby" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="ddlMessenger">ผู้วิ่งงาน</label>
                        <div class="col-md-9">
                            <asp:DropDownList ID="ddlMessenger" runat="server" CssClass="form-control input-sm">
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
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="chkStatus">การตรวจงาน</label>
                        <div class="col-md-9">

                            <label class="checkbox">
                                <input id="chkStatus" runat="server" type="checkbox" value="" />ตรวจแล้ว
                            </label>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="RadioButton1">สถานะงาน</label>
                        <div class="col-md-9">

                            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                <asp:ListItem Value="สำเร็จ"></asp:ListItem>
                                <asp:ListItem Value="ไม่สำเร็จ"></asp:ListItem>
                                <asp:ListItem Value="ยกเลิก"></asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="txtRemark">สาเหตุที่ผลงาน ไม่สำเร็จ,ยกเลิก</label>
                        <div class="col-md-9">
                            <asp:TextBox CssClass="form-control input-sm" ID="txtRemark" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3  control-label" for="txtImportfile">แนบไฟล์</label>
                        <div class="col-md-9">
                            <asp:FileUpload runat="server" ID="Importfile" CssClass="form-control input-sm" />
                        </div>
                    </div>

                    <asp:Button ID="btnSaveChange" CssClass="btn btn-primary" runat="server" Text="Save Changes" OnClick="btnSaveChange_Click" />
                </div>
            </div>
        </fieldset>
    </form>
</asp:Content>
