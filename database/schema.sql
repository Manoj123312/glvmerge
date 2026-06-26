CREATE DATABASE IF NOT EXISTS client_management;
USE client_management;

CREATE TABLE IF NOT EXISTS clients (
  client_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  address VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS meetings (
  meeting_id INT AUTO_INCREMENT PRIMARY KEY,
  client_id INT NOT NULL,
  topic VARCHAR(150) NOT NULL,
  number_of_people INT NOT NULL CHECK (number_of_people > 0),
  start_time DATETIME NOT NULL,
  status ENUM('scheduled', 'completed', 'cancelled') DEFAULT 'scheduled',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_meeting_client
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
    ON DELETE CASCADE
);
