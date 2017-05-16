library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity sumador30 is
    Port ( pc : in  STD_LOGIC_VECTOR (31 downto 0);
           disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           salida30 : out  STD_LOGIC_VECTOR (31 downto 0));
end sumador30;

architecture Behavioral of sumador30 is

begin

process(disp30,pc) is
begin
	salida30 <= std_logic_vector(unsigned(disp30) + unsigned(pc));
end process;

end Behavioral;

