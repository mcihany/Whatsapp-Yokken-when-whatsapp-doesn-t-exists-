using System;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;



public partial class _Default : System.Web.UI.Page 
{
  public  resim_islem resim_islem_sinif = new resim_islem();
  public klasor_islem klasor_islemleri = new klasor_islem();
  string[] resim_dizi;
    protected void Page_Load(object sender, EventArgs e)
    {
        string resim_sil = Request["resim_sil"];

        string k_resim_adres = null, resim_adres = null ;
        if (!string.IsNullOrEmpty(resim_sil)) {
            resim_adres = Server.MapPath(@"resimler\" + resim_sil);
            if (File.Exists(resim_adres))
            {
                k_resim_adres = Server.MapPath(@"k_resimler\" + resim_sil); ;
                try {
                    File.Delete(resim_adres);
                    if (File.Exists(k_resim_adres))
                    { File.Delete(k_resim_adres); }
                    
                    
                   
                }
                catch(Exception ex) {
                    Response.Write("Hata: " + ex.Message);
                } 
            }
        
        }


        klasor_islemleri.Klasor = "resimler";
        klasor_islemleri.k_resim_klasor = "k_resimler";
      
        klasor_islemleri.server_mapPath = Server.MapPath("");
        resim_dizi = klasor_islemleri.resim_dizi_ver();

    }

   
    public bool resim_bastir(string dosya, string resim_aciklama) {
        if (resim_islem_sinif.dosya_resim_mi(dosya))
        {
            if (System.IO.File.Exists(Server.MapPath(klasor_islemleri.Klasor) + "/" + dosya))
            {
                HttpCookie aCookie = HttpContext.Current.Response.Cookies["resim"];
                string genislik = aCookie.Values["resim_boyut"];
                string onceki_resim_Adres = onceki_resim_ver(dosya);
                string sonraki_resim_adres = sonraki_resim_ver(dosya);
                Response.Write(" <div  class='resim_div'><div><a id=\"resim_ileri\" href=\"resimler.aspx?resim=" + sonraki_resim_adres + "#resim1\">" + Server.HtmlEncode("<< ") +
                    "İLERİ</a><a id=\"resim_geri\" href=\"resimler.aspx?resim=" + onceki_resim_Adres + "#resim1\">GERİ " + Server.HtmlEncode(">>") + "</a></div>" + "<img name='" + dosya +
                    "' id=\"resim1\" width='" + genislik + "%'  alt='" + resim_aciklama + "' src='resimler/" + dosya +
                    "'/>" + "</div>");
                        
                
                return true;
            }
            else {
                return false;
            }

        }
        else {

            return false;
        }
    
    }

    private string onceki_resim_ver(string bastirilan_resim){
       
        string onceki_resim = null;
        for (uint i = 0; i < resim_dizi.Length; i++) {
            if (resim_dizi[i] == bastirilan_resim) {
                if (i != 0)
                {
                    onceki_resim = resim_dizi[i - 1];
                }
                else {
                    onceki_resim = resim_dizi[resim_dizi.Length-1];
                }
            }
        
        }
        return onceki_resim;
    
    }

    private string sonraki_resim_ver(string bastirilan_resim)
    {

        string sonraki_resim = null;
        for (uint i = 0; i < resim_dizi.Length; i++)
        {
            if (resim_dizi[i] == bastirilan_resim)
            {
                if (i != resim_dizi.Length-1)
                {
                    sonraki_resim = resim_dizi[i + 1];
                }
                else
                {
                    sonraki_resim = resim_dizi[0];
                }
            }

        }
        return sonraki_resim;

    }
}
