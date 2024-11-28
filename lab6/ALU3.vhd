LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU3 is -- ALU unit includes Reg. 3 
	port (		clk	:   in  std_logic ; 
	      student_ID	:	 in UNSIGNED(3 downto 0) ;
	      		A, B	:   in  UNSIGNED(7 downto 0) ; -- 8-bit inputs A & B from Reg. 1 & Reg. 2 
			opcode	:   in  UNSIGNED(7 downto 0) ; -- 8-bit opcode from Decoder 
			R	:   out std_logic) ; 
end ALU3 ; 

architecture calculation of ALU3 is
	SIGNAL Reg1, Reg2, Result	:	UNSIGNED(7 DOWNTO 0) := (OTHERS => '0') ;
begin 

	Reg1 <= A ;
	Reg2 <= B ;
	
	process ( clk, opcode ) 
	begin 
		
		if (clk'EVENT AND clk = '1') then 
				if(student_ID = Reg1(3 downto 0)) then
					R <= '1' ;
				elsif (student_ID = Reg1(7 downto 4)) then
					R <= '1' ;
				else
					R <= '0' ;
				end if ;
		end if ; 
	end process ;
end calculation ; 
