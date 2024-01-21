using System;
using System.Configuration;
using System.Net;
using System.Net.Mail;


public class EmailUtility
{
    #region Class Property Declaration
    private static string smtpHost = ConfigurationManager.AppSettings["SMTPHost"].ToString();
    private static int smtpPort = Convert.ToInt32(ConfigurationManager.AppSettings["SMTPPort"].ToString());
    private static string smtpUsername = ConfigurationManager.AppSettings["SMTPUsername"].ToString();
    private static string smtpPassword = ConfigurationManager.AppSettings["SMTPPassword"].ToString();

    private static string _from, _to, _cc, _bcc, _subject, _body, _attachment;
    #endregion

    #region Class Property Defninition
    public static string From { get { return _from; } set { _from = value; } }
    public static string To { get { return _to; } set { _to = value; } }
    public static string Cc { get { return _cc; } set { _cc = value; } }
    public static string Bcc { get { return _bcc; } set { _bcc = value; } }
    public static string Subject { get { return _subject; } set { _subject = value; } }
    public static string Body { get { return _body; } set { _body = value; } }
    public static string Attachment { get { return _attachment; } set { _attachment = value; } }
    #endregion

    public static string sendMail()
    {
        try
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(From);

            if (Convert.ToString(To) != "") { msg.To.Add(To); }
            //if (Convert.ToString(Cc) != "") { msg.CC.Add(Cc); }
            //if (Convert.ToString(Bcc) != "") { msg.Bcc.Add(Bcc); }

            msg.Subject = Subject;
            msg.Body = Body;
            msg.IsBodyHtml = true;
          //  msg.Attachments.Add(new Attachment(Attachment));

            NetworkCredential ntcd = new NetworkCredential();
            ntcd.UserName = smtpUsername;
            ntcd.Password = smtpPassword;

            SmtpClient smt = new SmtpClient();
            smt.Host = smtpHost;
            smt.Credentials = ntcd;
            smt.EnableSsl = true;
            smt.Port = smtpPort;
            smt.Send(msg);
            return "sent";
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }
}

