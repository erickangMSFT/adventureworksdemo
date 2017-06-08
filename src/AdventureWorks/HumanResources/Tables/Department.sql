
CREATE TABLE [HumanResources].[Department] (

    [DepartmentID] SMALLINT     IDENTITY (1, 1) NOT NULL,

	--For In-memory optimized table change UDT to NVARCHAR(50) for [Name] and [GroupName]
    [Name]         [dbo].[Name] NOT NULL,

    [GroupName]    [dbo].[Name] NOT NULL,


    [ModifiedDate] DATETIME     CONSTRAINT [DF_Department_ModifiedDate] DEFAULT (getdate()) NOT NULL,

	
    CONSTRAINT [PK_Department_DepartmentID] PRIMARY KEY CLUSTERED ([DepartmentID] ASC) 
   
);


GO


CREATE UNIQUE NONCLUSTERED INDEX [AK_Department_Name]
    ON [HumanResources].[Department]([Name] ASC);


GO
