<%@ Page Language="C#" AutoEventWireup="true" CodeFile="baglantilar.aspx.cs" Inherits="baglantilar" %>

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
    <title>Bağlantılar</title>
       <meta content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" name="viewport" />
  <style type="text/css">
        
       
        
        .baglanti_adres:visited
        {
            color: #888;
        }
        .baglanti_adres_div
        {
            margin-left: 1em;
            padding: 0em;
            width: 90%;
            
        }
       
           
         .baglanti_adres
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
         table tr
        {
        	 margin-bottom:2em;
        	}
       
    </style>
</head>
<body >
    <form id="form1" runat="server">
    <div id="ana_div">
         <m1:menu runat="server" id="menu1"/>
  <div style="width: 90%; height: 9.2em; margin-left: 1em; padding-left: 1em; font-size: 1em;
    border-style: groove; background-color: #eee;">
    <table>
    <tr>
    <td>Bağlantı:</td>  <td><input  id="baglanti_ad_text"  runat="server" style="margin-left:1em;" type="text" /></td>
    </tr>
    <tr>
    <td>Bağlantı Görünen:</td>  <td><input  id="baglanti_gorunen_text"  runat="server" style="margin-left:1em;" type="text" /></td>
    </tr>
    <tr>
      <td>Not:</td>  <td><input id="baglanti_ayrinti_text" runat="server" style="margin-left:1em;" type="text" /></td>
    </tr>
    </table>
    
    
    <div style="margin-top: 1em;">
        <asp:Button Style="width: 10em; font-size: 0.9em; height: 2.5em;" runat="server" Text="Bağlantıyı Kaydet"
            ID="button1" OnClick="button1_click" /></div>
    <div style="margin-top: 0.2em; font-size: .8em;">
        <asp:Label runat="server" ID="lbl1"></asp:Label></div>
</div>
         <%
                
       
        List<klasor_islem.baglanti_ozellikler> baglantilar = new klasor_islem().baglantilar_ver();
        baglantilar.Reverse();
        if (baglantilar != null) {
          
            Response.Write("<div class='baglanti_adres_div'><ul>");
            for (UInt16 i = 0; i < baglantilar.Count; i++) {
                if (baglantilar[i] != null) {
                    klasor_islem.baglanti_ozellikler Bo = baglantilar[i];



                    if (string.IsNullOrEmpty(Bo.BXmlBGorunenAd)) Bo.BXmlBGorunenAd = Bo.BXmlBaglanti;
                        Response.Write(HttpUtility.HtmlDecode("<li><a target='blank' class='baglanti_adres'  href='"+Bo.BXmlBaglanti+"' > " + (i + 1).ToString() + ") " + 
                            ortak_fonk.tirnak_degistir(Bo.BXmlBGorunenAd)  +
                            "<div class='ayrinti'>" +
                            ortak_fonk.tirnak_degistir ( Bo.BXmlBayrinti) + "</div>" + "</a></li><br/>"));







                   

                
                }
            
            }
            Response.Write("</ul></div>");
        }
  
       
                    
               
        
        
        
    %>
    </div>
    </form>
</body>
</html>
