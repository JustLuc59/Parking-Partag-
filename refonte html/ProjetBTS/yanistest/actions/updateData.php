<?php
header('Content-Type: application/json');

// Inclure le fichier de configuration de la base de données
include_once '../config/Database.php';

// Vérifier la connexion
if ($bdd === null) {
    echo json_encode(array("success" => false, "message" => "Connexion à la bdd échouée"));
    exit;
}

// Récupérer les données envoyées par la requête POST
$data = json_decode(file_get_contents('php://input'), true);

// Vérifier que les données nécessaires sont présentes
if (!isset($data['username']) || empty($data['username'])) {
    echo json_encode(array("success" => false, "message" => "Username is required"));
    exit;
}

$username = $data['username'];
$mdp = isset($data['password']) && !empty($data['password']) ? $data['password'] : null;
$city = isset($data['city']) && !empty($data['city']) ? $data['city'] : null;
$mail = isset($data['mail']) && !empty($data['mail']) ? $data['mail'] : null;
$phone = isset($data['phone']) && !empty($data['phone']) ? $data['phone'] : null;
$numberplate = isset($data['numberplate']) && !empty($data['numberplate']) ? $data['numberplate'] : null;

// Construire la requête SQL pour mettre à jour les données
$fields = array();
$params = array('username' => $username);

if ($mdp !== null) {
    $fields[] = "userpassword = :password";
    $params['password'] = $mdp;
}
if ($city !== null) {
    $fields[] = "usercity = :city";
    $params['city'] = $city;
}
if ($mail !== null) {
    $fields[] = "usermail = :mail";
    $params['mail'] = $mail;
}
if ($phone !== null) {
    $fields[] = "userphone = :phone";
    $params['phone'] = $phone;
}
if ($numberplate !== null) {
    $fields[] = "usernumberplate = :numberplate";
    $params['numberplate'] = $numberplate;
}

if (empty($fields)) {
    echo json_encode(array("success" => false, "message" => "No valid data to update"));
    exit;
}

$sql = "UPDATE users SET " . implode(", ", $fields) . " WHERE username = :username";

// Préparer et exécuter la requête
$stmt = $bdd->prepare($sql);

if ($stmt->execute($params)) {
    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("success" => false, "message" => "Error updating record"));
}
?>
