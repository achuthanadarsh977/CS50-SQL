CREATE VIEW frequently_reviewed
AS SELECT listings.id , listings.property_type , listings.host_name
, MAX(reviews.listing_id) as review FROM listings JOIN reviews
ON listings.id = reviews.listing_id
ORDER BY property_type ASC ,host_name ASC
LIMIT 100;
