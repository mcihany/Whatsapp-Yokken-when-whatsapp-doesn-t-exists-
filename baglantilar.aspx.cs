using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class baglantilar : System.Web.UI.Page
{
    public klasor_islem klasor_islemleri = new klasor_islem();
    protected void Page_Load(object sender, EventArgs e)
    {
        klasor_islemleri.DosyalarKlasor = "dosyalar";
        klasor_islemleri.server_mapPath = Server.MapPath("");

    }
    protected void button1_click(object sender, EventArgs e) {
       

            try
            {
             
                // string uzanti = f_u1.FileName.Substring(f_u1.FileName.LastIndexOf("."), f_u1.FileName.Length - f_u1.FileName.LastIndexOf("."));

                // string dosya_ad = DateTime.Now.Ticks.ToString();
                string baglanti = baglanti_ad_text.Value.Trim();
                string baglanti_gorunen = baglanti_gorunen_text.Value.Trim();


                string dosya_ayrinti = baglanti_ayrinti_text.Value.Trim();
                if (!string.IsNullOrEmpty(baglanti))
                {

                    klasor_islemleri.baglanti_xml_kaydet(HttpUtility.HtmlDecode(baglanti), HttpUtility.HtmlDecode(baglanti_gorunen),
                        HttpUtility.HtmlDecode(dosya_ayrinti));
                    Response.Redirect(Request.Path + "?mesaj=" + sabitler.DosyaYuklemeBasariliMsj, false);
                }
                else {
                    lbl1.Text = "Bağlantı Boş Olamaz.";
                }

             

            }
            catch (Exception ex)
            {


                Response.Write("Hata Meydana Geldi:Hata: " + ex.Message);
            }


    
    }

    
}
