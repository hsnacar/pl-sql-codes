/*
Type all integers which are divisible by 4 and divisible by 6 
from 120 to 11 in the same line with a space between two consecutive integers
*/

DECLARE
    v_result VARCHAR2(32767);
BEGIN
    FOR i IN REVERSE 11..120 LOOP
        IF
            MOD(i, 4) = 0
            AND MOD(i, 6) = 0
        THEN
            v_result := v_result
                        || ' '
                        || to_char(i);
        END IF;
    END LOOP;

    dbms_output.put_line(v_result);
END;