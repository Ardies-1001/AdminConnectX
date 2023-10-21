<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Formulaire</title>
	<style>
		
	</style>
</head>
<body>

	<main>



	<?php
			if (isset($errors) && count($errors) != 0)
			{
				
				foreach ($errors as $error){
					echo $error;
				}
				
			}
		?>


		<form method="post">
			<div class="">				
				<label for="ID MACHINE">ID MACHINE</label>
				<input type="text" name="id_machine" id="ID MACHINE" required>
			</div>
			
			<div class="">
				<label for="NOM MACHINE">NOM MACHINE</label>
				<input type="text" name="nom_machine" id="NOM MACHINE" required>
			</div>

			<div class="">
				<label for="ADRESSE IP">ADRESSE IP</label>
				<input type="text" name="adresse_ip" id="ADRESSE IP" required>
			</div>

			<div class="">
				<label for="ID MACHINE">ID MACHINE</label>
				<input type="text" name="localisation" id="ID MACHINE" required>
			</div>
			<div class="">
				<select name="statut">
					<option value="connecté">Connecté</option>	
					<option value="déconnecté">Déconnecté</option>			
				</select>
			</div>
			<div style="margin-top:20px">
				<input type="submit" name="add" value="enregistrer">
			</div>
			
			
		</form>
	</main>
	
</body>
</html>