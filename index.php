<?
	if (!isset($_SESSION)) 
	session_start();
	include "inicializace_dbITU.php";
	include "strankyITU.php";
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>Poznej savce ČR</title>
</head>
<body>
	<?
	if(!isset($_GET["menu"])){
		$_GET["menu"] = 0;	
	}
	main($_GET["menu"], $conn)

	
	
	?>
</BODY>
</HTML>
