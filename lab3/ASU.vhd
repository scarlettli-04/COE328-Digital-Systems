LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ASU IS

	PORT ( Cin			: IN STD_LOGIC;
		X,Y			: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		S				: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		Cout			: OUT STD_LOGIC;
		negative		: BUFFER STD_LOGIC);
		
END ASU;


ARCHITECTURE Behavior OF ASU IS
	SIGNAL Sum: STD_LOGIC_VECTOR(4 DOWNTO 0);
	
BEGIN
	PROCESS(Cin,X,Y,negative)
	BEGIN
		IF Cin = '0' THEN
			--addition
			Sum <= ('0' & X) + ('0' & Y);
			negative <= '0';
			Cout <= Sum(4);
			S <= Sum(3 DOWNTO 0);		
		ELSE
			--subtraction
			Sum <= ('0'& X) - ('0' & Y);
			negative <= Sum(4);
			Cout <= Sum(4);
			if (negative = '1') then
				S <= not (Sum(3 DOWNTO 0)-1);
			else
				S <= Sum(3 DOWNTO 0);
			END if;
		END IF;		
	END PROCESS;
END Behavior;