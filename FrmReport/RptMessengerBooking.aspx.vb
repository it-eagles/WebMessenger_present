Option Strict On
Option Explicit On

Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports CrystalDecisions.Web
Imports CrystalDecisions.ReportSource
Imports CrystalDecisions.CrystalReports
Imports System.Linq
Imports Microsoft.Reporting.WebForms
Imports System.Net
Imports System.Globalization

Public Class RptMessengerBooking
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
                    txtDate1.Text = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
                    txtDate2.Text = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
                End If

            End Using


        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim date1 As Date = DateTime.ParseExact(txtDate1.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
        Dim date2 As Date = DateTime.ParseExact(txtDate2.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))

        Using db = New DB_EaglesInternalEntities

            Dim results = (From c In db.tblBookingMessenger
                       Where c.BookingDate >= date1 And c.BookingDate <= date2 Order By c.BookingDate Ascending
                       Select New With {c.RecNo,
                                        c.BookingDate,
                                        c.BookingTime,
                                        c.CusTel,
                                        c.ContactPerson,
                                        c.CustomerName,
                                        c.Location,
                                        c.JobType1,
                                        c.JobType2,
                                        c.JobType3,
                                        c.JobDesc,
                                        c.ReceiveComback,
                                        c.BookingBy,
                                        c.Branch,
                                        c.Messenger,
                                        c.Status,
                                        c.Remark,
                                        c.ReceiveBy}).ToList


            Dim rpt As New ReportDocument()
            'Dim fileName As String = System.IO.Path.GetTempPath() + Guid.NewGuid().ToString() + ".pdf"
            'rpt.Load("D:\DevelopmentProjet/WebMessenger/WebMessenger/Report/crMessenger.rpt")
            rpt.Load(Server.MapPath("../Report/crMessengerBooking.rpt"))
            rpt.SetDataSource(results)
            rpt.SetParameterValue("date1", Me.txtDate1.Text)
            rpt.SetParameterValue("date2", Me.txtDate2.Text)
            CrystalReportViewer1.ReportSource = rpt
            CType(rpt, ReportDocument).ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("../PDF/jobMessenger.pdf"))
            'Response.Redirect(Server.MapPath("../PDF/" + CStr(index) + ".pdf"))

            Dim path As String = Server.MapPath("../PDF/jobMessenger.pdf")
            Dim client As New WebClient()
            Dim buffer As [Byte]() = client.DownloadData(path)

            If buffer IsNot Nothing Then
                Response.ContentType = "application/pdf"
                Response.AddHeader("content-length", buffer.Length.ToString())
                Response.BinaryWrite(buffer)
                Response.End()
            End If
        End Using
    End Sub
End Class