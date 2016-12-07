<?php


	if(isset($_POST["reg"])){
		if(isset($_POST["rlogin"]) && $_POST["rlogin"] != "" && isset($_POST["rpass"]) && $_POST["rpass"] != ""){
			if(strlen($_POST["rlogin"]) > 20 || strlen($_POST["rpass"]) > 20){
				?><script>alert("Některé pole přesahuje povolenou délku 20 znaků");</script><?
				unset($_POST["rlogin"]);
				unset($_POST["rpass"]);
				$_GET["menu"] = 4;
			}
			else{
				$query =  "SELECT * FROM user where nick='".$_POST["rlogin"]."'";
				$result = mysql_query($query, $conn);
				$data = mysql_fetch_array($result);
				if($data["nick"] == $_POST["rlogin"]){
					?><script>alert("Tento login již někdo používá");</script><?
					unset($_POST["rlogin"]);
					$_GET["menu"] = 4;
				}
				else{
					$query = "INSERT INTO user (nick, password) VALUES ('"
						.mysql_real_escape_string($_POST["rlogin"])."','"
						.mysql_real_escape_string($_POST["rpass"])."')";
					$result = mysql_query($query, $conn);
					if(!$result){
						?><script>alert("Údaje se nepodařilo přidat do databáze");</script><?
						$_GET["menu"] = 4;
					}
					?><script>alert("Byl jste úspěšně registrovaný");</script><?
					$_GET["menu"] = 0;
				}
			}
		}
		else{
			?><script>alert("Nebyli vyplněny povinné údaje");</script><?
			$_GET["menu"]=4;
		}
	}

















?>
