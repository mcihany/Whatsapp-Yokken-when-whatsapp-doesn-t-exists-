<%@ Page Language="C#" AutoEventWireup="true" CodeFile="giris.aspx.cs" Inherits="giris"
    EnableViewState="false" %>
    

<%
    string gidilecek_url = Request.QueryString["url"];
    
    if (!Convert.ToBoolean(Session["sifre"]))
    {

        string sifre = Request.Form["sifre_text"];
     

        if (!string.IsNullOrEmpty(sifre))
        {
            if (sifre == "0000")
            {
                Session["sifre"] = true;
                if (gidilecek_url != null && !string.IsNullOrEmpty(gidilecek_url))
                {
                    Response.Redirect(gidilecek_url);
                }
                else {
                    if (gidilecek_url != null && !string.IsNullOrEmpty(gidilecek_url))
                    {
                        Response.Redirect(gidilecek_url);
                    }
                    else
                    {
                        Response.Redirect("default.aspx");
                    }
                }
              
            }
            else
            {

                Session["sifre"] = false;

                mesaj_div.InnerText = "Yanlış Şifre!";
            }

        }
        else
        {
            Session["sifre"] = false;


        }

    }
    else {
        if (gidilecek_url != null && string.IsNullOrEmpty(gidilecek_url))
        {
            Response.Redirect(gidilecek_url);
        }
        else
        {
            Response.Redirect("default.aspx");
        }
    }
    
    
    
    
   

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Şifre Lütfen</title>
       <meta content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" name="viewport" />
       <link href="mobile_css/2011_1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
     function odakla(nesne) {
    var nes = document.getElementById(nesne);
    if (nes != null) {
        nes.scrollIntoView(true);
        nes.focus();
    }
}
    
    </script>
    <style type="text/css">
    .ana_div
    {
    	margin-left: 1em;
    	margin-top:1em;
    	}
    </style>

</head>
<body   onload="odakla('s_text') ">
    <form id="form1" method="post" action="<%if(!string.IsNullOrEmpty(Request.QueryString["url"])){Response.Write("giris.aspx?url="+gidilecek_url); }
    else{Response.Write("giris.aspx");}%>">
    
    
    
     
    <div class="ana_div">
    <div>
        <div style="color:Red; margin-bottom: 1em;">
            Şifre:</div>
        <input type="password" name="sifre_text" id="s_text" style="width: 6em; font-size: 2em; margin-bottom: 1em;" />
        <br />
        <input type="submit" value="Giriş" style="color:Yellow; background-color:Black; width: 6em; font-size: 2em; " />
    </div>
    <div runat="server" id="mesaj_div" style="color: Red; margin-top: 1em;">
    </div>
    </div>
    </form>
</body>
</html>
