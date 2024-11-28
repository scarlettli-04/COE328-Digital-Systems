LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY ssegmodified IS
	PORT (	R : IN STD_LOGIC ;
			leds : OUT STD_LOGIC_VECTOR(1 TO 7)) ;
END ssegmodified ;

ARCHITECTURE Behavior OF ssegmodified IS
BEGIN
	PROCESS ( R )
	BEGIN
		IF(R = '1') THEN
					    -- abcdefg
			leds <= NOT("0110011") ; -- y
		ELSE
			leds <= NOT("0010101") ; -- n
		END IF ;
	END PROCESS ;
END Behavior ;
