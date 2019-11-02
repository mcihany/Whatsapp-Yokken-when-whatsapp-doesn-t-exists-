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

public partial class resim_yukle : System.Web.UI.UserControl
{
   
    resim_islem resim_islem_sinif = new resim_islem();
    klasor_islem klasor_islem = new klasor_islem();
    protected void button1_click(object sender, EventArgs e) {
        if (f_u1.HasFile)
        {

            if (resim_islem_sinif.dosya_resim_mi(f_u1.FileName))
            {
                try
                {

                    string uzanti = f_u1.FileName.Substring(f_u1.FileName.LastIndexOf("."), f_u1.FileName.Length - f_u1.FileName.LastIndexOf("."));

                    string dosya_ad = DateTime.Now.Ticks.ToString();
                    string resim_ad = Server.MapPath("~/" + klasor_islem.Klasor + "/" + dosya_ad + uzanti);
                    f_u1.SaveAs(resim_ad);
                    f_u1.Dispose();
                    using (System.Drawing.Image kucuk_resim = resim_boyutlandır(System.Drawing.Image.FromFile(resim_ad), 50, 38))
                    {

                        string kucuk_resim_ad = Server.MapPath("~/" + klasor_islem.k_resim_klasor + "/" + dosya_ad + uzanti);
                        kucuk_resim.Save(kucuk_resim_ad);
                        kucuk_resim.Dispose();
                        
                        Response.Redirect(Request.Path + "?mesaj=Resim Başarıyla Yüklendi");
                    }

                }
                catch (Exception ex)
                {


                    Response.Write("Hata Meydana Geldi:Hata: "+ex.Message);
                }
            }
            else {

                Response.Write("Dosya Beklenen Resim Formatarında Değil.<br/>.jpg, .bmp, .png olmalı");
            
            }
           
        }
        else {
            lbl1.Text = "Resim Seçiniz!";
           
        }
        
    
    }
    public System.Drawing.Image resim_boyutlandır(System.Drawing.Image img, Int32 gen, Int32 yuk)
    {
        int kaynakEn = img.Width;
        int KaynakBoy = img.Height;
        float nPercent = 0;
        float nPercentW = 0;
        float nPercentH = 0;

        nPercentW = ((float)gen / (float)kaynakEn);
        nPercentH = ((float)yuk / (float)KaynakBoy);

        if (nPercentH < nPercentW)
        {
            nPercent = nPercentH;
        }
        else
        {
            nPercent = nPercentW;
        }

        int HedefEn = (int)(kaynakEn * nPercent);
        int HedefBoy = (int)(KaynakBoy * nPercent);

        using (Bitmap b = new Bitmap(HedefEn, HedefBoy))
        {
            using (Graphics g = Graphics.FromImage((System.Drawing.Image)b))
            {
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.DrawImage(img, 0, 0, HedefEn, HedefBoy);
                g.Dispose();
            }
            
            return (System.Drawing.Image)b;
        }
    }
}
