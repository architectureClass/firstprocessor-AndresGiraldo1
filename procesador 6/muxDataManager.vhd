library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxDataManager is
    Port ( selector : in  STD_LOGIC_VECTOR (1 downto 0);
           data : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_result : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           dataToWrite : out  STD_LOGIC_VECTOR (31 downto 0));
end muxDataManager;

architecture Behavioral of muxDataManager is

begin

process(data,alu_result,selector)
begin
	if(selector = "00")then
		dataToWrite <= alu_result;
	elsif(selector="01")then
		dataToWrite <= data;
	elsif(selector= "10")then
		dataToWrite <= PC;
	else
		dataToWrite<=alu_result;
	end if;
end process;


end Behavioral;

