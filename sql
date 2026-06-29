CREATE TABLE Farmer (
    FarmerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    Phone VARCHAR(20)
);
CREATE TABLE Farm (
    FarmID INT PRIMARY KEY,
    Location VARCHAR(100),
    Size FLOAT,         
    Type VARCHAR(50)   
    );
CREATE TABLE Crop (
    CropID INT PRIMARY KEY,
    Name VARCHAR(50),
    HarvestTime DATE,
    Season VARCHAR(20) 
);
CREATE TABLE Equipment (
    EquipementID INT PRIMARY KEY,
    Name VARCHAR(50),
    Type VARCHAR(30),
    Status VARCHAR(20)  
);
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    CropID INT,
    Quantity INT,
    DateHarvested DATE,
    FOREIGN KEY (CropID) REFERENCES Crop(CropID)
    );

INSERT INTO Farmer (FarmerID, Name, Address, Phone) VALUES
 (1, 'Ali Ben Salem', 'Rue El Jazeera, Tunis', '555-1234'),
 (2, 'Mouna Trabelsi', 'Avenue Habib Bourguiba, Sfax', '555-5678'),
 (3, 'Sami Bouazizi', 'Route de Gabes, Sousse', '555-9012');


INSERT INTO Farm (FarmID, Location, Size, Type) VALUES
 (101, 'Kairouan', 12.5, 'Crop'),
 (102, 'Nabeul', 8.0, 'Livestock'),
 (103, 'Beja', 20.0, 'Mixed'),
 (104, 'Mahdia', 5.5, 'Crop');


INSERT INTO Crop (CropID, Name, HarvestTime, Season) VALUES
 (201, 'Wheat', '2025-06-15', 'Spring'),
 (202, 'Tomato', '2025-07-10', 'Summer'),
 (203, 'Olive', '2025-10-01', 'Autumn'),
 (204, 'Potato', '2025-04-20', 'Spring');


INSERT INTO Equipment (EquipmentID, Name, Type, Status) VALUES
 (301, 'Tractor A', 'Tractor', 'Available'),
 (302, 'Harvester X', 'Harvester', 'In Use'),
 (303, 'Sprayer Z', 'Sprayer', 'Maintenance'),
 (304, 'Plow Y', 'Plow', 'Available');


INSERT INTO Product (ProductID, CropID, Quantity, DateHarvested) VALUES
 (401, 201, 1000, '2025-06-01'),
 (402, 202, 750, '2025-05-28'),
 (403, 203, 500, '2025-06-02'),
 (404, 204, 1200, '2025-05-30');


SELECT * FROM Farm WHERE Location = 'Beja';


SELECT Name, Type FROM Equipment WHERE Status = 'Available';


SELECT Crop.Name AS Crop_Name, 
       SUM(Product.Quantity) AS TotalHarvested
FROM Product
Natural JOIN Crop ON Product.CropID = Crop.CropID
GROUP BY Crop.Name;

Update Equipment Set Status='Under Maintenance' Where equipmentId= 303; 

DELETE FROM Product
WHERE CropID IN (
    SELECT CropID FROM Crop WHERE Season = 'Autumn'
);


INSERT INTO Product (ProductID, CropID, Quantity, DateHarvested)
SELECT 501, CropID, 100, '2025-06-04'
FROM Crop
WHERE Name = 'Wheat';

SELECT Farmer.Name, Farm.Location
FROM Farmer
Narural JOIN Farm ON Farmer.FarmerID = Farm.FarmID
WHERE Farm.Type = 'Mixed';

SELECT Farm.Location, COUNT(Equipment.EquipmentID) AS Equipment_Count
FROM Farm
 JOIN Equipment ON Farm.FarmID = Equipment.FarmID
GROUP BY Farm.Location;






