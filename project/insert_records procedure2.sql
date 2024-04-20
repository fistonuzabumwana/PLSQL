CREATE OR REPLACE PROCEDURE insert_records IS
DECLARE
        table_choice int;     
        farmer_id farmers.FarmerID%type;
        farmer_name farmers.FarmerName%type;
        contact_info farmers.ContactInformation%type;
        farm_size farmers.FarmSize%type := &v_farm_size;
        membership_status farmers.membership_status%type;
    BEGIN
    DBMS_OUTPUT.PUT_LINE('Choose a table to insert new record:');
    DBMS_OUTPUT.PUT_LINE('1. Farmers');
    DBMS_OUTPUT.PUT_LINE('2. Address');
    DBMS_OUTPUT.PUT_LINE('3. Crops');
    DBMS_OUTPUT.PUT_LINE('4. HarvestQuantity');
    DBMS_OUTPUT.PUT_LINE('5. supervisor');
    table_choice := '&table_choice';

    CASE table_choice
        WHEN '1' THEN
        farmer_id := &farmer_id;
        farmer_name := '&farmer_name';
        contact_info := '&contact_info';
        farm_size := &farm_size;
        membership_status := '&membership_status';

        INSERT INTO Farmers (FarmerID, FarmerName, ContactInformation, FarmSize, MembershipStatus)
        VALUES (farmer_id, farmer_name, contact_info, farm_size, membership_status);
        DBMS_OUTPUT.PUT_LINE('Record inserted successfully into Farmers table.');
        
        WHEN '2' THEN
        -- Prompt user for data to insert into address table


        WHEN '3' THEN
        -- Prompt user for data to insert into Crops table
        

        WHEN '4' THEN
        -- Prompt user for data to insert into HarvestQuantity table
        
        WHEN '5' THEN
        -- Prompt user for data to insert into supervisor table
    END CASE;

END;
/
