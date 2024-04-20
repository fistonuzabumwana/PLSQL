CREATE OR REPLACE FUNCTION average_yield_per_hectare (p_farmer_id IN farmers.FarmerID%TYPE) RETURN FLOAT IS
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
/
