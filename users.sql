USE basededatos;
SHOW GRANTS FOR "root"@"localhost";
CREATE USER "administrador" IDENTIFIED BY "pass_admin";
GRANT ALL PRIVILEGES ON basededatos TO "administrador"@"localhost";