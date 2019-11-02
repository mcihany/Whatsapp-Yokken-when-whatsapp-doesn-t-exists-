<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="karsilama" %>

<%@ Register Src="menu.ascx" TagName="menu" TagPrefix="m1" %>
<%@ Register Src="~/dogum_gunu.ascx" TagName="dogum_gunu" TagPrefix="dg" %>
<%  if (!Convert.ToBoolean(Session["sifre"]))
    {
        Response.Redirect("giris.aspx?url=" + Page.Request.Url.AbsoluteUri);

    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Karşılama</title>
    <meta content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"
        name="viewport" />
    <style type="text/css">
        .karsilama
        {
            font-size: 1em;
            font-style: oblique;
            color: #555555;
            margin-left: 1em;
            margin-bottom: 1em;
            margin-top: 1em;
            width: 100%;
        }
        .kalan_sure
        {
            font-size: 1.1em;
            font-style: oblique;
            color: #333;
            margin-left: 1em;
            margin-bottom: 1em;
            color: #990000;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <m1:menu runat="server" ID="menu1" />
    <div class="karsilama">
        <% Response.Write(sabitler.KarsilamaMsj); %></div>
    
  <div class="kalan_sure">
  <%
      DateTime gelecek = Convert.ToDateTime("01.01.2020");
      DateTime simdi = DateTime.Now;
      TimeSpan fark = gelecek.Subtract(simdi);
      double gun ;
      int saat ;
      int dakika;
      if (fark.TotalMinutes>0)
      {
           fark = gelecek.Subtract(simdi);
           gun = fark.TotalDays;
           saat = fark.Hours;
           dakika = fark.Minutes;
          Response.Write("<br/><b>Aşkım Evliliğimize Kalan Süre:</b><br/><br/>" + Math.Floor(gun) + " Gün");
          if (saat > 0)
          {
              Response.Write(" " + saat + " Saat");
          }

          if (dakika > 0)
          {
              Response.Write(" " + dakika + " Dakika");
          }

      }
      else {
           fark = simdi.Subtract(gelecek);
           gun = fark.Days;
           saat = fark.Hours;
           dakika = fark.Minutes;
          Response.Write("<br/><b>Aşkım Evliliğimizden Geçen Süre:</b><br/><br/>" + gun + " Gün");
          if (saat > 0)
          {
              Response.Write(" " + saat + " Saat");
          }

         
      
      }
      
       %>
       </div>
    </form>
</body>
</html>
