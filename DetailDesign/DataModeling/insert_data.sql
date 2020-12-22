INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (1, 'Dock1', '252x252', 30, 'HN');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (2, 'Dock2', '252x252', 40, 'HN');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (3, 'Dock3', '252x253', 50, 'HCM');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (4, 'Dock3', '252x253', 50, 'HCM');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (5, 'Dock3', '252x253', 50, 'HCM');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (6, 'Dock3', '252x253', 50, 'HCM');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (7, 'Dock3', '252x253', 50, 'HCM');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (8, 'Dock3', '252x253', 50, 'HCM');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (9, 'Dock3', '252x253', 50, 'HCM');
INSERT INTO "ecoBikeSystem"."DockStation" (id, name, area, size, address) VALUES (10, 'Dock3', '252x253', 50, 'HCM');

INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, "bikeValue", "baseRentAmount", "additionalRentAmount", lock,"dockId") VALUES (1, 'abcde', 'red', 'EBike', 200000, 20000, 1000, true,1);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, "bikeValue", "baseRentAmount", "additionalRentAmount", lock,"dockId") VALUES (2, 'adfaf', 'blue', 'EBike', 210000, 12000, 5000, true,1);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, "bikeValue", "baseRentAmount", "additionalRentAmount", lock,"dockId") VALUES (3, 'adfdaf', 'yellow', 'EBike', 230000, 25000, 4000, true,2);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, "bikeValue", "baseRentAmount", "additionalRentAmount", lock,"dockId") VALUES (4, 'hgdsda', 'black', 'EBike', 234200, 60000, 2000, true,2);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, "bikeValue", "baseRentAmount", "additionalRentAmount", lock,"dockId") VALUES (5, 'afafadf', 'blue', 'Standardbike', 100000, 20000, 1000, true,3);
INSERT INTO "ecoBikeSystem"."Bike" (id, barcode, color, category, "bikeValue", "baseRentAmount", "additionalRentAmount", lock,"dockId") VALUES (6, 'fadfdasf', 'white', 'TwinEbike', 400000, 60000, 8000, false,3);