CREATE OR REPLACE PROCEDURE insert_records IS
    table_choice INT;
    farmer_id farmers.FarmerID%TYPE;
    farmer_name farmers.FarmerName%TYPE;
    contact_info farmers.ContactInformation%TYPE;
    farm_size farmers.FarmSize%TYPE := &v_farm_size;
    membership_status farmers.membership_status%TYPE;
    crop_id crops.CropID%TYPE;
    crop_name crops.CropName%TYPE;
    crop_type crops.CropType%TYPE;
    planting_date crops.PlantingDate%TYPE;
    harvest_date crops.HarvestDate%TYPE;
    quantity_harvested harvestquantity.QuantityHarvested%TYPE;
    units harvestquantity.Units%TYPE;
    quality harvestquantity.Quality%TYPE;
    market_destination harvestquantity.MarketDestination%TYPE;
    address_id address.FarmerID%TYPE;
    street_address address.StreetAddress%TYPE;
    city address.City%TYPE;
    province address.Province%TYPE;
    sector address.Sector%TYPE;
    supervisor_id supervisor.SupervisorID%TYPE;
    supervisor_name supervisor.SupervisorName%TYPE;
    contact supervisor.Contact%TYPE;
    district supervisor.District%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Choose a table to insert a new record:');
    DBMS_OUTPUT.PUT_LINE('1. Farmers');
    DBMS_OUTPUT.PUT_LINE('2. Address');
    DBMS_OUTPUT.PUT_LINE('3. Crops');
    DBMS_OUTPUT.PUT_LINE('4. HarvestQuantity');
    DBMS_OUTPUT.PUT_LINE('5. Supervisor');
    table_choice := &table_choice;

    CASE table_choice
        WHEN '1' THEN
            DBMS_OUTPUT.PUT_LINE('Enter FarmerID:');
            farmer_id := &farmer_id;
            DBMS_OUTPUT.PUT_LINE('Enter Farmer Name:');
            farmer_name := '&farmer_name';
            DBMS_OUTPUT.PUT_LINE('Enter Contact Information:');
            contact_info := '&contact_info';
            DBMS_OUTPUT.PUT_LINE('Enter Farm Size:');
            farm_size := &farm_size;
            DBMS_OUTPUT.PUT_LINE('Enter Membership Status:');
            membership_status := '&membership_status';

            INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
            VALUES (farmer_id, farmer_name, contact_info, farm_size, membership_status);
            DBMS_OUTPUT.PUT_LINE('Record inserted successfully into Farmers table.');
        
        WHEN '2' THEN
            DBMS_OUTPUT.PUT_LINE('Enter AddressID:');
            address_id := &address_id;
            DBMS_OUTPUT.PUT_LINE('Enter Street Address:');
            street_address := '&street_address';
            DBMS_OUTPUT.PUT_LINE('Enter City:');
            city := '&city';
            DBMS_OUTPUT.PUT_LINE('Enter Province:');
            province := '&province';
            DBMS_OUTPUT.PUT_LINE('Enter Sector:');
            sector := '&sector';

            INSERT INTO Address (AddressID, FarmerID, StreetAddress, City, Province, Sector)
            VALUES (address_id, farmer_id, street_address, city, province, sector);
            DBMS_OUTPUT.PUT_LINE('Record inserted successfully into Address table.');

        WHEN '3' THEN
            DBMS_OUTPUT.PUT_LINE('Enter CropID:');
            crop_id := &crop_id;
            DBMS_OUTPUT.PUT_LINE('Enter Crop Name:');
            crop_name := '&crop_name';
            DBMS_OUTPUT.PUT_LINE('Enter Crop Type:');
            crop_type := '&crop_type';
            DBMS_OUTPUT.PUT_LINE('Enter Planting Date:');
            planting_date := '&planting_date'; 
            DBMS_OUTPUT.PUT_LINE('Enter Harvest Date:');
            harvest_date := '&harvest_date';

            INSERT INTO Crops (CropID, CropName, CropType, PlantingDate, HarvestDate, FarmerID)
            VALUES (crop_id, crop_name, crop_type, TO_DATE(planting_date, 'YYYY-MM-DD'), TO_DATE(harvest_date, 'YYYY-MM-DD'), farmer_id);
            DBMS_OUTPUT.PUT_LINE('Record inserted successfully into Crops table.');

        WHEN '4' THEN
            DBMS_OUTPUT.PUT_LINE('Enter CropID:');
            crop_id := &crop_id;
            DBMS_OUTPUT.PUT_LINE('Enter Harvest Date:');
            harvest_date := '&harvest_date'; 
            DBMS_OUTPUT.PUT_LINE('Enter Quantity Harvested:');
            quantity_harvested := &quantity_harvested;
            DBMS_OUTPUT.PUT_LINE('Enter Units:');
            units := '&units';
            DBMS_OUTPUT.PUT_LINE('Enter Quality:');
            quality := '&quality';
            DBMS_OUTPUT.PUT_LINE('Enter Market Destination:');
            market_destination := '&market_destination';

            INSERT INTO HarvestQuantity (CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination, FarmerID)
            VALUES (crop_id, TO_DATE(harvest_date, 'YYYY-MM-DD'), quantity_harvested, units, quality, market_destination, farmer_id);
            DBMS_OUTPUT.PUT_LINE('Record inserted successfully into HarvestQuantity table.');

        WHEN '5' THEN
            DBMS_OUTPUT.PUT_LINE('Enter SupervisorID:');
            supervisor_id := &supervisor_id;
            DBMS_OUTPUT.PUT_LINE('Enter Supervisor Name:');
            supervisor_name := '&supervisor_name';
            DBMS_OUTPUT.PUT_LINE('Enter Contact:');
            contact := '&contact';
            DBMS_OUTPUT.PUT_LINE('Enter District:');
            district := '&district';

            INSERT INTO Supervisor (SupervisorID, SupervisorName, Contact, District, FarmerID)
            VALUES (supervisor_id, supervisor_name, contact, district, farmer_id);
            DBMS_OUTPUT.PUT_LINE('Record inserted successfully into Supervisor table.');
    END CASE;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Invalid input format. Please enter a valid number or date.');
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate value found. Cannot insert duplicate records.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
