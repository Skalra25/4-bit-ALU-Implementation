-- ------------------------------------------------------------
-- TITLE       : LAB 6 
-- PROJECT     : Skalra_LAB6_ALU	
-- AUTHOR      : Sagal Singh Kalra
-- DATE        : 11/07/2021
-- DESCRIPTION : Implementation of 
--               4-Bit Arithmetic Logic unit
-- ------------------------------------------------------------

--Library Declarations 
library IEEE;
use IEEE.std_logic_1164.all;

--Entity and I/O declarations
entity Skalra_LAB6_ALU is
port (A,B  : in std_logic_vector(3 downto 0 );
		Cin  : in std_logic;
		Cout : out std_logic;
		Sel  : in std_logic_vector(1 downto 0);
		M_out,
		C_in : out std_logic_vector(3 downto 0));
end Skalra_LAB6_ALU;

--Structural Construct
architecture struct of Skalra_LAB6_ALU is 

component ALU is 
port (A,B,Cin   : in std_logic;
		Sel       : in std_logic_vector(1 downto 0);
		Cout,
		output    : out std_logic);
end component; 

signal C  : std_logic_vector(2 downto 0);

begin

	ALU0 : ALU port map(A(0), B(0), Cin,  Sel, C(0), M_out(0)); --ALU(0)
	ALU1 : ALU port map(A(1), B(1), C(0), Sel, C(1), M_out(1));	--ALU(1)
	ALU2 : ALU port map(A(2), B(2), C(1), Sel, C(2), M_out(2));	--ALU(2)
	ALU3 : ALU port map(A(3), B(3), C(2), Sel, Cout, M_out(3)); --ALU(3)

	C_in(0) <= Cin;
	C_in(1) <= C(0);
	C_in(2) <= C(1);
	C_in(3) <= C(2);

end struct;		
--End of code

 