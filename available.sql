CREATE VIEW available
AS SELECT listings.id as id , listings.property_type as property_type, listings.host_name as host_name ,
availabilities.date as date  FROM listings JOIN availabilities
ON listings.id = availabilities.listing_id
WHERE availabilities.available = "TRUE";
