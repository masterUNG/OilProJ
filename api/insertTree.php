<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
		$idRec = $_GET['idRec'];
		$idTree = $_GET['idTree'];
		$nameTree = $_GET['nameTree'];
		$urlImage = $_GET['urlImage'];
		$lat = $_GET['lat'];
		$lng = $_GET['lng'];
		$dateTimeRec = $_GET['dateTimeRec'];
		
		
							
		$sql = "INSERT INTO `treeData`(`id`, `idRec`, `idTree`, `nameTree`, `urlImage`, `lat`, `lng`, `dateTimeRec`) VALUES (Null,'$idRec','$idTree','$nameTree','$urlImage','$lat','$lng','$dateTimeRec')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master Oil";
   
}
	mysqli_close($link);
?>