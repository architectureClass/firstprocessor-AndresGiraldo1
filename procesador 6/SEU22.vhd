library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU22 is
    Port ( disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
           seu22 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU22;

architecture Behavioral of SEU22 is

begin

process(disp22)
	begin
		if(disp22(21) = '1')then
			seu22(21 downto 0) <= disp22;
			seu22(31 downto 22) <= (others=>'1');
		else
			seu22(21 downto 0) <= disp22;
			seu22(31 downto 22) <= (others=>'0');
		end if;
end process;

end Behavioral;

