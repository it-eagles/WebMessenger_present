Option Strict On
Option Explicit On

Imports System.IO
Imports System.Linq
Imports System.Data
Imports System.Web
Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms
Imports CrystalDecisions.CrystalReports.Engine
Imports System.Globalization

Public Class Booking

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim datenow As String = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
            BindData(datenow, datenow, "", "")
        End If
    End Sub
    Private Sub BindData(ByVal date1 As String, ByVal date2 As String, branch As String, mess As String)

        If mess = "ทุกคน" Then
            mess = ""
        End If
        If branch = "ทุกสาขา" Then
            branch = ""
        End If
        Dim dt1 As Date = DateTime.ParseExact(date1, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
        Dim dt2 As Date = DateTime.ParseExact(date2, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))

        Using db = New DB_EaglesInternalEntities

            Dim ds = (From c In db.tblBookingMessenger Where c.BookingDate >= dt1 _
                 And c.BookingDate <= dt2 And c.Branch.Contains(branch) And c.Messenger.Contains(mess) Order By c.RecNo Ascending
                     Select New With {
                         c.RecNo, c.BookingDate, c.CustomerName, c.Location, _
                         c.BookingBy, c.Branch, c.Messenger, c.Status
                        }).ToList()

            If ds.Count > 0 Then
                Me.GridView1.DataSource = ds
                Me.GridView1.DataBind()
            Else
                Me.GridView1.DataSource = Nothing
                Me.GridView1.DataBind()
            End If
        End Using

    End Sub

   

    Protected Sub lnkPrint_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim btnsubmit As LinkButton = TryCast(sender, LinkButton)
        Dim gRow As GridViewRow = DirectCast(btnsubmit.NamingContainer, GridViewRow)
        Dim index As String = GridView1.DataKeys(gRow.RowIndex).Value.ToString()
        Dim url As String = "FrmReport/RptMessenger.aspx?recno=" + index
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "onclick", "javascript:window.open( '" + url + "','_blank','height=600px,width=1000px,scrollbars=1');", True)
        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "", "window.open('../Report/RptMessenger.aspx?recno='" + index + ",'popup1','_blank')", True)
      

    End Sub

    Protected Sub lnkEdit_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim btnsubmit As LinkButton = TryCast(sender, LinkButton)
        Dim gRow As GridViewRow = DirectCast(btnsubmit.NamingContainer, GridViewRow)
        Dim index As String = GridView1.DataKeys(gRow.RowIndex).Value.ToString()
        Dim menu As String = "Messenger Booking"
        Dim userid As String = Session("UserID").ToString.ToUpper
        Dim recNo As Integer = CInt(index)
        'lblRecno.Text = GridView1.DataKeys(gRow.RowIndex).Value.ToString()
        'txtBookingDate.Text = DirectCast(gRow.FindControl("lblBookingDate"), Label).Text
        Using db As New DB_EaglesInternalEntities
            Dim us = From u In db.tblUserMenu Where u.UserID = userid And u.Menu = menu And u.Edit_ = 1

            If us.Any Then
                Dim ds = (From c In db.tblBookingMessenger Where c.RecNo = recNo).SingleOrDefault

                If (ds.Status = "สำเร็จ" Or ds.Status = "ไม่สำเร็จ" Or ds.Status = "ยกเลิก") And Not (UserID = "E.1195" Or UserID = "K.301" Or UserID = "K.302" Or UserID = "E.896") Then
                    ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('ข้อมูลสถานะ สำเร็จ,ไม่สำเร็จ,ยกเลิก คุณไม่สามารถแก้ไขข้อมูลได้ครับ')", True)
                    Exit Sub
                Else
                    Dim url As String = "EditBooking.aspx?recno=" + index
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "onclick", "javascript:window.open( '" + url + "','_self','height=600px,width=1000px,scrollbars=1');", True)
                End If        
            Else
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('คุณไม่มีสิทธิ์ แก้ไขข้อมูล')", True)
                Exit Sub
            End If
        End Using
        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "openModal();", True)
    End Sub
    'Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
    '    Dim index As Integer = Convert.ToInt32(e.CommandArgument)

    '    If e.CommandName.Equals("Edit") Then
    '        Using db = New DB_EaglesInternalEntities

    '            Dim ds = (From c In db.tblBookingMessenger Where c.RecNo = index).SingleOrDefault
    '            lblRecno.Text = ds.RecNo.ToString
    '            txtBookingDate.Text = ds.BookingDate.ToString
    '            txtBookingTime.Text = ds.BookingTime
    '            ddlBranch.Text = ds.Branch

    '       End Using
    '        'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "EditModalScript", "openModal();", False)
    '        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "openModal();", True)


    '    End If
    'End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If txtDate1.Text = "" Then
            txtDate1.Text = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
        End If

        If txtDate2.Text = "" Then
            txtDate2.Text = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
        End If

        BindData(txtDate1.Text, txtDate2.Text, ddlBranchSearch.Text, ddlMessengerSearch.Text)
      
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lblRecno As Label = DirectCast(e.Row.FindControl("lblRecno"), Label)
            If Not IsNothing(lblRecno) Then
                lblRecno.Text = DataBinder.Eval(e.Row.DataItem, "Recno").ToString()
            End If
            Dim lblBookingDate As Label = DirectCast(e.Row.FindControl("lblBookingDate"), Label)
            If Not IsNothing(lblBookingDate) Then
                lblBookingDate.Text = CStr(DataBinder.Eval(e.Row.DataItem, "BookingDate", "{0:dd/MM/yyyy}"))
            End If
            Dim lblCustomerName As Label = DirectCast(e.Row.FindControl("lblCustomerName"), Label)
            If Not IsNothing(lblCustomerName) Then
                lblCustomerName.Text = DataBinder.Eval(e.Row.DataItem, "CustomerName").ToString()
            End If
            Dim lblLocation As Label = DirectCast(e.Row.FindControl("lblLocation"), Label)
            If Not IsNothing(lblLocation) Then
                lblLocation.Text = DataBinder.Eval(e.Row.DataItem, "Location").ToString()
            End If
            Dim lblBookingBy As Label = DirectCast(e.Row.FindControl("lblBookingBy"), Label)
            If Not IsNothing(lblBookingBy) Then
                lblBookingBy.Text = DataBinder.Eval(e.Row.DataItem, "BookingBy").ToString()
            End If
            Dim lblBranch As Label = DirectCast(e.Row.FindControl("lblBranch"), Label)
            If Not IsNothing(lblBranch) Then
                lblBranch.Text = DataBinder.Eval(e.Row.DataItem, "Branch").ToString()
            End If
            Dim lblMessenger As Label = DirectCast(e.Row.FindControl("lblMessenger"), Label)
            If Not IsNothing(lblMessenger) Then
                lblMessenger.Text = DataBinder.Eval(e.Row.DataItem, "Messenger").ToString()
            End If
            Dim lblstatus As Label = DirectCast(e.Row.FindControl("lblstatus"), Label)
            If Not IsNothing(lblstatus) Then
                lblstatus.Text = DataBinder.Eval(e.Row.DataItem, "status").ToString()
            End If
        End If
    End Sub

    Protected Sub ShowPageCommand(s As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex

        If txtDate1.Text = "" Then
            txtDate1.Text = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
        End If
        If txtDate2.Text = "" Then
            txtDate2.Text = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
        End If

        BindData(txtDate1.Text, txtDate2.Text, ddlBranchSearch.Text, ddlMessengerSearch.Text)

    End Sub
   
End Class