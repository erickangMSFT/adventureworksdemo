--test comment for SCM

CREATE PROCEDURE [HumanResources].[uspGetDirectReports]
    @BusinessEntityID int
AS
DECLARE @hid hierarchyid
SET @hid = (SELECT Top (1)
    m.[OrganizationNode]
from [HumanResources].[vEmployee] m
where m.[BusinessEntityID] = @BusinessEntityID)

SELECT
    e.[BusinessEntityID]
	, e.[NationalIDNumber]
	, e.[LoginID]
	, e.[OrganizationNode]
	, e.[OrganizationLevel]
    , e.[Title]
    , e.[FirstName]
    , e.[MiddleName]
    , e.[LastName]
    , e.[Suffix]
    , e.[JobTitle]  
    , e.[PhoneNumber]
    , e.[PhoneNumberType]
    , e.[EmailAddress]
    , e.[EmailPromotion]
    , e.[AddressLine1]
    , e.[AddressLine2]
    , e.[City]
    , e.[StateProvinceName] 
    , e.[PostalCode]
    , e.[CountryRegionName] 
    , e.[AdditionalContactInfo]
	, e.[DepartmentID]
	, e.[GroupName]
	, e.[DepartmentName]
FROM [HumanResources].[vEmployee] e
WHERE e.[OrganizationNode].GetAncestor(1) = @hid
RETURN 0
