library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity extensionSigno is
    Port ( inmediato : in  STD_LOGIC_VECTOR (12 downto 0);
           salida_ext : out  STD_LOGIC_VECTOR (31 downto 0));
end extensionSigno;

architecture Behavioral of extensionSigno is

begin

process (inmediato)
	begin
		salida_ext(12 downto 0) <= inmediato;
		if(inmediato(12) = '0')then
			salida_ext (31 downto 13) <= (others=>'0');
		else
			salida_ext(31 downto 13) <= (others=>'1');
		end if;		
	
	end process;

end Behavioral;

