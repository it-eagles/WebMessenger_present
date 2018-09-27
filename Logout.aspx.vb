Public Class Logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Session.Clear()
            Session.Abandon()
            Session.RemoveAll()
            'Response.Redirect(Request.Cookies("MessConfigPath").Value + "Login.aspx")
            Response.Redirect("~/Login.aspx")
            Response.End()

        End If
    End Sub

End Class