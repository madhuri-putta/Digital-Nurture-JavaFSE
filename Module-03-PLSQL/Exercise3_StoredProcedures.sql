-- ==========================================
-- Exercise 3 : Stored Procedures
-- ==========================================

---------------------------------------------------
-- Scenario 1
-- Process Monthly Interest
---------------------------------------------------

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN

    UPDATE Accounts
    SET Balance = Balance + (Balance*0.01)
    WHERE AccountType='Savings';

    COMMIT;

END;
/

BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT * FROM Accounts;

---------------------------------------------------
-- Scenario 2
-- Transfer Funds
---------------------------------------------------

CREATE OR REPLACE PROCEDURE TransferFunds
(
    p_FromAccount IN NUMBER,
    p_ToAccount IN NUMBER,
    p_Amount IN NUMBER
)
IS
BEGIN

    UPDATE Accounts
    SET Balance=Balance-p_Amount
    WHERE AccountID=p_FromAccount;

    UPDATE Accounts
    SET Balance=Balance+p_Amount
    WHERE AccountID=p_ToAccount;

    COMMIT;

END;
/

BEGIN
    TransferFunds(1,4,500);
END;
/

SELECT * FROM Accounts;

---------------------------------------------------
-- Scenario 3
-- Add Customer
---------------------------------------------------

CREATE OR REPLACE PROCEDURE AddCustomer
(
    p_CustomerID IN NUMBER,
    p_Name IN VARCHAR2,
    p_DOB IN DATE,
    p_Balance IN NUMBER
)
IS
BEGIN

    INSERT INTO Customers
    (
        CustomerID,
        Name,
        DOB,
        Balance,
        LastModified
    )
    VALUES
    (
        p_CustomerID,
        p_Name,
        p_DOB,
        p_Balance,
        SYSDATE
    );

    COMMIT;

END;
/

BEGIN
    AddCustomer
    (
        5,
        'Madhu',
        TO_DATE('2001-08-15','YYYY-MM-DD'),
        15000
    );
END;
/

SELECT * FROM Customers;

-- Optional cleanup after taking screenshot
DELETE FROM Customers
WHERE CustomerID=5;

COMMIT;