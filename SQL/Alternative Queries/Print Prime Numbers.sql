DELIMITER $$

CREATE PROCEDURE GeneratePrimes()
BEGIN
    DECLARE n INT;
    DECLARE i INT;
    DECLARE is_prime BOOL;
    DECLARE result VARCHAR(1000);
    
    SET result = '';
    
    SET n = 2;
    
    WHILE n <= 1000 DO
        SET is_prime = TRUE;
        
        SET i = 2;
        WHILE i <= SQRT(n) DO
            IF n % i = 0 THEN
                SET is_prime = FALSE;
            END IF;
            SET i = i + 1;
        END WHILE;
        
        IF is_prime THEN
            SET result = CONCAT(result, n, '&');
        END IF;
        
        SET n = n + 1;
    END WHILE;
    
    SELECT SUBSTRING(result, 1, LENGTH(result) - 1) AS primes;
END$$

DELIMITER ;

CALL GeneratePrimes();
