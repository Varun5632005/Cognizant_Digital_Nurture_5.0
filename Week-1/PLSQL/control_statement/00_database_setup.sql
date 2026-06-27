
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    DOB DATE NOT NULL,
    Email VARCHAR2(150),
    Balance NUMBER(12,2) DEFAULT 0,
    CustomerStatus VARCHAR2(20) DEFAULT 'REGULAR',
    LastModified DATE DEFAULT SYSDATE,
    LastUpdated DATE DEFAULT SYSDATE
);

-- CREATE TABLE: Accounts
-- Stores customer account information (savings, checking, etc.).
CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    AccountType VARCHAR2(20) NOT NULL,
    Balance NUMBER(12,2) DEFAULT 0,
    InterestRate NUMBER(5,2) DEFAULT 0,
    LastInterestDate DATE DEFAULT SYSDATE,
    LastModified DATE DEFAULT SYSDATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

-- CREATE TABLE: Transactions
-- Records all account transactions including deposits, withdrawals, and transfers.
CREATE TABLE Transactions (
    TransactionID NUMBER PRIMARY KEY,
    AccountID NUMBER NOT NULL,
    TransactionDate DATE DEFAULT SYSDATE,
    Amount NUMBER(12,2) NOT NULL,
    TransactionType VARCHAR2(20) NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID) ON DELETE CASCADE
);

-- CREATE TABLE: AccountTransfers
-- Stores fund transfer records between two accounts.
CREATE TABLE AccountTransfers (
    TransferID NUMBER PRIMARY KEY,
    FromAccountID NUMBER NOT NULL,
    ToAccountID NUMBER NOT NULL,
    TransferDate DATE DEFAULT SYSDATE,
    Amount NUMBER(12,2) NOT NULL,
    Status VARCHAR2(20) NOT NULL,
    Remarks VARCHAR2(200),
    FOREIGN KEY (FromAccountID) REFERENCES Accounts(AccountID) ON DELETE CASCADE,
    FOREIGN KEY (ToAccountID) REFERENCES Accounts(AccountID) ON DELETE CASCADE
);

-- CREATE TABLE: BonusLog
-- Tracks bonus payments awarded to employees.
CREATE TABLE BonusLog (
    BonusID NUMBER PRIMARY KEY,
    EmployeeID NUMBER NOT NULL,
    BonusDate DATE DEFAULT SYSDATE,
    PerformanceScore NUMBER(3,2) NOT NULL,
    BonusAmount NUMBER(12,2) NOT NULL,
    Status VARCHAR2(20) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

-- CREATE TABLE: Loans
-- Stores active loans and transfer details for each customer.
CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    LoanAmount NUMBER(12,2) NOT NULL,
    InterestRate NUMBER(5,2) NOT NULL,
    OutstandingAmount NUMBER(12,2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    NextDueDate DATE NOT NULL,
    LoanStatus VARCHAR2(20) DEFAULT 'ACTIVE',
    LastModified DATE DEFAULT SYSDATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

-- CREATE TABLE: ReminderLog
-- Tracks reminder notifications sent for loan payments.
CREATE TABLE ReminderLog (
    ReminderID NUMBER PRIMARY KEY,
    LoanID NUMBER NOT NULL,
    CustomerID NUMBER NOT NULL,
    ReminderDate DATE NOT NULL,
    ReminderType VARCHAR2(20) NOT NULL,
    Status VARCHAR2(20) NOT NULL,
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID) ON DELETE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

-- CREATE TABLE: Employees
-- Stores employee information for the banking system.
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Position VARCHAR2(50) NOT NULL,
    Salary NUMBER(12,2) NOT NULL,
    PerformanceScore NUMBER(3,2) DEFAULT 0,
    Department VARCHAR2(50) NOT NULL,
    HireDate DATE DEFAULT SYSDATE
);

-- Create sequences for auto-increment IDs (optional)
CREATE SEQUENCE Customers_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE Accounts_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE Transactions_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE Loans_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE Employees_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ReminderLog_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE AccountTransfers_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE BonusLog_SEQ START WITH 1 INCREMENT BY 1;

-- Create indexes for better query performance
CREATE INDEX idx_Accounts_CustomerID ON Accounts(CustomerID);
CREATE INDEX idx_Transactions_AccountID ON Transactions(AccountID);
CREATE INDEX idx_Loans_CustomerID ON Loans(CustomerID);
CREATE INDEX idx_ReminderLog_LoanID ON ReminderLog(LoanID);
CREATE INDEX idx_AccountTransfers_FromAccountID ON AccountTransfers(FromAccountID);
CREATE INDEX idx_AccountTransfers_ToAccountID ON AccountTransfers(ToAccountID);
CREATE INDEX idx_BonusLog_EmployeeID ON BonusLog(EmployeeID);

-- Insert sample data for testing
INSERT INTO Customers (CustomerID, Name, DOB, Email, Balance, CustomerStatus, LastModified, LastUpdated)
VALUES (101, 'John Smith', TO_DATE('1955-03-15', 'YYYY-MM-DD'), 'john.smith@example.com', 750000, 'REGULAR', SYSDATE, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Email, Balance, CustomerStatus, LastModified, LastUpdated)
VALUES (102, 'Sarah Johnson', TO_DATE('1980-07-22', 'YYYY-MM-DD'), 'sarah.johnson@example.com', 250000, 'REGULAR', SYSDATE, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Email, Balance, CustomerStatus, LastModified, LastUpdated)
VALUES (103, 'Michael Brown', TO_DATE('1990-11-08', 'YYYY-MM-DD'), 'michael.brown@example.com', 100000, 'REGULAR', SYSDATE, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, InterestRate, LastInterestDate)
VALUES (1001, 101, 'SAVINGS', 500000, 3.50, SYSDATE - 30);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, InterestRate, LastInterestDate)
VALUES (1002, 101, 'CHECKING', 250000, 0.50, SYSDATE - 30);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, InterestRate, LastInterestDate)
VALUES (1003, 102, 'SAVINGS', 180000, 3.00, SYSDATE - 30);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, InterestRate, LastInterestDate)
VALUES (1004, 102, 'CHECKING', 70000, 0.50, SYSDATE - 30);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, InterestRate, LastInterestDate)
VALUES (1005, 103, 'SAVINGS', 100000, 3.25, SYSDATE - 30);

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, OutstandingAmount, StartDate, EndDate, NextDueDate, LoanStatus)
VALUES (2001, 101, 500000, 8.5, 450000, TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2028-01-15', 'YYYY-MM-DD'), SYSDATE + 10, 'ACTIVE');

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, OutstandingAmount, StartDate, EndDate, NextDueDate, LoanStatus)
VALUES (2002, 102, 200000, 9.2, 180000, TO_DATE('2023-06-20', 'YYYY-MM-DD'), TO_DATE('2028-06-20', 'YYYY-MM-DD'), SYSDATE + 45, 'ACTIVE');

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, OutstandingAmount, StartDate, EndDate, NextDueDate, LoanStatus)
VALUES (2003, 103, 120000, 10.0, 120000, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2029-01-10', 'YYYY-MM-DD'), SYSDATE + 5, 'ACTIVE');

INSERT INTO Employees (EmployeeID, Name, Position, Salary, PerformanceScore, Department)
VALUES (5001, 'Robert Wilson', 'Manager', 80000, 9.2, 'Loans');

INSERT INTO Employees (EmployeeID, Name, Position, Salary, PerformanceScore, Department)
VALUES (5002, 'Emily Davis', 'Specialist', 60000, 8.0, 'Customer Service');

INSERT INTO Employees (EmployeeID, Name, Position, Salary, PerformanceScore, Department)
VALUES (5003, 'Alex Martinez', 'Analyst', 55000, 7.5, 'Finance');

COMMIT;

-- Display table creation confirmation
BEGIN
    DBMS_OUTPUT.PUT_LINE('====== Database Setup Completed ======');
    DBMS_OUTPUT.PUT_LINE('Tables created:');
    DBMS_OUTPUT.PUT_LINE('  - Customers');
    DBMS_OUTPUT.PUT_LINE('  - Accounts');
    DBMS_OUTPUT.PUT_LINE('  - Transactions');
    DBMS_OUTPUT.PUT_LINE('  - AccountTransfers');
    DBMS_OUTPUT.PUT_LINE('  - BonusLog');
    DBMS_OUTPUT.PUT_LINE('  - Loans');
    DBMS_OUTPUT.PUT_LINE('  - ReminderLog');
    DBMS_OUTPUT.PUT_LINE('  - Employees');
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Sample data inserted successfully!');
    DBMS_OUTPUT.PUT_LINE('You can now run the scenario scripts.');
END;
/
