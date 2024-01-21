<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

      <section class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2><i class="fa fa-pencil"></i>Our Contact Details</h2>
                </div>
            </div>
        </div>
    </section>

    <section id="contact-us" class="contact-us section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <span class="title-bg">Paan Pumps</span>
                        <h1>Contact Us</h1>
                        <p>
                            contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old<p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="contact-main">
                        <div class="row">
                            <!-- Contact Form -->
                            <div class="col-lg-8 col-12">
                                <div class="form-main">
                                    <div class="text-content">
                                        <h2>Send Message Us</h2>
                                    </div>
                                    <form class="form" method="post">
                                        <div class="row">
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <input type="text" name="name"  id="txtFirstName" placeholder="Full Name" required="required" />
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <input type="email" name="email"  id="txtEmailid"  placeholder="Your Email" required="required" />
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-12">
                                                <div class="form-group">
                                                    <input type="text" name="subject" id="txtMailSubject" placeholder="Your subject" required="required" />
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-12">
                                                <div class="form-group">
                                                    <textarea name="message" rows="6" id="txtMailBody"" placeholder="Type Your Message"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-12">
                                                <div class="form-group button">
                                                  <%--  <button type="submit" id="btnsendMail" class="btn primary">Submit Message</button>--%>
                                                       <input type="submit" id="btnsendMail" class="btn btn-primary btn-lg btn-block" value="Send Message"/>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!--/ End Contact Form -->
                            <!-- Contact Address -->
                            <div class="col-lg-4 col-12">
                                <div class="contact-address">
                                    <!-- Address -->
                                    <div class="contact">
                                        <h2>Our Contact Address</h2>
                                        <ul class="address">
                                            <li><i class="fa fa-paper-plane"></i><span>Address: </span>Road no 3, Block-D, Khilgaon 1200, Dhaka Bangladesh</li>
                                            <li><i class="fa fa-phone"></i><span>Phone: </span>+(123) 31222183</li>
                                            <li class="email"><i class="fa fa-envelope"></i><span>Email: </span><a href="mailto:paanpumps@yahoo.co.in">paanpumps@yahoo.co.in</a></li>
                                        </ul>
                                    </div>
                                    <!--/ End Address -->
                                    <!-- Social -->
                                    <ul class="social">
                                        <li class="active"><a href="#"><i class="fa fa-facebook"></i>Like Us facebook</a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i>Follow Us twitter</a></li>
                                        <li><a href="#"><i class="fa fa-google-plus"></i>Follow Us google-plus</a></li>
                                        <li><a href="#"><i class="fa fa-linkedin"></i>Follow Us linkedin</a></li>
                                        <li><a href="#"><i class="fa fa-behance"></i>Follow Us behance</a></li>
                                    </ul>
                                    <!--/ End Social -->
                                </div>
                            </div>
                            <!--/ End Contact Address -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

  <script type="text/javascript">


        $("#btnsendMail").click(function (e)
        {
            e.preventDefault();
            alert($('#txtEmailid').val());
            if (!ValidateEmail($('#txtEmailid').val())) {
                return;
            }

            $.ajax({
                type: "Post",
                url: 'contact.aspx/SendMail_ContactUs',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                data: "{FName:'" + $('#txtFirstName').val() + "',Emailid:'" + $('#txtEmailid').val() + "',MailSubject: '" + $('#txtMailSubject').val() + "',MailBody:' " + $('#txtMailBody').val() + "'}",
                async: false,
                success: function (Data) {
                    alert(Data.d.Data);
                    $('#txtFirstName').val('');
                    $('#txtEmailid').val('');
                    $('#txtMailSubject').val('');
                    $('#txtMailBody').val('');
                },
                error: function (d) {
                    alert("something went to wrong ..!");
                }
            });
        });

        function ValidateEmail(mail) {
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

            if (reg.test(mail) == false) {
                alert('Invalid Email Address');
                return false;
            }

            return true;
        }


    </script>
</asp:Content>

