CREATE OR REPLACE PACKAGE BODY FARMERS_MONITORING_SYSTEM AS

PROCEDURE farmer_performance (farmer_ids IN farmers.FarmerID%TYPE) IS

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
END farmer_performance;

PROCEDURE farmer_report (farmer_ids IN farmers.FarmerID%TYPE) IS

    farmer_name farmers.FarmerName%TYPE;
    farm_size farmers.FarmSize%TYPE;
    membership_status farmers.MembershipStatus%TYPE;
    total_harvested FLOAT := 0;
    crop_name crops.CropName%TYPE;
    quantity_harvested harvestquantity.QuantityHarvested%TYPE;
    units harvestquantity.Units%TYPE;
    harvest_date harvestquantity.HarvestDate%TYPE;
    quality harvestquantity.Quality%TYPE;
    market_destination harvestquantity.MarketDestination%TYPE;
    forecast VARCHAR2(4000);
    crop_count INTEGER := 0;
    average_yield_per_hectares FLOAT;

    CURSOR farmer_cur IS
        SELECT FarmerName, FarmSize, MembershipStatus
        FROM Farmers
        WHERE FarmerID = farmer_ids;
    CURSOR harvest_cur IS
        SELECT c.CropName, h.QuantityHarvested, h.Units, h.HarvestDate, h.Quality, h.MarketDestination
        FROM Crops c
        JOIN HarvestQuantity h ON c.CropID = h.CropID
        WHERE c.FarmerID = farmer_ids;

BEGIN

    OPEN farmer_cur;
    FETCH farmer_cur INTO farmer_name, farm_size, membership_status;
    CLOSE farmer_cur;

    DBMS_OUTPUT.PUT_LINE('  ');
    DBMS_OUTPUT.PUT_LINE('  ');
    DBMS_OUTPUT.PUT_LINE('  ');

    DBMS_OUTPUT.PUT_LINE('---------------- Farmer Report ---------------------');
    DBMS_OUTPUT.PUT_LINE('  ');

    DBMS_OUTPUT.PUT_LINE('Farmer Name: ' || farmer_name);
    DBMS_OUTPUT.PUT_LINE('Farm Size: ' || farm_size || ' hectares');
    DBMS_OUTPUT.PUT_LINE('Membership Status: ' || membership_status);
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('  ');
    DBMS_OUTPUT.PUT_LINE('  ');


    DBMS_OUTPUT.PUT_LINE('----------------Harvest Details--------------------------');
    DBMS_OUTPUT.PUT_LINE('  ');

    DBMS_OUTPUT.PUT_LINE('Crop Name | Quantity Harvested | Units | Harvest Date | Quality | Market Destination');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');

    OPEN harvest_cur;

    LOOP
        FETCH harvest_cur INTO crop_name, quantity_harvested, units, harvest_date, quality, market_destination;
        EXIT WHEN harvest_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(crop_name || ' | ' || quantity_harvested || ' | ' || units || ' | ' || harvest_date || ' | ' || quality || ' | ' || market_destination);
        total_harvested := total_harvested + quantity_harvested;
        crop_count := crop_count + 1;
    END LOOP;

    CLOSE harvest_cur;

    DBMS_OUTPUT.PUT_LINE('  ');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('  ');

    DBMS_OUTPUT.PUT_LINE('Total Harvested: ' || total_harvested || ' units');

    IF crop_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Average Crop Yield: ' || ROUND(total_harvested / crop_count, 2) || ' units per crop');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Average Crop Yield: N/A');
    END IF;

    average_yield_per_hectares := average_yield_per_hectare(farmer_ids);

    IF average_yield_per_hectares IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Average Yield Per hectare: ' || ROUND(average_yield_per_hectares, 2) || ' units');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Average Yield Per hectare: N/A');
    END IF;

    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('  ');
    DBMS_OUTPUT.PUT_LINE('------------------Forecast for Agricultural Activities----------------------');
    DBMS_OUTPUT.PUT_LINE('  ');

    forecast := 'Based on historical data and weather forecasts, it is anticipated that the upcoming harvest season will have favorable conditions, resulting in higher yields. Farmers are advised to prepare for increased demand in the market.';
    DBMS_OUTPUT.PUT_LINE(forecast);

    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('  ');
    DBMS_OUTPUT.PUT_LINE('  ');
    DBMS_OUTPUT.PUT_LINE('          Comparison of Performance Between 2024 and 2025');

    farmer_performance(farmer_ids);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the specified farmer.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END farmer_report;
FUNCTION average_yield_per_hectare (p_farmer_id IN farmers.FarmerID%TYPE) RETURN FLOAT IS
    total_harvested FLOAT := 0;
    total_acres FLOAT := 0;
    average_yield_per_hectare FLOAT;
BEGIN

    SELECT SUM(h.QuantityHarvested), SUM(f.FarmSize)
    INTO total_harvested, total_acres
    FROM HarvestQuantity h
    JOIN Crops c ON h.CropID = c.CropID
    JOIN Farmers f ON c.FarmerID = f.FarmerID
    WHERE f.FarmerID = p_farmer_id;

    IF total_acres > 0 THEN
        average_yield_per_hectare := total_harvested / total_acres;
    ELSE
        average_yield_per_hectare := NULL;
    END IF;

    RETURN average_yield_per_hectare;
END average_yield_per_hectare;
END;
/
