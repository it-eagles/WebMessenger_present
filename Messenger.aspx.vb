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
                    lblNameAdd.Text = Session("Prefix_thai").ToString + " " + Session("Name_thai").ToString + " " + Session("Surname_thai").ToString
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
                Me.GridView1.DataSource = ds
                Me.GridView1.DataBind()
            Else
                Me.GridView1.DataSource = Nothing
                Me.GridView1.DataBind()
            End If
        End Using
    End Sub

    Protected Sub lnkEdit_Click(ByVal sender As Object, ByVal e As EventArgs)

        Dim btnsubmit As LinkButton = TryCast(sender, LinkButton)
        Dim gRow As GridViewRow = DirectCast(btnsubmit.NamingContainer, GridViewRow)
        Dim dateMess As Date = DateTime.ParseExact(CStr(GridView1.DataKeys(gRow.RowIndex).Values(0)), "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
        Dim name As String = CStr(GridView1.DataKeys(gRow.RowIndex).Values(1))

        Using db = New DB_EaglesInternalEntities
            Dim ds = (From c In db.tblMessenger Where c.MessDate = dateMess And c.Name = name).SingleOrDefault
            lblMessDate.Text = CStr(ds.MessDate)
            lblName.Text = ds.Name
            txtTimeOut.Text = ds.TimeOut
            txtMileOut.Text = CStr(ds.MileOut)
            txtTimeIn.Text = ds.TimeIn
            txtMileIn.Text = CStr(ds.MileIn)

        End Using
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "openModal();", True)

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

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lblMessDate As Label = DirectCast(e.Row.FindControl("lblMessDate"), Label)
            If Not IsNothing(lblMessDate) Then
                lblMessDate.Text = CStr(DataBinder.Eval(e.Row.DataItem, "MessDate", "{0:dd/MM/yyyy}"))
            End If
            Dim lblName As Label = DirectCast(e.Row.FindControl("lblName"), Label)
            If Not IsNothing(lblName) Then
                lblName.Text = DataBinder.Eval(e.Row.DataItem, "Name").ToString()
            End If
            Dim lblTimeOut As Label = DirectCast(e.Row.FindControl("lblTimeOut"), Label)
            If Not IsNothing(lblTimeOut) Then
                lblTimeOut.Text = DataBinder.Eval(e.Row.DataItem, "TimeOut").ToString()
            End If
            Dim lblMileOut As Label = DirectCast(e.Row.FindControl("lblMileOut"), Label)
            If Not IsNothing(lblMileOut) Then
                lblMileOut.Text = DataBinder.Eval(e.Row.DataItem, "MileOut").ToString()
            End If
            Dim lblTimeIn As Label = DirectCast(e.Row.FindControl("lblTimeIn"), Label)
            If Not IsNothing(lblTimeIn) Then
                lblTimeIn.Text = DataBinder.Eval(e.Row.DataItem, "TimeIn").ToString()
            End If
            Dim lblMileIn As Label = DirectCast(e.Row.FindControl("lblMileIn"), Label)
            If Not IsNothing(lblMileIn) Then
                lblMileIn.Text = DataBinder.Eval(e.Row.DataItem, "MileIn").ToString()
            End If

        End If
    End Sub

    Protected Sub ShowPageCommand(s As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        BindData()

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Using db = New DB_EaglesInternalEntities

            db.tblMessenger.Add(New tblMessenger() With { _
                     .MessDate = DateTime.ParseExact(txtMessDate.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US")), _
                     .Name = lblNameAdd.Text.Trim, _
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

    Protected Sub btnAddMile_Click(sender As Object, e As EventArgs) Handles btnAddMile.Click
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "AddModalScript", "openModalAdd();", True)
    End Sub
End Class