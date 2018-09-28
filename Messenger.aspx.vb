Option Strict On
Option Explicit On

Imports System.Linq
Imports System.Data
Imports System.Globalization

Public Class Messenger
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Using db = New DB_EaglesInternalEntities
                Dim menu As String = "Messenger Booking"
                Dim id As String = Session("UserID").ToString

                Dim ds = (From c In db.tblUserMenu Where c.UserID = id And c.Menu = menu And c.Save_ = 1).FirstOrDefault
                If IsNothing(ds) Then
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirect", "alert('คุณไม่มีสิทธิ์เข้าเมนูนี้ครับ'); window.location='" + Request.ApplicationPath + "Default.aspx'; ", True)
                Else
                    txtNameAdd.Text = Session("Prefix_thai").ToString + " " + Session("Name_thai").ToString + " " + Session("Surname_thai").ToString
                    BindData()
                End If

            End Using
        End If
    End Sub

    Private Sub BindData()
        Dim Name As String = Session("Prefix_thai").ToString & " " & Session("Name_thai").ToString + " " + Session("Surname_thai").ToString

        Using db = New DB_EaglesInternalEntities

            Dim ds = (From c In db.tblMessenger Where c.Name.Contains(Name) Order By c.MessDate Descending
                     Select New With {
                         c.MessDate, c.MileIn, c.MileOut, c.Name, _
                         c.TimeIn, c.TimeOut}).ToList()

            If ds.Count > 0 Then
                Me.dgvMile.DataSource = ds
                Me.dgvMile.DataBind()
            Else
                Me.dgvMile.DataSource = Nothing
                Me.dgvMile.DataBind()
            End If
        End Using
    End Sub

    Protected Sub lnkEdit_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim Item As RepeaterItem = TryCast(TryCast(sender, LinkButton).Parent, RepeaterItem)
        Dim name As String = TryCast(Item.FindControl("lblName"), Label).Text.Trim
        Dim Mess As String = TryCast(Item.FindControl("lblMessDate"), Label).Text.Trim
        Dim dateMess As Date = DateTime.ParseExact(Mess, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
        Using db = New DB_EaglesInternalEntities
            Dim ds = (From c In db.tblMessenger Where c.MessDate = dateMess And c.Name = name).SingleOrDefault
            lblMessDate.Text = CStr(ds.MessDate)
            lblName.Text = ds.Name
            txtTimeOut.Text = ds.TimeOut
            txtMileOut.Text = CStr(ds.MileOut)
            txtTimeIn.Text = ds.TimeIn
            txtMileIn.Text = CStr(ds.MileIn)
            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "myModalEdit();", True)
            ScriptManager.RegisterStartupScript(upMile, upMile.GetType(), "show", "$(function () { $('#" + plMile.ClientID + "').modal('show'); });", True)
            upMile.Update()
        End Using

    End Sub

    Protected Sub btnSaveChange_Click(sender As Object, e As EventArgs) Handles btnSaveChange.Click

        Dim messdate As Date = DateTime.ParseExact(lblMessDate.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
        Using db = New DB_EaglesInternalEntities

            Dim Messenger As tblMessenger = (From c In db.tblMessenger _
                        Where c.Name = lblName.Text And c.MessDate = messdate _
                        Select c).First()
            Messenger.TimeOut = txtTimeOut.Text.Trim
            Messenger.MileOut = CDec(txtMileOut.Text.Trim)
            Messenger.TimeIn = txtTimeOut.Text.Trim
            Messenger.MileIn = CDec(txtMileIn.Text.Trim)
            Messenger.UpdateBy = Session("Name_eng").ToString.ToUpper
            Messenger.UpdateDate = Now

            db.SaveChanges()
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirect", "alert('แก้ไขข้อมูล เรียบร้อยแล้วครับ'); window.location='" + Request.ApplicationPath + "/Default.aspx';", True)
        End Using

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Using db = New DB_EaglesInternalEntities

            db.tblMessenger.Add(New tblMessenger() With { _
                     .MessDate = DateTime.ParseExact(txtMessDate.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US")), _
                     .Name = txtNameAdd.Text.Trim, _
                     .TimeOut = txtTimeOutAdd.Text.Trim, _
                     .MileOut = CDec(txtMileOutAdd.Text.Trim), _
                     .TimeIn = txtTimeInAdd.Text.Trim, _
                     .MileIn = CDec(txtMileInAdd.Text.Trim), _
                     .CreateBy = Session("Name_eng").ToString.ToUpper, _
                     .CreateDate = Now _
                })
            db.SaveChanges()
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('บันทึกข้อมูล เรียบร้อยแล้วครับ');", True)
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirect", "alert('บันทึกข้อมูล เรียบร้อยแล้วครับ'); window.location='" + Request.ApplicationPath + "/Messenger.aspx';", True)
            ' Response.Redirect("~/Default.aspx")
        End Using
    End Sub

    'Protected Sub btnAddMile_Click(sender As Object, e As EventArgs) Handles btnAddMile.Click
    '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "AddModalScript", "openModalAdd();", True)
    'End Sub

    Protected Sub dgvMile_ItemDataBound(sender As Object, e As RepeaterItemEventArgs)
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim lblMessDate As Label = DirectCast(e.Item.FindControl("lblMessDate"), Label)
            If Not IsNothing(lblMessDate) Then
                lblMessDate.Text = CStr(DataBinder.Eval(e.Item.DataItem, "MessDate", "{0:dd/MM/yyyy}"))
            End If
            Dim lblName As Label = DirectCast(e.Item.FindControl("lblName"), Label)
            If Not IsNothing(lblName) Then
                lblName.Text = DataBinder.Eval(e.Item.DataItem, "Name").ToString()
            End If
            Dim lblTimeOut As Label = DirectCast(e.Item.FindControl("lblTimeOut"), Label)
            If Not IsNothing(lblTimeOut) Then
                lblTimeOut.Text = DataBinder.Eval(e.Item.DataItem, "TimeOut").ToString()
            End If
            Dim lblMileOut As Label = DirectCast(e.Item.FindControl("lblMileOut"), Label)
            If Not IsNothing(lblMileOut) Then
                lblMileOut.Text = DataBinder.Eval(e.Item.DataItem, "MileOut").ToString()
            End If
            Dim lblTimeIn As Label = DirectCast(e.Item.FindControl("lblTimeIn"), Label)
            If Not IsNothing(lblTimeIn) Then
                lblTimeIn.Text = DataBinder.Eval(e.Item.DataItem, "TimeIn").ToString()
            End If
            Dim lblMileIn As Label = DirectCast(e.Item.FindControl("lblMileIn"), Label)
            If Not IsNothing(lblMileIn) Then
                lblMileIn.Text = DataBinder.Eval(e.Item.DataItem, "MileIn").ToString()
            End If
        End If
    End Sub
End Class