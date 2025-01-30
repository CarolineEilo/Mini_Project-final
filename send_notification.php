<?php
require_once 'connection.php';

function sendNotificationToNanny($parent_id, $nanny_id, $message) {
    global $dbh;
    
    // Get parent name
    $stmt = $dbh->prepare("SELECT Fullname FROM parentstbl WHERE ID = ?");
    $stmt->execute([$parent_id]);
    $parent = $stmt->fetch(PDO::FETCH_ASSOC);
    
    // Get nanny email
    $stmt = $dbh->prepare("SELECT Email FROM nannytbl WHERE ID = ?");
    $stmt->execute([$nanny_id]);
    $nanny = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($parent && $nanny) {
        $stmt = $dbh->prepare("INSERT INTO notifications (parent_id, nanny_id, parent_name, nanny_email, message, status) VALUES (?, ?, ?, ?, ?, 'pending')");
        return $stmt->execute([
            $parent_id,
            $nanny_id,
            $parent['Fullname'],
            $nanny['Email'],
            $message
        ]);
    }
    return false;
}
?>