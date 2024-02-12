<?php
require_once '../vendor/autoload.php';

use App\Page;
use App\Session;

$page = new Page();
$session = new Session();

// Vérifier si l'utilisateur est connecté
if (!$session->isConnected()) {
    header('Location: index.php'); // Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
    exit();
}

// Récupérer les informations de l'utilisateur depuis la session
$user = $session->get('user');

echo $page->render('profile.html.twig', ['user' => $user]);
?>
