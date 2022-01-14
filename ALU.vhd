-- ------------------------------------------------------------
-- TITLE       : LAB 6 
-- PROJECT     : Skalra_LAB6_ALU	
-- FILE        : ALU
-- AUTHOR      : Sagal Singh Kalra
-- DATE        : 11/07/2021
-- DESCRIPTION : Implementation of 1-Bit ALU by
--             : port mapping Full_adder and MUX
-- ------------------------------------------------------------

--Library Declarations
library IEEE;
use IEEE.std_logic_1164.all;

--Entity and I/O declarations
entity ALU is 
port (A,B,Cin   : in std_logic;
		Sel       : in std_logic_vector(1 downto 0);
		Cout,
		output     : out std_logic);
end ALU;

--Structural Construct
architecture struct of ALU is 

component MUX is				
port (A,B,C,D : in std_logic;
      sel     : in std_logic_vector(1 downto 0);
		F       : out std_logic);
end component;

component Full_adder is
port(X, Y, Zin : in std_logic;
     S, Zout   : out std_logic);
end component; 

signal X,Y : std_logic;
signal A_gate, F_adder, N_gate, X_gate : std_logic;

begin 
	X <= A;
	Y <= B;  	
	A_gate <= X and Y;
	N_gate <= X or Y;
	X_gate <= X xor Y;

FA0 : Full_adder port map (X, Y , Cin, F_adder, Cout);

MUX0 : MUX port map (F_adder, A_gate, N_gate, X_gate, sel, output);

end struct;