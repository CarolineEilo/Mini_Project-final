<?php
// connection.php - Database connection file
$servername = "localhost"; // Update with your server name
$username = "root"; // Update with your database username
$password = ""; // Update with your database password
$dbname = "augustcare"; // Update with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $parent_id = $_POST['parent_id'];
    $parent_name = $_POST['parent_name'];
    $nanny_id = $_POST['nanny_id'];
    $nanny_email = $_POST['nanny_email'];
    $message = $_POST['message'];

    $stmt = $conn->prepare("INSERT INTO notifications (parent_id, nanny_id, parent_name, nanny_email, message) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("iisss", $parent_id, $nanny_id, $parent_name, $nanny_email, $message);

    if ($stmt->execute()) {
        echo "Request sent successfully!";
    } else {
        echo "Error sending request: " . $conn->error;
    }

    $stmt->close();
    $conn->close();
}
?>

<!-- display_nanny_data.php - Main script to display selected data -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>parent Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .button-container {
            text-align: center;
            margin: 20px 0;
        }

        .button-container button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #EEA9BA;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .button-container1 button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .button-container1 button:hover {
            background-color: #D1D0D0;
        }

        .button-container button:hover {
            background-color: #D1D0D0;
        }


        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th,
        td {

            border: 1px solid #dddddd;
            text-align: left;
            padding: 12px;
        }

        th {
            background: rgb(225, 171, 171);
            /* Green */
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
            /* Light grey for even rows */
        }

        tr:hover {
            background-color: #ddd;
            /* Light grey on hover */
        }

        td {
            color: #555;
            /* Darker text for better readability */
        }

        @media (max-width: 600px) {
            table {
                font-size: 14px;
                /* Smaller font on small screens */
            }
        }
    </style>
</head>

<body>

    <h2>Available Nannies</h2>
    <!-- Button to navigate to another page -->
    <div class="button-container">
        <button onclick="location.href='search.php';">Search For Nanny</button>
    </div>
    <div class="button-container">
        <button onclick="location.href='services.php';">Our services</button>
    </div>


    <table>
        <tr>
            <th>Fullname</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Domestic Work</th>
            <th>Price</th>
            <th>Date Added (GegDate)</th>
        </tr>

        <?php
        // Include the database connection file
        require_once 'connection.php';

        // Query to fetch selected columns from nannytbl
        $query = "SELECT Fullname, Email, PhoneNumber, Age, Gender, DomesticWork, Price, GegDate FROM nannytbl";
        $result = $conn->query($query);

        // Check if there are results and display them in the table
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<tr>';
                echo '<td>' . htmlspecialchars($row['Fullname']) . '</td>';
                echo '<td>' . htmlspecialchars($row['Email']) . '</td>';
                echo '<td>' . htmlspecialchars($row['PhoneNumber']) . '</td>';
                echo '<td>' . htmlspecialchars($row['Age']) . '</td>';
                echo '<td>' . htmlspecialchars($row['Gender']) . '</td>';
                echo '<td>' . htmlspecialchars($row['DomesticWork']) . '</td>';
                echo '<td>' . htmlspecialchars($row['Price']) . '</td>';
                echo '<td>' . htmlspecialchars($row['GegDate']) . '</td>';
                echo '</tr>';
            }
        } else {
            echo '<tr><td colspan="8">No records found.</td></tr>';
        }

        // Close the database connection
        $conn->close();
        ?>

    </table>
    <?php
    // connection.php - Database connection file
    $servername = "localhost"; // Update with your server name
    $username = "root"; // Update with your database username
    $password = ""; // Update with your database password
    $dbname = "augustcare"; // Update with your database name

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    ?>
    <h2>Available Cleaners</h2>
    <!-- Button to navigate to another page -->
    <table>
        <tr>
            <th>Fullname</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Domestic Work</th>
            <th>Price</th>
        </tr>

        <?php
        // Include the database connection file
        require_once 'connection.php';

        // Query to fetch selected columns from nannytbl
        $query = "SELECT Fullname, Email, PhoneNumber, Age, Gender, DomesticWork, Price FROM cleaner";
        $result = $conn->query($query);

        // Check if there are results and display them in the table
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<tr>';
                echo '<td>' . htmlspecialchars($row['Fullname']) . '</td>';
                echo '<td>' . htmlspecialchars($row['Email']) . '</td>';
                echo '<td>' . htmlspecialchars($row['PhoneNumber']) . '</td>';
                echo '<td>' . htmlspecialchars($row['Age']) . '</td>';
                echo '<td>' . htmlspecialchars($row['Gender']) . '</td>';
                echo '<td>' . htmlspecialchars($row['DomesticWork']) . '</td>';
                echo '<td>' . htmlspecialchars($row['Price']) . '</td>';
                echo '</tr>';
            }
        } else {
            echo '<tr><td colspan="8">No records found.</td></tr>';
        }

        // Close the database connection
        $conn->close();
        ?>

    </table>
    <br>
    <div class="button-container1">
        <button onclick="location.href='logout.php';">logout</button>
    </div>
</body>

</html>