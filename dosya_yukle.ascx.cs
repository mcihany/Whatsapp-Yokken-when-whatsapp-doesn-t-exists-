using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Drawing.Imaging;
using System.Drawing;
using System.Drawing.Drawing2D;

public partial class dosya_yukle : System.Web.UI.UserControl
{
   
  
    klasor_islem klasor_islem = new klasor_islem();
    protected void button1_click(object sender, EventArgs e) {
        if (f_u1.HasFile)
        {

           
                try
                {
                   
                   // string uzanti = f_u1.FileName.Substring(f_u1.FileName.LastIndexOf("."), f_u1.FileName.Length - f_u1.FileName.LastIndexOf("."));

                   // string dosya_ad = DateTime.Now.Ticks.ToString();
                    string adres = klasor_islem.DosyalarKlasor + "\\" +f_u1.FileName;
                    string dosya_adres = Server.MapPath("~/" +adres );
                    f_u1.SaveAs(dosya_adres);
                    string dosya_adi = dosya_ad_text.Value.Trim();
                    string dosya_ayrinti = dosya_ayrinti_text.Value.Trim();
                    if (!string.IsNullOrEmpty(adres)) {
                        if (string.IsNullOrEmpty(dosya_adi))
                            dosya_adi = f_u1.FileName;
                        klasor_islem.dosya_xml_kaydet(HttpUtility.HtmlDecode(adres), HttpUtility.HtmlDecode(dosya_adi), HttpUtility.HtmlDecode(dosya_ayrinti));
                    }
                   
                    Response.Redirect(Request.Path + "?mesaj="+sabitler.DosyaYuklemeBasariliMsj,false);

                }
                catch (Exception ex)
                {


                    Response.Write("Hata Meydana Geldi:Hata: "+ex.Message);
                }
           
           
        }
        else {
            lbl1.Text = "Dosya Seçiniz!";
           
        }
        
    
    }

}
