CREATE TABLE Farmers (
    FarmerID INT PRIMARY KEY,
    FarmerName VARCHAR(100),
    ContactInformation VARCHAR(100),
    FarmSize FLOAT,
    MembershipStatus VARCHAR(50),
    CONSTRAINT chk_membership_status CHECK (MembershipStatus IN ('premium', 'basic', 'average'))
);


CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    FarmerID INT,
    StreetAddress VARCHAR(255),
    City VARCHAR(100),
    Province VARCHAR(100),
    Sector VARCHAR(20),
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
);

CREATE TABLE Crops (
    CropID INT PRIMARY KEY,
    CropName VARCHAR(100),
    CropType VARCHAR(100),
    PlantingDate DATE,
    HarvestDate DATE,
    FarmerID INT,
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
);

CREATE TABLE HarvestQuantity (
    HarvestID INT PRIMARY KEY,
    CropID INT,
    HarvestDate DATE,
    QuantityHarvested FLOAT,
    Units VARCHAR(50),
    Quality VARCHAR(50),
    MarketDestination VARCHAR(100),
    FOREIGN KEY (CropID) REFERENCES Crops(CropID)
);

CREATE TABLE Supervisor (
    SupervisorID INT PRIMARY KEY,
    SupervisorName VARCHAR(100),
    Contact VARCHAR(100),
    District VARCHAR(100),
    FarmerID INT,
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
);
