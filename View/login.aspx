<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Esondage2018.View.login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
	<title>Authentification</title>
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

                                <input type="button" onclick="window.location.href='http://localhost:54719/View/Index.aspx'" value="Créer un sondage"  style="float: right; font-style: normal; font-weight: lighter; color: #9933FF; text-decoration: underline; background-color: #FFFFFF;" /><br /><br />
 

				<form class="login100-form validate-form" method="POST" runat="server">
					<span class="login100-form-title p-b-49">
						
                    <br />
						Authentification
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Ce champ est obligatoire">
						<span class="label-input100">Email</span>
						<input class="input100" type="text" id="mail" name="mail" placeholder="Entrer votre email">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Ce champ est obligatoire">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" id="pass" name="pass" placeholder="Entrer votre mot de passe">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					
					<br/>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" runat="server"  id="add_pass" onserverclick="Add_Pass_Click" class="login100-form-btn">
								S'authentifier
							</button>
						</div>
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<span>
							
						</span>
					    <asp:TextBox ID="TextBox1" runat="server" ForeColor="Red" Height="21px" Width="151px">Utilisateur inconnu(e)</asp:TextBox>
					</div>

				
					

						<center><a href="http://localhost:54719/View/Sinscrire.aspx#" class="txt2">
							S'inscrire
						</a></center>
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
	<script src="js/main.js"></script>

</body>
</html>