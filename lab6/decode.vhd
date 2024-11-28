LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY decode IS
	PORT (state	:	IN  STD_LOGIC_VECTOR(2 DOWNTO 0) ; -- 3 to 8
				En	:	IN  STD_LOGIC ;
		  opcode	:	OUT STD_LOGIC_VECTOR(0 TO 7) ) ;
END decode ;

ARCHITECTURE Behavior OF decode IS
	SIGNAL Enstate : STD_LOGIC_VECTOR(3 DOWNTO 0) ;
BEGIN
	Enstate <= En & state ;
	WITH Enstate SELECT
		opcode <= "00000001" WHEN "1000", -- function 1 ; corresponds to state:  0
					 "00000010" WHEN "1001", -- function 2 ;								 1 
					 "00000100" WHEN "1010", -- function 3 ;								 2
					 "00001000" WHEN "1011", -- function 4 ;								 3
					 "00010000" WHEN "1100", -- function 5 ;								 4
					 "00100000" WHEN "1101", -- function 6 ;								 5
					 "01000000" WHEN "1110", -- function 7 ;								 6
					 "10000000" WHEN "1111", -- function 8 ;								 7
					 "00000000" WHEN OTHERS ;
END Behavior ;
