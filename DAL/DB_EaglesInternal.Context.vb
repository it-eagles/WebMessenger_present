﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated from a template.
'
'     Manual changes to this file may cause unexpected behavior in your application.
'     Manual changes to this file will be overwritten if the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Data.Entity
Imports System.Data.Entity.Infrastructure

Partial Public Class DB_EaglesInternalEntities
    Inherits DbContext

    Public Sub New()
        MyBase.New("name=DB_EaglesInternalEntities")
    End Sub

    Protected Overrides Sub OnModelCreating(modelBuilder As DbModelBuilder)
        Throw New UnintentionalCodeFirstException()
    End Sub

    Public Overridable Property tblUser() As DbSet(Of tblUser)
    Public Overridable Property tblUserMenu() As DbSet(Of tblUserMenu)
    Public Overridable Property tblBookingMessenger() As DbSet(Of tblBookingMessenger)
    Public Overridable Property tblMessenger() As DbSet(Of tblMessenger)
    Public Overridable Property tblFileITs() As DbSet(Of tblFileIT)
    Public Overridable Property tblCustomerLists() As DbSet(Of tblCustomerList)

End Class
