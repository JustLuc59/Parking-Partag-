<?php
header('Content-Type: application/json');
include_once '../config/Database.php';

// Activer les erreurs pour le débogage
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Fonction pour loguer les erreur
function log_error($message) {
    $log_file = '/var/log/apache2/errors.log'; // Chemin vers le fichier de log
    if (is_writable($log_file)) {
        error_log($message, 3, $log_file);
    } else {
        error_log("Failed to log error: $message", 0); // Journaliser dans le journal d'erreurs PHP si le fichier de log n'est pas accessible
    }
}

try {
    $json = json_decode(file_get_contents('php://input'), true);
    $result = array();

    if (isset($json['username']) && isset($json['password'])) {
        $username = htmlspecialchars($json['username']);
        $password = htmlspecialchars($json['password']);

        $database = new Database();
        $bdd = $database->getConnection();

        if ($bdd === null) {
            throw new Exception("Erreur de connexion à la base de données");
        }

        // Préparer la requête pour vérifier les informations d'identification
        $stmt = $bdd->prepare("SELECT * FROM users WHERE username = :username AND userpassword = :password");
        if (!$stmt) {
            throw new Exception("Erreur de préparation de la requête SQL");
        }

        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':password', $password);
        
        // Exécuter la requête
        if (!$stmt->execute()) {
            throw new Exception("Erreur lors de l'exécution de la requête SQL");
        }

        // Vérifier si le nom d'utilisateur et le mot de passe existent
        if ($stmt->rowCount() > 0) {
            $result["success"] = true;
        } else {
            $result["success"] = false;
            $result["error"] = "Nom d'utilisateur ou mot de passe incorrect";
        }
    } else {
        $result["success"] = false;
        $result["error"] = "Paramètres manquants : 'username' et/ou 'password'";
    }
} catch (PDOException $e) {
    log_error("Database error: " . $e->getMessage());
    $result["success"] = false;
    $result["error"] = "Erreur de connexion à la base de données : " . $e->getMessage();
} catch (Exception $e) {
    log_error("General error: " . $e->getMessage());
    $result["success"] = false;
    $result["error"] = "Erreur : " . $e->getMessage();
}

echo json_encode($result);
?>
