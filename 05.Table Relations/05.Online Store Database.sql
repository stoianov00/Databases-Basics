CREATE TABLE Cities(
    CityID INT NOT NULL,
    Name VARCHAR(50) NOT NULL
    CONSTRAINT PK_CityID PRIMARY KEY (CityID)
)

CREATE TABLE Customers(
    CustomerID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Birthday DATE,
    CityID INT NOT NULL
    CONSTRAINT PK_CustomerID PRIMARY KEY (CustomerID)
    CONSTRAINT FK_Customers_CityID FOREIGN KEY (CityID) REFERENCES Cities (CityID)
)

CREATE TABLE Orders(
    OrderID INT NOT NULL,
    CustomerID INT NOT NULL
    CONSTRAINT PK_OrderID PRIMARY KEY (OrderID) 
    CONSTRAINT FK_Orders_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
)

CREATE TABLE ItemTypes(
    ItemTypeID INT NOT NULL,
    Name VARCHAR(50) NOT NULL
    CONSTRAINT PK_ItemTypeID PRIMARY KEY (ItemTypeID)
)

CREATE TABLE Items(
    ItemID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    ItemTypeID INT NOT NULL 
    CONSTRAINT PK_ItemID PRIMARY KEY (ItemID)
    CONSTRAINT FK_Items_ItemTypeID FOREIGN KEY (ItemTypeID) REFERENCES ItemTypes (ItemTypeID)
)

CREATE TABLE OrderItems(
    OrderID INT NOT NULL,
    ItemID INT NOT NULL
    CONSTRAINT PK_OrderItems PRIMARY KEY (OrderID, ItemID),
    CONSTRAINT FK_OrderItems_OrderID FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    CONSTRAINT FK_OrderItems_ItemID FOREIGN KEY (ItemID) REFERENCES Items (ItemID)
)
