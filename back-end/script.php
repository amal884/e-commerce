	<?php

			// Server name => localhost
			// Username => root
			// Password => empty
			// Database name => test
			// Passing these 4 parameters
			$connect = mysqli_connect("localhost", "phpmyadmin", "root", "ecom_g");
			if (mysqli_connect_errno()) {
				echo "Failed to connect to MySQL: " . mysqli_connect_error();
				exit();
			  }

			// json file name
			$filename = "PRODUCTS.json";

			// Read the JSON file in PHP
			$data = file_get_contents($filename);

			// Convert the JSON String into PHP Array
			$array = json_decode($data, true);
			// Extracting row by row
			foreach($array as $row) {
				//echo "yes";
				// Database query to insert data
				// into database Make Multiple
				// Insert Query
				$q="INSERT INTO PRODUIT VALUES
				('".$row["sku"]."', '".$row["name"]."',
				'".$row["type"]."', '".$row["description"]."','".$row["price"]."','".$row["upc"]."', 
				'".$row["manufacturer"]."','".$row["model"]."','".$row["shipping"]."',
				'".$row["url"]."','".$row["image"]."'); ";

				mysqli_query($connect,$q);

			
				foreach($row['category'] as $c){
					$sql = "SELECT ID_CATEGORIE FROM CATEGORIE WHERE ID_CATEGORIE ='".$c['id']."'";
					if ($result = mysqli_query($connect, $sql)) {
						if(!mysqli_fetch_row($result)){
							$inserSql = "INSERT INTO CATEGORIE VALUES('".$c['id']."','".$c['name']."')";
							mysqli_query($connect,$inserSql);
						}

					}
					$inserSql2 = "INSERT INTO PRODUIT_CATEGORIE VALUES('".$row['sku']."','".$c['id']."')";
					mysqli_query($connect,$inserSql2);
				}
				
			}
		