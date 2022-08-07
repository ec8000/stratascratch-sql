/*
What were the top 10 ranked songs in 2010?
Output the rank, group name, and song name but do not show the same song twice.
Sort the result based on the year_rank in ascending order.

billboard_top_100_year_end
id:         int
year:       int
year_rank:  int
group_name: varchar
artist:     varchar
song_name:  varchar
*/

SELECT 
    group_name, 
    song_name, 
    year_rank 
FROM billboard_top_100_year_end
WHERE year = 2010 AND year_rank <= 10
GROUP BY group_name, song_name, year_rank 
ORDER BY year_rank ASC;
