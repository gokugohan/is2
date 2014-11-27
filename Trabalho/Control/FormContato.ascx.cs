using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control_FormContato : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage mensagem = new MailMessage();
            mensagem.Subject = tbAssunto.Text.Trim();
            mensagem.Body = tbMensagem.Text;
            mensagem.From = new MailAddress("menezes@chebre.com","Hélder Menezes");
            mensagem.To.Add(new MailAddress(tbEmail.Text,tbNomeCompleto.Text.Trim()));
        
            SmtpClient mSmtpClient = new SmtpClient();
            mSmtpClient.Send(mensagem);
            ClearText();
        }
        catch (Exception ex)
        {
            lblInfo.Text = "Uppps.. " + ex.Message + "<br/> Source: " + ex.Source;
            ClearText();
        }
        
    }

    private void ClearText()
    {
        tbNomeCompleto.Text = "";
        tbEmail.Text = "";
        tbAssunto.Text = "";
        tbMensagem.Text = "";
    }
}