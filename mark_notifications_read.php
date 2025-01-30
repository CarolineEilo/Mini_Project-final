<?php
session_start();
require_once 'connection.php';

if (isset($_SESSION['email'])) {
    $nanny_email = $_SESSION['email'];
    
    $stmt = $dbh->prepare("UPDATE notifications SET is_read = TRUE WHERE nanny_email = :email AND is_read = FALSE");
    $stmt->bindParam(':email', $nanny_email);
    $stmt->execute();
    
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'error' => 'Not logged in']);
}