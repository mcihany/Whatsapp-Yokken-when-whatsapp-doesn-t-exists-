using System;
using System.Collections.Generic;

using System.Web;

/// <summary>
/// Summary description for resim_islem
/// </summary>
public class resim_islem
{
	public resim_islem()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool dosya_resim_mi(string dosya_adi)
    {
        string uzanti = dosya_adi.Substring(dosya_adi.LastIndexOf("."), dosya_adi.Length - dosya_adi.LastIndexOf("."));
        if (string.Equals(uzanti, ".jpg", StringComparison.CurrentCultureIgnoreCase) ||
           string.Equals(uzanti, ".png", StringComparison.CurrentCultureIgnoreCase) ||
          string.Equals(uzanti, ".bmp", StringComparison.CurrentCultureIgnoreCase) ||
          string.Equals(uzanti, ".gif", StringComparison.CurrentCultureIgnoreCase))
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    public string resim_boyut_ver(Int32 istek, Int32 boyut)
    {
        //istek 1 ise büyüt
        //istek 2 ise küçült
        if (istek == 1 && boyut + 10 <= 100)
        {

            boyut += 10;


        }
        else if (istek == 2 && boyut - 10 >= 10)
        {

            boyut -= 10;


        }
        return Convert.ToString(boyut);
    }

}
