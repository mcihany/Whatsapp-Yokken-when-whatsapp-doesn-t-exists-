using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for sabitler
/// </summary>
static public class sabitler
{
    public class baglantilar {
        static private string baglantilar_xml_adres = @"xml\baglantilar.xml";
        static public string baglantilarXmlAdres
        {
            get { return baglantilar_xml_adres; }
        }
        static private string blar_xml_Dadi_ozellik = "baglanti";
        static public string BXmlAdiOzellik
        {
            get { return blar_xml_Dadi_ozellik; }
        }
        static private string blar_xml_Bgorunen_ad_ozellik = "baglanti_gorunen";
        static public string BXmlGorunenAdOzellik
        {
            get { return blar_xml_Bgorunen_ad_ozellik; }
        }
        static private string blar_xml_Dayrinti_ozellik = "baglanti_ayrinti";
        static public string BXmlDayrintiOzellik
        {
            get { return blar_xml_Dayrinti_ozellik; }
        }
        static private string blar_xml_Dtarih_ozellik = "baglanti_kayit_tarih";
        static public string BXmlDtarihOzellik
        {
            get { return blar_xml_Dtarih_ozellik; }
        }
        static private string blar_xml_baglanti_Ozellik = "baglanti";
        static public string BXmlbaglantiOzellik
        {
            get { return blar_xml_baglanti_Ozellik; }
        }

        static private string blar_xml_DIndeks_Ozellik = "indeks";
        static public string BXmlDIndeksOzellik
        {
            get { return blar_xml_DIndeks_Ozellik; }
        }
    
    }

    static private string dosyalar_xml_adres=@"xml\dosyalar.xml";
    static public string DosyalarXmlAdres {
        get { return dosyalar_xml_adres; }
    }
    static private string dlar_xml_Dadi_ozellik = "dosya_adi";
    static public string DXmlAdiOzellik
    {
        get { return dlar_xml_Dadi_ozellik; }
    } 
    static private string dlar_xml_Dadres_ozellik = "dosya_adres";
    static public string DXmlAdresOzellik
    {
        get { return dlar_xml_Dadres_ozellik; }
    }
    static private string dlar_xml_Dayrinti_ozellik = "dosya_ayrinti";
    static public string DXmlDayrintiOzellik
    {
        get { return dlar_xml_Dayrinti_ozellik; }
    }
    static private string dlar_xml_Dtarih_ozellik = "dosya_kayit_tarih";
    static public string DXmlDtarihOzellik
    {
        get { return dlar_xml_Dtarih_ozellik; }
    }
    static private string dlar_xml_Dosya_Ozellik = "dosya";
    static public string DXmlDosyaOzellik
    {
        get { return dlar_xml_Dosya_Ozellik; }
    }

    static private string dlar_xml_DIndeks_Ozellik = "indeks";
    static public string DXmlDIndeksOzellik
    {
        get { return dlar_xml_DIndeks_Ozellik; }
    }
    static private string dosya_yukleme_basarili_msj = "Başarıyla Yüklendi.";
    static public string DosyaYuklemeBasariliMsj
    {
        get { return dosya_yukleme_basarili_msj; }
    }
    static private string karsilama_msj = "Hoşgeldiniz...";
    static public string KarsilamaMsj
    {
        get { return karsilama_msj; }
    }
}
