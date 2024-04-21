CREATE OR REPLACE PROCEDURE insert_into_harvestquantity (num_records in int) IS
BEGIN
        DBMS_OUTPUT.PUT_LINE('Enter the number of records to insert:');
        num_records := &num_records;
        
    -- Loop to insert the specified number of records
    FOR i IN 1..num_records LOOP
        -- Prompt user for data to insert into HarvestQuantity table
        DBMS_OUTPUT.PUT_LINE('Enter data for Record ' || i || ':');
        DECLARE
            crop_id INT := &crop_id;
            harvest_date DATE := '&harvest_date'; -- Assuming date format input from user
            quantity_harvested FLOAT := &quantity_harvested;
            units VARCHAR2(50) := '&units';
            quality VARCHAR2(50) := '&quality';
            market_destination VARCHAR2(100) := '&market_destination';
        BEGIN
            -- Insert into HarvestQuantity table
            INSERT INTO HarvestQuantity (CropID, HarvestDate, QuantityHarvested, Units, Quality, MarketDestination)
            VALUES (crop_id, TO_DATE(harvest_date, 'YYYY-MM-DD'), quantity_harvested, units, quality, market_destination);
            DBMS_OUTPUT.PUT_LINE('Record ' || i || ' inserted successfully into HarvestQuantity table.');
        EXCEPTION
        WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('Invalid input format. Please enter a valid number.');
            RETURN;
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('An error occurred while inserting Record ' || i || ': ' || SQLERRM);
        END;
    END LOOP;
END;
/

