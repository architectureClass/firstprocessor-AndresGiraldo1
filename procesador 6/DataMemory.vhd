library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DataMemory is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enableMem : in  STD_LOGIC;
           writeEnable : in  STD_LOGIC;
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           CRD : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaDM : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is

type ram_type is array (0 to 63) of std_logic_vector (31 downto 0);
signal ramMemory : ram_type:=(others => x"00000000");

begin

process(clk)
begin
	if(falling_edge(clk))then
		if(enableMem = '1') then
			if(reset = '1')then
				salidaDM  <= (others => '0');
				ramMemory <= (others => x"00000000");
			else
				if(writeEnable = '0')then
					salidaDM  <= ramMemory(conv_integer(aluResult(5 downto 0)));
				else
					ramMemory(conv_integer(aluResult(5 downto 0))) <= CRD;
				end if;
			end if;
		end if;
	end if;
end process;

end Behavioral;

