<?php
// Quick test to check if equipment table exists
header('Content-Type: application/json');

require_once __DIR__ . '/ConfigFile/dbconfig.php';

try {
    // Try to query the equipment table
    $stmt = $pdo->query("SHOW TABLES LIKE 'equipment'");
    $result = $stmt->fetch();

    if ($result) {
        // Table exists, get some info
        $countStmt = $pdo->query("SELECT COUNT(*) as count FROM equipment");
        $count = $countStmt->fetch();

        echo json_encode([
            'success' => true,
            'table_exists' => true,
            'item_count' => $count['count'],
            'message' => "Equipment table exists with {$count['count']} items"
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'table_exists' => false,
            'message' => 'Equipment table does not exist. Please run database_migration.sql'
        ]);
    }
} catch (PDOException $e) {
    echo json_encode([
        'success' => false,
        'error' => $e->getMessage()
    ]);
}
?>
