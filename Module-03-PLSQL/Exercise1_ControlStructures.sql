-- ==========================================
-- Module 3 - Exercise 1 : Control Structures
-- ==========================================

---------------------------------------------------------
-- Scenario 1
-- Apply 1% discount to loan interest rate
-- for customers above 60 years old
---------------------------------------------------------

BEGIN
    UPDATE Loans
    SET InterestRate = InterestRate - 1
    WHERE CustomerID IN (
        SELECT CustomerID
        FROM Customers
        WHERE FLOOR(MONTHS_BETWEEN(SYSDATE, DOB) / 12) > 60
    );

    COMMIT;
END;
/

-- Verify
SELECT * FROM Loans;

---------------------------------------------------------
-- Scenario 2
-- Mark customers as VIP if Balance > 10000
---------------------------------------------------------

ALTER TABLE Customers
ADD IsVIP VARCHAR2(5);

BEGIN
    UPDATE Customers
    SET IsVIP = 'TRUE'
    WHERE Balance > 10000;

    COMMIT;
END;
/

-- Verify
SELECT CustomerID,
       Name,
       Balance,
       IsVIP
FROM Customers;

---------------------------------------------------------
-- Scenario 3
-- Print reminders for loans due within next 30 days
---------------------------------------------------------

UPDATE Loans
SET EndDate = SYSDATE + 15
WHERE LoanID = 1;

COMMIT;

BEGIN
    FOR rec IN (
        SELECT c.Name,
               l.EndDate
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID
        WHERE l.EndDate BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: ' ||
            rec.Name ||
            ' Loan Due on ' ||
            TO_CHAR(rec.EndDate, 'DD-MON-YYYY')
        );
    END LOOP;
END;
/

-- Verify
SELECT CustomerID,
       LoanID,
       EndDate
FROM Loans;