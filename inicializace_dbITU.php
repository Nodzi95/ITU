<?
$server = "localhost:/var/run/mysql/mysql.sock";
$user = "xmolek00";
$pass = "7opantom";
$name = "xmolek00";

$conn= mysql_connect($server, $user, $pass) or die("Nelze se pøipojit");

if(!mysql_select_db($name, $conn)){
	echo "chyba pøi pøipojení k databázi";
	exit();
}
mysql_set_charset('utf8');
?>
