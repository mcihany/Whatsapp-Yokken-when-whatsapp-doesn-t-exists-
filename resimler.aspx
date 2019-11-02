<%@ Page Language="C#" AutoEventWireup="true" CodeFile="resimler.aspx.cs" Inherits="_Default"
    EnableViewState="false" %>

<%@ Register Src="resim_yukle.ascx" TagName="resim_yukle" TagPrefix="uc1" %>
<%@ Register Src="~/menu.ascx" TagName="menu" TagPrefix="m1" %>
<% 
      
    if (Convert.ToBoolean(Session["sifre"]) == true)
    {



        string boyut = "40";

        if (Request.Cookies["resim"] == null)
        {


            boyut = "40";
        }
        else
        {
            if (Request.Cookies["resim"].Values["resim_boyut"] == null || string.IsNullOrEmpty(Request.Cookies["resim"].Values["resim_boyut"]))
            {


                boyut = "40";
            }
            else
            {

                boyut = Request.Cookies["resim"].Values["resim_boyut"];
            }

        }



        string boyut_istek = Request.QueryString["boyut"];
        if (!string.IsNullOrEmpty(boyut_istek))
        {

            if (boyut_istek == "buyult")
            {
                boyut = resim_islem_sinif.resim_boyut_ver(1, Convert.ToInt32(boyut));
            }
            else if (boyut_istek == "kucult")
            {

                boyut = resim_islem_sinif.resim_boyut_ver(2, Convert.ToInt32(boyut));
            }


        }
        HttpCookie cook = new HttpCookie("resim");
        cook.Expires = DateTime.Now.AddDays(1);

        cook.Values["resim_boyut"] = boyut;
        Response.Cookies.Add(cook);


    }
    else
    {

        Response.Redirect("giris.aspx?url=" + Page.Request.Url.AbsoluteUri);
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"
        name="viewport" />
    <script type="text/javascript" src="jquery/jquery.min.js"></script>
    <script type="text/javascript">
        document.onkeydown = keyKontrol;

        function resim_indir() {
            var resim_eleman = document.getElementById("resim1");
            var adres = "resim_indir.aspx?resim=" + resim_eleman.name;
            location.href = adres;
        }
        function boyutlandir(istek) {
            var adress = null;
            if (istek == 1) {
                adress = url_parametre_ekle("boyut", "buyult");
            } else if (istek == 2) {
                adress = url_parametre_ekle("boyut", "kucult");
            }

            if (location.href == adress) {
                location.reload(adress);
            } else {
                location.href = adress;
            }



        }

        function url_parametre_ekle(param, deger) {
            var protokol = location.protocol;
            var aranan = location.search;
            var isaret = location.hash;
            var sayfa = location.pathname;
            var host = location.host;
            var adres = protokol + "//" + host + sayfa;

            //alert("aranan: " + aranan + " işaret: " + isaret + " sayfa: " + sayfa + " host: " + host + " protokol: " + protokol);
            if (aranan == "" || aranan == null) {
                adres = adres + "?" + param + "=" + deger;

            } else {
                var param_yer = aranan.indexOf(param + "=");
                if (param_yer == -1) {

                    adres = adres + aranan + "&" + param + "=" + deger;

                }
                else {

                    //aynı parametre zaten var.
                    var digerParam_yer = aranan.indexOf('&', 0);

                    if (digerParam_yer == -1) {
                        //başka parametre yoksa           
                        aranan = string_sil(param_yer + param.length + 1, aranan, aranan.length - (param_yer + param.length + 1));
                        aranan = string_yerlestir(param_yer + param.length + 1, aranan, deger);


                    } else {
                        //başka parametreler varsa

                        aranan = string_sil(param_yer + param.length + 1, aranan, digerParam_yer - param_yer + param.length + 2);
                        if (param_yer > digerParam_yer) {
                            aranan = aranan + deger;
                            // alert(aranan);
                        } else {

                            aranan = string_yerlestir(param_yer + param.length + 1, aranan, deger);
                        }



                    }

                    adres = adres + aranan;
                }




            }
            if (isaret != "") {
                adres = adres + isaret;
            }

            return adres;

        }
        function string_yerlestir(bas_yer, asil_deger, deger) {

            var yeni_deger;
            if (bas_yer >= 0 && bas_yer <= asil_deger.length) {
                var oncesi = asil_deger.substring(0, bas_yer);
                var sonrasi = asil_deger.substring(bas_yer, asil_deger.length);
                yeni_deger = oncesi + deger + sonrasi;
                return yeni_deger;
            } else {
                return null;
            }
        }

        function string_sil(bas_yer, asil_deger, sayi) {
            var yenideger;

            if (bas_yer >= 0 && bas_yer <= asil_deger.length && (bas_yer + sayi) <= asil_deger.length) {

                var oncesi = asil_deger.substring(0, bas_yer);

                var sonrasi = asil_deger.substring(bas_yer + sayi, asil_deger.length);

                yenideger = oncesi + sonrasi;

                return yenideger;
            } else {
                return null;
            }

        }
        function sonraki_resim_adres_al() {
            var adres = document.getElementById("resim_ileri");
            return adres.href;
        }
        function onceki_resim_adres_al() {
            var adres = document.getElementById("resim_geri");
            return adres.href;
        }

        function resim_sil(adres) {

            var answer = confirm("Resim Silinecek Eminmisiniz?")
            if (answer) {
                
                var adres = "resimler.aspx?resim_sil=" + adres
                location.href = adres;
            }
            
           
        
        }

        //ekrana basılan tuşun kodunu verir
        function keyKontrol(key) {
            var keyKod;
            keyKod = key.which;
            switch (keyKod) {
                case 37:
                    //geri         
                    location.href = sonraki_resim_adres_al();
                    break;
                case 39:
                    //ileri
                    location.href = onceki_resim_adres_al();
                    break;
                case 38:
                    //buyüt
                    boyutlandir(1);
                    break;
                case 40:
                    //kücült
                    boyutlandir(2);
                    break;

                default:
                    break;
            }

        }       
    </script>
    <style type="text/css">
        .resim_div
        {
            margin-bottom: 0.5em;
            margin-left: 1em;
        }
        .resim_div img
        {
            border-radius: 10px;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
            -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
            text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
            border-style: groove;
        }
        
        .resim_adres
        {
            margin-right: 1.2em;
            line-height: 1.3em;
            background: #222 url(overlay.png) repeat-x;
            display: inline-block;
            padding: 2px 2px 2px;
            margin: 0 0 0 3px;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
            -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
            text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
            border-bottom: 1px solid rgba(0,0,0,0.25);
            position: relative;
        }
        .resim_adres:visited
        {
            color: #888;
        }
        .resim_adres_div
        {
            margin-left: 1em;
            padding: 0em;
            width: 90%;
        }
        .resim_indir_div
        {
            margin-left: 1em;
            margin-top: 0.5em;
        }
        .resim_indir_div a
        {
            line-height: 1.3em;
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
            cursor: pointer;
        }
        .resim_div div a
        {
            line-height: 1.3em;
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
            cursor: pointer;
            margin-bottom: 0.6em;
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
            width: 100%;
        }
        
        .containerdiv
        {
            float: right;
            position: relative; z-index:5;
        }
        .containerdiv img:hover
        {
            width: 20px;
            height: 20px;
            cursor:pointer;
        }
        .cornerimage
        {
            position: absolute;
            top: 0;
            right: 0;
        }
    </style>
    <title>Resimler</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="ana_div">
        <m1:menu runat="server" ID="menu1" />
        <uc1:resim_yukle ID="resim_yukle1" runat="server" />
        <div class="resim_indir_div">
            <a onclick="resim_indir()">Resmi İndir</a><a onclick="boyutlandir(1);">Büyüt</a>
            <a onclick="boyutlandir(2)">Küçült</a> <a>Sağa Döndür</a><a>Sola Döndür</a></div>
        <%
        
            string[] resimler_dizi = klasor_islemleri.resim_dizi_ver();
            if (resimler_dizi.Length > 0)
            {
                for (Int32 i = resimler_dizi.Length - 1; i >= 0; i--)
                {
                    string dosya_adi = resimler_dizi[i];
                    if (i == resimler_dizi.Length - 1) Response.Write("<div class='resim_adres_div'><ul>");
                    if (resim_islem_sinif.dosya_resim_mi(dosya_adi))
                    {
                        //  Response.Write("<li><a class='resim_adres'  href='default.aspx?resim=" + dosya_adi + "' >Resim " + (i + 1).ToString() + "</a></li>");
                        if (System.IO.File.Exists(Server.MapPath(klasor_islemleri.k_resim_klasor + "/" + dosya_adi)))
                        {
                            Response.Write("<li><a class='resim_adres'  href='resimler.aspx?resim=" + dosya_adi + "#resim1' >" +
                               " <img class='resim_adres'  src=\"" + klasor_islemleri.k_resim_klasor + "/" + dosya_adi +
                                "\"></img></a><div class='containerdiv' onclick='resim_sil(\""+dosya_adi+
                                "\")'><img class='cornerimage'  src='sit_resimler/cikis.png'></img></div></li>");

                        }
                        else
                            
                        {

                            Response.Write("<li><a class='resim_adres'  href='resimler.aspx?resim=" + dosya_adi + "#resim1' >" +
                              " <img class='resim_adres'  height='38px' width='50px' src=\"" + klasor_islemleri.Klasor + "/" + dosya_adi +
                               "\"></img></a><div class='containerdiv' onclick='resim_sil(\"" + dosya_adi +
                               "\")'><img class='cornerimage'  src='sit_resimler/cikis.png'></img></div></li>");
                            /*
                            Response.Write("<li><div class='containerdiv' onclick='resim_sil(\"" + dosya_adi + 
                                "\")'><img class='cornerimage'  src='sit_resimler/cikis.png'></img></div><a class='resim_adres'  href='resimler.aspx?resim=" + 
                                dosya_adi + "#resim1' >Resim " + (i + 1).ToString() + "</a></li>");*/
                        }



                    }
                    if (i == 0) Response.Write("</ul></div>");

                }
                bool resim_istek_varmi = false; string istek_resim = null;
                if (!string.IsNullOrEmpty(Request.QueryString["resim"]))
                {
                    resim_istek_varmi = true;
                    istek_resim = Request.QueryString["resim"];
                }

                if (resim_istek_varmi)
                {

                    if (!resim_bastir(istek_resim, "Resim"))
                    {
                        Response.Write("İstenilen Resim Gösterilemiyor :(");
                        Response.Write("</br>Son Resim Gösteriliyor.");
                        if (!resim_bastir(resimler_dizi[resimler_dizi.Length - 1], "Ressim"))
                        {
                            Response.Write("Son Resimde Nedense Gösterilemiyor :(");
                        }
                    }

                }
                else
                {
                    if (!resim_bastir(resimler_dizi[resimler_dizi.Length - 1], "Son Resim"))
                    {
                        Response.Write("Son Resim Nedense Gösterilemiyor :(");
                    }

                }

            }
        
        
        
        %>
    </div>
    </form >
</body>
</html>
