CREATE OR REPLACE FUNCTION factorial(n NUMBER) RETURN NUMBER IS
    result NUMBER := 1;
BEGIN
    IF n < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Factorial is not defined for negative numbers.');
        RETURN NULL;
    END IF;
    
    FOR i IN 1..n LOOP
        result := result * i;
    END LOOP;
    
    RETURN result;
END;
/
