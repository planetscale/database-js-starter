CREATE TABLE hotels(
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(50) NOT NULL,
  stars FLOAT(2) UNSIGNED
);

INSERT INTO hotels (id, name, address, stars) VALUES
  (1, 'Four Seasons Resort Jackson hole', '7680 Granite Loop Rd, Teton Village, WY 83025', 4.7),
  (2, 'The Galt House', '140 N Fourth St, Louisville, KY 40202', 4),
  (3, 'The Foundry Hotel Asheville', '51 S Market St, Asheville, NC 28801', 4.7),
  (4, 'Hotel del Coronado', '1500 Orange Ave, Coronado, CA 92118', 4.5),
  (5, 'Montage Kapalua Bay', '1 Bay Dr, Lahaina, HI 96761', 4.7);

CREATE TABLE rooms(
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  room_type VARCHAR(100) NOT NULL,
  price FLOAT(2) UNSIGNED,
  hotel_id INT UNSIGNED NOT NULL
);

INSERT INTO rooms (id, room_type, price, hotel_id) VALUES
  (1, '2 Bedroom Premier Ocean View Residence', 4430, 5),
  (2, '3 Bedroom Ocean View Residence', 4850, 5),
  (3, '3 Bedroom Partial Ocean Grand Residence', 5400, 5),
  (4, 'Foundry King Hearing Acc', 435, 3),
  (5, 'Foundry King', 435, 3),
  (6, 'Foundry Double Queen', 444, 3),
  (7, 'Victorian 1Q', 663, 4),
  (8, 'Victorian 1K', 712, 4),
  (9, 'Victorian 1K Deluxe', 736, 4),
  (10, 'Deluxe Room, West Tower', 156, 2),
  (11, 'Deluxe Room, 1 King', 156, 2),
  (12, 'Executive 1-Bedroom Suite, East Tower', 218, 2),
  (13, 'Valley-Side Accessible Room', 1335, 1),
  (14, 'Resort-View One Bedroom Suite', 2535, 1),
  (15, 'Specialty Suite', 4210, 1);

CREATE TABLE guests(
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  phone_num VARCHAR(20)
);

INSERT INTO guests (id, name, phone_num) VALUES 
  (1, 'Rylie Garcia', '994-994-2129'),
  (2, 'Aurora Parson', '719-466-8864'),
  (3, 'Marley Cruz', '906-412-2003'),
  (4, 'Brinley Webster', '547-866-0595'),
  (5, 'Elliana Woods', '694-322-8326'),
  (6, 'Carson Green', '542-884-3956'),
  (7, 'Kalani Hanson', '260-745-3172'),
  (8, 'Harvey Davidson', '201-273-9185'),
  (9, 'Austin Barnes', '440-217-2357'),
  (10, 'Luke Evans', '251-682-6663');

CREATE TABLE bookings(
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  check_in DATETIME NOT NULL,
  check_out DATETIME NOT NULL,
  room_id INT UNSIGNED NOT NULL
);

INSERT INTO bookings (id, check_in, check_out, room_id) VALUES
  (1, '2022-08-11 15:00:00', '2022-08-12 11:00:00', 2),
  (2, '2022-08-19 15:00:00', '2022-08-24 11:00:00', 4),
  (3, '2022-09-03 15:00:00', '2022-09-04 11:00:00', 8),
  (4, '2022-09-03 13:00:00', '2022-09-09 10:00:00', 9),
  (5, '2022-09-12 16:00:00', '2022-10-12 11:00:00', 3),
  (6, '2022-09-14 15:00:00', '2022-09-15 11:00:00', 7);

CREATE TABLE booking_guests(
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  booking_id INT UNSIGNED,
  guest_id INT UNSIGNED
);

INSERT INTO booking_guests (booking_id, guest_id) VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 7),
  (3, 8),
  (3, 9),
  (4, 10),
  (5, 4),
  (6, 5),
  (6, 6);