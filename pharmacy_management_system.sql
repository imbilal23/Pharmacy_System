CREATE DATABASE Pharmacy_Inventory_;

USE Pharmacy_Inventory_;


CREATE TABLE Admin_login(
       A_id INT PRIMARY KEY,
       A_username VARCHAR(200) UNIQUE NOT NULL,
       A_password VARCHAR(50) NOT NULL
);

CREATE TABLE Supplier(
       sup_id INT PRIMARY KEY,
       sup_name VARCHAR(100) NOT NULL,
       company_name VARCHAR(100),
       sup_addres VARCHAR(500),
       phone VARCHAR(20) NOT NULL,
       email VARCHAR(100)
);

CREATE TABLE Medication(
       med_id INT PRIMARY KEY NOT NULL,
       med_name VARCHAR(250) NOT NULL,
       med_QTY INT,
       category VARCHAR(200),
       location_rack VARCHAR(250) NOT NULL,
       med_price DECIMAL(10,2) NOT NULL,
       stock_level INT NOT NULL,
       sup_id INT,
       CONSTRAINT fk_medication_supplier FOREIGN KEY (sup_id) 
           REFERENCES Supplier(sup_id)
);

CREATE TABLE Purchase(
       purc_id INT PRIMARY KEY,
       med_id INT NOT NULL,
       sup_id INT NOT NULL,
       purc_QTY INT NOT NULL,
       purc_cost DECIMAL(10,2) NOT NULL,
       purc_date DATE NOT NULL,
       Mfg_date DATE NOT NULL,
       exp_date DATE NOT NULL,
       batch_number VARCHAR(50) NOT NULL,
       CONSTRAINT fk_purchase_medication FOREIGN KEY (med_id) 
           REFERENCES Medication(med_id),
       CONSTRAINT fk_purchase_supplier FOREIGN KEY (sup_id) 
           REFERENCES Supplier(sup_id)
);

CREATE TABLE Staff(
       staff_id INT PRIMARY KEY,
       first_name VARCHAR(50) NOT NULL,
       last_name VARCHAR(50) NOT NULL,
       age INT,
       sex CHAR(1),
       role VARCHAR(50) NOT NULL,
       hire_date DATE NOT NULL,
       salary DECIMAL(10,2) NOT NULL, 
       contact_number VARCHAR(20) NOT NULL,
       email VARCHAR(150) NOT NULL
);

CREATE TABLE Customer(
       Cust_id INT PRIMARY KEY,
       first_name VARCHAR(50),
       last_name VARCHAR(50),
       gender CHAR(1),
       phone VARCHAR(20)
);

CREATE TABLE Sales(
       sale_id INT PRIMARY KEY,
       cust_id INT NOT NULL,
       sale_date DATETIME NOT NULL,
       quantity INT NOT NULL,
       total_amount DECIMAL(10,2) NOT NULL,
       staff_id INT NOT NULL,
       CONSTRAINT fk_sales_customer FOREIGN KEY (cust_id) 
           REFERENCES Customer(Cust_id),
       CONSTRAINT fk_sales_staff FOREIGN KEY (staff_id) 
           REFERENCES Staff(staff_id)
);

CREATE TABLE Sale_Invoice(
       invoice_id INT IDENTITY(1,1) PRIMARY KEY,
       sale_id INT NOT NULL,
       Cust_id INT NOT NULL,
       med_id INT NOT NULL,
       QTY INT NOT NULL,
       unit_price DECIMAL(10,2) NOT NULL,
       total_amount DECIMAL(10,2) NOT NULL,
       discount DECIMAL(5,2) NOT NULL,
       CONSTRAINT fk_invoice_sale FOREIGN KEY (sale_id) 
           REFERENCES Sales(sale_id),
       CONSTRAINT fk_invoice_customer FOREIGN KEY (Cust_id) 
           REFERENCES Customer(Cust_id),
       CONSTRAINT fk_invoice_medication FOREIGN KEY (med_id) 
           REFERENCES Medication(med_id)
);


INSERT INTO Admin_login (A_id, A_username, A_password) VALUES
(1, 'admin', 'password');

INSERT INTO Supplier (sup_id, sup_name, company_name, sup_addres, phone, email) VALUES
(123, 'XYZ Pharmaceuticals', 'Highnoon Laboratories', 'Chennai, Tamil Nadu', '8745632145', 'xyz@xyzpharma.com'),
(136, 'ABC PharmaSupply', 'Ferozsons Laboratories', 'Trichy', '7894561235', 'abc@pharmsupp.com'),
(145, 'Daily Pharma Ltd', 'Searle Pakistan', 'Hyderabad', '7854699321', 'daily@dpharma.com'),
(156, 'MedAll', 'Abbott Pakistan', 'Chennai', '9874585236', 'mainid@medall.com'),
(162, 'MedHead Pharmaceuticals', 'Getz Pharma Pakistan', 'Trichy', '7894561335', 'abc@pharmsupp.com');

INSERT INTO Medication(med_id, med_name, med_QTY, category, location_rack, med_price, stock_level, sup_id) VALUES
(123001, 'Dolo 650 MG', 625, 'Tablet', 'rack 5', 1.00, 50, 123),
(123002, 'Panadol Cold & Flu', 90, 'Tablet', 'rack 6', 2.50, 20, 123),
(123003, 'Livogen', 25, 'Capsule', 'rack 3', 5.00, 10, 136),
(123004, 'Gelusil', 440, 'Tablet', 'rack 4', 1.25, 50, 156),
(123005, 'Cyclopam', 120, 'Tablet', 'rack 2', 6.00, 30, 123),
(123006, 'Benadryl 200 ML', 35, 'Syrup', 'rack 10', 50.00, 10, 145),
(123007, 'Lopamide', 15, 'Capsule', 'rack 7', 5.00, 5, 123),
(123008, 'Vitamic C', 90, 'Tablet', 'rack 8', 3.00, 20, 162),
(123009, 'Omeprazole', 35, 'Capsule', 'rack 3', 4.00, 10, 156),
(123010, 'Concur 5 MG', 600, 'Tablet', 'rack 9', 3.50, 100, 136),
(123011, 'Augmentin 250 ML', 115, 'Syrup', 'rack 7', 80.00, 20, 145);

INSERT INTO Purchase(purc_id, med_id, sup_id, purc_QTY, purc_cost, purc_date, Mfg_date, exp_date, batch_number) VALUES
(1001, 123010, 136, 200, 1500.50, '2020-03-01', '2019-05-05', '2021-05-10', 'BATCH001'),
(1002, 123002, 123, 1000, 3000.00, '2020-02-01', '2018-06-01', '2020-12-05', 'BATCH002'),
(1003, 123006, 145, 20, 800.00, '2020-04-22', '2017-02-05', '2020-07-01', 'BATCH003'),
(1004, 123004, 156, 250, 1000.00, '2020-04-02', '2020-05-06', '2023-05-06', 'BATCH004'),
(1005, 123005, 123, 200, 1200.00, '2020-02-01', '2019-08-02', '2021-04-01', 'BATCH005'),
(1006, 123010, 162, 500, 1500.00, '2019-04-22', '2018-01-01', '2020-05-02', 'BATCH006'),
(1007, 123001, 123, 500, 450.00, '2020-01-02', '2019-01-05', '2022-03-06', 'BATCH007');

INSERT INTO Staff (staff_id, first_name, last_name, age, sex, role, hire_date, salary, contact_number, email) VALUES
(1, 'Admin', '-', 30, 'M', 'Admin', '2009-06-24', 95000.00, '9874563219', 'admin@pharmacia.com'),
(4567001, 'Varshini', 'Elangovan', 25, 'F', 'Pharmacist', '2017-11-12', 25000.00, '9967845123', 'evarsh@hotmail.com'),
(4567002, 'Anita', 'Shree', 20, 'F', 'Pharmacist', '2012-10-06', 45000.00, '8546123566', 'anita@gmail.com'),
(4567003, 'Harish', 'Raja', 22, 'M', 'Pharmacist', '2019-07-06', 21000.00, '7854123694', 'harishraja@live.com'),
(4567005, 'Amaya', 'Singh', 28, 'F', 'Pharmacist', '2017-05-16', 32000.00, '7894532165', 'amaya@gmail.com'),
(4567006, 'Shoaib', 'Ahmed', 20, 'M', 'Pharmacist', '2018-09-05', 28000.00, '7896541234', 'shoaib@hotmail.com'),
(4567009, 'Shayla', 'Hussain', 40, 'F', 'Manager', '2010-05-06', 80000.00, '7854123695', 'shaylah@gmail.com'),
(4567010, 'Daniel', 'James', 27, 'M', 'Pharmacist', '2016-01-05', 30000.00, '7896541235', 'daniels@gmail.com');

INSERT INTO Customer(Cust_id, first_name, last_name, gender, phone) VALUES
(1, 'Safia', 'Malik', 'F', '9632587415'),
(2, 'Varun', 'Ilango', 'M', '9987565423'),
(3, 'Suja', 'Suresh', 'F', '7896541236'),
(4, 'Agatha', 'Elizabeth', 'F', '7845129635'),
(5, 'Zayed', 'Shah', 'M', '6789541235'),
(6, 'Vijay', 'Kumar', 'M', '8996574123'),
(7, 'Meera', 'Das', 'F', '7845963259');


INSERT INTO Sales (sale_id, cust_id, sale_date, quantity, total_amount, staff_id) VALUES
(1, 1, '2020-04-15', 20, 180.00, 4567009),
(2, 2, '2020-04-21', 10, 292.50, 1),
(3, 3, '2020-04-15', 5, 54.55, 4567010),
(4, 4, '2020-04-14', 50, 175.00, 4567006),
(5, 3, '2020-04-21', 15, 45.00, 1),
(6, 6, '2020-03-11', 10, 140.00, 4567001),
(7, 5, '2020-04-24', 5, 350.00, 1),
(8, 4, '2020-04-24', 4, 35.00, 4567001),
(12, 3, '2020-04-24', 3, 60.00, 1),
(13, 4, '2020-04-24', 5, 62.50, 4567001),
(15, 7, '2020-12-04', 18, 420.00, 1);


INSERT INTO Sale_Invoice(sale_id, Cust_id, med_id, QTY, unit_price, total_amount, discount) VALUES
(1, 1, 123001, 20, 1.00, 20.00, 10.00),
(1, 1, 123011, 2, 80.00, 160.00, 5.00),
(2, 2, 123003, 10, 3.00, 30.00, 5.00),
(2, 2, 123005, 10, 6.00, 60.00, 5.00),
(3, 3, 123008, 5, 3.00, 15.00, 6.00),
(4, 4, 123010, 50, 3.50, 175.00, 10.00);

-- Triggers
-- Update stock after purchase
GO
CREATE TRIGGER trg_AfterPurchase
ON Purchase
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE m
    SET m.med_QTY = m.med_QTY + i.purc_QTY
    FROM Medication m
    INNER JOIN inserted i ON m.med_id = i.med_id;
END;
GO

-- check stock befor sale and update after sale
CREATE TRIGGER trg_BeforeSaleInvoice
ON Sale_Invoice
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Check stock availability
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Medication m ON i.med_id = m.med_id
        WHERE m.med_QTY < i.QTY
    )
    BEGIN
        RAISERROR('Insufficient stock for one or more medications', 16, 1);
        RETURN;
    END
    
    -- Process valid inserts
    INSERT INTO Sale_Invoice(sale_id, Cust_id, med_id, QTY, unit_price, total_amount, discount)
    SELECT sale_id, Cust_id, med_id, QTY, unit_price, total_amount, discount
    FROM inserted;
    
    -- Update stock levels
    UPDATE m
    SET m.med_QTY = m.med_QTY - i.QTY
    FROM Medication m
    INNER JOIN inserted i ON m.med_id = i.med_id;
END;
GO

-- Stored Procedures
CREATE PROCEDURE sp_ProcessSale
    @cust_id INT,
    @staff_id INT,
    @med_id INT,
    @quantity INT,
    @discount DECIMAL(5,2)
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @price DECIMAL(10,2);
    DECLARE @total DECIMAL(10,2);
    DECLARE @sale_id INT;
    DECLARE @stock_available INT;
    
    -- Get current unit price and stock
    SELECT @price = med_price, @stock_available = med_QTY
    FROM Medication 
    WHERE med_id = @med_id;
    
    -- Validate inputs
    IF @quantity <= 0
    BEGIN
        RAISERROR('Quantity must be positive', 16, 1);
        RETURN;
    END
    
    IF @discount < 0 OR @discount > 100
    BEGIN
        RAISERROR('Discount must be between 0 and 100', 16, 1);
        RETURN;
    END
    
    IF @stock_available < @quantity
    BEGIN
        RAISERROR('Insufficient stock available', 16, 1);
        RETURN;
    END
    
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Calculate total with discount
        SET @total = (@price * @quantity) * (1 - (@discount/100));
        
        -- Create sale record
        INSERT INTO Sales (cust_id, sale_date, quantity, total_amount, staff_id)
        VALUES (@cust_id, GETDATE(), @quantity, @total, @staff_id);
        
        SET @sale_id = SCOPE_IDENTITY();
        
        -- Create invoice line
        INSERT INTO Sale_Invoice (sale_id, Cust_id, med_id, QTY, unit_price, total_amount, discount)
        VALUES (@sale_id, @cust_id, @med_id, @quantity, @price, @total, @discount);
        
        COMMIT TRANSACTION;
        
        -- Return invoice details
        SELECT 
            @sale_id AS sale_id,
            @total AS amount,
            'Sale processed successfully' AS message;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        
        THROW;
    END CATCH
END;
GO
-- Total sale 
CREATE PROCEDURE dbo.GetTotalSales
    @SaleDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        SUM(si.total_amount) AS TotalSales,
        SUM(si.total_amount) / NULLIF(COUNT(DISTINCT si.sale_id), 0) AS AverageSaleValue,
        COUNT(DISTINCT si.sale_id) AS NumberOfTransactions,
        COUNT(si.med_id) AS TotalItemsSold,
        SUM(m.med_price * si.QTY) AS PotentialRevenue,
        SUM(m.med_price * si.QTY) - SUM(si.total_amount) AS TotalDiscountsGiven
    FROM Sale_Invoice si
    JOIN Sales s ON si.sale_id = s.sale_id
    JOIN Medication m ON si.med_id = m.med_id
    WHERE CAST(s.sale_date AS DATE) = @SaleDate;
END;
GO

--Get information about medicationsupplier
CREATE FUNCTION dbo.GetMedicationSupplierInfo 
(
    @med_id INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        m.med_id,
        m.med_name,
        m.med_QTY,
        m.category,
        m.med_price,
        m.location_rack AS rack_location,
        s.sup_id,
        s.sup_name,
        s.company_name,
        s.phone AS supplier_phone,
        s.email AS supplier_email,
        s.sup_addres
    FROM Medication m
    JOIN Supplier s ON m.sup_id = s.sup_id
    WHERE m.med_id = @med_id
);
GO
-- alert for expiry date
CREATE FUNCTION dbo.fn_CheckExpiryDate 
(
    @med_id INT
)
RETURNS VARCHAR(200)
AS
BEGIN
    DECLARE @exp_date DATE;
    DECLARE @med_name VARCHAR(250);
    DECLARE @today DATE = GETDATE();
    DECLARE @message VARCHAR(200);
    DECLARE @nearest_expiry DATE;

    SELECT @med_name = med_name FROM Medication WHERE med_id = @med_id;
    
    SELECT TOP 1 @nearest_expiry = exp_date
    FROM Purchase
    WHERE med_id = @med_id
    ORDER BY exp_date ASC;

    IF @nearest_expiry IS NULL
    BEGIN
        SET @message = 'No expiry information found for medication "' + @med_name + '"';
    END
    ELSE IF DATEDIFF(DAY, @today, @nearest_expiry) <= 30
    BEGIN
        SET @message = 'Warning: Medication "' + @med_name + '" has batch expiring on ' 
                     + CONVERT(VARCHAR, @nearest_expiry, 103);
    END
    ELSE
    BEGIN
        SET @message = 'Medication "' + @med_name + '" has no imminent expiries. Next expiry: ' 
                     + CONVERT(VARCHAR, @nearest_expiry, 103);
    END

    RETURN @message;
END;
GO
