<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dosya_yukle.ascx.cs" Inherits="dosya_yukle"
    EnableViewState="false" %>
   
<%
    string mesaj = Request.QueryString["mesaj"];
    if (!string.IsNullOrEmpty(mesaj))
    {
        lbl1.Text = mesaj;
    }



%>
<div style="width: 90%; height: 12.2em; margin-left: 1em; padding-left: 1em; font-size: 1em;
    border-style: groove; background-color: #eee;">
    <table>
    <tr>
    <td>Dosya Adi:</td>  <td><input  id="dosya_ad_text"  runat="server" style="margin-left:1em;" type="text" /></td>
    </tr>
    <tr>
      <td>Not:</td>  <td><input id="dosya_ayrinti_text" runat="server" style="margin-left:1em;" type="text" /></td>
    </tr>
    </table>
    
    Dosya Seçiniz:
    <div style="margin-top: 0.6em;">
        <asp:FileUpload runat="server" ID="f_u1" Style="font: 0.9em" Width="221px" />
    </div>
    <div style="margin-top: 1em;">
        <asp:Button Style="width: 8em; font-size: 0.9em; height: 2.5em;" runat="server" Text="Dosyayı Kaydet"
            ID="button1" OnClick="button1_click" /></div>
    <div style="margin-top: 0.2em; font-size: .8em;">
        <asp:Label runat="server" ID="lbl1"></asp:Label></div>
</div>
