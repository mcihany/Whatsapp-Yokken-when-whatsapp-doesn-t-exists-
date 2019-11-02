<%@ Page Language="C#" AutoEventWireup="true" CodeFile="resim_indir.aspx.cs" Inherits="resim_indir" %>

   
<%
    
    if (Convert.ToBoolean(Session["sifre"]) == true)
    {
        string istek_resim = Request.QueryString["resim"];
        if (!string.IsNullOrEmpty(istek_resim))
        {
           
            if (System.IO.File.Exists(Server.MapPath( "resimler/" + istek_resim)))
            {
                Response.ContentType = "image/JPEG";
                Response.AddHeader("Content-Disposition", "attachment;filename=" + istek_resim);
                Response.TransmitFile(Server.MapPath("resimler/" + istek_resim));
            }
            else
            {
                Response.Write("İstenilen Dosya Bulunamıyor!");
            }


        }
        else {
              Response.Write("Parametre Boş!");
           
        }
    }
    else
    {

        Response.Redirect("giris.aspx?url=" + Page.Request.Url.AbsoluteUri);
    }
   
    
    
     %>
