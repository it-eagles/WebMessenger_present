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

    Public Overridable Property Document() As DbSet(Of Document)
    Public Overridable Property M_Document() As DbSet(Of M_Document)
    Public Overridable Property Referal_Doc() As DbSet(Of Referal_Doc)
    Public Overridable Property sysdiagrams() As DbSet(Of sysdiagrams)
    Public Overridable Property tblAbsent() As DbSet(Of tblAbsent)
    Public Overridable Property tblBookingMessenger() As DbSet(Of tblBookingMessenger)
    Public Overridable Property tblCaseJob() As DbSet(Of tblCaseJob)
    Public Overridable Property tblDivision() As DbSet(Of tblDivision)
    Public Overridable Property tblFileIT() As DbSet(Of tblFileIT)
    Public Overridable Property tblIDRecording() As DbSet(Of tblIDRecording)
    Public Overridable Property tblItJobDoc() As DbSet(Of tblItJobDoc)
    Public Overridable Property tblMenu() As DbSet(Of tblMenu)
    Public Overridable Property tblMessenger() As DbSet(Of tblMessenger)
    Public Overridable Property tblRunningNumber() As DbSet(Of tblRunningNumber)
    Public Overridable Property tblUser() As DbSet(Of tblUser)
    Public Overridable Property tblUserGroup() As DbSet(Of tblUserGroup)
    Public Overridable Property tblUserMenu() As DbSet(Of tblUserMenu)
    Public Overridable Property tblUsername() As DbSet(Of tblUsername)
    Public Overridable Property tblAccessList() As DbSet(Of tblAccessList)
    Public Overridable Property tblAccessListDetail() As DbSet(Of tblAccessListDetail)
    Public Overridable Property Branch() As DbSet(Of Branch)
    Public Overridable Property Department() As DbSet(Of Department)
    Public Overridable Property Position() As DbSet(Of Position)
    Public Overridable Property RunNo() As DbSet(Of RunNo)
    Public Overridable Property Side() As DbSet(Of Side)
    Public Overridable Property tblCustomerList() As DbSet(Of tblCustomerList)
    Public Overridable Property Status() As DbSet(Of Status)

End Class