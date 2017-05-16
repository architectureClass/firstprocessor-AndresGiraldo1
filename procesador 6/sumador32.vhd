library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador32 is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaSumador : out  STD_LOGIC_VECTOR (31 downto 0));
end sumador32;

architecture Behavioral of sumador32 is

begin

process (a, b)
	begin
		
		salidaSumador <= a + b; 
	
	end process;

end Behavioral;

