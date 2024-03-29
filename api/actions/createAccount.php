<?php

header ('Content-type: application/json');

include_once '../config/Databse.php';
$json = json_decode(file_get_contents('php://input'), true);

if (isset($json['username']) and isset($json['password'])) {
    $username = htmlspecialchars($json["username"]);
    $password = htmlspecialchars($json["password"]);
    $success = "";

    if ($username == "" or $password= "") {
        $result["success"] = false;
        $result["error"] = "Le mot de passe et/ou le nom d'utilisateur est vide";
    } else {
        $checkIfUsernameExists = $bdd->prepare('SELECT id FROM users WHERE username = ?'); 
        $checkIfUsernameExists->execute(array($username));
    
        if ($checkIfUsernameExists->rowCount() > 0) {
            $result["success"] = false;
            $result["error"] = "Cet identifiant existe déja";
        } else {
        
            try {
                $createAccount = $bdd->prepare("INSERT INTO `users` (`id`, `username`, `userPassword`) VALUES (NULL, ?, ?);"); 
                $result["password"] = $password;
                $createAccount->execute(array($username, $password));
                $result["success"]=true;
            } catch (Exception $e) {
                $result["success"]=false;
                $result["error"]= "erreur lors de la création du compte...";   
            }  
        }
    }
}
