DECLARE
    v_number        NUMBER := 77;
    v_biggest_prime NUMBER;
BEGIN
    find_biggest_prime_number(v_number, v_biggest_prime);
    dbms_output.put_line(v_biggest_prime);
END;
/

CREATE OR REPLACE PROCEDURE is_prime_number (
    v_number IN NUMBER,
    v_result OUT BOOLEAN
) AS
    v_factor_count NUMBER;
BEGIN
    v_factor_count := 0;
    v_result := false;
    FOR i IN 2..v_number LOOP
        IF MOD(v_number, i) = 0 THEN
            v_factor_count := v_factor_count + 1;
        END IF;
    END LOOP;

    IF v_factor_count = 1 THEN
        v_result := true;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE find_biggest_prime_number (
    v_number               IN NUMBER,
    v_biggest_prime_number OUT NUMBER
) AS
    v_is_prime BOOLEAN := false;
BEGIN
    v_biggest_prime_number := 2;
    FOR i IN 2..v_number LOOP
        IF MOD(v_number, i) = 0 THEN
            is_prime_number(i, v_is_prime);
            IF v_is_prime = true THEN
                v_biggest_prime_number := i;
            END IF;
        END IF;
    END LOOP;

END;