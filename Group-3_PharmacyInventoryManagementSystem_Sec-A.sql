CREATE DATABASE PharmacyInventory;
USE PharmacyInventory;


CREATE TABLE Supplier(
       sup_id INT PRIMARY KEY IDENTITY(1,1),
       sup_name NVARCHAR(100) NOT NULL,
       company_name NVARCHAR(100),
       sup_addres NVARCHAR(500),
       phone NVARCHAR(20) NOT NULL,
       email NVARCHAR(100)
);
CREATE TABLE Medication(
       med_id INT PRIMARY KEY IDENTITY(1,1),
       med_name NVARCHAR(250) NOT NULL,
	   description NVARCHAR(500),
	   category NVARCHAR(200),
       stock_QTY INT NOT NULL DEFAULT 0,
	   unit_price DECIMAL(10,2) NOT NULL,
       sup_id INT FOREIGN KEY REFERENCES Supplier(sup_id),
       rack_location NVARCHAR(250) NOT NULL,
       expiry_date DATE NOT NULL,
       batch_number NVARCHAR(50) NOT NULL
);
CREATE TABLE Purchase(
       purc_id INT PRIMARY KEY IDENTITY(1,1),
	   purc_name NVARCHAR(100),
	   purc_descr NVARCHAR(500),
	   purc_categ NVARCHAR(200),
       purc_QTY INT NOT NULL,
       purc_cost DECIMAL(10,2) NOT NULL,
       purc_date DATE NOT NULL,
       Mfg_date DATE NOT NULL,
       exp_date DATE NOT NULL,
       batch_number NVARCHAR(50) NOT NULL,
       sup_id INT FOREIGN KEY REFERENCES Supplier(sup_id)
);
CREATE TABLE Staff(
       staff_id INT PRIMARY KEY IDENTITY(1,1),
       first_name NVARCHAR(50) NOT NULL,
       last_name NVARCHAR(50) NOT NULL,
       age INT,
       sex CHAR(1),
       role NVARCHAR(50) NOT NULL,
       hire_date DATE NOT NULL,
       salary DECIMAL(10,2) NOT NULL, 
       contact_number NVARCHAR(20) NOT NULL,
       email NVARCHAR(150) NOT NULL
);
CREATE TABLE Customer(
       cust_id INT PRIMARY KEY IDENTITY(1,1),
       first_name NVARCHAR(50) NOT NULL,
       last_name NVARCHAR(50) NOT NULL,
);
CREATE TABLE Sales(
       sale_id INT PRIMARY KEY IDENTITY(1,1),
	   cust_id INT FOREIGN KEY REFERENCES Customer(cust_id),
       sale_date DATE NOT NULL,
	   discount DECIMAL(5,2) DEFAULT 0,
       total_amount DECIMAL(10,2) NOT NULL
);
CREATE TABLE Customer_Invoice(
       invoice_id INT PRIMARY KEY IDENTITY(1,1),
	   cust_id INT FOREIGN KEY REFERENCES Customer(Cust_id),
	   med_name NVARCHAR(100),
       QTY INT NOT NULL,
       unit_price DECIMAL(10,2) NOT NULL,
	   discount DECIMAL(5,2) DEFAULT 0,
       total_amount DECIMAL(10,2) NOT NULL,
       sale_id INT FOREIGN KEY REFERENCES Sales(sale_id),
	   med_id INT FOREIGN KEY REFERENCES Medication(med_id)
);
INSERT INTO Supplier (sup_name, company_name, sup_addres, phone, email)
VALUES
('Kamran Adal', 'MediCare Inc.', '123 Pharma St, Health City', '555-1001', 'orders@medicare.com'),
('Danish Afzal', 'Global Pharmaceuticals', '456 Medicine Ave, Bio Town', '555-1002', 'supply@globalpharma.com'),
('Abdullah Tahir', 'Quality Medicine Co.', '789 Wellness Blvd, Care City', '555-1003', 'sales@qualitymeds.com'),
('Dilshan Ali', 'Prime Health Distributors', '321 Cure Road, Med Town', '555-1004', 'contact@primedist.com'),
('Saddam Hussain', 'Vital Medicine Solutions', '654 Health Lane, Pharma City', '555-1005', 'info@vitalsolutions.com');

INSERT INTO Medication (med_name, description, category, stock_QTY, unit_price, sup_id, rack_location, expiry_date, batch_number)
VALUES
('Paracetamol 500mg', 'Pain and fever relief', 'Analgesic', 250, 5.99, 1, 'A1', '2024-12-31', 'BATCH-PARA-2023'),
('Amoxicillin 250mg', 'Antibiotic capsules', 'Antibiotic', 150, 12.50, 2, 'B2', '2025-06-30', 'BATCH-AMOX-2023'),
('Loratadine 10mg', 'Antihistamine tablets', 'Allergy', 180, 8.75, 3, 'C3', '2024-09-30', 'BATCH-LORA-2023'),
('Omeprazole 20mg', 'Acid reducer capsules', 'Gastrointestinal', 200, 15.25, 4, 'D4', '2025-03-31', 'BATCH-OME-2023'),
('Ibuprofen 200mg', 'Anti-inflammatory tablets', 'Pain Relief', 300, 7.50, 5, 'E5', '2024-11-30', 'BATCH-IBU-2023'),
('Cetirizine 10mg', 'Antihistamine for allergies', 'Allergy', 200, 6.50, 3, 'C4', '2025-01-31', 'BATCH-CET-2023'),
('Aspirin 75mg', 'Blood thinner and pain relief', 'Cardiac', 180, 4.25, 1, 'A2', '2024-10-15', 'BATCH-ASP-2023'),
('Simvastatin 20mg', 'Cholesterol medication', 'Cardiac', 150, 10.75, 2, 'B3', '2025-07-31', 'BATCH-SIM-2023'),
('Metformin 500mg', 'Diabetes medication', 'Endocrine', 220, 8.99, 4, 'D5', '2025-02-28', 'BATCH-MET-2023'),
('Salbutamol Inhaler', 'Asthma relief', 'Respiratory', 100, 12.99, 5, 'E6', '2024-08-31', 'BATCH-SAL-2023'),
('Atorvastatin 40mg', 'Cholesterol control', 'Cardiac', 170, 15.50, 1, 'A3', '2025-04-30', 'BATCH-ATO-2023'),
('Diazepam 5mg', 'Anxiety relief', 'Psychiatric', 80, 9.25, 2, 'B4', '2024-12-15', 'BATCH-DIA-2023'),
('Ciprofloxacin 500mg', 'Broad-spectrum antibiotic', 'Antibiotic', 120, 11.75, 3, 'C5', '2025-03-15', 'BATCH-CIP-2023'),
('Losartan 50mg', 'Blood pressure control', 'Cardiac', 190, 7.25, 4, 'D6', '2025-05-31', 'BATCH-LOS-2023'),
('Metoprolol 50mg', 'Beta blocker for heart', 'Cardiac', 160, 6.99, 5, 'E7', '2024-11-15', 'BATCH-METO-2023'),
('Pantoprazole 40mg', 'Acid reducer', 'Gastrointestinal', 210, 9.50, 1, 'A4', '2025-01-15', 'BATCH-PAN-2023'),
('Warfarin 5mg', 'Blood thinner', 'Cardiac', 90, 8.25, 2, 'B5', '2024-10-31', 'BATCH-WAR-2023'),
('Levothyroxine 50mcg', 'Thyroid hormone', 'Endocrine', 200, 5.75, 3, 'C6', '2025-06-15', 'BATCH-LEV-2023'),
('Amlodipine 5mg', 'Calcium channel blocker', 'Cardiac', 180, 7.99, 4, 'D7', '2025-02-15', 'BATCH-AML-2023'),
('Fluoxetine 20mg', 'Antidepressant', 'Psychiatric', 130, 10.25, 5, 'E8', '2024-09-30', 'BATCH-FLU-2023'),
('Hydrochlorothiazide 25mg', 'Diuretic', 'Cardiac', 170, 4.99, 1, 'A5', '2025-03-31', 'BATCH-HYD-2023'),
('Sertraline 50mg', 'Antidepressant', 'Psychiatric', 140, 12.50, 2, 'B6', '2024-12-31', 'BATCH-SER-2023'),
('Tramadol 50mg', 'Pain relief', 'Analgesic', 110, 14.75, 3, 'C7', '2025-01-31', 'BATCH-TRA-2023'),
('Diclofenac 50mg', 'Anti-inflammatory', 'Pain Relief', 190, 6.25, 4, 'D8', '2024-11-30', 'BATCH-DIC-2023'),
('Pregabalin 75mg', 'Nerve pain relief', 'Neurological', 100, 18.99, 5, 'E9', '2025-04-15', 'BATCH-PRE-2023'),
('Insulin Glargine', 'Long-acting insulin', 'Endocrine', 60, 25.50, 1, 'A6', '2024-10-15', 'BATCH-INS-2023'),
('Montelukast 10mg', 'Asthma controller', 'Respiratory', 150, 13.25, 2, 'B7', '2025-05-31', 'BATCH-MON-2023'),
('Esomeprazole 40mg', 'Acid reducer', 'Gastrointestinal', 200, 11.99, 3, 'C8', '2024-12-15', 'BATCH-ESO-2023'),
('Clopidogrel 75mg', 'Blood thinner', 'Cardiac', 170, 9.75, 4, 'D9', '2025-02-28', 'BATCH-CLO-2023'),
('Alprazolam 0.5mg', 'Anxiety relief', 'Psychiatric', 90, 7.50, 5, 'E10', '2024-09-15', 'BATCH-ALP-2023'),
('Furosemide 40mg', 'Diuretic', 'Cardiac', 160, 5.25, 1, 'A7', '2025-01-31', 'BATCH-FUR-2023'),
('Gabapentin 300mg', 'Nerve pain relief', 'Neurological', 140, 8.99, 2, 'B8', '2024-11-15', 'BATCH-GAB-2023'),
('Metronidazole 400mg', 'Antibiotic', 'Antibiotic', 120, 10.50, 3, 'C9', '2025-03-31', 'BATCH-METR-2023'),
('Ranitidine 150mg', 'Acid reducer', 'Gastrointestinal', 180, 6.75, 4, 'D10', '2024-10-31', 'BATCH-RAN-2023'),
('Tamsulosin 0.4mg', 'For enlarged prostate', 'Urological', 110, 12.25, 5, 'E11', '2025-04-30', 'BATCH-TAM-2023'),
('Bisoprolol 5mg', 'Beta blocker', 'Cardiac', 150, 7.99, 1, 'A8', '2024-12-15', 'BATCH-BIS-2023'),
('Doxycycline 100mg', 'Antibiotic', 'Antibiotic', 130, 9.25, 2, 'B9', '2025-02-15', 'BATCH-DOX-2023'),
('Lisinopril 10mg', 'Blood pressure control', 'Cardiac', 190, 6.50, 3, 'C10', '2024-11-30', 'BATCH-LIS-2023'),
('Quetiapine 25mg', 'Antipsychotic', 'Psychiatric', 100, 15.75, 4, 'D11', '2025-05-15', 'BATCH-QUE-2023'),
('Sildenafil 50mg', 'Erectile dysfunction', 'Urological', 80, 20.99, 5, 'E12', '2024-09-30', 'BATCH-SIL-2023'),
('Tadalafil 20mg', 'Erectile dysfunction', 'Urological', 70, 22.50, 1, 'A9', '2025-01-15', 'BATCH-TAD-2023'),
('Venlafaxine 75mg', 'Antidepressant', 'Psychiatric', 120, 14.25, 2, 'B10', '2024-10-31', 'BATCH-VEN-2023'),
('Zolpidem 10mg', 'Sleep aid', 'Psychiatric', 90, 11.99, 3, 'C11', '2025-03-15', 'BATCH-ZOL-2023'),
('Carvedilol 25mg', 'Beta blocker', 'Cardiac', 140, 8.75, 4, 'D12', '2024-12-31', 'BATCH-CAR-2023'),
('Finasteride 5mg', 'For hair loss', 'Dermatological', 110, 13.50, 5, 'E13', '2025-02-28', 'BATCH-FIN-2023'),
('Memantine 10mg', 'Alzheimer treatment', 'Neurological', 80, 19.25, 1, 'A10', '2024-11-15', 'BATCH-MEM-2023'),
('Rivaroxaban 20mg', 'Blood thinner', 'Cardiac', 100, 25.99, 2, 'B11', '2025-04-30', 'BATCH-RIV-2023'),
('Sitagliptin 100mg', 'Diabetes medication', 'Endocrine', 120, 18.50, 3, 'C12', '2024-10-15', 'BATCH-SIT-2023'),
('Valsartan 160mg', 'Blood pressure control', 'Cardiac', 150, 10.25, 4, 'D13', '2025-01-31', 'BATCH-VAL-2023'),
('Apixaban 5mg', 'Blood thinner', 'Cardiac', 90, 28.75, 5, 'E14', '2024-09-30', 'BATCH-API-2023');

INSERT INTO Purchase (purc_name, purc_descr,purc_categ,purc_QTY, purc_cost, purc_date, Mfg_date, exp_date, batch_number, sup_id)
VALUES
('Azithromycin 250mg', 'Macrolide antibiotic', 'Antibiotic', 200, 4200.00, '2023-11-10', '2023-10-01', '2025-08-31', 'BATCH-AZI-2023', 2),
('Dexamethasone 4mg', 'Corticosteroid', 'Anti-inflammatory', 150, 3750.00, '2023-11-15', '2023-10-10', '2025-09-30', 'BATCH-DEX-2023', 1),
('Ondansetron 4mg', 'Anti-nausea medication', 'Gastrointestinal', 300, 4500.00, '2023-11-20', '2023-10-15', '2025-10-31', 'BATCH-OND-2023', 3),
('Phenytoin 100mg', 'Anti-seizure medication', 'Neurological', 180, 5400.00, '2023-11-25', '2023-10-20', '2025-11-30', 'BATCH-PHE-2023', 4),
('Warfarin 3mg', 'Anticoagulant', 'Cardiac', 250, 6250.00, '2023-11-30', '2023-10-25', '2025-12-31', 'BATCH-WAR-2023', 5),
('Paracetamol 500mg', 'Pain relief tablets', 'Analgesic', 500, 2500.00, '2023-01-15', '2022-12-01', '2024-12-31', 'BATCH-PARA-2023', 1),
('Amoxicillin 250mg', 'Antibiotic capsules', 'Antibiotic', 300, 3750.00, '2023-02-20', '2023-01-10', '2025-06-30', 'BATCH-AMOX-2023', 2),
('Loratadine 10mg', 'Antihistamine tablets', 'Allergy', 400, 3500.00, '2023-03-10', '2023-02-15', '2024-09-30', 'BATCH-LORA-2023', 3),
('Omeprazole 20mg', 'Acid reducer capsules', 'Gastrointestinal', 250, 3812.50, '2023-04-05', '2023-03-01', '2025-03-31', 'BATCH-OME-2023', 4),
('Ibuprofen 200mg', 'Anti-inflammatory tablets', 'Pain Relief', 600, 4500.00, '2023-05-12', '2023-04-20', '2024-11-30', 'BATCH-IBU-2023', 5);

INSERT INTO Staff (first_name, last_name, age, sex, role, hire_date, salary, contact_number, email)
VALUES
('John', 'Smith', 35, 'M', 'Pharmacist', '2020-06-15', 75000.00, '555-2001', 'john.smith@pharmacy.com'),
('Sarah', 'Johnson', 28, 'F', 'Pharmacy Technician', '2021-03-22', 45000.00, '555-2002', 'sarah.j@pharmacy.com'),
('Michael', 'Williams', 42, 'M', 'Senior Pharmacist', '2018-11-05', 85000.00, '555-2003', 'michael.w@pharmacy.com'),
('Emily', 'Brown', 31, 'F', 'Pharmacist', '2019-09-14', 78000.00, '555-2004', 'emily.b@pharmacy.com'),
('David', 'Jones', 45, 'M', 'Pharmacy Manager', '2017-05-10', 95000.00, '555-2005', 'david.j@pharmacy.com');


Select * from Supplier;
Select * from Customer;
Select * from Staff;
Select * from Medication;
Select * from Purchase;
Select * from Customer_Invoice;
Select * from Sales;


-- Trigger for Update stock after purchase
CREATE TRIGGER trg_AfterPurchase
ON Purchase
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- For (new medications)
        INSERT INTO Medication (
            med_name, 
            description, 
            category, 
            stock_QTY, 
            unit_price, 
            sup_id, 
            rack_location, 
            expiry_date, 
            batch_number
        )
        SELECT 
            i.purc_name,
            i.purc_descr,
            i.purc_categ,
            i.purc_QTY,
            (i.purc_cost / i.purc_QTY),
            i.sup_id,
            'TEMP-LOCATION',
            i.exp_date,
            i.batch_number
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1 FROM Medication m 
            WHERE m.med_name = i.purc_name
        );
        
        -- Update existing medications
        UPDATE m
        SET 
            m.stock_QTY = m.stock_QTY + i.purc_QTY,
            m.expiry_date = CASE WHEN i.exp_date > m.expiry_date THEN i.exp_date ELSE m.expiry_date END,
            m.unit_price = (i.purc_cost / i.purc_QTY)
        FROM Medication m
        INNER JOIN inserted i ON m.med_name = i.purc_name;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

-- Stored Procedures
CREATE PROCEDURE sp_ProcessSale
	@first_name NVARCHAR(50),
    @last_name NVARCHAR(50),
    @med_name NVARCHAR(100),
    @quantity INT,
    @discount DECIMAL(5,2)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @price DECIMAL(10,2);
    DECLARE @total DECIMAL(10,2);
    DECLARE @sale_id INT;
    DECLARE @stock_available INT;
	DECLARE @med_id INT;
	DECLARE @cust_id INT;

	INSERT INTO Customer (first_name, last_name)
        VALUES (@first_name, @last_name);
        SET @cust_id = SCOPE_IDENTITY();

    -- Get current unit price and stock
    SELECT 
        @price = unit_price, 
        @stock_available = stock_QTY,
        @med_id = med_id
    FROM Medication 
    WHERE med_name = @med_name;

	 -- Check if medication exists
    IF NOT EXISTS (SELECT 1 FROM Medication WHERE med_name = @med_name)
    BEGIN
        RAISERROR('Medication not found in inventory', 16, 1);
        RETURN;
    END

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
    
    -- Check stock availability
    IF @stock_available < @quantity
    BEGIN
        RAISERROR('Insufficient stock!)',16, 1);
        RETURN;
    END
    
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Calculate total with discount
        SET @total = (@price * @quantity) * (1 - (@discount/100));
        
        -- Create sale record
        INSERT INTO Sales (cust_id,sale_date, discount,total_amount)
        VALUES (@cust_id,GETDATE(), @discount, @total);
        SET @sale_id = SCOPE_IDENTITY();
        
        -- Create invoice record
        INSERT INTO Customer_Invoice (cust_id, med_name, QTY, unit_price, discount, total_amount, sale_id,med_id)
        VALUES (@cust_id, @med_name, @quantity, @price, @discount, @total, @sale_id,@med_id);

		 -- Update stock levels 
        UPDATE Medication
        SET stock_QTY = stock_QTY - @quantity
        WHERE med_id = @med_id;
        COMMIT TRANSACTION;
        
        -- Return invoice details
        SELECT 
            @sale_id AS Sale_ID,
            @med_name AS Medicine_Name,
            @quantity AS QTY,
            @price AS Unit_Price,
            @discount AS Discount,
            @total AS Total_Amount,
            'Sale processed successfully' AS message;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
EXEC sp_ProcessSale
     @first_name = 'Muhammad',
     @last_name = 'Bilal',
	 @med_name = 'Paracetamol 500mg',
	 @quantity = 5,
	 @discount = 10.00;


-- Total sale 
CREATE PROCEDURE GetTotalSales
    @SaleDateFrom DATE,
    @SaleDateTo DATE
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        SUM(si.total_amount) AS TotalSales,
        AVG(si.total_amount) AS AverageSaleValue,
        COUNT(si.med_id) AS TotalItemsSold,
        SUM(m.unit_price * si.QTY) - SUM(si.total_amount) AS TotalDiscountsGiven,
		SUM(m.unit_price * si.QTY) AS PotentialRevenue
    FROM Customer_Invoice si
    JOIN Sales s ON si.sale_id = s.sale_id
    JOIN Medication m ON si.med_id = m.med_id
    WHERE s.sale_date BETWEEN @SaleDateFrom AND @SaleDateTo;
END;
EXEC GetTotalSales 
             @SaleDateFrom = '2025-05-20',
             @SaleDateTo   = '2025-06-20';

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
        m.stock_QTY,
        m.category,
        m.unit_price,
        m.rack_location,
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
SELECT * FROM dbo.GetMedicationSupplierInfo(1);


-- Sample Queries
-- check for expiry date
SELECT 
    med_id,
    med_name,
    batch_number,
    expiry_date,
    DATEDIFF(DAY, GETDATE(), expiry_date) AS days_until_expiry
FROM Medication
WHERE expiry_date BETWEEN GETDATE() AND DATEADD(MONTH, 2, GETDATE())
ORDER BY expiry_date;

-- Current stock levels
SELECT m.med_id, m.med_name, m.stock_QTY, m.expiry_date
FROM Medication m
WHERE m.stock_QTY >= 1
ORDER BY m.stock_QTY ASC;

-- Daily sales report
SELECT 
    CAST(s.sale_date AS DATE) AS Sale_Date,
    COUNT(*) AS total_transactions,
    SUM(s.total_amount) AS Total_Sales,
    AVG(s.total_amount) AS Average_Aale
FROM Sales s
GROUP BY CAST(s.sale_date AS DATE)
ORDER BY Sale_Date DESC;

-- Customer purchase history
SELECT 
    c.cust_id,
    c.first_name + ' ' + c.last_name AS Customer_Name,
    COUNT(s.sale_id) AS Total_Purchases,
    SUM(s.total_amount) AS Total_Spent
FROM Customer c
LEFT JOIN Sales s ON c.cust_id = s.cust_id
GROUP BY c.cust_id, c.first_name, c.last_name
ORDER BY Total_Spent DESC;

--Update rack_location
UPDATE Medication
SET rack_location = 'A11'
where med_id = 51;


-- Views
-- Current inventory status
CREATE VIEW vw_InventoryStatus AS
SELECT 
    m.med_id,
    m.med_name,
    m.category,
    m.stock_QTY,
    m.unit_price,
    m.expiry_date,
    m.batch_number,
    m.rack_location,
    DATEDIFF(DAY, GETDATE(), m.expiry_date) AS days_until_expiry,
    s.sup_name AS supplier_name,
    s.phone AS supplier_phone,
    CASE 
    WHEN m.stock_QTY <= 0 THEN 'Out of Stock'
    WHEN m.expiry_date IS NOT NULL AND m.expiry_date < GETDATE() THEN 'Expired'
    WHEN m.stock_QTY <= 50 THEN 'Low Stock'
    WHEN m.expiry_date IS NOT NULL AND DATEDIFF(DAY, GETDATE(), m.expiry_date) <= 30 THEN 'Expiring Soon'
    ELSE 'In Stock'
END AS status
FROM Medication m
LEFT JOIN Supplier s ON m.sup_id = s.sup_id;

-- Sales summary (corrected)
CREATE VIEW vw_SalesSummary AS
SELECT 
    YEAR(s.sale_date) AS year,
    MONTH(s.sale_date) AS month,
    SUM(s.total_amount) AS total_sales,
    SUM(s.total_amount * s.discount/100) AS total_discounts,
    SUM(si.QTY) AS total_units_sold
FROM Sales s
JOIN Customer_Invoice si ON s.sale_id = si.sale_id
GROUP BY YEAR(s.sale_date), MONTH(s.sale_date);


-- index on supplier
CREATE INDEX idx_supplier_name ON Supplier(sup_name);
CREATE INDEX idx_supplier_company ON Supplier(company_name);
--  index on medication
CREATE INDEX idx_medication_name ON Medication(med_name);
CREATE INDEX idx_medication_category ON Medication(category);
CREATE INDEX idx_medication_supplier ON Medication(sup_id);
CREATE INDEX idx_medication_stock ON Medication(stock_QTY);
CREATE INDEX idx_medication_expiry ON Medication(expiry_date);
CREATE INDEX idx_medication_location ON Medication(rack_location);

-- index on sales
CREATE INDEX idx_sales_customer ON Sales(cust_id);
CREATE INDEX idx_sales_date ON Sales(sale_date);
CREATE INDEX idx_sales_total ON Sales(total_amount);

-- index on Customer_invoice
CREATE INDEX idx_invoice_sale ON Customer_Invoice(sale_id);
CREATE INDEX idx_invoice_customer ON Customer_Invoice(Cust_id);
CREATE INDEX idx_invoice_medication ON Customer_Invoice(med_id);
CREATE INDEX idx_invoice_discount ON Customer_Invoice(discount);

--  index on customer
CREATE INDEX idx_customer_name ON Customer(last_name, first_name);

-- index on purchase
CREATE INDEX idx_purchase_supplier ON Purchase(sup_id);
CREATE INDEX idx_purchase_date ON Purchase(purc_date);
CREATE INDEX idx_purchase_expiry ON Purchase(exp_date);