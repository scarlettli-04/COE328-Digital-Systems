LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY sseg IS
	PORT ( 
		bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		sign : IN STD_LOGIC ;
		ledsL, ledsR : OUT STD_LOGIC_VECTOR(1 TO 7)) ;
END sseg ;

ARCHITECTURE Behavior OF sseg IS
BEGIN
	PROCESS ( bcd , sign)
	BEGIN
		IF(sign = '1') THEN
			ledsL <= NOT("0000001") ; -- neg
		ELSE
			ledsL <= NOT("0000000") ; -- pos
		END IF ;
	
		CASE bcd IS              -- abcdefg
			WHEN "0000" => ledsR <= NOT("1111110") ; -- 0
			WHEN "0001" => ledsR <= NOT("0110000") ; -- 1
			WHEN "0010" => ledsR <= NOT("1101101") ; -- 2
			WHEN "0011" => ledsR <= NOT("1111001") ; -- 3
			WHEN "0100" => ledsR <= NOT("0110011") ; -- 4
			WHEN "0101" => ledsR <= NOT("1011011") ; -- 5
			WHEN "0110" => ledsR <= NOT("1011111") ; -- 6
			WHEN "0111" => ledsR <= NOT("1110000") ; -- 7
			WHEN "1000" => ledsR <= NOT("1111111") ; -- 8
			WHEN "1001" => ledsR <= NOT("1110011") ; -- 9
			WHEN "1010" => ledsR <= NOT("1110111") ; -- A/10
			WHEN "1011" => ledsR <= NOT("0011111") ; -- B/11
			WHEN "1100" => ledsR <= NOT("1001110") ; -- C/12
			WHEN "1101" => ledsR <= NOT("0111101") ; -- D/13
			WHEN "1110" => ledsR <= NOT("1001111") ; -- E/14
			WHEN "1111" => ledsR <= NOT("1000111") ; -- F/15
		END CASE ;
		
	END PROCESS ;
END Behavior ;
