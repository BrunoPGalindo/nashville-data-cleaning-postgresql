SELECT *
FROM nashville_housing

-------------------------------------------------------------------------------------------

-- padronizacao da data

SELECT saledate
FROM nashville_housing -- estilo da data antiga: "2013-04-09 00:00:00"

SELECT saledate::date
FROM nashville_housing

ALTER TABLE nashville_housing
ALTER COLUMN saledate TYPE DATE
USING saledate::date -- estilo da data nova: "2013-04-09"

-------------------------------------------------------------------------------------------

-- populando os dados de endereço (propertyaddress)

SELECT propertyaddress
FROM nashville_housing

SELECT propertyaddress
FROM nashville_housing
WHERE propertyaddress IS NULL

SELECT *
FROM nashville_housing
ORDER BY parcelid

-- através do parcelid nós conseguiremos popular os endereços que tem o mesmo parcelid mas não estão
-- com o propertyaddress preenchido
-- "018 07 0 045.00"	"SINGLE FAMILY"	"202	LUCIEN RD, GOODLETTSVILLE"
-- "018 07 0 045.00"	"SINGLE FAMILY"	"202	LUCIEN RD, GOODLETTSVILLE"

SELECT a.parcelid, a.propertyaddress, b.parcelid, b.propertyaddress, COALESCE(a.propertyaddress, b.propertyaddress)
FROM nashville_housing AS a
JOIN nashville_housing AS b
	ON a.parcelid = b.parcelid
	AND a.uniqueid <> b.uniqueid
WHERE a.propertyaddress IS NULL

-- rodar um update para popular os valores nulos

UPDATE nashville_housing
SET propertyaddress = b.propertyaddress
FROM nashville_housing AS b
WHERE
    nashville_housing.parcelid = b.parcelid
    AND nashville_housing.uniqueid <> b.uniqueid
    AND nashville_housing.propertyaddress IS NULL;

-------------------------------------------------------------------------------------------

-- separar o endereço em colunas individuais (endereço, cidade, Estado)

SELECT propertyaddress
FROM nashville_housing -- atual: "1808  FOX CHASE DR, GOODLETTSVILLE"

SELECT SPLIT_PART(propertyaddress, ',', 1) AS property_split_address
FROM nashville_housing -- resultado: "1808  FOX CHASE DR"

SELECT SPLIT_PART(propertyaddress, ',', 2) AS property_split_city
FROM nashville_housing -- resultado: "GOODLETTSVILLE"

SELECT SPLIT_PART(owneraddress, ',', 1) AS owner_split_address
FROM nashville_housing; -- resultado: "1808  FOX CHASE DR"

SELECT SPLIT_PART(owneraddress, ',', 2) AS owner_split_city
FROM nashville_housing; -- resultado: "GOODLETTSVILLE"

SELECT SPLIT_PART(owneraddress, ',', 3) AS owner_split_state
FROM nashville_housing; -- resultado: "TN"

-- adicionando as novas colunas

ALTER TABLE nashville_housing
ADD COLUMN property_split_address VARCHAR(255);

ALTER TABLE nashville_housing
ADD COLUMN property_split_city VARCHAR(255);

ALTER TABLE nashville_housing
ADD COLUMN owner_split_address VARCHAR(255);

ALTER TABLE nashville_housing
ADD COLUMN owner_split_city VARCHAR(255);

ALTER TABLE nashville_housing
ADD COLUMN owner_split_state VARCHAR(255);

-- populando as novas colunas

UPDATE nashville_housing
SET property_split_address = SPLIT_PART(propertyaddress, ',', 1)

UPDATE nashville_housing
SET property_split_city = SPLIT_PART(propertyaddress, ',', 2)

UPDATE nashville_housing
SET owner_split_address = SPLIT_PART(owneraddress, ',', 1)

UPDATE nashville_housing
SET owner_split_city = SPLIT_PART(owneraddress, ',', 2)

UPDATE nashville_housing
SET owner_split_state = SPLIT_PART(owneraddress, ',', 3)

-------------------------------------------------------------------------------------------

-- campo "soldasvacant" ser 'Yes' ou 'No'

SELECT DISTINCT(soldasvacant), COUNT(soldasvacant)
FROM nashville_housing
GROUP BY soldasvacant
ORDER BY 2

-- "Y" 52
-- "N" 399
-- "Yes" 4623
-- "No" 51403

SELECT soldasvacant
, CASE WHEN soldasvacant = 'Y' THEN 'Yes'
	WHEN soldasvacant = 'N' THEN 'No'
	ELSE soldasvacant
	END
FROM nashville_housing

UPDATE nashville_housing
SET soldasvacant = CASE
    WHEN soldasvacant = 'Y' THEN 'Yes'
    WHEN soldasvacant = 'N' THEN 'No'
    ELSE soldasvacant
END

-- "Yes"	4675
-- "No"		51802

-------------------------------------------------------------------------------------------

-- removendo duplicadas
-- se o dado tem o mesmo parcelid, propertyaddress, saleprice, saledate, saledate logo, ele vai ser
-- um dado duplicado e removido

WITH row_num_cte AS (
SELECT *
	, row_number() OVER(
		PARTITION BY parcelid
		, propertyaddress
		, saleprice
		, saledate
		, legalreference
	ORDER BY uniqueid
) AS row_num
FROM nashville_housing
)

SELECT *
FROM row_num_cte
WHERE row_num > 1
ORDER BY propertyaddress

-- caso 'row_num' > 1, é uma linha duplicada, logo, queremos deletá-la

WITH row_num_cte AS (
SELECT *
	, row_number() OVER(
		PARTITION BY parcelid
		, propertyaddress
		, saleprice
		, saledate
		, legalreference
	ORDER BY uniqueid
) AS row_num
FROM nashville_housing
)

DELETE FROM nashville_housing
USING row_num_cte
WHERE
    nashville_housing.uniqueid = row_num_cte.uniqueid
    AND row_num_cte.row_num > 1;

-------------------------------------------------------------------------------------------

-- deletando colunas que não serão utilizadas (caso queira)

SELECT *
FROM nashville_housing

ALTER TABLE nashville_housing
	DROP COLUMN owneraddress
	, DROP COLUMN taxdistrict
	, DROP COLUMN propertyaddress
	, DROP COLUMN saledate



