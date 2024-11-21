LIBRARY ieee; 
USE ieee.std_logic_1164.all; 

ENTITY johns IS  
	PORT (
		Clrn, Clk : IN STD_LOGIC;
		W  : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) ;
		Q  : OUT STD_LOGIC_VECTOR (0 TO 2)) ; 
END johns; 

ARCHITECTURE Behaivor OF johns IS
	signal Qreg  : STD_LOGIC_VECTOR (0 TO 2); 
BEGIN 
	PROCESS (Clrn, Clk)  
	BEGIN   
		IF Clrn = '0' THEN 
			Qreg <= "000";   
		ELSIF (Clk'EVENT AND Clk = '1') THEN 
			Qreg(1) <= Qreg(0);
			Qreg(2) <= Qreg(1);
			Qreg(0) <= NOT Qreg(2);
		END IF;   
		
		CASE Qreg IS    -- d(i), i=4,…,9
			WHEN "000" => W <= "0001"; -- d4: 1
			WHEN "100" => W <= "0111"; -- d5: 7
			WHEN "110" => W<= "0010"; -- d6: 2
			WHEN "111" => W<= "0100"; -- d7: 4
			WHEN "011" => W<= "0010"; -- d8: 2
			WHEN "001" => W <= "0011"; -- d9: 3
			WHEN OTHERS => W <= "----";
		END CASE;
	END PROCESS;   -- student ID  
	Q <= Qreg;    -- d1,d2,d3,d4,d5,d6,d7,d8,d9
END Behaivor;    --  5  0  1  1  7  2  4  2  3
