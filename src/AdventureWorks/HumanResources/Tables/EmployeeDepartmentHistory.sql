CREATE TABLE [HumanResources].[EmployeeDepartmentHistory] (
    [BusinessEntityID] INT      NOT NULL,
    [DepartmentID]     SMALLINT NOT NULL,
    [ShiftID]          TINYINT  NOT NULL,
    [StartDate]        DATE     NOT NULL,
    [EndDate]          DATE     NULL,
    [ModifiedDate]     DATETIME CONSTRAINT [DF_EmployeeDepartmentHistory_ModifiedDate] DEFAULT (getdate()) NOT NULL,

    CONSTRAINT [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [StartDate] ASC, [DepartmentID] ASC, [ShiftID] ASC),
    CONSTRAINT [CK_EmployeeDepartmentHistory_EndDate] CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL),
    CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [HumanResources].[Department] ([DepartmentID]),
    CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID]),
    CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID] FOREIGN KEY ([ShiftID]) REFERENCES [HumanResources].[Shift] ([ShiftID])
);


GO

--For in-memory optimized table, change NONCLUSTERED INDEX to NONCLUSTERED HAS INDEX WITH (BUCKET_COUNT = xxxxxx)
CREATE NONCLUSTERED INDEX [IX_EmployeeDepartmentHistory_DepartmentID]
    ON [HumanResources].[EmployeeDepartmentHistory]([DepartmentID] ASC);


GO

--For in-memory optimized table, change NONCLUSTERED INDEX to NONCLUSTERED HAS INDEX WITH (BUCKET_COUNT = xxxxxx)
CREATE NONCLUSTERED INDEX [IX_EmployeeDepartmentHistory_ShiftID]
    ON [HumanResources].[EmployeeDepartmentHistory]([ShiftID] ASC);


GO
