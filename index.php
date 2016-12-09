<?
	if (!isset($_SESSION)) 
	session_start();
	include "inicializace_dbITU.php";
	include "strankyITU.php";
	include "dotazy.php";
?>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Poznej savce ČR</title>
<link href="styly.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<?
	if(!isset($_GET["menu"])){
		$_GET["menu"] = 0;	
	}
	
	if(isset($_POST["name"]) && isset($_POST["pass"]) && $_POST["name"] != ""){
		$query = "SELECT * FROM user WHERE nick='".$_POST["name"]."'";
		$result = mysql_query($query, $conn) or die("nelze se dotazat");
		$data = mysql_fetch_array($result);		
		if($data["password"] == $_POST["pass"]){
			$_SESSION["user"] = $data["nick"];
			$_GET["menu"] = 0;
		}
		else{
			?><script>alert("Spatne zadany login nebo heslo");</script><?
		}
	}

	if($_GET["menu"] == 7){
		if(isset($_SESSION["user"])) unset($_SESSION["user"]);
		$_GET["menu"] = 0;
	}
	main($_GET["menu"], $conn)

	
	
	?>
</body>
</html>