<?php
session_start();
if (!isset($_SESSION['user'])) {
  header("Location: signin.html");
  exit;
}
?>
<!DOCTYPE html>
<html>
<head><title>Dashboard</title></head>
<body>
  <h1>Welcome, <?= htmlspecialchars($_SESSION['user']) ?>!</h1>
  <p>You are now logged in.</p>
</body>
</html>
