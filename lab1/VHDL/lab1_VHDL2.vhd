LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY lab1_VHDL2 IS
PORT (w1, w2, w3, w4: IN STD_Logic; g,h : OUT STD_Logic);
end lab1_VHDL2;

ARCHITECTURE Behavior OF lab1_VHDL2 IS
BEGIN
g <= (w1 AND w2) OR (w3 AND w4);
h <= (w1 AND w3) OR (w2 AND w4);
END Behavior;