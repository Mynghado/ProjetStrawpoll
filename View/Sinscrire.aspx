<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sinscrire.aspx.cs" Inherits="Esondage2018.View.Sinscrire" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
	<title>Inscription</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                <input type="button"  onclick="window.location.href='http://localhost:54719/View/Index.aspx'" value="Create a poll"  style="float: right; font-style: normal; font-weight: lighter; color: #9933FF; text-decoration: underline; background-color: #FFFFFF;" /><br /><br />
				<form class="login100-form validate-form" method="POST" runat="server">
					<span class="login100-form-title p-b-49">
						Registration<br />
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Ce champ est obligatoire">
						<span class="label-input100">Name</span>
						<input class="input100" type="text" id="nom" required="required" name="nom" placeholder="Entrer votre nom">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Ce champ est obligatoire">
						<span class="label-input100">Email</span>
						<input class="input100" type="text" id="email"  required="required" name="email" placeholder="Entrer votre email">
						<span class="focus-input100" data-symbol="&#x2709;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Ce champ est obligatoire">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" id="motdepasse"  required="required" name="motdepasse" placeholder="Entrer votre mot de passe">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<!--<div class="wrap-input100 validate-input m-b-23" data-validate = "Ce champ est obligatoire">
						<center><span class="label-input100">Clic on this square if you're an admin</span></center>
						<input class="input100" type="checkbox" id="admin" name="admin" >
						<span class="focus-input100" ></span>
					</div>-->
					
					<center><asp:TextBox runat="server" id="textboxt1" Text="Cet émail existe déja" Font-Size="Smaller" ForeColor="Red" Width="160px"></asp:TextBox></center>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" runat="server"  id="add_passs" onserverclick="Add_Pass_Clicx" class="login100-form-btn">
								Register</button>
						</div>
					</div>

					

					

					
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/man.js"></script>

</body>
</html>