CREATE OR REPLACE PROCEDURE TRANSFERFUNDS(fromid INT, toid INT, amount INT) 
IS c_balance INT;
BEGIN 
    SELECT BALANCE INTO c_balance
    FROM ACCOUNTS
    WHERE ACCOUNTID = fromid;

    IF c_balance >= amount THEN

        UPDATE ACCOUNTS
        SET BALANCE = BALANCE - c_balance
        WHERE ACCOUNTID = fromid;

        UPDATE ACCOUNTS
        SET BALANCE = BALANCE + c_balance
        WHERE ACCOUNTID = toid;

        DBMS_OUTPUT.PUT_LINE('Amount Transferred Successfully!');

    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient Funds!');
    END IF;
END;
/