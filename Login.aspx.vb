Option Strict On
Option Explicit On

Imports System.Linq
Imports System.Web
Imports System.Web.Configuration
Imports System.Security
Imports System.Globalization

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim UserID As New HttpCookie("UserID")
        'Dim MessConfigPath As New HttpCookie("MessConfigPath")

        'Dim CurrentCF = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath)
        'Dim MessConfig = CurrentCF.AppSettings.Settings("mess").Value
        'Response.Cookies("MessConfigPath").Value = MessConfig


        'TextBox1.Text = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
        'Response.Write(DateTime.ParseExact(TextBox1.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US")))
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim LoginCls As New LoginCls
        Dim menu As String = "Messenger Booking"
        If LoginCls.chkUser(txtUserName.Value, txtUserPass.Value) Then
            Using db = New DB_EaglesInternalEntities

                Dim ds = (From c In db.tblUser
                           Where c.UserId = txtUserName.Value.Trim
                           Select New With
                           {
                                c.UserId,
                                c.Prefix_thai,
                                c.Name_thai,
                                c.Surname_thai,
                                c.Name_eng
                             }).FirstOrDefault()
                Dim ds1 = (From c In db.tblUserMenu Where c.UserID = ds.UserId And c.Menu = menu And c.Read_ = 1).FirstOrDefault
                If Not IsNothing(ds1) Then
                    Session("UserID") = txtUserName.Value.Trim
                    Session("Prefix_thai") = ds.Prefix_thai
                    Session("Name_thai") = ds.Name_thai
                    Session("Surname_thai") = ds.Surname_thai
                    Session("Name_eng") = ds.Name_eng
                    'Response.Redirect(Request.Cookies("MessConfigPath").Value & "Default.aspx")
                    Response.Redirect("~/Default.aspx")
                Else
                    lblMsg.Text = "* You do not have access"
                End If

            End Using
        Else
            lblMsg.Text = "* Your Username and/or password  is not correct."
        End If
    End Sub
End Class