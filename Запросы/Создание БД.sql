use [20.101-09-Restaurant]

go 
CREATE TABLE [dbo].[Employees](
		[EmployeesID] [int] PRIMARY KEY NOT NULL,
		[EmployeesName] [nvarchar] (50) NOT NULL,
		[EmployeesPatronymic] [nvarchar] (50),
		[EmployeesSurname] [nvarchar] (50) NOT NULL,
		)
		go

go 
CREATE TABLE [dbo].[Posts](
		[PostsID] [int] PRIMARY KEY NOT NULL,
		[PostsName] [nvarchar] (50) NOT NULL,
		[PostsSalary] [decimal] (8,2) NOT NULL,
		)
		go

go 
CREATE TABLE [dbo].[EmployeeInformation](
		[EmployeeInformationID] [int] PRIMARY KEY NOT NULL,
		[EmployeeInformationBorn] [date] NOT NULL,
		[EmployeeInformationTel] [nvarchar] (15) NOT NULL,
		[EmployeeInformationSeries] [nvarchar] (4) NOT NULL,
		[EmployeeInformationNumber] [nvarchar] (6) NOT NULL,
		[EmployeeInformationPostsID] [int] NOT NULL,
		CONSTRAINT FK_EmployeeInformation_Employees FOREIGN KEY (EmployeeInformationID)
		REFERENCES [Employees] (EmployeesID),
		CONSTRAINT FK_EmployeeInformation_Posts FOREIGN KEY (EmployeeInformationPostsID)
		REFERENCES [Posts] (PostsID)
		)
		go

go 
CREATE TABLE [dbo].[Authorization](
		[AuthorizationID] [int] PRIMARY KEY NOT NULL,
		[AuthorizationLogin] [nvarchar] (50) NOT NULL,
		[AuthorizationPassword] [nvarchar] (300) NOT NULL,
		CONSTRAINT FK_Authorization_EmployeeInformation FOREIGN KEY (AuthorizationID)
		REFERENCES [EmployeeInformation] (EmployeeInformationID)
		)
		go

go 
CREATE TABLE [dbo].[OrderStatus](
		[OrderStatusID] [int] PRIMARY KEY NOT NULL,
		[OrderStatusName] [nvarchar] (15) NOT NULL,
		)
		go

go 
CREATE TABLE [dbo].[TablesStatus](
		[TablesID] [int] PRIMARY KEY NOT NULL,
		[TablesStatusName] [nvarchar] (15) NOT NULL,
		)
		go

go 
CREATE TABLE [dbo].[Tables](
		[TablesID] [int] PRIMARY KEY NOT NULL,
		[TablesNumberOfSeats] [int]  NOT NULL,
		[TablesStatusID] [int]  NOT NULL,
		CONSTRAINT FK_Tables_TablesStatus FOREIGN KEY (TablesStatusID)
		REFERENCES [TablesStatus] (TablesID)
		)
		go

go 
CREATE TABLE [dbo].[Orders](
		[OrdersID] [int] PRIMARY KEY NOT NULL,
		[OrdersCost] [decimal] (8,2) NOT NULL,
		[OrdersStatusID] [int] NOT NULL,
		[OrdersTablesID] [int] NOT NULL,
		CONSTRAINT FK_Orders_OrderStatus FOREIGN KEY (OrdersStatusID)
		REFERENCES [OrderStatus] (OrderStatusID),
		CONSTRAINT FK_Orders_Tables FOREIGN KEY (OrdersTablesID)
		REFERENCES [Tables] (TablesID)
		)
		go

go 
CREATE TABLE [dbo].[Check](
		[CheckID] [int] PRIMARY KEY NOT NULL,
		[EmployeeID] [int] NOT NULL,
		[OrderID] [int] NOT NULL,
		[CheckDate] [date] NOT NULL,
		CONSTRAINT FK_Check_Employees FOREIGN KEY (EmployeeID)
		REFERENCES [Employees] (EmployeesID),
		CONSTRAINT FK_Check_Orders FOREIGN KEY (OrderID)
		REFERENCES [Orders] (OrdersID)
		)
		go

go 
CREATE TABLE [dbo].[TypeOfTheDishes](
		[TypeOfTheDishesID] [int] PRIMARY KEY NOT NULL,
		[TypeOfTheDishesName] [nvarchar] (50)  NOT NULL,
		)
		go

go 
CREATE TABLE [dbo].[Dishes](
		[DishesID] [int] PRIMARY KEY NOT NULL,
		[DishesName] [nvarchar] (50)  NOT NULL,
		[DishesCost] [decimal] (8,2)  NOT NULL,
		[TypeOfTheDishesID] [int]  NOT NULL,
		[WeightOfTheDish] [decimal] (8,3)  NOT NULL,
		CONSTRAINT FK_Dishes_TypeOfTheDishes FOREIGN KEY (TypeOfTheDishesID)
		REFERENCES [TypeOfTheDishes] (TypeOfTheDishesID)
		)
		go


go 
CREATE TABLE [dbo].[OrderDishes](
		[OrderDishesID] [int] PRIMARY KEY NOT NULL,
		[OrdersID] [int]  NOT NULL,
		[DishesID] [int]  NOT NULL,
		CONSTRAINT FK_OrderDishes_Orders FOREIGN KEY (OrdersID)
		REFERENCES [Orders] (OrdersID),
		CONSTRAINT FK_OrderDishes_Dishes FOREIGN KEY (DishesID)
		REFERENCES [Dishes] (DishesID)
		)
		go

go 
CREATE TABLE [dbo].[Products](
		[ProductsID] [int] PRIMARY KEY NOT NULL,
		[ProductsName] [nvarchar] (50)  NOT NULL,
		[ProductsCost] [decimal] (8,2)  NOT NULL,
		[ProductsBestBeforeDate] [nvarchar] (15)  NOT NULL,
		[ProductsWeight] [decimal] (8,3)  NOT NULL,
		)
		go

go 
CREATE TABLE [dbo].[ConsituentDishes](
		[ConsituentDishesID] [int] PRIMARY KEY NOT NULL,
		[DishesID] [int]  NOT NULL,
		[ProductID] [int]  NOT NULL,
		CONSTRAINT FK_ConsituentDishes_Dishes FOREIGN KEY (DishesID)
		REFERENCES [Dishes] (DishesID),
		CONSTRAINT FK_ConsituentDishes_Products FOREIGN KEY (ProductID)
		REFERENCES [Products] (ProductsID)
		)
		go

go 
CREATE TABLE [dbo].[Purchases](
		[PurchasesID] [int] PRIMARY KEY NOT NULL,
		[PurchasesDate] [date]  NOT NULL,
		)
		go

go 
CREATE TABLE [dbo].[PurchasesProducts](
		[PurchasesProductsID] [int] PRIMARY KEY NOT NULL,
		[PurchasesID] [int]  NOT NULL,
		[ProductsID] [int]  NOT NULL,
		CONSTRAINT FK_PurchasesProducts_Products FOREIGN KEY (ProductsID)
		REFERENCES [Products] (ProductsID),
		CONSTRAINT FK_PurchasesProducts_Purchases FOREIGN KEY (PurchasesID)
		REFERENCES [Purchases] (PurchasesID)
		)
		go