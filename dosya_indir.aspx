<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dosya_indir.aspx.cs" Inherits="dosya_indir" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>

   
<%
    
    if (Convert.ToBoolean(Session["sifre"]))
    {
        string istek_dosya = Request.QueryString["dosya"];
        if (!string.IsNullOrEmpty(istek_dosya))
        {
            istek_dosya = HttpUtility.HtmlDecode(istek_dosya);
            if (System.IO.File.Exists(Server.MapPath(istek_dosya)))
            {
                DirectoryInfo di = new DirectoryInfo(Server.MapPath(istek_dosya));

                string strURL = di.FullName;
                WebClient req = new WebClient();
                HttpResponse response = HttpContext.Current.Response;
                response.Clear();
                response.ClearContent();
                response.ClearHeaders();
                response.Buffer = true;
                response.AddHeader("Content-Disposition", "attachment;filename=\"" + di.Name + "\"");
                byte[] data = req.DownloadData(strURL);
                response.BinaryWrite(data);
                response.End();
                
                
                
                
                
                //fileDownload(di.Name, di.FullName);
                /*
                Response.ClearContent();
                Int32 fn_yer=istek_dosya.LastIndexOf("\\");
                string filename = null;
                if(fn_yer>=0){
                    filename = istek_dosya.Substring(fn_yer, istek_dosya.Length - fn_yer);
                }
                if (string.IsNullOrEmpty( filename)) { 
                filename=istek_dosya;
                }
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment;filename=" + filename);
              
                Response.TransmitFile(Server.MapPath(istek_dosya));
                Response.End();*/
                
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
