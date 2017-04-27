library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NProgramCounter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           entradaNProgramCounter : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaNProgramCounter : out  STD_LOGIC_VECTOR (31 downto 0));
end NProgramCounter;

architecture Behavioral of NProgramCounter is

begin

process (clk, reset, entradaNProgramCounter)
	begin
		if (reset = '1') then
			salidaNProgramCounter <= (others => '0');
		else
			if(rising_edge(clk)) then
				salidaNProgramCounter <= entradaNProgramCounter;
			end if;
		end if;
end process;

end Behavioral;

