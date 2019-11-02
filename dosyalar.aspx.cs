using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class dosyalar : System.Web.UI.Page
{
    public klasor_islem klasor_islemleri = new klasor_islem();
    protected void Page_Load(object sender, EventArgs e)
    {
        klasor_islemleri.DosyalarKlasor = "dosyalar";
        klasor_islemleri.server_mapPath = Server.MapPath("");

    }

    
}
