/*
A number is called an Armstrong number if it equals the sum of the cube of its every digit. 
For example, 153 is an Armstrong number, 
because of 153= 1 + 125 + 27, which equals the cube of every digit. 
Type a code to check if the given number is the Armstrong number or not.
*/


CREATE OR REPLACE PROCEDURE is_armstrong_number (
    v_check_number IN INTEGER,
    is_armstrong   OUT BOOLEAN
) AS
    v_check_number_temp INTEGER;
    v_digit             INTEGER := 0;
    v_sum               INTEGER := 0;
BEGIN
    is_armstrong := false;
    v_check_number_temp := v_check_number;
    WHILE v_check_number_temp >= 1 LOOP
        v_digit := MOD(v_check_number_temp, 10);
        v_sum := v_sum + ( v_digit * v_digit * v_digit );
        v_check_number_temp := floor(v_check_number_temp / 10);
    END LOOP;

    IF v_check_number = v_sum THEN
        is_armstrong := true;
    ELSE
        is_armstrong := false;
    END IF;

END;

/

DECLARE
    v_check_number INTEGER := 153;
    is_armstrong   BOOLEAN := false;
BEGIN
    is_armstrong_number(v_check_number, is_armstrong);
    IF is_armstrong = true THEN
        dbms_output.put_line(v_check_number || ' is a Armstrong number');
    ELSE
        dbms_output.put_line(v_check_number || ' is not a Armstrong number');
    END IF;

END;