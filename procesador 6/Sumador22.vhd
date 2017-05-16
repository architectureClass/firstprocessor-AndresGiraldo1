library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity Sumador22 is
    Port ( pc : in  STD_LOGIC_VECTOR (31 downto 0);
           disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           salida22 : out  STD_LOGIC_VECTOR (31 downto 0));
end Sumador22;

architecture Behavioral of Sumador22 is

begin

process(pc,disp22) is
begin
	salida22 <= std_logic_vector(unsigned(pc) + unsigned(disp22));
end process;

end Behavioral;

