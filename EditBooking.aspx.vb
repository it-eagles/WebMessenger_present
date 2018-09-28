Option Explicit On
Option Strict On
Option Infer On

Imports System.IO
Imports System.Globalization


Public Class EditBooking
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            showEdit()
        End If
    End Sub

    Private Function saveFile() As Boolean
        Using db As New DB_EaglesInternalEntities

            Try
                If Me.Importfile.HasFile Then

                    db.Database.Connection.Open()
                    Dim fileName As String = Path.GetFileName(Importfile.PostedFile.FileName)
                    Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")
                    Dim name As String = txtRecno.Text + "-" + fileName
                    db.tblFileITs.Add(New tblFileIT With { _
                                      .Filename = name, _
                                      .Title = txtRecno.Text, _
                                      .Createby = CStr(Session("usetID")), _
                                      .Createdate = Now
                                     })
                    db.SaveChanges()
                    Dim FilePath As String = Server.MapPath(FolderPath + name)
                    Importfile.SaveAs(FilePath)
                    Return True
                End If
            Catch ex As Exception
                Return False

            End Try

            Return True

        End Using

    End Function
    Private Sub showEdit()
        Dim index As Integer = CInt(Request.QueryString("recno"))
        Using db = New DB_EaglesInternalEntities

            Dim ds = (From c In db.tblBookingMessenger Where c.RecNo = index).SingleOrDefault

            txtRecno.Text = ds.RecNo.ToString
            txtBookingDate.Text = Convert.ToDateTime(ds.BookingDate).ToString("dd/MM/yyyy")
            txtBookingTime.Text = ds.BookingTime
            txtCusTel.Text = ds.CusTel
            txtContactPerson.Text = ds.ContactPerson
            txtCustomerName.Text = ds.CustomerName
            txtLocation.Text = ds.Location
            If ds.JobType1 = "วางบิล" Then
                chkJobType1.Checked = True
            Else
                chkJobType1.Checked = False
            End If
            If ds.JobType2 = "รับเช็ค" Then
                chkJobType2.Checked = True
            Else
                chkJobType2.Checked = False
            End If
            If ds.JobType3 = "รับ/ส่ง เอกสาร" Then
                chkJobType3.Checked = True
            Else
                chkJobType3.Checked = False
            End If
            txtJobDesc.Text = ds.JobDesc
            txtReceiveComback.Text = ds.ReceiveComback
            txtBookingBy.Text = ds.BookingBy
            ddlBranch.Text = ds.Branch
            txtReceiveby.Text = ds.ReceiveBy
            ddlMessenger.Text = ds.Messenger
            If ds.Status = "สำเร็จ" Then
                RadioButtonList1.SelectedValue = "สำเร็จ"
            ElseIf ds.Status = "ไม่สำเร็จ" Then
                RadioButtonList1.SelectedValue = "ไม่สำเร็จ"
            ElseIf ds.Status = "ยกเลิก" Then
                RadioButtonList1.SelectedValue = "ยกเลิก"
            Else
                RadioButtonList1.SelectedValue = Nothing
            End If
            If ds.StatusJob = 1 Then
                chkStatus.Checked = True
            Else
                chkStatus.Checked = False
            End If
            txtRemark.Text = ds.Remark
            Dim tiel As String = CStr(ds.RecNo)
            Dim imfil = (From im In db.tblFileITs Where im.Title = tiel).FirstOrDefault

            If Not imfil Is Nothing Then
                Dim Extension As String = Path.GetExtension(imfil.Filename)
                ' Path ที่เก็บไฟล์
                Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

                If Extension = ".png" Or Extension = ".jpg" Or Extension = ".jpeg" Then
                    'Image1.ImageUrl = "~/FileMessenger/" + imfil.Filename
                    btnImage.ImageUrl = "~/FileMessenger/" + imfil.Filename
                    btnImage.ImageAlign = ImageAlign.Middle
                    'Image1.ImageAlign = ImageAlign.Middle
                    txtshowFile.Text = imfil.Filename
                    Session("Filename") = imfil.Filename
                End If
              
            End If

        End Using
    End Sub

    Protected Sub btnSaveChange_Click(sender As Object, e As EventArgs) Handles btnSaveChange.Click
        Dim menu As String = "Messenger Booking"
        Dim userid = Session("UserID").ToString

        Using db = New DB_EaglesInternalEntities

            Dim BookingMessenger As tblBookingMessenger = (From c In db.tblBookingMessenger _
                   Where c.RecNo = CInt(txtRecno.Text) _
                   Select c).First()

            BookingMessenger.BookingDate = DateTime.ParseExact(txtBookingDate.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
            BookingMessenger.BookingTime = txtBookingTime.Text
            BookingMessenger.CusTel = txtCusTel.Text.Trim
            BookingMessenger.ContactPerson = txtContactPerson.Text.Trim
            BookingMessenger.CustomerName = txtCustomerName.Text.Trim
            BookingMessenger.Location = txtLocation.Text.Trim
            BookingMessenger.JobType1 = IIf(chkJobType1.Checked = True, "วางบิล", "").ToString
            BookingMessenger.JobType2 = IIf(chkJobType2.Checked = True, "รับเช็ค", "").ToString
            BookingMessenger.JobType3 = IIf(chkJobType3.Checked = True, "รับ/ส่ง เอกสาร", "").ToString
            BookingMessenger.JobDesc = txtJobDesc.Text.Trim
            BookingMessenger.ReceiveComback = txtReceiveComback.Text.Trim
            BookingMessenger.BookingBy = txtBookingBy.Text.Trim
            BookingMessenger.Branch = ddlBranch.Text
            BookingMessenger.Messenger = ddlMessenger.Text
            BookingMessenger.Status = RadioButtonList1.SelectedValue
            BookingMessenger.Remark = txtRemark.Text.Trim
            BookingMessenger.ReceiveBy = txtReceiveby.Text.Trim
            BookingMessenger.StatusJob = CType(IIf(chkStatus.Checked = True, 1, 0), Integer)
            BookingMessenger.UpdateBy = Session("Name_eng").ToString.ToUpper
            BookingMessenger.UpdateDate = Now

            db.SaveChanges()
            If saveFile() = False Then
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('upDate Feile เกิดข้อผิดพลาด !!')", True)
                Exit Sub
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirect", "alert('แก้ไขข้อมูล เรียบร้อยแล้วครับ'); window.location='" + Request.ApplicationPath + "/Default.aspx';", True)
                Exit Sub
            End If
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('บันทึกข้อมูล เรียบร้อยแล้วครับ')", True)
            'Response.Redirect(Request.Cookies("MessConfigPath").Value + "Default.aspx")
            'Response.Redirect("~/Default.aspx")
        End Using

    End Sub

    Protected Sub btnImage_Click(sender As Object, e As ImageClickEventArgs)
        Dim image As String = Session("Filename").ToString
        openImage(image)
    End Sub
    Private Sub openImage(image As String)
        Image1.ImageUrl = "~/FileMessenger/" + image
        Image1.ImageAlign = ImageAlign.Middle
        ScriptManager.RegisterStartupScript(upImage, upImage.GetType(), "show", "$(function () { $('#" + plImage.ClientID + "').modal('show'); });", True)
        upImage.Update()
    End Sub
End Class