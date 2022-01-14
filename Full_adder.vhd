-- ------------------------------------------------------------
-- TITLE       : LAB 6 
-- PROJECT     : Skalra_LAB6_ALU	
-- FILE        : Full_adder
-- AUTHOR      : Sagal Singh Kalra
-- DATE        : 11/07/2021
-- DESCRIPTION : Implementation of Full Adder
-- ------------------------------------------------------------

--Library Declarations
library IEEE;
use IEEE.std_logic_1164.all;

--Entity and I/O declarations
entity Full_adder is
port(X, Y, Zin : in std_logic;
     S, Zout   : out std_logic);
end Full_adder;

--Behavioural Construct
architecture behavioral of Full_adder is
begin 
S    <= (Zin xor (X xor Y));
Zout <= ((X and Y) or (Zin and Y) or (Zin and X)); 
end behavioral;
--End of code