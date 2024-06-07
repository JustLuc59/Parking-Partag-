<?php
header('Content-type: application/json');
include_once '../config/Database.php';
$json = json_decode(file_get_contents('php://input'), true);

$result = array(); // Initialise le tableau de résultat

// Vérifie si les champs obligatoires sont présents
if (isset($json['username']) && isset($json['password'])) {
    $username = htmlspecialchars($json["username"]);
    $password = htmlspecialchars($json["password"]);
    $city = isset($json["city"]) ? htmlspecialchars($json["city"]) : ""; // Validation/définition valeur par défaut sile  champ est vide
    $mail = isset($json["mail"]) ? htmlspecialchars($json["mail"]) : ""; 
    $phone = isset($json["phone"]) ? htmlspecialchars($json["phone"]) : ""; 
    $numberplate = isset($json["numberplate"]) ? htmlspecialchars($json["numberplate"]) : ""; 
    
    // Vérification si username et password ne sont pas vides
    if (empty($username) || empty($password)) {
        $result["success"] = false;
        $result["error"] = "Le mot de passe et/ou le nom d'utilisateur est vide";
    } else {
        // vérification si username existe déja 
        try {  
            $checkIfUsernameExists = $bdd->prepare('SELECT id FROM users WHERE username = ?'); 
            $checkIfUsernameExists->execute(array($username));

            if ($checkIfUsernameExists->fetch()) {
                $result["success"] = false;
                $result["error"] = "Cet identifiant existe déjà";
            } else {
                $createAccount = $bdd->prepare("INSERT INTO `users` (`id`, `username`, `userPassword`, `usercity`, `usermail`, `userphone`, `usernumberplate`) VALUES (NULL, ?, ?, ?, ?, ?, ?)"); 
                $createAccount->execute(array($username, $password, $city, $mail, $phone, $numberplate));

                $result["success"] = true;
            }
        } catch (PDOException $e) {
            $result["success"] = false;
            $result["error"] = "Erreur lors de la création du compte : " . $e->getMessage();
        }  
    }
} else {
    $result["success"] = false;
    $result["error"] = "Paramètres manquants : 'username' et/ou 'password'";
}

echo json_encode($result); // Renvoie la réponse JSON
?>