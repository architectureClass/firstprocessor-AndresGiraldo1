library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  ncwp : in  STD_LOGIC;
			  icc: out STD_LOGIC_VECTOR (3 downto 0);
			  carry : out  STD_LOGIC;
           cwp : out  STD_LOGIC
			  );
end PSR;

architecture Behavioral of PSR is
signal PSRegister: STD_LOGIC_VECTOR (31 DOWNTO 0):= (others=>'0');

begin

process(clk,reset,nzvc,ncwp)
	begin
		if(reset = '1') then
				cwp <= '0';
				carry <= '0';
				icc <= "0000";
		else
			if(rising_edge(clk))then
				PSRegister(0) <= ncwp;
				carry <= PSRegister(20);
				cwp <= ncwp;
			end if;
			PSRegister(23 downto 20) <= nzvc;
				icc <= PSRegister(23 downto 20);
			
		end if;
	end process;

end Behavioral;

