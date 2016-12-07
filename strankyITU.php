<?php

function main($menu, $conn){
?>
<?if(isset($_SESSION["user"])){
		echo "lognuty uzivatel: " . $_SESSION["user"];	
}?>
		<ul>
			<li><a href="?menu=0">Domů</a></li>
			<li><a href="?menu=1">Vyuka</a></li>
			<li><a href="?menu=2">Kontakt</a></li>
				
			<?if(isset($_SESSION["user"])){?>
			<li><a href="?menu=5">Test</a></li>
			<li><a href="?menu=6">Výsledky</a></li>
			<li><a href="?menu=7">Odhlásit</a></li>
			<?}else{?>
			<li><a href="?menu=3">Login</a></li>
			<li><a href="?menu=4">Registrovat</a></li>
			<?}?>		
		</ul>
<?
switch($menu){
	case 0:?>
			<p>
				<span>Ví­tejte ve výuce zvířat</span>
			</p>		
	<?break;

	case 1:

	$query = "SELECT * FROM animal ";
	
	$res = "ah";
	$all = 0;
	$selma = 0;
	$sudo = 0;
	$hlodavci = 0;
	$hmyz = 0;
	$primat = 0;
	$prikaz = "";
	if(isset($_POST['formSubmit'])){
		if(isset($_POST['type'])){
			if(in_array('all', $_POST['type'])){
				global $res, $all, $prikaz;
				$res = mysql_query($query, $conn);
				$all = 1;
			}
			else{
				global $res, $all, $selma, $sudo, $hlodavci, $hmyz, $primat;
				if(in_array('selma', $_POST['type'])){
					$sql_extra[] = " type = 'selma'";
					$selma = 1;
				}
				if(in_array('sudo', $_POST['type'])){
					$sql_extra[] = " type = 'sudo'";
					$sudo = 1;
				}
				if(in_array('hlodavci', $_POST['type'])){
					$sql_extra[] = " type = 'hlodavci'";
					$hlodavci = 1;
				}
				if(in_array('hmyz', $_POST['type'])){
					$sql_extra[] = " type = 'hmyz'";
					$hmyz = 1;
				}
				if(in_array('primat', $_POST['type'])){
					$sql_extra[] = " type = 'primat'";
					$primat = 1;
				}
				$all = 0;

				$search_term = implode( " OR ", $sql_extra);
				//echo $search_term;
				$prikaz = " WHERE {$search_term}";
				$query .= $prikaz;
				$res = mysql_query($query, $conn);
			}
		}
		else{
			global $res;
			$res = "";
		}
	
	}
	else{
		global $res, $all;
		$all = 1;
		$res = mysql_query($query, $conn);
	}
	?>


	


	<form name="search_form" method="POST" >
	<input type="checkbox" name="type[]" value="all" <?php if($all == 1) echo "checked"?>> Vše
  	<input type="checkbox" name="type[]" value="selma" <?php if($selma == 1) echo "checked"?>> Šelma
	<input type="checkbox" name="type[]" value="sudo" <?php if($sudo == 1) echo "checked"?>> Sudokopytníci
	<input type="checkbox" name="type[]" value="hlodavci" <?php if($hlodavci == 1) echo "checked"?>> Hlodavci
	<input type="checkbox" name="type[]" value="hmyz" <?php if($hmyz == 1) echo "checked"?>> Hmyzožravci
	<input type="checkbox" name="type[]" value="primat" <?php if($primat == 1) echo "checked"?>> Primáti<br>
	<input type="submit" name="formSubmit" value="Filter"/>
	</form>
	
	<?
		
		if($res != ""){
			$sql = "SELECT COUNT(*) FROM animal ";
			if($prikaz != ""){
				$sql .= $prikaz;
			}
			$result = mysql_query($sql, $conn);
			$r = mysql_fetch_row($result);
			$numrows = $r[0];
			$rowsperpage = 10;
			$totalpages = ceil($numrows / $rowsperpage);
			if(isset($_GET['currentpage']) && is_numeric($_GET['currentpage'])){
				$currentpage = (int) $_GET['currentpage'];
			}
			else{
				$currentpage = 1;
			}

			if($currentpage > $totalpages){
				$currentpage = $totalpages;
			}
			
			if($currentpage < 1){
				$currentpage = 1;
			}

			$offset = ($currentpage - 1) * $rowsperpage;
			$sql = "SELECT name, picture FROM animal ";
			if($prikaz != ""){
				$sql .= $prikaz;
			}
			$sql .= " LIMIT $offset, $rowsperpage";
			$result = mysql_query($sql, $conn);
			while($data = mysql_fetch_assoc($result)){
				?><h2><?echo $data['name'];?></h2>
				<img src="<?echo $data['picture'];?>" style="width:300px;height:228px"> <br /><?
			}
			$range = 3;

			if($currentpage > 1){
				echo " <a href='{$_SERVER['PHP_SELF']}?menu=1&currentpage=1'><<</a> ";
				$prevpage = $currentpage - 1;
				echo " <a href='{$_SERVER['PHP_SELF']}?menu=1&currentpage=$prevpage'><</a> ";
			}
			for($x = ($currentpage - $range); $x < (($currentpage + $range) + 1); $x++){
				if(($x > 0) && ($x <= $totalpages)){
					if($x == $currentpage){
						echo " [<b>$x</b>] ";
					}
					else{
						echo " <a href='{$_SERVER['PHP_SELF']}?menu=1&currentpage=$x'>$x</a> ";
					}
				}
			}

			if($currentpage != $totalpages){
				$nextpage = $currentpage + 1;
				echo " <a href='{$_SERVER['PHP_SELF']}?menu=1&currentpage=$nextpage'>></a> ";
				echo " <a href='{$_SERVER['PHP_SELF']}?menu=1&currentpage=$totalpages'>>></a> ";
			}
		}
	break;

	case 2:?>
			<p>
				Božetěchova 2 <br>
				Brno, Královo Pole <br>
				email: <a href="mailto:xnodza00@stud.fit.vutbr.cz">xnodza00@stud.fit.vutbr.cz</a><br>
				tel: 123 456 789
			</p>		
	<?break;
	
	case 3:
		?>
			<h2>Přihlášení</h2>
			<table>
			<form method="POST">
				<tr><td><label>Login: </label></td><td><input type="text" name="name"/></td></tr>
				<tr><td><label>Heslo: </label></td><td><input type="password" name="pass"/></td></tr>
				<tr><td></td><td><input class="button" type="submit" value="Přihlásit"/></td></tr>
			</form>
			</table>	
	<?break;

	case 4:
		?>
		<table>
		<form method="POST">
			<tr><td><label>Login:</label></td><td><input type="text" name="rlogin" value="<?php if(isset($_POST["rlogin"])) echo $_POST["rlogin"];?>"/></td></tr>
			<tr><td><label>Heslo:</label></td><td><input type="password" name="rpass" value="<?php if(isset($_POST["rpass"])) echo $_POST["rpass"];?>"/></td></tr>
			<tr><td></td><td><input type="submit" name="reg" value="registrovat"/></td></tr>
		</form>
		</table>
	<?break;
			
	}

}

?>
