/*
Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.

airbnb_hosts
host_id:      int
nationality:  varchar
gender:       varchar
age:          int

airbnb_guests
guest_id:     int
nationality:  varchar
gender:       varchar
age:          int
*/

SELECT DISTINCT host.host_id, guest.guest_id  
FROM airbnb_hosts AS host
JOIN airbnb_guests AS guest ON host.nationality = guest.nationality AND
     host.gender = guest.gender;



