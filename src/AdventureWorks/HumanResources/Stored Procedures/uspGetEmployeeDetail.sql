CREATE PROCEDURE [HumanResources].[uspGetEmployeeDetail]
    @BusinessEntityID int

AS
SELECT
    e.[BusinessEntityID]
	, e.[NationalIDNumber]
	, e.[LoginID]
	, e.[OrganizationNode]
	, e.[OrganizationLevel]
    , p.[Title]
    , p.[FirstName]
    , p.[MiddleName]
    , p.[LastName]
    , p.[Suffix]
    , e.[JobTitle]  
    , pp.[PhoneNumber]
    , pnt.[Name] AS [PhoneNumberType]
    , ea.[EmailAddress]
    , p.[EmailPromotion]
    , a.[AddressLine1]
    , a.[AddressLine2]
    , a.[City]
    , sp.[Name] AS [StateProvinceName] 
    , a.[PostalCode]
    , cr.[Name] AS [CountryRegionName] 
    , p.[AdditionalContactInfo]
	, d.[DepartmentID]
	, d.[GroupName]
	, d.[Name] as DepartmentName
FROM [HumanResources].[Employee] e
    INNER JOIN [Person].[Person] p
    ON p.[BusinessEntityID] = e.[BusinessEntityID]
    INNER JOIN [Person].[BusinessEntityAddress] bea
    ON bea.[BusinessEntityID] = e.[BusinessEntityID]
    INNER JOIN [Person].[AddressRename] a
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    LEFT OUTER JOIN [Person].[PersonPhone] pp
    ON pp.BusinessEntityID = p.[BusinessEntityID]
    LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
    ON pp.[PhoneNumberTypeID] = pnt.[PhoneNumberTypeID]
    LEFT OUTER JOIN [Person].[EmailAddress] ea
    ON p.[BusinessEntityID] = ea.[BusinessEntityID]
    INNER JOIN [HumanResources].[EmployeeDepartmentHistory] edh
    ON e.[BusinessEntityID] = edh.[BusinessEntityID]
    INNER JOIN [HumanResources].[Department] d
    ON edh.[DepartmentID] = d.[DepartmentID]
WHERE edh.EndDate IS NULL and e.[BusinessEntityID] = @BusinessEntityID
RETURN 0
