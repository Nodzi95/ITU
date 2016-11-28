<?php

function main($menu, $conn){
?>	<div>
		<ul>
			<li><a href="?menu=0">DomÅ¯</a></li>
			<li><a href="?menu=1">Vyuka</a></li>
			<li><a href="?menu=2">Kontakt</a></li>		
		</ul>
	</div>

<?
switch($menu){
	case 0:?>
		<div>
			<p>
				<span>VÃ­tejte ve vyuce zvirat</span>
			</p>		
		</div>
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
	if(isset($_POST['formSubmit'])){
		if(isset($_POST['type'])){
			if(in_array('all', $_POST['type'])){
				global $res, $all;
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

				$query .= " WHERE {$search_term}";
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
			?><table border='0' style="width:100%"><?
			echo "<tbody>";
			$count = 1;
			echo "<tr>";
			while($data=mysql_fetch_array($res)){
				global $count;
					if($count == 3){
						?></tr><tr><?
						$count = 1;
					}
					else{
						$count += 1;
					}?>
					<td><?echo $data["name"]?></td>
					<td><img src=<?echo $data["picture"]?> width="128" height="128"></td>
					<?
			}
			echo "</tbody>";
			echo "</table>";
		}
	break;

	case 2:?>
		<div>
			<p>
				<span>Kontakt</span>
			</p>		
		</div>
	<?break;
	}

}

?>