--cleaning Data in SQL

select * from Nashville

select * from Nashville
--where PropertyAddress is null
order by ParcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
from Nashville a
JOIN Nashville b
    on a.ParcelID = b.ParcelID
    and a.UniqueID <> b.UniqueID
where a.PropertyAddress is null

update a
set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from Nashville a
JOIN Nashville b
    on a.ParcelID = b.ParcelID
    and a.UniqueID <> b.UniqueID
where a.PropertyAddress is null

select PropertyAddress
from Nashville
--where PropertyAddress is null
--order by ParcelID

select
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress)) as Address
from dbo.Nashville

alter table Nashville 
add PropertySplitAddress Nvarchar(255);

update Nashville
set PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )

alter table Nashville 
add PropertySplitCity Nvarchar(255);

update Nashville
set PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress))

select *
from Nashville

select OwnerAddress
from Nashville

select PARSENAME(replace(OwnerAddress, ',','.'),3),
PARSENAME(replace(OwnerAddress, ',','.'),2),
PARSENAME(replace(OwnerAddress, ',','.'),1)
from dbo.Nashville

alter table Nashville 
add OwnerSplitAddress Nvarchar(255);

update Nashville
set OwnerSplitAddress = PARSENAME(replace(OwnerAddress, ',','.'),3)

alter table Nashville 
add OwnerSplitCity Nvarchar(255);

update Nashville
set OwnerSplitCity = PARSENAME(replace(OwnerAddress, ',','.'),2)

alter table Nashville 
add OwnerSplitState Nvarchar(255);

update Nashville
set OwnerSplitState = PARSENAME(replace(OwnerAddress, ',','.'),1)

select * from dbo.Nashville

drop PropertySplitAddres
from dbo.Nashville

select distinct(SoldAsVacant), count(SoldAsVacant)
from dbo.Nashville
group by SoldAsVacant
order by 2

select SoldAsVacant, 
CASE When SoldAsVacant = 'Y' THEN 'Yes'
     When SoldAsVacant = 'N' THEN 'No'
     Else SoldAsVacant
     END
from dbo.Nashville

update Nashville
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
     When SoldAsVacant = 'N' THEN 'No'
     Else SoldAsVacant
     END
from dbo.Nashville


-- remove duplicates

WITH RowNumCTE AS(
select *,
    ROW_NUMBER() OVER (
    PARTITION BY ParcelID,
                 PropertyAddress,
                 SalePrice,
                 SaleDate,
                 LegalReference
                 ORDER BY 
                    UniqueID 
                     ) row_num
from dbo.Nashville
--order by ParcelID
)
select *
from RowNumCTE
where row_num > 1
--order by PropertyAddress

ALTER TABLE dbo.Nashville
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER TABLE dbo.Nashville
DROP COLUMN SaleDate

select * from Nashville

