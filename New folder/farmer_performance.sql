CREATE OR REPLACE PROCEDURE farmer_performance (farmer_ids IN farmers.FarmerID%TYPE) IS

    farmer_name farmers.FarmerName%TYPE;
    farm_size farmers.FarmSize%TYPE;
    membership_status farmers.MembershipStatus%TYPE;
    crop_name crops.CropName%TYPE;
    harvest_quantity_2024 FLOAT;
    harvest_quantity_2025 FLOAT;
    difference FLOAT;

    CURSOR farmer_cur IS
        SELECT FarmerName, FarmSize, MembershipStatus
        FROM Farmers
        WHERE FarmerID = farmer_ids;

    CURSOR harvest_cur IS
        SELECT c.CropName, 
        SUM(CASE WHEN EXTRACT(YEAR FROM h.HarvestDate) = 2024 THEN h.QuantityHarvested ELSE 0 END) AS harvest_2024,
        SUM(CASE WHEN EXTRACT(YEAR FROM h.HarvestDate) = 2025 THEN h.QuantityHarvested ELSE 0 END) AS harvest_2025
        FROM Crops c
        JOIN HarvestQuantity h ON c.CropID = h.CropID
        WHERE c.FarmerID = farmer_ids
        GROUP BY c.CropName;

BEGIN

    OPEN farmer_cur;
    FETCH farmer_cur INTO farmer_name, farm_size, membership_status;
    CLOSE farmer_cur;

    DBMS_OUTPUT.PUT_LINE('  ');
    DBMS_OUTPUT.PUT_LINE('  ');
    DBMS_OUTPUT.PUT_LINE('  ');

    DBMS_OUTPUT.PUT_LINE('------------------ Farmer Performance Comparison -----------------------');
    DBMS_OUTPUT.PUT_LINE('  ');

    DBMS_OUTPUT.PUT_LINE('Farmer Name: ' || farmer_name);
    DBMS_OUTPUT.PUT_LINE('Farm Size: ' || farm_size || ' hectares');
    DBMS_OUTPUT.PUT_LINE('Membership Status: ' || membership_status);
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------');
    
    DBMS_OUTPUT.PUT_LINE('  ');
    DBMS_OUTPUT.PUT_LINE('Crop Name  |  Harvest Quantity (2024)  |  Harvest Quantity (2025)  |  Difference');
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------');

    OPEN harvest_cur;

    LOOP
        FETCH harvest_cur INTO crop_name, harvest_quantity_2024, harvest_quantity_2025;
        EXIT WHEN harvest_cur%NOTFOUND;
        difference := harvest_quantity_2025 - harvest_quantity_2024;
        DBMS_OUTPUT.PUT_LINE(crop_name || '  |         ' || harvest_quantity_2024 || '       |     '       || harvest_quantity_2025 || '     |        ' || difference);
    END LOOP;

    CLOSE harvest_cur;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the specified farmer.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
