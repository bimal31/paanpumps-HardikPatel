using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contactus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static ResponseObject SendMail_ContactUs(string FName,  string Emailid, string MailSubject, String MailBody)
    {



        EmailUtility.From = Emailid;
        EmailUtility.To = ConfigurationManager.AppSettings["DefaultEmail"].ToString();
        EmailUtility.Subject = MailSubject;
        EmailUtility.Body = MailBody;
        string Fullname = FName;
        EmailUtility.Body = "Name : " + Fullname +
                           "<br />Message: " + MailBody;


        ResponseObject response = new ResponseObject();
        try
        {

            var isSent = EmailUtility.sendMail();
            if (isSent == "sent")
            {
                response.IsError = 1;
                response.Data = "Send Mail";
            }
            else
            {
                response.IsError = 0;
                response.Data = "something went to wrong ..!";
            }
        }
        catch (Exception ex)
        {
            response.IsError = 0;
            response.Data = ex.Message;
        }

        return response;

    }
}