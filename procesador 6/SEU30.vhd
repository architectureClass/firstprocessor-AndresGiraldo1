library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU30 is
    Port ( disp30 : in  STD_LOGIC_VECTOR (29 downto 0);
           seu30 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU30;

architecture Behavioral of SEU30 is

begin

process(disp30)
	begin
		if(disp30(29) = '1')then
			seu30(29 downto 0) <= disp30;
			seu30(31 downto 30) <= (others=>'1');
		else
			seu30(29 downto 0) <= disp30;
			seu30(31 downto 30) <= (others=>'0');
		end if;
	end process;


end Behavioral;

