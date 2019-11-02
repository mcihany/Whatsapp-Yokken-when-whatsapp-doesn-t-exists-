using System;
using System.Collections.Generic;
using System.Xml;
using System.Web;
using System.Web.Hosting;
using System.IO;

/// <summary>
/// Summary description for klasor_islem
/// </summary>
public class klasor_islem
{
    private static string server_klasor;
    private static XmlDocument dosyalar_xml = null;
    private static XmlNode dosyalar = null;
    private static XmlDocument baglantilar_xml = null;
    private static XmlNode baglantilar = null;

    private void baglantilar_yukle()
    {        
        if (!string.IsNullOrEmpty(server_klasor)) {
        string xml_adres = server_klasor + "\\" + sabitler.DosyalarXmlAdres;
        dosyalar_xml = new XmlDocument();

        if (File.Exists(xml_adres))
        {
            dosyalar_xml.Load(xml_adres);
            if (dosyalar_xml.ChildNodes.Count > 0)
            {                
                dosyalar = dosyalar_xml.ChildNodes[1];                
            }
        }
          
       }       

    }

    private void baglantilar_baglantilar_yukle()
    {
        if (!string.IsNullOrEmpty(server_klasor))
        {
            string xml_adres = server_klasor + "\\" + sabitler.baglantilar.baglantilarXmlAdres;
           baglantilar_xml = new XmlDocument();

            if (File.Exists(xml_adres))
            {
                baglantilar_xml.Load(xml_adres);
                if (baglantilar_xml.ChildNodes.Count > 0)
                {
                    baglantilar = baglantilar_xml.ChildNodes[1];
                }
            }

        }

    }

    private static string xml_dosya_klasor;
    public string XmlDosyaKlasor
    {
        get { return xml_dosya_klasor; }
        set { xml_dosya_klasor = value; }
    }

	
    private static string klasor;
    private static string kucuk_resim_klasor;
  

    public string Klasor
    {
        get { return klasor; }
        set { klasor = value; }
    }
    public string k_resim_klasor
    {
        get { return kucuk_resim_klasor; }
        set { kucuk_resim_klasor = value; }
    }


    public string server_mapPath
    {
        get { return server_klasor; }
        set { server_klasor = value; }
    }
    private static string dosyalar_klasor;   

    public string DosyalarKlasor
    {
        get { return dosyalar_klasor; }
        set { dosyalar_klasor = value; }
    }
    

    public string[] resim_dizi_ver() {
      
    
      string[] resimler=new string[0];
      if (!string.IsNullOrEmpty(server_klasor)) { 
  System.IO.DirectoryInfo resim_klasor = new System.IO.DirectoryInfo(server_klasor+"/"+klasor);
      if (resim_klasor.Exists == true)
      {
          System.IO.FileInfo[] resim_dizi = resim_klasor.GetFiles("*.*", System.IO.SearchOption.TopDirectoryOnly);
          if (resim_dizi.Length > 0)
          {
              Array.Resize(ref resimler, resim_dizi.Length);
              for (uint i = 0; i < resim_dizi.Length; i++) {
                  resimler[i] = resim_dizi[i].Name;
              
              }
          
          }
      }
      }
      return resimler;
    }
    public string[] dosyalar_dizi_ver()
    {


        string[] dosyalar = new string[0];
        if (!string.IsNullOrEmpty(server_klasor))
        {
            System.IO.DirectoryInfo dosya_klasor = new System.IO.DirectoryInfo(server_klasor + "/" + DosyalarKlasor);
            if (dosya_klasor.Exists == true)
            {
                System.IO.FileInfo[] dosya_dizi = dosya_klasor.GetFiles("*.*", System.IO.SearchOption.TopDirectoryOnly);
                if (dosya_dizi.Length > 0)
                {
                    Array.Resize(ref dosyalar, dosya_dizi.Length);
                    for (uint i = 0; i < dosya_dizi.Length; i++)
                    {
                        dosyalar[i] = dosya_dizi[i].Name;

                    }

                }
            }
        }
        return dosyalar;
    }
    
    public bool dosya_xml_kaydet(string adres,string dosya_adi, string aciklama) {
        baglantilar_yukle();
        if (dosyalar != null) {
            if (!string.IsNullOrEmpty(dosya_adi)) {
                adres = HttpUtility.HtmlEncode(adres);
                dosya_adi = HttpUtility.HtmlEncode(dosya_adi);
                aciklama = HttpUtility.HtmlEncode(aciklama);
                XmlNode yeni_dugum = dosyalar_xml.CreateNode(XmlNodeType.Element, sabitler.DXmlDosyaOzellik, string.Empty);

                XmlNode dosya_adi_alt_dugum =  dosyalar_xml.CreateNode(XmlNodeType.Element, sabitler.DXmlAdiOzellik, string.Empty);
                dosya_adi_alt_dugum.InnerText = dosya_adi;

                XmlNode dosya_adresi_alt_dugum = dosyalar_xml.CreateNode(XmlNodeType.Element, sabitler.DXmlAdresOzellik, string.Empty);
                dosya_adresi_alt_dugum.InnerText = adres;

                XmlNode dosya_ayrinti_alt_dugum = dosyalar_xml.CreateNode(XmlNodeType.Element, sabitler.DXmlDayrintiOzellik, string.Empty);
                dosya_ayrinti_alt_dugum.InnerText = aciklama;

                XmlNode dosya_tarih_alt_dugum = dosyalar_xml.CreateNode(XmlNodeType.Element, sabitler.DXmlDtarihOzellik, string.Empty);
                dosya_tarih_alt_dugum.InnerText = DateTime.Now.ToString();


                XmlNode dosya_indeks_alt_dugum = dosyalar_xml.CreateNode(XmlNodeType.Element, sabitler.DXmlDIndeksOzellik, string.Empty);
                dosya_indeks_alt_dugum.InnerText = (maks_indeks_ver()+1).ToString();


                yeni_dugum.AppendChild(dosya_adi_alt_dugum);
                yeni_dugum.AppendChild(dosya_adresi_alt_dugum);
                yeni_dugum.AppendChild(dosya_ayrinti_alt_dugum);
                yeni_dugum.AppendChild(dosya_tarih_alt_dugum);
                yeni_dugum.AppendChild(dosya_indeks_alt_dugum);
                dosyalar.AppendChild(yeni_dugum);

                try
                {

                    XmlElement rootNode = dosyalar_xml.DocumentElement;
                    dosyalar_xml.ReplaceChild(dosyalar, rootNode);
                    dosyalar_xml.Save( server_klasor + "\\" + sabitler.DosyalarXmlAdres);
                    return true;
                }
                catch { }
            }
        
        }


        return true;
    }

    public Int16 maks_indeks_ver() {
        Int16 indeks=0;
        for (Int16 i = 0; i<dosyalar.ChildNodes.Count;i++ ) {
            Int16 gecici_indeks = 0;
            for (Int16 m = 0; m < dosyalar.ChildNodes[i].ChildNodes.Count; m++) {
                if (dosyalar.ChildNodes[i].ChildNodes[m].LocalName == sabitler.DXmlDIndeksOzellik) {
                    string veri = dosyalar.ChildNodes[i].ChildNodes[m].InnerText;
                    if (!string.IsNullOrEmpty(veri))
                    {
                        gecici_indeks = Convert.ToInt16(veri);
                    }

                    if (gecici_indeks > indeks)
                    {

                        indeks = gecici_indeks;

                    }
                }
               

            }
        
        }


        return indeks;
    }

    public List<dosya_ozellikler> dosyalar_ver(){
        baglantilar_yukle();
        List<dosya_ozellikler> Dozelikler = new List<dosya_ozellikler>();
        if (dosyalar != null) {
            for (UInt16 i = 0; i < dosyalar.ChildNodes.Count; i++)
            {
                dosya_ozellikler dO = new dosya_ozellikler();
                for (UInt16 j = 0; j < dosyalar.ChildNodes[i].ChildNodes.Count; j++)
                {
                    if (dosyalar.ChildNodes[i].ChildNodes[j].LocalName == sabitler.DXmlAdiOzellik)
                    {
                        dO.DXmlDAdi = dosyalar.ChildNodes[i].ChildNodes[j].InnerText;

                    }
                    else if (dosyalar.ChildNodes[i].ChildNodes[j].LocalName == sabitler.DXmlAdresOzellik)
                    {
                        dO.DXmlDAdres = dosyalar.ChildNodes[i].ChildNodes[j].InnerText;

                    }
                    else if (dosyalar.ChildNodes[i].ChildNodes[j].LocalName == sabitler.DXmlDayrintiOzellik)
                    {
                        dO.DXmlDayrinti = dosyalar.ChildNodes[i].ChildNodes[j].InnerText;

                    }
                    else if (dosyalar.ChildNodes[i].ChildNodes[j].LocalName == sabitler.DXmlDIndeksOzellik)
                    {
                        dO.DXmlDIndeks = dosyalar.ChildNodes[i].ChildNodes[j].InnerText;

                    }
                    else if (dosyalar.ChildNodes[i].ChildNodes[j].LocalName == sabitler.DXmlDtarihOzellik)
                    {
                        dO.DXmlDtarih = dosyalar.ChildNodes[i].ChildNodes[j].InnerText;

                    }
                   

                }
                Dozelikler.Add(dO);

            }
        
        }
      


        return Dozelikler;
    }







    public bool baglanti_xml_kaydet(string baglanti, string baglanti_gorunen, string aciklama)
    {
       baglantilar_baglantilar_yukle();
        if (baglantilar != null)
        {
            if (!string.IsNullOrEmpty(baglanti))
            {
                baglanti = HttpUtility.HtmlEncode(baglanti);
                baglanti_gorunen = HttpUtility.HtmlEncode(baglanti_gorunen);
                aciklama = HttpUtility.HtmlEncode(aciklama);
                XmlNode yeni_dugum = baglantilar_xml.CreateNode(XmlNodeType.Element, sabitler.baglantilar.BXmlAdiOzellik, string.Empty);

                XmlNode baglanti_alt_dugum = baglantilar_xml.CreateNode(XmlNodeType.Element, sabitler.baglantilar.BXmlbaglantiOzellik, string.Empty);
                baglanti_alt_dugum.InnerText = baglanti;

                XmlNode baglanti_gorunen_ad_alt_dugum = baglantilar_xml.CreateNode(XmlNodeType.Element, sabitler.baglantilar.BXmlGorunenAdOzellik, string.Empty);
                baglanti_gorunen_ad_alt_dugum.InnerText = baglanti_gorunen;

                XmlNode baglanti_ayrinti_alt_dugum = baglantilar_xml.CreateNode(XmlNodeType.Element, sabitler.baglantilar.BXmlDayrintiOzellik, string.Empty);
                baglanti_ayrinti_alt_dugum.InnerText = aciklama;

                XmlNode baglanti_tarih_alt_dugum = baglantilar_xml.CreateNode(XmlNodeType.Element, sabitler.baglantilar.BXmlDtarihOzellik, string.Empty);
                baglanti_tarih_alt_dugum.InnerText = DateTime.Now.ToString();


                XmlNode baglanti_indeks_alt_dugum = baglantilar_xml.CreateNode(XmlNodeType.Element, sabitler.baglantilar.BXmlDIndeksOzellik, string.Empty);
                baglanti_indeks_alt_dugum.InnerText = (baglantilar_xml_maks_indeks_ver() + 1).ToString();


                yeni_dugum.AppendChild(baglanti_alt_dugum);
                yeni_dugum.AppendChild(baglanti_gorunen_ad_alt_dugum);
                yeni_dugum.AppendChild(baglanti_ayrinti_alt_dugum);
                yeni_dugum.AppendChild(baglanti_tarih_alt_dugum);
                yeni_dugum.AppendChild(baglanti_indeks_alt_dugum);
                baglantilar.AppendChild(yeni_dugum);

                try
                {

                    XmlElement rootNode = baglantilar_xml.DocumentElement;
                    baglantilar_xml.ReplaceChild(baglantilar, rootNode);
                    baglantilar_xml.Save(server_klasor + "\\" + sabitler.baglantilar.baglantilarXmlAdres);
                    return true;
                }
                catch { }
            }

        }


        return true;
    }

    public Int16 baglantilar_xml_maks_indeks_ver()
    {
        Int16 indeks = 0;
        for (Int16 i = 0; i < baglantilar.ChildNodes.Count; i++)
        {
            Int16 gecici_indeks = 0;
            for (Int16 m = 0; m < baglantilar.ChildNodes[i].ChildNodes.Count; m++)
            {
                if (baglantilar.ChildNodes[i].ChildNodes[m].LocalName == sabitler.DXmlDIndeksOzellik)
                {
                    string veri = baglantilar.ChildNodes[i].ChildNodes[m].InnerText;
                    if (!string.IsNullOrEmpty(veri))
                    {
                        gecici_indeks = Convert.ToInt16(veri);
                    }

                    if (gecici_indeks > indeks)
                    {

                        indeks = gecici_indeks;

                    }
                }


            }

        }


        return indeks;
    }

    public List<baglanti_ozellikler> baglantilar_ver()
    {
        baglantilar_baglantilar_yukle();
        List<baglanti_ozellikler> Dozelikler = new List<baglanti_ozellikler>();
        if (baglantilar != null)
        {
            for (UInt16 i = 0; i < baglantilar.ChildNodes.Count; i++)
            {
                baglanti_ozellikler dO = new baglanti_ozellikler();
                for (UInt16 j = 0; j < baglantilar.ChildNodes[i].ChildNodes.Count; j++)
                {
                    if (baglantilar.ChildNodes[i].ChildNodes[j].LocalName == sabitler.baglantilar.BXmlbaglantiOzellik)
                    {
                        dO.BXmlBaglanti = baglantilar.ChildNodes[i].ChildNodes[j].InnerText;

                    }
                    else if (baglantilar.ChildNodes[i].ChildNodes[j].LocalName == sabitler.baglantilar.BXmlDayrintiOzellik)
                    {
                        dO.BXmlBayrinti = baglantilar.ChildNodes[i].ChildNodes[j].InnerText;

                    }
                    else if (baglantilar.ChildNodes[i].ChildNodes[j].LocalName == sabitler.baglantilar.BXmlDIndeksOzellik)
                    {
                        dO.BXmlBIndeks = baglantilar.ChildNodes[i].ChildNodes[j].InnerText;

                    }
                    else if (baglantilar.ChildNodes[i].ChildNodes[j].LocalName == sabitler.baglantilar.BXmlDtarihOzellik)
                    {
                        dO.BXmlBtarih = baglantilar.ChildNodes[i].ChildNodes[j].InnerText;

                    }
                    else if (baglantilar.ChildNodes[i].ChildNodes[j].LocalName == sabitler.baglantilar.BXmlGorunenAdOzellik)
                    {
                        dO.BXmlBGorunenAd = baglantilar.ChildNodes[i].ChildNodes[j].InnerText;

                    }


                }
                Dozelikler.Add(dO);

            }

        }



        return Dozelikler;
    }
    public class dosya_ozellikler
    {

        private string dlar_xml_Dadi;
        public string DXmlDAdi
        {
            get { return dlar_xml_Dadi; }
            set { dlar_xml_Dadi = value; }
        }
        private string dlar_xml_Dadres;
        public string DXmlDAdres
        {
            get { return dlar_xml_Dadres; }
            set { dlar_xml_Dadres = value; }
        }
        private string dlar_xml_Dayrinti;
        public string DXmlDayrinti
        {
            get { return dlar_xml_Dayrinti; }
            set { dlar_xml_Dayrinti = value; }
        }
        private string dlar_xml_Dtarih;
        public string DXmlDtarih
        {
            get { return dlar_xml_Dtarih; }
            set { dlar_xml_Dtarih = value; }
        }

        private string dlar_xml_DIndeks;
        public string DXmlDIndeks
        {
            get { return dlar_xml_DIndeks; }
            set { dlar_xml_DIndeks = value; }
        }

    }

   public class baglanti_ozellikler {

         private string blar_xml_b_gorunen_ad ;
         public string BXmlBGorunenAd
        {
            get { return blar_xml_b_gorunen_ad; }
            set { blar_xml_b_gorunen_ad = value; }
        }
         private string blar_baglanti;
         public string BXmlBaglanti
        {
            get { return blar_baglanti; }
            set { blar_baglanti = value; }
        }
         private string blar_xml_Bayrinti ;
         public string BXmlBayrinti
        {
            get { return blar_xml_Bayrinti; }
            set { blar_xml_Bayrinti = value; }
        }
         private string blar_xml_Btarih ;
         public string BXmlBtarih
        {
            get { return blar_xml_Btarih; }
            set { blar_xml_Btarih = value; }
        }       

         private string blar_xml_BIndeks ;
         public string BXmlBIndeks
        {
            get { return blar_xml_BIndeks; }
            set { blar_xml_BIndeks = value; }
        } 
    
    }
}
