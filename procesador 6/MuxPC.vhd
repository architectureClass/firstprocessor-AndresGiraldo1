library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MuxPC is
    Port ( disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           pcSource : in  STD_LOGIC_VECTOR (1 downto 0);
           pcSalidaMux : out  STD_LOGIC_VECTOR (31 downto 0);
           pcDireccion : in  STD_LOGIC_VECTOR (31 downto 0));
end MuxPC;

architecture Behavioral of MuxPC is

begin

process(disp30,disp22,pc,pcDireccion,pcSource)
	begin
			case pcSource is
				when "00" =>
					pcSalidaMux <= pcDireccion;
				when "01" =>
					pcSalidaMux <= disp30;
				when "10" =>
					pcSalidaMux <= disp22;
				when "11" =>
					pcSalidaMux <= pc;
				when others =>
					pcSalidaMux <= pc;
			end case;
	end process;


end Behavioral;

