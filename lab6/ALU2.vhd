LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU2 is -- ALU unit includes Reg. 3 
	port (		clk   :   in  std_logic ;
				  A, B   :   in  UNSIGNED(7 downto 0) ; -- 8-bit inputs A & B from Reg. 1 & Reg. 2 
				opcode   :   in  UNSIGNED(7 downto 0) ; -- 8-bit opcode from Decoder 
				R1, R2   :   out UNSIGNED(3 downto 0) ; -- 8-bit Result split in two 4-bit digits
				  Sign   :   out std_logic) ; 
end ALU2 ; 

architecture calculation of ALU2 is
	SIGNAL Reg1, Reg2, Result : UNSIGNED(7 DOWNTO 0) := (OTHERS => '0') ;
begin 

	Reg1 <= A ;
	Reg2 <= ((NOT(B(7 downto 4))) & '0' &'0' & '0' & '0') + ('0' &'0' & '0' & '0' & (B(3 downto 0))) ; -- invert first four bits of B and concate with the original last 4 bits of B
	
	process ( clk, opcode ) 
	begin 
		
		if (clk'EVENT AND clk = '1') then 
			case opcode is 
			when "00000001" => 
				Sign <= '0' ;
				Result <= Reg1 + Reg2 ; -- Do addition for Reg1 and Reg2
				
			when "00000010" => 
				-- Do subtraction for Reg1 and Reg2
				if (Reg1 < Reg2) then -- if Reg1 < Reg2 then result will be negative; 2's complement result to get correct result
					Sign <= '1' ;
					Result <= (NOT(Reg1 - Reg2) + 1) ;
				else
					Sign <= '0' ;
					Result <= Reg1 - Reg2 ;
				end if ;
				
			when "00000100" => 
				Sign <= '0' ;
				Result <= NOT(Reg1) ; -- Do inverse of A = Reg1
				
			when "00001000" => 
				Sign <= '0' ;
				Result <= Reg1 NAND Reg2 ; -- Do Boolean NAND
				
			when "00010000" => 
				Sign <= '0' ;
				Result <= Reg1 NOR Reg2 ; -- Do Boolean NOR 
				
			when "00100000" => 
				Sign <= '0' ;
				Result <= Reg1 AND Reg2 ; -- Do Boolean AND 
				
			when "01000000" => 
				Sign <= '0' ;
				Result <= Reg1 XOR Reg2 ; -- Do Boolean XOR 
				
			when "10000000" => 
				Sign <= '0' ;
				Result <= Reg1 OR Reg2 ; -- Do Boolean OR 
			
			when others => 
				Sign <= '0' ;
				Result <= "00000000" ; -- Don’t care, do nothing 
			end case ; 
		end if ; 
	end process ;
	
	R1 <= Result(3 downto 0) ;
	R2 <= Result(7 downto 4) ;
	
end calculation ; 
