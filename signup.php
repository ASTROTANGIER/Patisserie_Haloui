<?php
require 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $name = $_POST["name"];
  $email = $_POST["email"];
  $password = password_hash($_POST["password"], PASSWORD_DEFAULT);
  $phone = $_POST["phone"];
  $localisation = $_POST["localisation"];

  $stmt = $pdo->prepare("INSERT INTO users (name, email, password, phone, localisation)
                         VALUES (:name, :email, :password, :phone, :localisation)");

  try {
    $stmt->execute([
      'name' => $name,
      'email' => $email,
      'password' => $password,
      'phone' => $phone,
      'localisation' => $localisation
    ]);
    echo "Registration successful. <a href='signin.html'>Sign In</a>";
  } catch (PDOException $e) {
    if ($e->getCode() == 23000) {
      echo "Email already registered. <a href='signup.html'>Try again</a>";
    } else {
      echo "Error: " . $e->getMessage();
    }
  }
}
?>
