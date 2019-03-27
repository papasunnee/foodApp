<%-- 
    Document   : index
    Created on : Oct 23, 2018, 12:38:19 PM
    Author     : Funmilola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<!-- Head -->

<head>
    <title>Food App Signin Form </title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta-Tags -->
    <!-- Index-Page-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <!-- //Custom-Stylesheet-Links -->
    <!--fonts -->
    <!-- //fonts -->
    <link rel="stylesheet" href="css/font-awesome.css" type="text/css" media="all">
    <!-- //Font-Awesome-File-Links -->
	
	<!-- Google fonts -->
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
	<!-- Google fonts -->

</head>
<!-- //Head -->
<!-- Body -->

<body>
    <%
        String username=(String)session.getAttribute("username");
        
        //redirect user to home page if already logged in
        if(username!=null){
            response.sendRedirect( request.getContextPath() + "/fooditem");
        }
//        String status=request.getParameter("status");
//        
//        if(status!=null){
//            if(status.equals("false")){
//                   out.print("Incorrect login details!");                       
//            }
//            else{
//                out.print("Some error occurred!");
//            }
//        }
        %>
    <h1 class="title-agile text-center">Food Store App</h1>
    <div class="content-w3ls">
        <div class="content-bottom">
			<h2>Sign In Here</h2>
            <form name="login_form" action="LoginController" method="post">
                <div style="color : red ; text-align: center; margin-bottom : 5px">
                    <span>
                    <%
                        if (session.getAttribute("em") != null) {
                            out.println(session.getAttribute("em"));
                            session.setAttribute("em", null);
                        }
                    %>
                    </span>
                </div>
                
                <div class="field-group">
                    <span class="fa fa-user" aria-hidden="true"></span>
                    <div class="wthree-field">
                        <input name="username" id="text1" type="text" value="" placeholder="Username" required>
                    </div>
                </div>
                <div class="field-group">
                    <span class="fa fa-lock" aria-hidden="true"></span>
                    <div class="wthree-field">
                        <input name="password" id="myInput" type="Password" placeholder="Password">
                    </div>
                </div>
                <div class="field-group">
                    <div class="check">
                        <label class="checkbox w3l">
                            <input type="checkbox" onclick="myFunction()">
                            <i> </i>show password</label>
                    </div>
                    <!-- script for show password -->
                    <script>
                        function myFunction() {
                            var x = document.getElementById("myInput");
                            if (x.type === "password") {
                                x.type = "text";
                            } else {
                                x.type = "password";
                            }
                        }
                    </script>
                    <!-- //script for show password -->
                </div>
                <div class="wthree-field">
                    <input id="saveForm" name="login" type="submit" value="sign in" />
                </div>
<!--                <ul class="list-login">
                    <li class="switch-agileits">
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider round"></span>
                            keep signed in
                        </label>
                    </li>
                    <li>
                        <a href="#" class="text-right">forgot password?</a>
                    </li>
                    <li class="clearfix"></li>
                </ul>-->
            </form>
        </div>
    </div>
    <div class="copyright text-center">
        <p>© 2018 Food App. All rights reserved | Design by
            <a href="#">Olufunmilola Oroniran</a>
        </p>
    </div>
</body>
<!-- //Body -->
</html>

