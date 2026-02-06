IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Inventory')
BEGIN
    CREATE TABLE Inventory (
        Id INT PRIMARY KEY, 
        ItemName NVARCHAR(50), 
        Quantity INT,
        LastUpdated DATETIME DEFAULT GETDATE()
    );
END