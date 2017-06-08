--Sproc: Get direct manager using hierarchyID.GetAncestor function.
--BusinessEntityID is required parameter.
--The result must have a single entry except for CEO node.

-- For Natively compiled SP, add WITH NATIVE_COMPILATION option

CREATE PROCEDURE [HumanResources].[uspGetDirectManager]
    @BusinessEntityID int
AS
select 
    m.[BusinessEntityID] 	
	, m.[NationalIDNumber] 	
	, m.[LoginID] 	
	, m.[OrganizationNode]
	, m.[OrganizationLevel]
    , m.[Title]
    , m.[FirstName]
    , m.[MiddleName]
    , m.[LastName]
    , m.[Suffix]
    , m.[JobTitle]  
    , m.[PhoneNumber]
    , m.[PhoneNumberType]
    , m.[EmailAddress]
    , m.[EmailPromotion]
    , m.[AddressLine1]
    , m.[AddressLine2]
    , m.[City]
    , m.[StateProvinceName] 
    , m.[PostalCode]
    , m.[CountryRegionName] 
    , m.[AdditionalContactInfo]
	, m.[DepartmentID]
	, m.[GroupName]
	, m.[DepartmentName]
FROM [HumanResources].[vEmployee] m
    INNER JOIN [HumanResources].[vEmployee] e
    ON m.[OrganizationNode] = e.[OrganizationNode].GetAncestor(1)
where e.[BusinessEntityID] = @BusinessEntityID
RETURN 0
