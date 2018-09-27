<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="WebMessenger.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Web Messenger</title>

    <!-- Le styles -->
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="Content/css/signin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="container">

        <form class="form-signin" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <h2 class="form-signin-heading">Please sign in</h2>
            <label for="inputUser" class="sr-only">User ID</label>
            <input type="text" id="txtUserName" runat="server" class="form-control" placeholder="User ID" required="required" autofocus="autofocus" autocomplete="off" />
            <br />
            <label for="txtUserPass" class="sr-only">Password</label>
            <input type="password" id="txtUserPass" runat="server" class="form-control" placeholder="Password" required="required" />
            <asp:Label ID="lblMsg" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat="server" />
            <br />
            <br />
            <asp:Button CssClass="btn btn-lg btn-primary btn-block" ID="Button1" runat="server" Text="Sign in" OnClick="Button1_Click" />

        </form>

    </div>
    <!-- /container -->
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
