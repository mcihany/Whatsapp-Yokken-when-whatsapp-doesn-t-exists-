<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dosyalar.aspx.cs" Inherits="dosyalar" %>
<%@ Register Src="dosya_yukle.ascx" TagName="dosya_yukle" TagPrefix="uc2" %>
<%@ Register Src="~/menu.ascx" TagName="menu" TagPrefix="m1" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%if (!Convert.ToBoolean(Session["sifre"]))
  {
      Response.Redirect("giris.aspx?url=" + Page.Request.Url.AbsoluteUri);
  }

 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dosyalar</title>
       <meta content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" name="viewport" />
  <style type="text/css">
        
       
        
        .dosya_adres:visited
        {
            color: #888;
        }
        .dosya_adres_div
        {
            margin-left: 1em;
            padding: 0em;
            width: 90%;
            
        }
       
           
         .dosya_adres
        {
            line-height: 1.4em;
            background: #444;
            display: inline-block;
            padding: 5px 10px 6px;
            margin: 0 2px 0px 3px;
            color: Yellow;
            text-decoration: none;
            border-radius: 6px;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
            -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
            text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
            border-bottom: 1px solid rgba(0,0,0,0.25);
            position: relative;
            cursor:pointer;
            margin-bottom:0.6em;
          
         
           
        }
         .ayrinti
        {
            line-height: 1em;
           font-size:0.7em;
            color: Yellow;
            text-decoration: none;
          
        }
        li
        {
            list-style: none;
        }
        ul li
        {
            display: inline-block;
           
            margin-left: 0em;
        }
        ul
        {
            margin-left: -2em;
        }
        #ana_div
        {
        	width:100%
        	}
        
       
    </style>
</head>
<body >
    <form id="form1" runat="server">
    <div id="ana_div">
         <m1:menu runat="server" id="menu1"/>
     <uc2:dosya_yukle ID="dosya_yukle1" runat="server" />
         <%
                
        
        List<klasor_islem.dosya_ozellikler> dosyalar = klasor_islemleri.dosyalar_ver();
        dosyalar.Reverse();
        if (dosyalar != null) {
          
            Response.Write("<div class='dosya_adres_div'><ul>");
            for (UInt16 i = 0; i < dosyalar.Count; i++) {
                if (dosyalar[i] != null) {
                    klasor_islem.dosya_ozellikler Do = dosyalar[i];
                    Do.DXmlDAdres = HttpUtility.HtmlDecode(Do.DXmlDAdres);
                    if (File.Exists(Server.MapPath(Do.DXmlDAdres)))
                    {

                       
                        //  Response.Write("<li><a class='dosya_adres'  href='default.aspx?dosya=" + dosya_adi + "' >dosya " + (i + 1).ToString() + "</a></li>");
                        FileInfo f = new FileInfo(Server.MapPath(Do.DXmlDAdres));
                        double b = (f.Length / 1024f) / 1024f;
                        string buyukluk = null;
                        if (b > 1)
                        {
                            buyukluk = string.Format("{0:0.## MB}", b);
                        }
                        else
                        {
                            b = (f.Length / 1024f);
                            buyukluk = string.Format("{0:0.## KB}", b);
                        }

                        Response.Write(HttpUtility.HtmlDecode("<li><a class='dosya_adres'  href='dosya_indir.aspx?dosya=" + ortak_fonk.tirnak_degistir(Do.DXmlDAdres) + "' > " + (i + 1).ToString() + ") " + ortak_fonk.tirnak_degistir(Do.DXmlDAdi) + " (" + buyukluk + ")" +
                            "<div class='ayrinti'>" + Do.DXmlDtarih + "<br/>" + ortak_fonk.tirnak_degistir ( Do.DXmlDayrinti) + "</div>" + "</a></li><br/>"));







                    }
                    else {
                        Response.Write("<li><a class='dosya_adres'   > " + (i+1).ToString() + ") Dosya Bulunamadı!<br/>" +HttpUtility.HtmlEncode( ortak_fonk.tirnak_degistir ( Do.DXmlDAdi)) +  "</a></li><br/>");
                    }
                    

                
                }
            
            }
            Response.Write("</ul></div>");
        }
  
       
                    
               
        
        
        
    %>
    </div>
    </form>
</body>
</html>
