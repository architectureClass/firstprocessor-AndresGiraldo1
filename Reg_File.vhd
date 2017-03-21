library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Reg_File is
    Port ( rst : in  STD_LOGIC;
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Reg_File;

architecture Behavioral of Reg_File is

	type ram is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registro : ram :=(others => x"00000000");
	
begin
	process(rst,rs1,rs2,rd,dwr)
	begin
			registro(0) <= x"00000000";
			if(rst = '1')then
				CRs1 <= (others=>'0');
				CRs2 <= (others=>'0');
				registro <= (others => x"00000000");
				
			else
				CRs1<= registro(conv_integer(rs1));
				CRs2 <= registro(conv_integer(rs2));
				if(RegFileDesti /= "00000")then
					registro(conv_integer(rd)) <= dwr;
				end if;
			end if;
	end process;

end Behavioral;

