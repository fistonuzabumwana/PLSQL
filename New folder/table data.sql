INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
VALUES
    (1, 'Jeanine Uwamahoro', '+250783456789', 5.2, 'premium');
    INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
VALUES
    (2, 'Emmanuel Habimana', '+250787654321', 7.8, 'basic');
    INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
VALUES
    (3, 'Claudine Mukarugwiza', '+250781852963', 4.5, 'average');
    INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
VALUES
    (4, 'Felix Nzabonimana', '+250784789321', 6.3, 'premium');
    INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
VALUES
    (5, 'Marie Uwase', '+250789258147', 3.7, 'basic');
    INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
VALUES
    (6, 'Patrick Niyomugabo', '+250782963741', 9.1, 'average');
    INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
VALUES
    (7, 'Grace Umuhoza', '+250788258369', 8.5, 'premium');
    INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
VALUES
    (8, 'Jean Baptiste Mugisha', '+250732547819', 6.7, 'basic');
    INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
VALUES
    (9, 'Alice Umubyeyi', '+250785236147', 4.9, 'average');
    INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
VALUES
    (10, 'Eric Uwizeye', '+250781369852', 7.2, 'premium');





INSERT INTO Address (AddressID, FarmerID, StreetAddress, City, Province, Sector)
VALUES
    (1, 1, 'Kigali Street 123', 'Gasabo', 'Kigali', 'Kacyiru');
    INSERT INTO Address (AddressID, FarmerID, StreetAddress, City, Province, Sector)
VALUES
    (2, 2, 'Gisenyi Road 456', 'Rubavu', 'Western ', 'Mushonyi');
    INSERT INTO Address (AddressID, FarmerID, StreetAddress, City, Province, Sector)
VALUES
    (3, 3, 'Musanze Avenue 789', 'Musanze', 'Northern ', 'Muhoza');
    INSERT INTO Address (AddressID, FarmerID, StreetAddress, City, Province, Sector)
VALUES
    (4, 4, 'Huye Road 321', 'Huye', 'Southern ', 'Taba');
    INSERT INTO Address (AddressID, FarmerID, StreetAddress, City, Province, Sector)
VALUES
    (5, 5, 'Rubavu Road 654', 'Rubavu', 'Western ', 'Rubavu');
    INSERT INTO Address (AddressID, FarmerID, StreetAddress, City, Province, Sector)
VALUES
    (6, 6, 'Ruhango Street 987', 'Ruhango', 'Southern ', 'KINAZI');
    INSERT INTO Address (AddressID, FarmerID, StreetAddress, City, Province, Sector)
VALUES
    (7, 7, 'KN 135 Ave', 'Kigali', 'Nyarugenge', 'Nyamirambo');
    INSERT INTO Address (AddressID, FarmerID, StreetAddress, City, Province, Sector)
VALUES
    (8, 8, 'Muhanga Avenue 246', 'Muhanga', 'Southern ', 'NYAMABUYE');
    INSERT INTO Address (AddressID, FarmerID, StreetAddress, City, Province, Sector)
VALUES
    (9, 9, 'Nyagatare Road 579', 'Nyagatare', 'Eastern ', 'Gihundwe');
    INSERT INTO Address (AddressID, FarmerID, StreetAddress, City, Province, Sector)
VALUES
    (10, 10, 'Rwamagana Road 975', 'Rwamagana', 'Eastern ', 'Fumbwe');

-- Inserting records into Crops table
INSERT INTO Crops (CropID, CropName, CropType, PlantingDate, HarvestDate, FarmerID)
VALUES
    (1, 'Beans', 'Legume', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), 1);
    INSERT INTO Crops (CropID, CropName, CropType, PlantingDate, HarvestDate, FarmerID)
VALUES
    (2, 'Banana', 'Fruit', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'), 2);
    INSERT INTO Crops (CropID, CropName, CropType, PlantingDate, HarvestDate, FarmerID)
VALUES
    (3, 'Maize', 'Grain', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), 3);
    INSERT INTO Crops (CropID, CropName, CropType, PlantingDate, HarvestDate, FarmerID)
VALUES
    (4, 'Cassava', 'Root', TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-08-01', 'YYYY-MM-DD'), 4);
    INSERT INTO Crops (CropID, CropName, CropType, PlantingDate, HarvestDate, FarmerID)
VALUES
    (5, 'Sweet Potato', 'Root', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), 5);
    INSERT INTO Crops (CropID, CropName, CropType, PlantingDate, HarvestDate, FarmerID)
VALUES
    (6, 'Irish Potato', 'Root', TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'), 6);
    INSERT INTO Crops (CropID, CropName, CropType, PlantingDate, HarvestDate, FarmerID)
VALUES
    (7, 'Coffee', 'Cash Crop', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-11-01', 'YYYY-MM-DD'), 7);
    INSERT INTO Crops (CropID, CropName, CropType, PlantingDate, HarvestDate, FarmerID)
VALUES
    (8, 'Tea', 'Cash Crop', TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-12-01', 'YYYY-MM-DD'), 8);
    INSERT INTO Crops (CropID, CropName, CropType, PlantingDate, HarvestDate, FarmerID)
VALUES
    (9, 'Pineapple', 'Fruit', TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), 9);
    INSERT INTO Crops (CropID, CropName, CropType, PlantingDate, HarvestDate, FarmerID)
VALUES
    (10, 'Passion Fruit', 'Fruit', TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'), 10);

-- Inserting records into HarvestQuantity table
INSERT INTO HarvestQuantity (HarvestID, CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination)
VALUES
    (1, 1, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 500, 'kg', 'Excellent', 'Local Market');
    INSERT INTO HarvestQuantity (HarvestID, CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination)
VALUES
    (2, 2, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 300, 'kg', 'Good', 'Farm Stand');
    INSERT INTO HarvestQuantity (HarvestID, CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination)
VALUES
    (3, 3, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 700, 'kg', 'Excellent', 'Wholesale Market');
    INSERT INTO HarvestQuantity (HarvestID, CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination)
VALUES
    (4, 4, TO_DATE('2024-08-01', 'YYYY-MM-DD'), 400, 'kg', 'Good', 'Supermarket');
    INSERT INTO HarvestQuantity (HarvestID, CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination)
VALUES
    (5, 5, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 600, 'kg', 'Excellent', 'Export');
    INSERT INTO HarvestQuantity (HarvestID, CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination)
VALUES
    (6, 6, TO_DATE('2024-10-01', 'YYYY-MM-DD'), 200, 'kg', 'Good', 'Farm Stand');
    INSERT INTO HarvestQuantity (HarvestID, CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination)
VALUES
    (7, 7, TO_DATE('2024-11-01', 'YYYY-MM-DD'), 800, 'kg', 'Excellent', 'Wholesale Market');
    INSERT INTO HarvestQuantity (HarvestID, CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination)
VALUES
    (8, 8, TO_DATE('2024-12-01', 'YYYY-MM-DD'), 350, 'kg', 'Good', 'Supermarket');
    INSERT INTO HarvestQuantity (HarvestID, CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination)
VALUES
    (9, 9, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 450, 'kg', 'Excellent', 'Local Market');
    INSERT INTO HarvestQuantity (HarvestID, CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination)
VALUES
    (10, 10, TO_DATE('2025-02-01', 'YYYY-MM-DD'), 250, 'kg', 'Good', 'Export');




INSERT INTO Supervisor (SupervisorID, SupervisorName, Contact, District, FarmerID)
VALUES
    (1, 'Emmanuel Uwamahoro', '+250787688890', 'Rubavu ', 1);
    INSERT INTO Supervisor (SupervisorID, SupervisorName, Contact, District, FarmerID)
VALUES
    (2, 'Josephine Mukarugwiza', '+250789591939', 'Muhanga ', 3);
    INSERT INTO Supervisor (SupervisorID, SupervisorName, Contact, District, FarmerID)
VALUES
    (3, 'François Nzabonimana', '+250787971757', 'Nyarugenge ', 4);
    INSERT INTO Supervisor (SupervisorID, SupervisorName, Contact, District, FarmerID)
VALUES
    (4, 'Félicité Umuhoza', '+250786633686', 'Ruhango ', 7);
    INSERT INTO Supervisor (SupervisorID, SupervisorName, Contact, District, FarmerID)
VALUES
    (5, 'Daniel Mugisha', '+250788556595', 'Nyagatare ', 10);
    INSERT INTO Supervisor (SupervisorID, SupervisorName, Contact, District, FarmerID)
VALUES
    (6, 'Sophie Umubyeyi', '+250735320383', 'Rwamagana ', 9);
    INSERT INTO Supervisor (SupervisorID, SupervisorName, Contact, District, FarmerID)
VALUES
    (7, 'Jacques Niyomugabo', '+250722782902', 'Huye ', 6);
    INSERT INTO Supervisor (SupervisorID, SupervisorName, Contact, District, FarmerID)
VALUES
    (8, 'Anastasie Uwase', '+250781541781', 'Musanze ', 2);
    INSERT INTO Supervisor (SupervisorID, SupervisorName, Contact, District, FarmerID)
VALUES
    (9, 'Vincent Niyonzima', '+250730880123', 'Gasabo ', 5);
    INSERT INTO Supervisor (SupervisorID, SupervisorName, Contact, District, FarmerID)
VALUES
    (10, 'Christine Umutesi', '+250788788548', 'Nyarugenge ', 8);
