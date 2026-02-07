-- New drone options schema (MariaDB)
-- Base price in `drones` includes default RX/VTX/Camera, Battery default is "Без акумулятора"

CREATE TABLE IF NOT EXISTS rx_options (
  id INT AUTO_INCREMENT PRIMARY KEY,
  label VARCHAR(100) NOT NULL,
  price INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS vtx_options (
  id INT AUTO_INCREMENT PRIMARY KEY,
  label VARCHAR(100) NOT NULL,
  price INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS camera_options (
  id INT AUTO_INCREMENT PRIMARY KEY,
  label VARCHAR(100) NOT NULL,
  price INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS battery_options (
  id INT AUTO_INCREMENT PRIMARY KEY,
  label VARCHAR(120) NOT NULL,
  price INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS fiber_spool_options (
  id INT AUTO_INCREMENT PRIMARY KEY,
  label VARCHAR(80) NOT NULL,
  price INT NOT NULL DEFAULT 0,
  producer VARCHAR(120) NULL
);

-- Drones: option lists (JSON arrays) + default ids
ALTER TABLE drones
  ADD COLUMN rx_option_ids JSON NULL,
  ADD COLUMN rx_default_id INT NULL,
  ADD COLUMN vtx_option_ids JSON NULL,
  ADD COLUMN vtx_default_id INT NULL,
  ADD COLUMN camera_option_ids JSON NULL,
  ADD COLUMN camera_default_id INT NULL,
  ADD COLUMN battery_option_ids JSON NULL,
  ADD COLUMN battery_default_id INT NULL,
  ADD COLUMN fiber_spool_option_ids JSON NULL,
  ADD COLUMN fiber_spool_default_id INT NULL;

-- Example seed data
INSERT INTO rx_options (label, price) VALUES
  ('868MHz', 940),
  ('2.4GHz', 940),
  ('915MHz + 2.4GHz', 1300),
  ('433MHz', 1100),
  ('915MHz', 940);

INSERT INTO vtx_options (label, price) VALUES
  ('4.9G 2.5W', 4470),
  ('3.3G 3W', 4580),
  ('5.8G 2.5W', 4470),
  ('1.2G 2W', 3760);

INSERT INTO camera_options (label, price) VALUES
  ('Денна', 0),
  ('Нічна', 1200);

INSERT INTO battery_options (label, price) VALUES
  ('Без акумулятора', 0),
  ('6S4P 20Ah', 0);

INSERT INTO fiber_spool_options (label, price, producer) VALUES
  ('Без котушки', 0, NULL),
  ('10 км', 1500, 'Producer A'),
  ('15 км', 2000, 'Producer A'),
  ('20 км', 2600, 'Producer B'),
  ('25 км', 3200, 'Producer B');
