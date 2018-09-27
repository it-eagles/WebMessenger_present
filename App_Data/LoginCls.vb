Option Strict On
Option Explicit On

Imports System.Linq
Imports System.Data
Imports System.Management
Imports System.Net
Imports System.IO
Imports System.Text
Imports System.Security.Cryptography

Public Class LoginCls
    Private Shared DES As New TripleDESCryptoServiceProvider
    Private Shared MD5 As New MD5CryptoServiceProvider
    Public Shared EncryptPass As String = "eagles"

    Public Shared Function chkUser(userid As String, password As String) As Boolean
        Using db = New DB_EaglesInternalEntities
            Dim PassEn As String = Encrypt(password, EncryptPass)

            Dim q = (From p In db.tblUser _
               Where p.UserId.ToUpper() = userid And p.Password = PassEn
               Select p).Count()
            If (q > 0) Then
                Return True
            Else
                Return False
            End If
        End Using

    End Function

    Public Shared Function MD5Hash(ByVal value As String) As Byte()
        Return MD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(value))
    End Function

    Public Shared Function Encrypt(ByVal stringToEncrypt As String, ByVal key As String) As String
        DES.Key = MD5Hash(key)
        DES.Mode = CipherMode.ECB
        Dim Buffer As Byte() = ASCIIEncoding.ASCII.GetBytes(stringToEncrypt)
        Return Convert.ToBase64String(DES.CreateEncryptor().TransformFinalBlock(Buffer, 0, Buffer.Length))
    End Function

    Public Shared Function Decrypt(ByVal encryptedString As String, ByVal key As String) As String
        Try
            DES.Key = MD5Hash(key)
            DES.Mode = CipherMode.ECB
            Dim Buffer As Byte() = Convert.FromBase64String(encryptedString)
            Return ASCIIEncoding.ASCII.GetString(DES.CreateDecryptor().TransformFinalBlock(Buffer, 0, Buffer.Length))
        Catch ex As Exception
            'MessageBox.Show("The encryption key specified was not appropriate for decryption.", "Invalid Enryption Key", MessageBoxButtons.OK, MessageBoxIcon.Information)
            Return ""
        End Try
    End Function

End Class


