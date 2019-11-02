<%@ Control Language="C#" AutoEventWireup="true" CodeFile="resim_yukle.ascx.cs" Inherits="resim_yukle"
    EnableViewState="false" %>
<%
    string mesaj = Request.QueryString["mesaj"];
    if (!string.IsNullOrEmpty(mesaj))
    {
        lbl1.Text = mesaj;
    }



%>
<div style="width: 90%; height: 8.2em; margin-left: 1em; padding-left: 1em; font-size: 1em;
    border-style: groove; background-color: #eee;">
    Resim Seçiniz:
    <div style="margin-top: 0.6em;">
        <asp:FileUpload runat="server" ID="f_u1" Style="font: 0.9em" />
    </div>
    <div style="margin-top: 1em;">
        <asp:Button Style="width: 8em; font-size: 0.9em; height: 2.5em;" runat="server" Text="Resmi Yükle"
            ID="button1" OnClick="button1_click" /></div>
    <div style="margin-top: 0.2em; font-size: .8em;">
        <asp:Label runat="server" ID="lbl1"></asp:Label></div>
</div>
