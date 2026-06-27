DECLARE
    v_age NUMBER;
BEGIN
    FOR cust IN (
        SELECT CustomerID,
               TRUNC(MONTHS_BETWEEN(SYSDATE, DOB)/12) AS Age
        FROM Customers
    ) LOOP

        IF cust.Age > 60 THEN

            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = cust.CustomerID;

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Discount applied successfully.');
END;
/