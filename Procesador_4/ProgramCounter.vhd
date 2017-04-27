library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( clk : in  STD_LOGIC;
           pc_entrada : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_salida : out  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC);
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin

process (clk, reset, pc_entrada)
	begin
		if (reset = '1') then
			pc_salida <= (others => '0');
		else
			if(rising_edge(clk)) then
				pc_salida <= pc_entrada;
			end if;
		end if;
end process;

end Behavioral;
