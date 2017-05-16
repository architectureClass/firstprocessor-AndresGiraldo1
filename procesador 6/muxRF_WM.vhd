library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxRF_WM is
    Port ( RDWM : in  STD_LOGIC_VECTOR (5 downto 0);
           ro7 : in  STD_LOGIC_VECTOR (5 downto 0);
           rfDest : in  STD_LOGIC;
           nrd : out  STD_LOGIC_VECTOR (5 downto 0));
end muxRF_WM;

architecture Behavioral of muxRF_WM is

begin

process(RDWM,ro7,rfDest)
	begin
		if(rfDest = '0')then
			nrd <= RDWM;
		else
			if(rfDest = '1')then
				nrd <= ro7;
			end if;
		end if;
	end process;

end Behavioral;

