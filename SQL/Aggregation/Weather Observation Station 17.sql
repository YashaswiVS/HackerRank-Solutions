SELECT ROUND(MIN(long_w), 4) from station where lat_n = (
    SELECT MIN(LAT_N)
    FROM STATION where lat_n >38.7780
)