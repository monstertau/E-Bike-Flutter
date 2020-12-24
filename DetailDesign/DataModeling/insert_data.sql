INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (3, 'Quận 1', '252x253', 50, 'HCM');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (5, 'Quận 3', '252x253', 50, 'HCM');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (4, 'Quận 2', '252x253', 50, 'HCM');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (2, 'Ba Vì', '252x252', 40, 'Hà Nội');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (1, 'Thanh Xuân', '252x252', 30, 'Hà Nội');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (7, 'Cầu Giấy', '252x253', 50, 'Hà Nội');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (6, 'Đống Đa', '252x253', 50, 'Hà Nội');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (8, 'Hai Bà Trưng', '252x253', 50, 'Hà Nội');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (10, 'Tây Hồ', '252x253', 50, 'Hà Nội');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (9, 'Hà Đông', '252x253', 50, 'Hà Nội');


INSERT INTO "ecoBikeSystem"."BikeInfo" (id, bikevalue, baserentamount, addrentamount, saddle, pedal, rear) VALUES (1, 400000, 10000, 3000, 1, 1, 1);
INSERT INTO "ecoBikeSystem"."BikeInfo" (id, bikevalue, baserentamount, addrentamount, saddle, pedal, rear) VALUES (2, 550000, 15000, 4500, 2, 2, 1);
INSERT INTO "ecoBikeSystem"."BikeInfo" (id, bikevalue, baserentamount, addrentamount, saddle, pedal, rear) VALUES (3, 700000, 15000, 4500, 1, 1, 1);
INSERT INTO "ecoBikeSystem"."BikeInfo" (id, bikevalue, baserentamount, addrentamount, saddle, pedal, rear) VALUES (4, 700000, 20000, 6000, 2, 2, 1);

INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (43, '32522', 'Pink', 'Twinbike', true, 2,2);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (45, '62432', 'Pink', 'Twinbike', true, 2,2);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (46, '26242', 'Pink', 'Twinbike', true, 2,2);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (44, '24522', 'Pink', 'Twinbike', true, 2,2);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (42, '24527', 'Pink', 'Twinbike', false, 2,2);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (39, '65212', 'Pink', 'Twinbike', false, 2,2);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (47, '96322', 'Pink', 'Twinbike', true, 2,2);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (38, '45646', 'Pink', 'Twinbike', true, 2,2);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (41, '34673', 'Pink', 'Twinbike', true, 2,2);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (40, '56722', 'Pink', 'Twinbike', true, 2,2);


INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (13, '12348', 'Blue', 'Standardbike', true, 1,1);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (15, '56323', 'Blue', 'Standardbike', true, 1,1);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (12, '12347', 'Blue', 'Standardbike', true, 1,1);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (14, '12367', 'Blue', 'Standardbike', true, 1,1);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (5, '23456', 'Blue', 'Standardbike', false, 1,1);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (7, '12344', 'Blue', 'Standardbike', false, 1,1);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (8, '12343', 'Blue', 'Standardbike', false, 1,1);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (11, '12346', 'Blue', 'Standardbike', true, 1,1);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (10, '12341', 'Blue', 'Standardbike', false, 1,1);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (9, '12342', 'Blue', 'Standardbike', false, 1,1);


INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (20, '34583', 'Red', 'Ebike', true, 3,3);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (4, '57654', 'Black', 'Ebike', true, 3,3);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (21, '35633', 'Red', 'Ebike', true, 3,3);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (22, '23473', 'Red', 'Ebike', true, 3,3);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (17, '67332', 'Red', 'Ebike', true, 3,3);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (19, '67336', 'Red', 'Ebike', true, 3,3);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (18, '78535', 'Red', 'Ebike', true, 3,3);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (1, '45423', 'Red', 'Ebike', true, 3,3);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (2, '23424', 'Blue', 'Ebike', false, 3,3);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (3, '12345', 'Yellow', 'Ebike', false, 3,3);


INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (24, '13542', 'White', 'TwinEbike', true, 4,4);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (27, '24352', 'White', 'TwinEbike', true, 4,4);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (28, '84345', 'White', 'TwinEbike', true, 4,4);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (29, '47245', 'White', 'TwinEbike', true, 4,4);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (30, '24741', 'White', 'TwinEbike', true, 4,4);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (31, '24473', 'White', 'TwinEbike', true, 4,4);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (26, '35632', 'White', 'TwinEbike', true, 4,4);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (6, '24242', 'White', 'TwinEbike', false, 4,4);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (23, '12351', 'White', 'TwinEbike', false, 4,4);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, lockbike, "dockId",bikeinfoid) VALUES (25, '12315', 'White', 'TwinEbike', true, 4,4);



INSERT INTO "ecoBikeSystem"."Ebike" (id, battery) VALUES (1, 20);
INSERT INTO "ecoBikeSystem"."Ebike" (id, battery) VALUES (2, 30);
INSERT INTO "ecoBikeSystem"."Ebike" (id, battery) VALUES (3, 40);
INSERT INTO "ecoBikeSystem"."Ebike" (id, battery) VALUES (4, 50);
INSERT INTO "ecoBikeSystem"."Ebike" (id, battery) VALUES (17, 20);
INSERT INTO "ecoBikeSystem"."Ebike" (id, battery) VALUES (18, 30);
INSERT INTO "ecoBikeSystem"."Ebike" (id, battery) VALUES (19, 60);
INSERT INTO "ecoBikeSystem"."Ebike" (id, battery) VALUES (20, 70);
INSERT INTO "ecoBikeSystem"."Ebike" (id, battery) VALUES (21, 80);
INSERT INTO "ecoBikeSystem"."Ebike" (id, battery) VALUES (22, 90);

INSERT INTO "ecoBikeSystem"."Standardbike" (id) VALUES (5);
INSERT INTO "ecoBikeSystem"."Standardbike" (id) VALUES (7);
INSERT INTO "ecoBikeSystem"."Standardbike" (id) VALUES (8);
INSERT INTO "ecoBikeSystem"."Standardbike" (id) VALUES (9);
INSERT INTO "ecoBikeSystem"."Standardbike" (id) VALUES (10);
INSERT INTO "ecoBikeSystem"."Standardbike" (id) VALUES (11);
INSERT INTO "ecoBikeSystem"."Standardbike" (id) VALUES (12);
INSERT INTO "ecoBikeSystem"."Standardbike" (id) VALUES (13);
INSERT INTO "ecoBikeSystem"."Standardbike" (id) VALUES (14);
INSERT INTO "ecoBikeSystem"."Standardbike" (id) VALUES (15);

INSERT INTO "ecoBikeSystem"."Twinbike" (id) VALUES (38);
INSERT INTO "ecoBikeSystem"."Twinbike" (id) VALUES (39);
INSERT INTO "ecoBikeSystem"."Twinbike" (id) VALUES (40);
INSERT INTO "ecoBikeSystem"."Twinbike" (id) VALUES (41);
INSERT INTO "ecoBikeSystem"."Twinbike" (id) VALUES (42);
INSERT INTO "ecoBikeSystem"."Twinbike" (id) VALUES (43);
INSERT INTO "ecoBikeSystem"."Twinbike" (id) VALUES (44);
INSERT INTO "ecoBikeSystem"."Twinbike" (id) VALUES (45);
INSERT INTO "ecoBikeSystem"."Twinbike" (id) VALUES (46);
INSERT INTO "ecoBikeSystem"."Twinbike" (id) VALUES (47);

INSERT INTO "ecoBikeSystem"."TwinEbike" (id, battery) VALUES (6, 90);
INSERT INTO "ecoBikeSystem"."TwinEbike" (id, battery) VALUES (23, 50);
INSERT INTO "ecoBikeSystem"."TwinEbike" (id, battery) VALUES (24, 60);
INSERT INTO "ecoBikeSystem"."TwinEbike" (id, battery) VALUES (25, 70);
INSERT INTO "ecoBikeSystem"."TwinEbike" (id, battery) VALUES (26, 80);
INSERT INTO "ecoBikeSystem"."TwinEbike" (id, battery) VALUES (27, 90);
INSERT INTO "ecoBikeSystem"."TwinEbike" (id, battery) VALUES (28, 100);
INSERT INTO "ecoBikeSystem"."TwinEbike" (id, battery) VALUES (29, 60);
INSERT INTO "ecoBikeSystem"."TwinEbike" (id, battery) VALUES (30, 70);
INSERT INTO "ecoBikeSystem"."TwinEbike" (id, battery) VALUES (31, 80);

INSERT INTO "ecoBikeSystem"."Card" (id, "cardCode", "cardName", "dateExpired", "cvvCode", lock) VALUES (5, '121319_group10_2020', 'Group 10', '1125', 323, false);
INSERT INTO "ecoBikeSystem"."Card" (id, "cardCode", "cardName", "dateExpired", "cvvCode", lock) VALUES (6, '121319_group8_2020', 'Group 8', '1125', 128, false);
INSERT INTO "ecoBikeSystem"."Card" (id, "cardCode", "cardName", "dateExpired", "cvvCode", lock) VALUES (7, '21319_group10_2020', 'Group 10', '1125', 323, false);
INSERT INTO "ecoBikeSystem"."Card" (id, "cardCode", "cardName", "dateExpired", "cvvCode", lock) VALUES (8, '121319_group10_202', 'group10', '1122', 323, false);
INSERT INTO "ecoBikeSystem"."Card" (id, "cardCode", "cardName", "dateExpired", "cvvCode", lock) VALUES (4, '121318', 'Group 10', '1125', 323, false);