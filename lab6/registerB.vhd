LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity registerB IS
	port (		B	:	in    std_logic_vector(7 downto 0) ; -- 8-bit A input 
		reset, clk	:	in    std_logic ; 
			Q	:	out  std_logic_vector(7 downto 0)) ; -- 8-bit output 
	end registerB; 
	
architecture behavior of registerB is 
begin 
	process (reset, clk) 
	begin 
		if reset = '0' then 
			Q <= "00000000" ;
		elsif (clk'EVENT AND clk = '1') then 
			Q <= B ;
		end if ;
	end process ; 
end behavior; 
