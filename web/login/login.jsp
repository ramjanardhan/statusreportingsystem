<%-- 
    Document   : login
    Created on : Apr 29, 2017, 12:49:09 AM
    Author     : miracle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">

            <div class="row">
                <div class="col-sm-8">
                    <%String path = request.getContextPath();%>
                    <div class="content">
                        <div class="content_item hidden-xs">
                            <h4 style="color: #2d8fc8" class="heading_4"><b>TP On-boarding</b></h4>
                            <div>
                                <div class="col-sm-12 register">  
                                                                          
                                    For partner self registration   <img  alt="miraclesoft" data-toggle="modal" data-target="#selfReg" src='<%=path%>/includes/images/register.png'>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 pull-right">
                    <div class="panel panel-default bx_shadow login_bx">
                        <div class="panel-body">
                            <h3 class="thin text-center"><b>Log in</b></h3>


                            <s:form action="/general/tpoLoginCheck" method="post" name="tpLoginForm" id="tpLoginForm" theme="simple">
                                <div class="top-margin">
                                    <label>Username <span class="text-danger">*</span></label>
                                    <s:textfield cssClass="form-control" name="loginId" id="loginId"  tabindex="1"/>
                                </div>
                                <div class="top-margin">
                                    <label>Password <span class="text-danger">*</span></label>
                                    <s:password cssClass="form-control" name="password" id="password"  tabindex="2"/>
                                </div>

                                <div class="row">
                                    <div class="col-xs-8 col-sm-7">
                                        <a href="" data-toggle="modal" data-target="#myModal"  tabindex="4">Forgot password ?</a>
                                    </div>
                                    <div class="col-xs-4 col-sm-5">

                                        <s:submit value="Sign In" cssClass="btn btn-info btn-block btn-flat" tabindex="3"/>
                                    </div>
                                </div>

                            </s:form>
                            <div class="modal fade" id="myModal" data-backdrop="static" data-keyword="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header"  style="border:0">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">Reset Password</h4>
                                        </div>
                                        <div class="modal-body" style="margin-top: -15px; margin-bottom: -25px;">
                                            <div id="tpResultMessage">
                                                <div class="row">   
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label>login Id<span class="text-danger">*</span></label>
                                                            <s:textfield  cssClass="form-control" name="userid" id="userid" placeholder="User ID"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div class="form-group ajax_img">
                                                            <label>Email<span class="text-danger">*</span></label>
                                                            <s:textfield cssClass="form-control" name="regcontactEmail" id="regcontactEmail" placeholder="Your Email" value="%{regcontactEmail}" onchange="validateEmail(this);fieldLengthValidator(this);" onblur="isExistedUserEmail('login','forgotPwd');"/>
                                                            <i id="correctImg2" style="display: none;"  class="fa fa-check"></i>
                                                            <i id="wrongImg2" style="display: none;" class="fa fa-times"></i>
                                                            <i id="loadingImageEmailCheck2" style="display: none;" class="fa fa-spinner"></i>
                                                        </div>
                                                    </div>
                                                </div>  
                                            </div>
                                            <div class="modal-footer" style="border:0;margin:0">
                                                <div class="row">
                                                    <div class="col-md-12" style="margin-bottom:8px">
                                                        <div class="col-md-2 pull-right"><input type="button" id="pwdButton" value="Submit" class="btn btn-primary" onclick="forgotpassword();"/></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="selfReg" data-backdrop="static" data-keyword="false" tabindex="-1" role="dialog" aria-labelledby="selfRegLabel">
                                <div class="modal-dialog1" role="document">
                                    <div class="modal-content" style="margin:12%">
                                        <div class="modal-header1"  style="border:0">
                                            <button type="button" id="closeButton" style="color:#ff0000" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h3 class="modal-title" id="selfRegLabel" style="color:#285e8e">Partner self registration form</h3>
                                        </div>
                                        <hr>
                                        <center><div id="addpartnerMsg"></div>
                                            <div id="loadingImage"></div>
                                            <div id="tpResultMessage"></div></center>
                                            <s:form action="" method="post" cssClass="contact-form"  name="tpoPartnerAdd" id="tpoPartnerAdd" theme="simple">
                                            <div class="row">

                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>First Name<span class="text-danger">*</span></label>
                                                        <s:textfield cssClass="form-control"  name="contactPerson" id="contactPerson" value="%{contactPerson}" placeholder="First Name" onchange="addPtnerLengthValidator(this);"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Last Name<span class="text-danger">*</span></label>
                                                        <s:textfield cssClass="form-control" name="contactPersonLN" id="contactPersonLN" value="%{contactPersonLN}" placeholder="Last Name" onchange="addPtnerLengthValidator(this);"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group ajax_img">
                                                        <label>Contact Email<span class="text-danger">*</span></label>
                                                        <s:textfield cssClass="form-control" name="contactEmail" id="contactEmail" placeholder="Contact Email" value="%{contactEmail}" onchange="validateEmail(this);fieldLengthValidator(this);" onblur="isExistedUserEmail('partnerAdd','self');"/><i id="correctImg1" style="display: none;"  class="fa fa-check"></i>
                                                        <i id="wrongImg1" style="display: none;" class="fa fa-times"></i><i id="loadingImageEmailCheck" style="display: none;" class="fa fa-spinner"></i>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Phone Number<span class="text-danger">*</span></label>
                                                        <s:textfield cssClass="form-control"  name="addphoneNo" id="addphoneNo" value="%{addphoneNo}" placeholder="Phone no." onchange="addPtnerLengthValidator(this);"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Address<span class="text-danger">*</span></label>
                                                        <s:textfield cssClass="form-control" name="addaddress1" id="addaddress1" value="%{addaddress1}" placeholder="Address" onchange="addPtnerLengthValidator(this);"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>City<span class="text-danger">*</span></label>
                                                        <s:textfield cssClass="form-control" name="addcity" id="addcity" value="%{addcity}" placeholder="City" onchange="addPtnerLengthValidator(this);"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>State<span class="text-danger">*</span></label>
                                                        <s:textfield cssClass="form-control" name="addstate" id="addstate" value="%{addstate}" placeholder="State" onchange="addPtnerLengthValidator(this);"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Country<span class="text-danger">*</span></label>
                                                        <s:select headerKey="-1" headerValue="--Select--" cssClass="form-control" list="#@java.util.LinkedHashMap@{'US':'USA','IN':'India','CN':'Canada','UK':'United Kingdom'}" name="addcountry" id="addcountry" value="%{addcountry}"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Zip Code<span class="text-danger">*</span></label>
                                                        <s:textfield cssClass="form-control" name="addzipCode" id="addzipCode" value="%{addzipCode}" placeholder="Zip Code" onchange="addPtnerLengthValidator(this);"/>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-md-12" style="margin-bottom:8px">
                                                    <div class="col-md-2 pull-right"><input type="button" id="addbutton" value="Add" class="btn btn-primary" onclick="addPartner('self');"/></div>
                                                    <div class="col-md-2 pull-right"><input type="button" value="Reset" class="btn btn-primary" onClick="resetAddPartnerValues('self');"/></div>
                                                </div>
                                            </div>
                                        </s:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
