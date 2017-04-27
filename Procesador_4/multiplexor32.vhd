
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexor32 is
    Port ( entrada1 : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada2 : in  STD_LOGIC_VECTOR (31 downto 0);
           senalControl : in  STD_LOGIC;
           salida_mux : out  STD_LOGIC_VECTOR (31 downto 0));
end multiplexor32;

architecture Behavioral of multiplexor32 is

begin

process (entrada1, entrada2, senalControl)
	begin
	
		if (senalControl = '0') then
			salida_mux <= entrada1;
		else
			salida_mux <= entrada2;
		end if;
	
	end process;

end Behavioral;

