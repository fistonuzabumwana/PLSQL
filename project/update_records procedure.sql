CREATE OR REPLACE PROCEDURE update_records IS

    table_choice INT;
    farmer_id farmers.FarmerID%TYPE;
    farmer_name farmers.FarmerName%TYPE;
    contact_info farmers.ContactInformation%TYPE;
    farm_size farmers.FarmSize%TYPE;
    membership_status farmers.MembershipStatus%TYPE;
    address_id address.FarmerID%TYPE;
    street_address address.StreetAddress%TYPE;
    city address.City%TYPE;
    province address.Province%TYPE;
    sector address.Sector%TYPE;
    crop_id crops.CropID%TYPE;
    crop_name crops.CropName%TYPE;
    crop_type crops.CropType%TYPE;
    planting_date crops.PlantingDate%TYPE;
    harvest_date crops.HarvestDate%TYPE;
    quantity_harvested harvestquantity.QuantityHarvested%TYPE;
    units harvestquantity.Units%TYPE;
    quality harvestquantity.Quality%TYPE;
    market_destination harvestquantity.MarketDestination%TYPE;
    harvest_id harvestquantity.HarvestID%TYPE;
    supervisor_id supervisor.SupervisorID%TYPE;
    supervisor_name supervisor.SupervisorName%TYPE;
    contact supervisor.Contact%TYPE;
    district supervisor.District%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Choose a table to update records:');
    DBMS_OUTPUT.PUT_LINE('1. Farmers');
    DBMS_OUTPUT.PUT_LINE('2. Address');
    DBMS_OUTPUT.PUT_LINE('3. Crops');
    DBMS_OUTPUT.PUT_LINE('4. HarvestQuantity');
    DBMS_OUTPUT.PUT_LINE('5. Supervisor');
    table_choice := &table_choice;

    CASE table_choice
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE('Enter FarmerID to update:');
            farmer_id := &farmer_id;
            DBMS_OUTPUT.PUT_LINE('Enter Farmer Name:');
            farmer_name := '&farmer_name';
            DBMS_OUTPUT.PUT_LINE('Enter Contact Information:');
            contact_info := '&contact_info';
            DBMS_OUTPUT.PUT_LINE('Enter Farm Size:');
            farm_size := &farm_size;
            DBMS_OUTPUT.PUT_LINE('Enter Membership Status:');
            membership_status := '&membership_status';

            UPDATE Farmers
            SET FarmerName = farmer_name, ContactInformation = contact_info, FarmSize = farm_size, MembershipStatus = membership_status
            WHERE FarmerID = farmer_id;
            DBMS_OUTPUT.PUT_LINE('Record updated successfully in Farmers table.');
        
        WHEN 2 THEN
            DBMS_OUTPUT.PUT_LINE('Enter AddressID to update:');
            address_id := &address_id;
            DBMS_OUTPUT.PUT_LINE('Enter Street Address:');
            street_address := '&street_address';
            DBMS_OUTPUT.PUT_LINE('Enter City:');
            city := '&city';
            DBMS_OUTPUT.PUT_LINE('Enter Province:');
            province := '&province';
            DBMS_OUTPUT.PUT_LINE('Enter Sector:');
            sector := '&sector';

            UPDATE Address
            SET StreetAddress = street_address, City = city, Province = province, Sector = sector
            WHERE AddressID = address_id;
            DBMS_OUTPUT.PUT_LINE('Record updated successfully in Address table.');

        WHEN 3 THEN
            DBMS_OUTPUT.PUT_LINE('Enter CropID to update:');
            crop_id := &crop_id;
            DBMS_OUTPUT.PUT_LINE('Enter Crop Name:');
            crop_name := '&crop_name';
            DBMS_OUTPUT.PUT_LINE('Enter Crop Type:');
            crop_type := '&crop_type';
            DBMS_OUTPUT.PUT_LINE('Enter Planting Date:');
            planting_date := '&planting_date';
            DBMS_OUTPUT.PUT_LINE('Enter Harvest Date:');
            harvest_date := '&harvest_date';
            UPDATE Crops
            SET CropName = crop_name, CropType = crop_type, PlantingDate = TO_DATE(planting_date, 'YYYY-MM-DD'), HarvestDate = TO_DATE(harvest_date, 'YYYY-MM-DD')
            WHERE CropID = crop_id;
            DBMS_OUTPUT.PUT_LINE('Record updated successfully in Crops table.');

        WHEN 4 THEN
            DBMS_OUTPUT.PUT_LINE('Enter HarvestID to update:');
            harvest_id := &harvest_id;
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

            UPDATE HarvestQuantity
            SET HarvestDate = TO_DATE(harvest_date, 'YYYY-MM-DD'), QuantityHarvested = quantity_harvested, Units = units, Quality = quality, MarketDestination = market_destination
            WHERE HarvestID = harvest_id;
            DBMS_OUTPUT.PUT_LINE('Record updated successfully in HarvestQuantity table.');

        WHEN 5 THEN
            DBMS_OUTPUT.PUT_LINE('Enter SupervisorID to update:');
            supervisor_id := &supervisor_id;
            DBMS_OUTPUT.PUT_LINE('Enter Supervisor Name:');
            supervisor_name := '&supervisor_name';
            DBMS_OUTPUT.PUT_LINE('Enter Contact:');
            contact := '&contact';
            DBMS_OUTPUT.PUT_LINE('Enter District:');
            district := '&district';

            UPDATE Supervisor
            SET SupervisorName = supervisor_name, Contact = contact, District = district
            WHERE SupervisorID = supervisor_id;
            DBMS_OUTPUT.PUT_LINE('Record updated successfully in Supervisor table.');

        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid choice. Please enter a number between 1 and 5.');
    END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No record found with the provided ID.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
