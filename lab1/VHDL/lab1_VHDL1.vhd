LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY lab1_VHDL1 IS
PORT (x1, x2, x3: IN STD_Logic; f : OUT STD_Logic);
end lab1_VHDL1;

ARCHITECTURE Behavior OF lab1_VHDL1 IS
BEGIN
f <= (x1 AND x2) OR ((NOT x2) AND x3); 

END Behavior;