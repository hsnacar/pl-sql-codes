/*
    Type code to check whether a String is palindrome or not. 
    If a String is the same with its reverse then it is called palindrome. 
    For example; “anna”, “123321” are palindromes
*/

CREATE OR REPLACE PROCEDURE is_palindrome (
    v_word          IN VARCHAR,
    v_is_palindrome OUT BOOLEAN
) AS
    v_word_reverse VARCHAR2(100);
BEGIN
    v_word_reverse := '';
    v_is_palindrome := false;
    FOR i IN REVERSE 1..length(v_word) LOOP
        v_word_reverse := v_word_reverse
                          || substr(v_word, i, 1);
    END LOOP;

    IF v_word = v_word_reverse THEN
        v_is_palindrome := true;
    ELSE
        v_is_palindrome := false;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Your word must be different NULL!');
END;

/

DECLARE
    v_check_word          VARCHAR2(100) := '&Please_input_a_word';
    v_check_is_palindrome BOOLEAN;
BEGIN
    IF v_check_word IS NOT NULL THEN
        is_palindrome(v_check_word, v_check_is_palindrome);
        IF v_check_is_palindrome = true THEN
            dbms_output.put_line('Your word ('
                                 || v_check_word
                                 || ') is a Palindrome');
        ELSE
            dbms_output.put_line('Your word ('
                                 || v_check_word
                                 || ') is not a Palindrome!');
        END IF;

    ELSE
        dbms_output.put_line('Error: empty input');
    END IF;

END;