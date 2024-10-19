LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY ASU IS
	PORT ( 
		Cin : IN STD_LOGIC ;
		X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		Cout, Overflow, Sign : OUT STD_LOGIC ) ;
END ASU ;

ARCHITECTURE Behavior OF ASU IS
	SIGNAL Sum : STD_LOGIC_VECTOR(4 DOWNTO 0) ;
	SIGNAL CTEMP : STD_LOGIC_VECTOR(3 DOWNTO 0) ;
BEGIN
	PROCESS (Cin, X, Y)
		BEGIN
		IF(Cin = '1') THEN -- subtractor unit
			Sum <= ('0' & X) + ('0' & ((NOT(Y)) + '1')) ;
			CTEMP <= (('0' & X(2 DOWNTO 0)) + ('0' & (NOT(Y(2 DOWNTO 0)) + '1'))) ;
			IF(Sum(3) = '1') THEN
				Sign <= '1' ;
				Cout <= Sum(4) ;
				S <= (NOT(Sum(3 DOWNTO 0))+'1') ; -- 2's complement of the sum if it is negative
				Overflow <= CTEMP(3) XOR Sum(4) ;
			ELSE
				Sign <= '0' ;
				S <= Sum(3 DOWNTO 0) ;
				Cout <= Sum(4) ;
				Overflow <= CTEMP(3) XOR Sum(4) ;
			END IF ; 
		ELSE -- adder unit
			Sum <= ('0' & X) + ('0' & Y) ;
			S <= Sum(3 DOWNTO 0) ;
			Sign <= '0' ;
			Cout <= Sum(4) ;
			Overflow <= Sum(4) ;
		END IF ;
	END PROCESS ;
END Behavior ;
