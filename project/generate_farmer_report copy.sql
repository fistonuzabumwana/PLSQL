CREATE OR REPLACE PROCEDURE generate_farmer_report (p_farmer_id IN farmers.FarmerID%TYPE) IS
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
    CURSOR farmer_cur IS
        SELECT FarmerName, FarmSize, MembershipStatus
        FROM Farmers
        WHERE FarmerID = p_farmer_id;
    CURSOR harvest_cur IS
        SELECT c.CropName, h.QuantityHarvested, h.Units, h.HarvestDate, h.Quality, h.MarketDestination
        FROM Crops c
        JOIN HarvestQuantity h ON c.CropID = h.CropID
        WHERE c.FarmerID = p_farmer_id;
BEGIN
    -- Fetch farmer details
    OPEN farmer_cur;
    FETCH farmer_cur INTO v_farmer_name, v_farm_size, v_membership_status;
    CLOSE farmer_cur;

    -- Fetch harvest details
    DBMS_OUTPUT.PUT_LINE('Farmer Name: ' || v_farmer_name);
    DBMS_OUTPUT.PUT_LINE('Farm Size: ' || v_farm_size);
    DBMS_OUTPUT.PUT_LINE('Membership Status: ' || v_membership_status);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Harvest Details:');
    DBMS_OUTPUT.PUT_LINE('    Crop Name    |     Quantity Harvested      |    Units     |    Harvest Date     |   Quality    |   Market Destination        ');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------------------------------------------');
    OPEN harvest_cur;
    LOOP
        FETCH harvest_cur INTO v_crop_name, v_quantity_harvested, v_units, v_harvest_date, v_quality, v_market_destination;
        EXIT WHEN harvest_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_crop_name || '    |    ' || v_quantity_harvested || '    |    ' || v_units ||'     |    ' || v_harvest_date || '     |    ' || v_quality || '     |    ' || v_market_destination);
        v_total_harvested := v_total_harvested + v_quantity_harvested;
    END LOOP;
    CLOSE harvest_cur;

    -- Display total harvested
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Harvested: ' || v_total_harvested);
    
    -- Provide forecast for agricultural activities (example)
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Forecast for Agricultural Activities:');
    -- Logic for forecast (example)
    v_forecast := 'Based on historical data, it is forecasted that the next harvest season will see increased yields. Additionally, there might be a higher demand for certain crops in the market.';
    DBMS_OUTPUT.PUT_LINE(v_forecast);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the specified farmer.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/


CREATE OR REPLACE PROCEDURE generate_farmer_report (p_farmer_id IN farmers.FarmerID%TYPE) IS
    v_farmer_name farmers.FarmerName%TYPE;
    v_farm_size farmers.FarmSize%TYPE;
    v_membership_status farmers.MembershipStatus%TYPE;
    v_total_harvested FLOAT := 0;
    v_crop_name crops.CropName%TYPE;
    v_quantity_harvested harvestquantity.QuantityHarvested%TYPE;
    v_units harvestquantity.Units%TYPE;
    v_harvest_date harvestquantity.HarvestDate%TYPE;
    v_quality harvestquantity.Quality%TYPE;
    v_market_destination harvestquantity.MarketDestination%TYPE;
    v_forecast VARCHAR2(4000);
    v_crop_count INTEGER := 0;
    CURSOR farmer_cur IS
        SELECT FarmerName, FarmSize, MembershipStatus
        FROM Farmers
        WHERE FarmerID = p_farmer_id;
    CURSOR harvest_cur IS
        SELECT c.CropName, h.QuantityHarvested, h.Units, h.HarvestDate, h.Quality, h.MarketDestination
        FROM Crops c
        JOIN HarvestQuantity h ON c.CropID = h.CropID
        WHERE c.FarmerID = p_farmer_id;
BEGIN
    -- Fetch farmer details
    OPEN farmer_cur;
    FETCH farmer_cur INTO v_farmer_name, v_farm_size, v_membership_status;
    CLOSE farmer_cur;

    -- Fetch harvest details
    DBMS_OUTPUT.PUT_LINE('--------------------- Farmer Report ---------------------');
    DBMS_OUTPUT.PUT_LINE('Farmer Name: ' || v_farmer_name);
    DBMS_OUTPUT.PUT_LINE('Farm Size: ' || v_farm_size || ' acres');
    DBMS_OUTPUT.PUT_LINE('Membership Status: ' || v_membership_status);
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Harvest Details:');
    DBMS_OUTPUT.PUT_LINE('Crop Name | Quantity Harvested | Units | Harvest Date | Quality | Market Destination');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
    OPEN harvest_cur;
    LOOP
        FETCH harvest_cur INTO v_crop_name, v_quantity_harvested, v_units, v_harvest_date, v_quality, v_market_destination;
        EXIT WHEN harvest_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_crop_name || ' | ' || v_quantity_harvested || ' | ' || v_units || ' | ' || v_harvest_date || ' | ' || v_quality || ' | ' || v_market_destination);
        v_total_harvested := v_total_harvested + v_quantity_harvested;
        v_crop_count := v_crop_count + 1;
    END LOOP;
    CLOSE harvest_cur;

    -- Display total harvested and average crop yield
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Harvested: ' || v_total_harvested || ' units');
    IF v_crop_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Average Crop Yield: ' || ROUND(v_total_harvested / v_crop_count, 2) || ' units per crop');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Average Crop Yield: N/A');
    END IF;

    -- Provide forecast for agricultural activities (example)
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Forecast for Agricultural Activities:');
    -- Logic for forecast (example)
    v_forecast := 'Based on historical data and weather forecasts, it is anticipated that the upcoming harvest season will have favorable conditions, resulting in higher yields. Farmers are advised to prepare for increased demand in the market.';
    DBMS_OUTPUT.PUT_LINE(v_forecast);

    -- Compare performance between 2024 and 2025
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Comparison of Performance Between 2024 and 2025:');
    compare_farmer_performance(p_farmer_id);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the specified farmer.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
