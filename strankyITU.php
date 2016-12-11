<?php


function test($max){
	return rand(1, $max);
}

function testik($ID, $conn){
		$query = "SELECT * FROM animal WHERE ID=$ID";
		$result = mysql_query($query, $conn);
		$data = mysql_fetch_assoc($result);
		$out = $_SESSION["index"] +1;
		echo "<h2> Otázka: " . $out . "/20 </h2><br />";
		?><img src="<?echo $data['picture'];?>" style="width:300px;height:228px"> <br /><?
		//echo "<b>".$data['name']."</b>";
		//$names = array($answer => 0, "odpoved1" => 0, "odpoved2" => 0, "odpoved3" => 0);
		//$answers = array();
		
    		//$query = "SELECT *, 0 AS answ FROM animal WHERE ID<> $ID LIMIT 3 UNION SELECT *, 1 AS answ FROM animal WHERE ID=$ID ORDER BY RAND() ";
    	$query = "(SELECT * FROM animal WHERE ID <> $ID ORDER BY RAND() LIMIT 3) UNION (SELECT * FROM animal WHERE ID = $ID)  ORDER BY RAND()";
		$res = mysql_query($query, $conn);
		?><table><?
			$i = 0;
    		while($data=mysql_fetch_array($res)){
    			?>
    			<form method="POST">
	    			<tr><td><?
		                	echo $data["name"];
		                ?>
					</td>
	    			<td><input type="hidden" name="hidden_answer" value="<?php echo $data["ID"];?>">
					<td><input type="hidden" name="hidden_success" value="<?php echo $ID;?>">
					<td><input type="submit" name="answ" value="Odpovědět"></td></tr>
					<?if($i == 3){?><td><input type="submit" name="konec" value="Ukončit test"></td><?}?>
    			</form>
          		<?
          		$i++;
    		}
		?></table><?

}

function main($menu, $conn){
$description = "";
if(isset($_SESSION["user"])){
		//echo "lognuty uzivatel: " . $_SESSION["user"];	
}?>
<table id="wrapper" style="">
  <tr>
    <td id="ff">
  		<ul>
  			<li><a href="?menu=0"><img src="pics/home.svg" alt="Domu"></a></li>
  			<li><a href="?menu=1"><img src="pics/book.svg" alt="Vyuka"></a></li>
  				
  			<?if(isset($_SESSION["user"])){?>
  			<li><a href="?menu=5"><img src="pics/exam.svg" alt="Test"></a></li>
  			<li><a href="?menu=6">Výsledky</a></li>
  			<?}else{
  			//<li><a href="?menu=3"><img src="pics/login.svg" alt="Login"></a></li>
  			//<li><a href="?menu=4">Registrovat</a></li>
  			}?>		
  		</ul>
     </td>
    <td id="fs">
<?
switch($menu){
	case 0:
		unset($_SESSION['filter']);
		unset($_SESSION['filt']);
		unset($_SESSION['formSubmit']);
		unset($_SESSION['type']);
		?>
			<p>
				<span>Ví­tejte ve výuce zvířat</span>
			</p>		
	<?break;

	case 1:
	unset($_SESSION['filter']);
	unset($_SESSION['filt']);
	$query = "SELECT * FROM animal ";
	
	$res = "ah";
	$all = 0;
	$selma = 0;
	$sudo = 0;
	$hlodavci = 0;
	$hmyz = 0;
	$primat = 0;
	$prikaz = "";
	if(isset($_POST['formSubmit']) || isset($_SESSION['formSubmit'])){
		if(isset($_POST['type']) || isset($_SESSION['type'])){
			if(isset($_POST['formSubmit'])) {
				if(isset($_POST['type'])){
					$array = $_POST['type']; 
				}
				else{
					$array = array();
					$res = "";				
				}

			}			
			else { 
				$array = $_SESSION['type']; 
			}
			if(in_array('all', $array)){
				global $res, $all, $prikaz;
				$res = mysql_query($query, $conn);
				$all = 1;
			}
			else{
				global $res, $all, $selma, $sudo, $hlodavci, $hmyz, $primat;
				if(in_array('selma', $array)){
					$sql_extra[] = " type = 'selma'";
					$selma = 1;
				}
				if(in_array('sudo', $array)){
					$sql_extra[] = " type = 'sudo'";
					$sudo = 1;
				}
				if(in_array('hlodavci', $array)){
					$sql_extra[] = " type = 'hlodavci'";
					$hlodavci = 1;
				}
				if(in_array('hmyz', $array)){
					$sql_extra[] = " type = 'hmyz'";
					$hmyz = 1;
				}
				if(in_array('primat', $array)){
					$sql_extra[] = " type = 'primat'";
					$primat = 1;
				}
				$all = 0;
				if(isset($sql_extra)){
					$search_term = implode( " OR ", $sql_extra);
					//echo $search_term;
					$prikaz = " WHERE {$search_term}";
					$query .= $prikaz;
					//echo $query;
					$res = mysql_query($query, $conn);
				}
				
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
			//echo $sql;
			$result = mysql_query($sql, $conn);
			$r = mysql_fetch_row($result);
			$numrows = $r[0];
			$rowsperpage = 1;
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
			$sql = "SELECT * FROM animal ";
			if($prikaz != ""){
				$sql .= $prikaz;
			}
			$sql .= " LIMIT $offset, $rowsperpage";
			$result = mysql_query($sql, $conn);
			$data = mysql_fetch_assoc($result);
			?><h2><?echo $data['name'];?></h2>

			<?$description = $data['descriptionCZ'];?>
			<?if($currentpage > 1){
				$prevpage = $currentpage - 1;
				$sql = "SELECT * FROM animal WHERE ID='".($data['ID']-1)."'";
				$result = mysql_query($sql, $conn);
				$levo = mysql_fetch_assoc($result);
				echo "<a href='{$_SERVER['PHP_SELF']}?menu=1&currentpage=$prevpage'>"
				?><img src="<?echo $levo['picture'];?>" style="width:150px;height:114px"></a><?
			}?>
			<img src="<?echo $data['picture'];?>" style="width:300px;height:228px"><?


			if($currentpage != $totalpages){
				$nextpage = $currentpage + 1;
				$sql = "SELECT * FROM animal WHERE ID='".($data['ID']+1)."'";
				$result = mysql_query($sql, $conn);
				$pravo = mysql_fetch_assoc($result);
				echo "<a href='{$_SERVER['PHP_SELF']}?menu=1&currentpage=$nextpage'>"
				?><img src="<?echo $pravo['picture'];?>" style="width:150px;height:114px"></a><?
			}
			?><br /><?
			
			$range = 3;

			if($currentpage > 1){
				echo " <a href='{$_SERVER['PHP_SELF']}?menu=1&currentpage=1'><<</a> ";
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
				echo " <a href='{$_SERVER['PHP_SELF']}?menu=1&currentpage=$totalpages'>>></a> ";
			}
			$_SESSION["formSubmit"] = "Filter";
			if(isset($array)) $_SESSION["type"] = $array;
			else{ $_SESSION["type"][] = 'all';}
		}
	break;

	case 2:
		unset($_SESSION['filter']);
		unset($_SESSION['filt']);
		unset($_SESSION['formSubmit']);	
		unset($_SESSION['type']);	
		?>
			<p>
				Božetěchova 2 <br>
				Brno, Královo Pole <br>
				email: <a href="mailto:xnodza00@stud.fit.vutbr.cz">xnodza00@stud.fit.vutbr.cz</a><br>
				tel: 123 456 789
			</p>		
	<?break;
	
	case 3:
		unset($_SESSION['filter']);
		unset($_SESSION['filt']);
		unset($_SESSION['formSubmit']);	
		unset($_SESSION['type']);	
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
		unset($_SESSION['formSubmit']);	
		unset($_SESSION['type']);	
		?>
		<table>
		<form method="POST">
			<tr><td><label>Login:</label></td><td><input type="text" name="rlogin" value="<?php if(isset($_POST["rlogin"])) echo $_POST["rlogin"];?>"/></td></tr>
			<tr><td><label>Heslo:</label></td><td><input type="password" name="rpass" value="<?php if(isset($_POST["rpass"])) echo $_POST["rpass"];?>"/></td></tr>
			<tr><td></td><td><input type="submit" name="reg" value="registrovat"/></td></tr>
		</form>
		</table>
	<?break;
		
	case 5:
		unset($_SESSION['filter']);
		unset($_SESSION['filt']);
		unset($_SESSION['formSubmit']);
		unset($_SESSION['type']);
		$_SESSION["IDs"] = array();
		$_SESSION["index"] = 0;
		$_SESSION["body"] = 0;
		$i = 0;
    		while($i < 20){
			$x = test(62);
			if(!in_array($x, $_SESSION["IDs"])){
				$_SESSION["IDs"][$i] = $x;
				$i++;			
			}
			
			?><script>window.location.href="?menu=10";</script><?
		}
		break;

	case 6:
	/*FILTROVÁNÍ*/
	unset($_SESSION['formSubmit']);
	unset($_SESSION['type']);
	$query = "SELECT * FROM test ";
	
	$res = "ah";
	$all = 0;
	$me = 0;
	$up = 0;
	$down = 0;
	$prikaz = "";
	if(isset($_POST['filter']) || isset($_SESSION['filter'])){
		if(isset($_POST['filt']) || isset($_SESSION['filt'])){
			if(isset($_POST['filter'])) {
				if(isset($_POST['filt'])){
					$array = $_POST['filt']; 
				}
				else{
					$array = array();
					$res = "";				
				}

			}			
			else { 
				$array = $_SESSION['filt']; 
			}
			if(in_array('all', $array)){
				global $res, $all, $prikaz;
				$res = mysql_query($query, $conn);
				$all = 1;
			}
			else{
				global $res, $all, $me, $up, $down;
				if(in_array('me', $array)){
					$prikaz = " WHERE user_nick='".$_SESSION["user"]."'";
					$me = 1;
				}
				if(in_array('up', $array)){
					$prikaz .= " ORDER BY body";
					$up = 1;
				}
				if(in_array('down', $array)){
					$prikaz .= " ORDER BY body DESC";
					$down = 1;
				}
				$all = 0;
				if($up && $down){
					$up = 0;
					$down = 0;
					$res = "asd";
					$prikaz = "";
					if($me){
						$prikaz = " WHERE user_nick='".$_SESSION["user"]."'";
					}
					else{
						$all = 1;
					}
				}
				else if($all == 0 && $me == 0 && $up == 0 && $down == 0){
					$res = "";
				}
				else{
					$query .= $prikaz;
					//echo $query;
					$res = mysql_query($query, $conn);
				}
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

	<form name="filter" method="POST" >
	<input type="checkbox" name="filt[]" value="all" <?php if($all == 1) echo "checked"?>> Vše
  	<input type="checkbox" name="filt[]" value="me" <?php if($me == 1) echo "checked"?>> Moje výsledky
	<input type="checkbox" name="filt[]" value="up" <?php if($up == 1) echo "checked"?>> Seřadit vzestupně
	<input type="checkbox" name="filt[]" value="down" <?php if($down == 1) echo "checked"?>> Seřadit sestupně
	<input type="submit" name="filter" value="Filter"/>
	</form>
	
	<?
	/*FILTROVÁNÍ*/
		/*STRÁNKOVÁNÍ*/
		if($res != ""){
			$sql = "SELECT COUNT(*) FROM test ";
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
			$sql = "SELECT * FROM test ";
			if($prikaz != ""){
				$sql .= $prikaz;
			}
			$sql .= " LIMIT $offset, $rowsperpage";
			$result = mysql_query($sql, $conn);
			?><h2>Statistiky</h2>


			<?
			echo "<table>";
			echo "<tr><td>Uživatel</td><td>Počet bodů</td><td>Datum</td></tr>";
			while($data = mysql_fetch_assoc($result)){
				$true = 0;
				if(isset($_SESSION["user"])){
					if($data["user_nick"] == $_SESSION["user"]){
						$true = 1;
					}
				}
				?>
					<tr>
					<td><?if($true) echo "<b>"; echo $data["user_nick"];if($true) echo "</b>";?></td>
					<td><?if($true) echo "<b>"; echo $data["body"]."/20";if($true) echo "</b>";?></td>
					<td><?if($true) echo "<b>"; echo $data["time"];if($true) echo "</b>";?></td>
					<tr>
				<?
			}
			echo "</table>";

			$range = 3;

			if($currentpage > 1){
				$nextpage = $currentpage - 1;
				echo " <a href='{$_SERVER['PHP_SELF']}?menu=6&currentpage=1'><<</a> ";
				echo " <a href='{$_SERVER['PHP_SELF']}?menu=6&currentpage=$nextpage'><</a> ";
			}

			for($x = ($currentpage - $range); $x < (($currentpage + $range) + 1); $x++){
				if(($x > 0) && ($x <= $totalpages)){
					if($x == $currentpage){
						echo " [<b>$x</b>] ";
					}
					else{
						echo " <a href='{$_SERVER['PHP_SELF']}?menu=6&currentpage=$x'>$x</a> ";
					}
				}
			}

			if($currentpage != $totalpages){
				$nextpage = $currentpage + 1;
				echo " <a href='{$_SERVER['PHP_SELF']}?menu=6&currentpage=$nextpage'>></a> ";
				echo " <a href='{$_SERVER['PHP_SELF']}?menu=6&currentpage=$totalpages'>>></a> ";
			}
			$_SESSION["filter"] = "Filter";
			if(isset($array)) $_SESSION["filt"] = $array;
			else{ $_SESSION["filt"][] = 'all';}
		}
		/*STRÁNKOVÁNÍ*/
		break;

	case 10:
		unset($_SESSION['filter']);
		unset($_SESSION['filt']);
		unset($_SESSION['formSubmit']);
		unset($_SESSION['type']);
		testik($_SESSION["IDs"][$_SESSION["index"]], $conn);
		break;	

	default:
		unset($_SESSION['filter']);
		unset($_SESSION['filt']);
		unset($_SESSION['formSubmit']);
		unset($_SESSION['type']);
		$_GET["menu"] = 0;
	break;
	}
  ?>
    </td>
  </tr>
  <tr>
     <td id="sf">
  		<ul>
  			<li><a href="?menu=2">Kontakt</a></li>
  			<?if(isset($_SESSION["user"])){?>
  			<li><a href="?menu=7"><img src="pics/logout.svg" alt="Logout"></a></li>
  			<?}else{?>
  			<li><a href="?menu=3"><img src="pics/login.svg" alt="Login"></a></li>
  			<li><a href="?menu=4">Registrovat</a></li>
  			<?}?>		
  		</ul>
     </td>
    <td id="ss">
      <?echo $description;?>
    </td>
  </tr>
</table>

<?
}
?>
