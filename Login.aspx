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
        <div class="row text-center">
            <h1><strong>EaglesThai</strong></h1>
        </div>
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title text-center">Messenger Booking</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" runat="server">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <!--<div class="form-group">
                        <label class="control-label">Login</label>
                    </div>-->
                        <!--<label for="inputUser" class="sr-only">User ID</label>-->
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input type="text" id="txtUserName" runat="server" class="form-control" placeholder="Username" required="required" autofocus="autofocus" autocomplete="off" />
                            </div>
                        </div>
                        <!--<label for="txtUserPass" class="sr-only">Password</label>-->
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input type="password" id="txtUserPass" runat="server" class="form-control" placeholder="Password" required="required" />
                            </div>
                        </div>
                        <asp:Label ID="lblMsg" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat="server" />
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <asp:Button CssClass="btn btn-primary btn-block" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /container -->

    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

</body>
</html>
