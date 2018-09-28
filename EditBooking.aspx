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
                            <asp:TextBox CssClass="form-control" ID="txtRemark" runat="server" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3  control-label" for="txtImportfile">แนบไฟล์</label>
                        <div class="col-md-9">
                            <asp:FileUpload runat="server" ID="Importfile" CssClass="form-control " />
                        </div>
                       
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3  control-label" for="txtImportfile">ชื่อไฟล์</label>
                        <div class="col-md-9">
                           <asp:TextBox runat="server" ID="txtshowFile" CssClass="form-control " autocomplete="off"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-9 col-md-offset-3">
                            
                            <asp:ImageButton ID="btnImage" runat="server"  Width="150" OnClick="btnImage_Click"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-9 col-md-offset-3">
                            <asp:Button ID="btnSaveChange" CssClass="btn btn-primary" runat="server" Text="Save Changes" OnClick="btnSaveChange_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>

        <div id="myModal" class="modal">
            <span class="close">&times;</span>
       
            <div id="caption"></div>
        </div>
        <asp:Panel ID="plImage" runat="server" CssClass="modal" TabIndex="-1" role="dialog" aria-labelledby="myLabe1">
            <div class="modal-dialog modal-lg">
               
                    <span class="close">&times;</span>
                    <asp:UpdatePanel ID="upImage" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>

                            <asp:Image ID="Image1" runat="server" />

                        </ContentTemplate>
                    </asp:UpdatePanel>
               
            </div>
        </asp:Panel>
    </form>
     <script type='text/javascript'>
         function openModal() {
             $('#myModal').modal('show');
         }
    </script>
   <%-- <script>
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the image and insert it inside the modal - use its "alt" text as a caption
        var img = document.getElementById('#btnImage');
        var modalImg = document.getElementById("#img01");
        var captionText = document.getElementById("caption");
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
            captionText.innerHTML = this.alt;
        }

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }
    </script>--%>

</asp:Content>
