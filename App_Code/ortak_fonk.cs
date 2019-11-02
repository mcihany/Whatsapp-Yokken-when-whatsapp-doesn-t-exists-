using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for ortak_fonk
/// </summary>
public class ortak_fonk
{
	public ortak_fonk()
	{
		//
		// TODO: Add constructor logic here
		//
        
	}


    public static string tirnak_degistir(string metin) {
        if (metin != null) {
            
            metin = metin.Replace("\'", "&apos;");
        }       
        return metin;
    }
}
