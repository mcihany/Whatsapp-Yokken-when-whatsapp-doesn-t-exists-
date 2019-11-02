<%@ Page Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>
<%@ Register Src="menu.ascx" TagName="menu" TagPrefix="m1" %>
<%  if (!Convert.ToBoolean(Session["sifre"]))
    {
        Response.Redirect("giris.aspx?url=" + Page.Request.Url.AbsoluteUri);
      
    }
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aradığınız Sayfa Bulunamadı!</title>
      <meta content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" name="viewport" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <m1:menu runat="server" id="menu1"/>
     <h5 style="margin-left:15px; margin-top:15px;">Aradığınız Sayfayı Bulamadık.<br />Menülerden Devam Edebilirsiniz.</h5>
    </div>
    </form>
</body>
</html>
