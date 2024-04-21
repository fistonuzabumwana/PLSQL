CREATE OR REPLACE PACKAGE FARMERS_MONITORING_SYSTEM AS
    PROCEDURE farmer_performance(farmer_ids IN farmers.FarmerID%TYPE);
    PROCEDURE farmer_report(farmer_ids IN farmers.FarmerID%TYPE);
    FUNCTION average_yield_per_hectare(p_farmer_id IN farmers.FarmerID%TYPE) RETURN FLOAT;
END FARMERS_MONITORING_SYSTEM;
/