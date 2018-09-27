Option Strict On
Option Explicit On

Imports System.Linq
Public Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserID").ToString = "" Then
            'Response.Redirect(Request.Cookies("MessConfigPath").Value & "Default.aspx")
            Response.Redirect("~/Default.aspx")
            Response.End()
        Else
            lblUser.Text = Session("Prefix_thai").ToString + " " + Session("Name_thai").ToString + " " + Session("Surname_thai").ToString

        End If

    End Sub

    Sub LinkMessenger_Click(sender As Object, e As EventArgs)
 
    End Sub

End Class