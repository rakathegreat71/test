<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta charset="utf-8" />
<meta name="Keywords" content="html5, css3, form, style, input, textarea" />
<meta name="Description" content="Mue Tube Registration From" />
<meta name="title" content=">Mue Tube Registration Form " />
<meta name="author" content="Hideg Rares" />
<meta name="robots" content="all" />
<title>Mue Tube Registration Form  </title>
<link rel="stylesheet" href="css/master.css" type="text/css" />
<script>
function pass()
{
	var p1=document.getElementById("password");
	var p2=document.getElementById("repassword");
	if(p1.value!=p2.value)
	
	alert("password are not matched");
	
}
</script>
</head>

<body id="index">

        <div id="container">
            <div id="header"><h1>Mue Tube Registration Form</h1></div>
            <div id="main">
                <form action="" method="post">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="form-input-name">First Name</td>
                        <td class="input"><input type="text" name="pre[firstname]" placeholder="Your first name here..." autocomplete="off" required="required" /></td>
                    </tr>
                    <tr>
                        <td class="form-input-name">Last Name</td>
                        <td class="input"><input type="text" name="pre[lastname]" placeholder="Your last name here..." autocomplete="off" required="required" /></td>
                    </tr>
                    <tr>
                        <td class="form-input-name">Street Address</td>
                        <td class="input"><input type="text" name="pre[streetaddress]" placeholder="Your street address here..." autocomplete="off" /></td>
                    </tr>
                    <tr>
                        <td class="form-input-name">City</td>
                        <td class="input"><input type="text" name="pre[city]" placeholder="Your city here..." autocomplete="off" /></td>
                    </tr>
                    <tr>
                        <td class="form-input-name">Country</td>
                        <td class="input"><input type="text" name="pre[country]" placeholder="Your country here..." autocomplete="off" /></td>
                    </tr>
                    <tr>
                        <td class="form-input-name">Postal Code</td>
                        <td class="input"><input type="number" name="pre[postalcode]" placeholder="Your postal code here..." autocomplete="off" /></td>
                    </tr>
                    <tr>
                        <td class="form-input-name">E-mail</td>
                        <td class="input"><input type="email" name="pre[email]" placeholder="Your E-mail here..." autocomplete="off" required="required" /></td>
                    </tr>
                    <tr>
                        <td class="form-input-name">Password</td>
                        <td class="input"><input id="password"type="password" name="pre[password]" placeholder="Your password here..." autocomplete="off" required="required" /></td>
                    </tr>
                    <tr>
                        <td class="form-input-name">Retype Password</td>
                        <td class="input"><input id="repassword"type="password" name="pre[repassword]" placeholder="Retype your password..." autocomplete="off" required="required" /></td>
                    </tr>
                    <tr>
                        <td class="form-input-name">Aditional Information</td>
                        <td class="input"><textarea name="pre[info]" rows="5" cols="29" placeholder="Aditional information"></textarea></td>
                    </tr>
                    <tr>
                        <td class="form-input-name"></td>
                        <td><input type="submit" onclick="pass()" value="submit" /></td>
                    </tr>
                </table>
                </form>
            </div>
<div class="footer clear">
Copyright &copy; 2011 <a class="color" target="_blank" href="http://www.ricu.im">Ricu.im</a>. All rights reserved. View <a href="http://www.ricu.im/demos/html5-css3-reg-form/index.html">live demo</a>.
</div>
        </div>
</body>
</html>