#Create Table branch details
CREATE TABLE `branchdetails` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`branch_id`)
);

#insert data into branc details
INSERT INTO `branchdetails` VALUES (1,'Branch 1','Location 1'),(2,'Branch 2','Location 2'),(3,'Branch 3','Location 3'),(4,'Branch 4','Location 4'),
(5,'Branch 5','Location 5'),(6,'Branch 6','Location 6'),(7,'Branch 7','Location 7'),(8,'Branch 8','Location 8'),
(9,'Branch 9','Location 9'),(10,'Branch 10','Location 10'),(11,'Branch 11','Location 11'),(12,'Branch 12','Location 12'),
(13,'Branch 13','Location 13'),(14,'Branch 14','Location 14'),(15,'Branch 15','Location 15'),(16,'Branch 16','Location 16'),
(17,'Branch 17','Location 17'),(18,'Branch 18','Location 18'),(19,'Branch 19','Location 19'),(20,'Branch 20','Location 20'),
(21,'Branch 21','Location 21'),(22,'Branch 22','Location 22'),(23,'Branch 23','Location 23'),(24,'Branch 24','Location 24'),
(25,'Branch 25','Location 25'),(26,'Branch 26','Location 26'),(27,'Branch 27','Location 27'),(28,'Branch 28','Location 28'),
(29,'Branch 29','Location 29'),(30,'Branch 30','Location 30'),(31,'Branch 31','Location 31'),(32,'Branch 32','Location 32'),
(33,'Branch 33','Location 33'),(34,'Branch 34','Location 34'),(35,'Branch 35','Location 35'),(36,'Branch 36','Location 36'),
(37,'Branch 37','Location 37'),(38,'Branch 38','Location 38'),(39,'Branch 39','Location 39'),(40,'Branch 40','Location 40');

#create table customer details
CREATE TABLE `customerdetails` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact_details` varchar(255) DEFAULT NULL,
  `loyalty_program_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
);

#Insert data in table customer details
INSERT INTO `customerdetails` VALUES (1,'Customer 1','Email1@example.com',1),(2,'Customer 2','Email2@example.com',1),(3,'Customer 3','Email3@example.com',1),(4,'Customer 4','Email4@example.com',0),(5,'Customer 5','Email5@example.com',0),(6,'Customer 6','Email6@example.com',0),(7,'Customer 7','Email7@example.com',0),(8,'Customer 8','Email8@example.com',0),(9,'Customer 9','Email9@example.com',0),(10,'Customer 10','Email10@example.com',1),
(11,'Customer 11','Email11@example.com',0),(12,'Customer 12','Email12@example.com',0),(13,'Customer 13','Email13@example.com',1),(14,'Customer 14','Email14@example.com',0),(15,'Customer 15','Email15@example.com',0),(16,'Customer 16','Email16@example.com',0),(17,'Customer 17','Email17@example.com',1),(18,'Customer 18','Email18@example.com',0),(19,'Customer 19','Email19@example.com',0),(20,'Customer 20','Email20@example.com',0),
(21,'Customer 21','Email21@example.com',0),(22,'Customer 22','Email22@example.com',1),(23,'Customer 23','Email23@example.com',0),(24,'Customer 24','Email24@example.com',0),(25,'Customer 25','Email25@example.com',1),(26,'Customer 26','Email26@example.com',0),(27,'Customer 27','Email27@example.com',1),(28,'Customer 28','Email28@example.com',1),(29,'Customer 29','Email29@example.com',1),(30,'Customer 30','Email30@example.com',0),
(31,'Customer 31','Email31@example.com',0),(32,'Customer 32','Email32@example.com',0),(33,'Customer 33','Email33@example.com',1),(34,'Customer 34','Email34@example.com',1),(35,'Customer 35','Email35@example.com',1),(36,'Customer 36','Email36@example.com',1),(37,'Customer 37','Email37@example.com',1),(38,'Customer 38','Email38@example.com',1),(39,'Customer 39','Email39@example.com',0),(40,'Customer 40','Email40@example.com',0),
(41,'Customer 41','Email41@example.com',1),(42,'Customer 42','Email42@example.com',1),(43,'Customer 43','Email43@example.com',1),(44,'Customer 44','Email44@example.com',1),(45,'Customer 45','Email45@example.com',0),(46,'Customer 46','Email46@example.com',1),(47,'Customer 47','Email47@example.com',0),(48,'Customer 48','Email48@example.com',0),(49,'Customer 49','Email49@example.com',1),(50,'Customer 50','Email50@example.com',0),
(51,'Customer 51','Email51@example.com',1),(52,'Customer 52','Email52@example.com',1),(53,'Customer 53','Email53@example.com',1),(54,'Customer 54','Email54@example.com',0),(55,'Customer 55','Email55@example.com',1),(56,'Customer 56','Email56@example.com',1),(57,'Customer 57','Email57@example.com',0),(58,'Customer 58','Email58@example.com',1),(59,'Customer 59','Email59@example.com',1),(60,'Customer 60','Email60@example.com',1),
(61,'Customer 61','Email61@example.com',1),(62,'Customer 62','Email62@example.com',1),(63,'Customer 63','Email63@example.com',0),(64,'Customer 64','Email64@example.com',0),(65,'Customer 65','Email65@example.com',0),(66,'Customer 66','Email66@example.com',0),(67,'Customer 67','Email67@example.com',1),(68,'Customer 68','Email68@example.com',1),(69,'Customer 69','Email69@example.com',1),(70,'Customer 70','Email70@example.com',1),
(71,'Customer 71','Email71@example.com',0),(72,'Customer 72','Email72@example.com',0),(73,'Customer 73','Email73@example.com',0),(74,'Customer 74','Email74@example.com',0),(75,'Customer 75','Email75@example.com',1),(76,'Customer 76','Email76@example.com',1),(77,'Customer 77','Email77@example.com',0),(78,'Customer 78','Email78@example.com',1),(79,'Customer 79','Email79@example.com',0),(80,'Customer 80','Email80@example.com',1),
(81,'Customer 81','Email81@example.com',1),(82,'Customer 82','Email82@example.com',1),(83,'Customer 83','Email83@example.com',1),(84,'Customer 84','Email84@example.com',1),(85,'Customer 85','Email85@example.com',1),(86,'Customer 86','Email86@example.com',1),(87,'Customer 87','Email87@example.com',0),(88,'Customer 88','Email88@example.com',0),(89,'Customer 89','Email89@example.com',0),(90,'Customer 90','Email90@example.com',1),
(91,'Customer 91','Email91@example.com',0),(92,'Customer 92','Email92@example.com',1),(93,'Customer 93','Email93@example.com',0),(94,'Customer 94','Email94@example.com',1),(95,'Customer 95','Email95@example.com',1),(96,'Customer 96','Email96@example.com',0),(97,'Customer 97','Email97@example.com',1),(98,'Customer 98','Email98@example.com',0),(99,'Customer 99','Email99@example.com',0),(100,'Customer 100','Email100@example.com',1);

#create table product details
CREATE TABLE `productdetails` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_level` int NOT NULL,
  PRIMARY KEY (`product_id`)
);

#insert data into product details
INSERT INTO `productdetails` VALUES (1,'Product 1','Category 2',10.50,55),(2,'Product 2','Category 3',11.00,60),(3,'Product 3','Category 4',11.50,65),(4,'Product 4','Category 5',12.00,70),(5,'Product 5','Category 6',12.50,75),(6,'Product 6','Category 7',13.00,80),(7,'Product 7','Category 8',13.50,85),(8,'Product 8','Category 9',14.00,90),(9,'Product 9','Category 10',14.50,95),(10,'Product 10','Category 1',15.00,50),
(11,'Product 11','Category 2',15.50,55),(12,'Product 12','Category 3',16.00,60),(13,'Product 13','Category 4',16.50,65),(14,'Product 14','Category 5',17.00,70),(15,'Product 15','Category 6',17.50,75),(16,'Product 16','Category 7',18.00,80),(17,'Product 17','Category 8',18.50,85),(18,'Product 18','Category 9',19.00,90),(19,'Product 19','Category 10',19.50,95),(20,'Product 20','Category 1',20.00,50),
(21,'Product 21','Category 2',20.50,55),(22,'Product 22','Category 3',21.00,60),(23,'Product 23','Category 4',21.50,65),(24,'Product 24','Category 5',22.00,70),(25,'Product 25','Category 6',22.50,75),(26,'Product 26','Category 7',23.00,80),(27,'Product 27','Category 8',23.50,85),(28,'Product 28','Category 9',24.00,90),(29,'Product 29','Category 10',24.50,95),(30,'Product 30','Category 1',25.00,50),
(31,'Product 31','Category 2',25.50,55),(32,'Product 32','Category 3',26.00,60),(33,'Product 33','Category 4',26.50,65),(34,'Product 34','Category 5',27.00,70),(35,'Product 35','Category 6',27.50,75),(36,'Product 36','Category 7',28.00,80),(37,'Product 37','Category 8',28.50,85),(38,'Product 38','Category 9',29.00,90),(39,'Product 39','Category 10',29.50,95),(40,'Product 40','Category 1',30.00,50),
(41,'Product 41','Category 2',30.50,55),(42,'Product 42','Category 3',31.00,60),(43,'Product 43','Category 4',31.50,65),(44,'Product 44','Category 5',32.00,70),(45,'Product 45','Category 6',32.50,75),(46,'Product 46','Category 7',33.00,80),(47,'Product 47','Category 8',33.50,85),(48,'Product 48','Category 9',34.00,90),(49,'Product 49','Category 10',34.50,95),(50,'Product 50','Category 1',35.00,50),
(51,'Product 51','Category 2',35.50,55),(52,'Product 52','Category 3',36.00,60),(53,'Product 53','Category 4',36.50,65),(54,'Product 54','Category 5',37.00,70),(55,'Product 55','Category 6',37.50,75),(56,'Product 56','Category 7',38.00,80),(57,'Product 57','Category 8',38.50,85),(58,'Product 58','Category 9',39.00,90),(59,'Product 59','Category 10',39.50,95),(60,'Product 60','Category 1',40.00,50),
(61,'Product 61','Category 2',40.50,55),(62,'Product 62','Category 3',41.00,60),(63,'Product 63','Category 4',41.50,65),(64,'Product 64','Category 5',42.00,70),(65,'Product 65','Category 6',42.50,75),(66,'Product 66','Category 7',43.00,80),(67,'Product 67','Category 8',43.50,85),(68,'Product 68','Category 9',44.00,90),(69,'Product 69','Category 10',44.50,95),(70,'Product 70','Category 1',45.00,50);


#create table complaint details
CREATE TABLE `complaintdetails` (
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `complaint_date` date NOT NULL,
  `resolution_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `complaintdetails_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customerdetails` (`customer_id`),
  CONSTRAINT `complaintdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `productdetails` (`product_id`)
);

#Insert data into complaints table
INSERT INTO `complaintdetails` VALUES (1,13,25,'2022-03-02','Under Review'),(2,10,62,'2022-01-20','Closed'),(3,21,56,'2022-07-01','Closed'),(4,23,6,'2022-09-11','Pending'),(5,48,12,'2022-05-25','Pending'),(6,41,21,'2022-03-04','Under Review'),(7,34,37,'2022-11-15','Under Review'),(8,4,15,'2022-02-10','Resolved'),(9,31,61,'2022-07-07','Resolved'),(10,12,10,'2022-06-15','Resolved'),
(11,42,37,'2022-07-02','Closed'),(12,17,41,'2022-10-30','Under Review'),(13,25,52,'2022-05-28','Under Review'),(14,40,15,'2022-01-11','Resolved'),(15,20,68,'2022-09-17','Closed'),(16,48,33,'2022-05-17','Closed'),(17,10,41,'2022-01-29','Pending'),(18,48,45,'2022-10-07','Closed'),(19,50,51,'2022-12-22','Pending'),(20,9,62,'2022-09-23','Closed'),
(21,45,29,'2022-03-31','Under Review'),(22,5,47,'2022-07-31','Closed'),(23,13,39,'2022-01-24','Pending'),(24,10,37,'2022-06-17','Pending'),(25,43,65,'2022-03-15','Resolved'),(26,18,44,'2022-01-05','Pending'),(27,21,63,'2022-07-16','Pending'),(28,42,9,'2022-08-28','Pending'),(29,48,47,'2022-09-19','Resolved'),(30,8,58,'2022-09-16','Closed'),
(31,22,24,'2022-09-23','Closed'),(32,41,52,'2022-01-17','Resolved'),(33,26,24,'2022-02-09','Pending'),(34,11,47,'2022-01-08','Under Review'),(35,40,12,'2022-10-05','Closed'),(36,23,70,'2022-03-02','Closed'),(37,42,2,'2022-07-17','Closed'),(38,10,27,'2022-07-19','Resolved'),(39,31,60,'2022-01-02','Under Review'),(40,26,12,'2022-12-03','Closed'),
(41,6,67,'2022-07-21','Resolved'),(42,41,70,'2022-10-12','Pending'),(43,16,15,'2022-11-10','Under Review'),(44,31,14,'2022-02-05','Closed'),(45,2,43,'2022-12-29','Pending'),(46,13,44,'2022-07-25','Under Review'),(47,20,70,'2022-01-21','Pending'),(48,6,55,'2022-04-03','Resolved'),(49,16,48,'2022-03-09','Resolved'),(50,6,55,'2022-06-25','Under Review'),
(51,20,5,'2022-01-08','Under Review'),(52,23,31,'2022-06-02','Pending'),(53,37,66,'2022-06-01','Resolved'),(54,40,55,'2022-04-26','Under Review'),(55,30,18,'2022-11-03','Pending'),(56,24,68,'2022-11-08','Pending'),(57,30,15,'2022-11-28','Under Review'),(58,5,61,'2022-05-26','Closed'),(59,47,59,'2022-05-09','Resolved'),(60,46,21,'2022-11-27','Closed');


#create table sales
CREATE TABLE `sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `sale_date` date NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `productdetails` (`product_id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customerdetails` (`customer_id`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `branchdetails` (`branch_id`)
);

#Insert data into sales table
INSERT INTO `sales` VALUES (1,'2022-05-01',51,10,46,40),(2,'2022-02-21',67,8,20,38),(3,'2022-05-23',7,1,34,20),(4,'2022-07-21',39,6,25,37),(5,'2022-06-15',50,4,9,29),(6,'2022-06-04',20,5,31,6),(7,'2022-02-04',53,5,37,24),(8,'2022-11-16',27,5,41,3),(9,'2022-03-31',31,8,28,18),(10,'2022-05-17',69,1,6,34),
(11,'2022-04-14',54,2,1,15),(12,'2022-04-08',24,6,34,9),(13,'2022-12-10',3,1,2,32),(14,'2022-03-17',26,1,38,22),(15,'2022-08-27',61,6,36,7),(16,'2022-01-30',4,5,26,3),(17,'2022-07-25',32,2,10,35),(18,'2022-06-12',22,5,18,22),(19,'2022-07-18',16,3,49,13),(20,'2022-02-15',4,4,31,27),
(21,'2022-03-05',24,9,2,30),(22,'2022-02-10',68,2,48,26),(23,'2022-11-03',65,3,36,19),(24,'2022-02-23',43,7,4,31),(25,'2022-12-25',69,3,32,15),(26,'2022-01-26',11,5,39,8),(27,'2022-04-10',1,3,35,25),(28,'2022-03-15',1,4,41,6),(29,'2022-01-08',69,5,43,38),(30,'2022-06-10',16,9,6,8),
(31,'2022-03-15',10,10,2,11),(32,'2022-07-14',35,6,21,25),(33,'2022-01-10',3,10,39,23),(34,'2022-04-09',31,1,9,38),(35,'2022-01-23',62,8,39,40),(36,'2022-11-27',17,9,15,15),(37,'2022-03-08',34,7,45,31),(38,'2022-04-03',13,7,32,9),(39,'2022-01-17',35,8,1,18),(40,'2022-03-08',34,7,45,31),
(41,'2022-04-03',13,7,32,9),(42,'2022-01-17',35,8,1,18),(43,'2022-04-02',54,7,51,27),(44,'2022-10-02',56,9,51,7),(45,'2022-04-11',34,7,54,13),(46,'2022-07-26',34,3,60,36),(47,'2022-06-28',39,2,56,27),(48,'2022-07-30',50,5,54,27),(49,'2022-11-20',42,4,60,5),(50,'2022-03-09',70,4,59,19),
(51,'2022-12-08',22,1,55,32),(52,'2022-02-09',59,1,54,21),(53,'2022-01-08',52,5,58,38),(54,'2022-09-22',37,7,58,28),(55,'2022-08-10',40,8,58,39),(56,'2022-05-25',47,3,57,22),(57,'2022-11-22',20,8,53,15),(58,'2022-03-08',5,8,56,40),(59,'2022-09-11',17,3,57,11),(60,'2022-02-03',46,3,56,2),
(61,'2022-07-18',42,9,51,8),(62,'2022-12-27',3,4,59,9),(63,'2022-12-01',23,7,51,18),(64,'2022-09-13',32,3,59,13),(65,'2022-06-29',12,3,58,6),(66,'2022-05-25',8,7,57,11),(67,'2022-01-06',1,3,58,28),(68,'2022-10-03',5,3,55,39),(69,'2022-04-14',30,7,55,11),(70,'2022-10-29',12,10,51,14),
(71,'2022-06-04',9,1,52,33),(72,'2022-08-13',15,1,53,31),(73,'2022-02-17',43,8,55,37),(74,'2022-12-29',65,9,52,24),(75,'2022-11-05',59,1,59,29),(76,'2022-11-04',18,9,51,1),(77,'2022-07-25',19,9,52,25),(78,'2022-07-07',67,7,51,5),(79,'2022-01-11',67,5,60,17),(80,'2022-03-08',1,4,53,38),
(81,'2022-10-11',45,6,53,7),(82,'2022-04-02',45,7,52,4),(83,'2022-04-03',51,10,56,1),(84,'2022-08-02',69,4,55,17),(85,'2022-09-08',56,5,60,14),(86,'2022-01-19',39,7,60,39),(87,'2022-01-25',59,7,58,33),(88,'2022-11-15',14,9,59,6),(89,'2022-05-08',46,6,56,39),(90,'2022-08-06',44,1,54,2),
(91,'2022-12-23',35,9,58,36),(92,'2022-02-23',17,6,56,10);



CREATE TABLE `staffshiftdetails` (
  `staff_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `shift_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`staff_id`,`branch_id`,`shift_date`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `staffshiftdetails_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branchdetails` (`branch_id`)
);

INSERT INTO `staffshiftdetails` VALUES (1,15,'2022-12-28','09:25:00','19:04:00'),(2,9,'2022-12-14','08:09:00','12:30:00'),(3,5,'2022-08-15','09:20:00','17:20:00'),(4,33,'2022-04-22','11:50:00','19:34:00'),(5,37,'2022-10-05','12:23:00','16:23:00'),(6,22,'2022-08-23','13:42:00','14:56:00'),(7,38,'2022-08-12','12:26:00','12:37:00'),(8,31,'2022-09-30','14:04:00','18:58:00'),(9,1,'2022-12-12','12:08:00','14:58:00'),(10,4,'2022-03-16','11:47:00','16:32:00'),
(11,6,'2022-08-19','11:02:00','18:49:00'),(12,21,'2022-08-21','09:36:00','19:36:00'),(13,39,'2022-09-15','14:42:00','17:45:00'),(14,23,'2022-03-08','09:00:00','17:15:00'),(15,2,'2022-10-03','12:31:00','15:16:00'),(16,36,'2022-12-08','08:28:00','18:20:00'),(17,18,'2022-07-05','10:01:00','15:01:00'),(18,5,'2022-05-30','11:07:00','15:15:00'),(19,16,'2022-03-30','15:56:00','12:37:00'),(20,7,'2022-03-02','10:13:00','17:31:00'),
(21,15,'2022-10-24','15:52:00','19:07:00'),(22,31,'2022-07-01','13:00:00','19:22:00'),(23,15,'2022-05-28','14:35:00','19:59:00'),(24,37,'2022-05-31','08:48:00','19:09:00'),(25,31,'2022-07-31','16:13:00','18:40:00'),(26,12,'2022-07-30','15:10:00','17:08:00'),(27,14,'2022-07-22','12:06:00','15:21:00'),(28,9,'2022-11-19','10:33:00','19:23:00'),(29,36,'2022-06-04','14:43:00','18:34:00'),(30,7,'2022-12-22','15:36:00','15:17:00'),
(31,19,'2022-07-12','13:16:00','14:16:00'),(32,37,'2022-08-14','09:18:00','19:25:00'),(33,27,'2022-01-03','11:41:00','18:32:00'),(34,27,'2022-06-24','14:21:00','17:25:00'),(35,25,'2022-10-02','14:08:00','12:52:00'),(36,37,'2022-06-28','10:33:00','16:05:00'),(37,34,'2022-10-17','14:29:00','15:57:00'),(38,12,'2022-12-23','16:21:00','13:42:00'),(39,2,'2022-07-13','14:43:00','15:44:00'),(40,28,'2022-12-17','11:58:00','18:12:00'),
(41,30,'2022-10-28','13:33:00','16:17:00'),(42,12,'2022-01-21','11:29:00','19:37:00'),(43,35,'2022-11-16','16:53:00','17:02:00'),(44,10,'2022-04-03','14:45:00','12:43:00'),(45,34,'2022-09-14','08:01:00','12:44:00'),(46,6,'2022-07-27','08:10:00','16:25:00'),(47,6,'2022-06-17','12:45:00','16:06:00'),(48,24,'2022-06-02','08:37:00','19:46:00'),(49,31,'2022-01-04','09:39:00','19:56:00'),(50,4,'2022-05-16','15:25:00','12:19:00');


