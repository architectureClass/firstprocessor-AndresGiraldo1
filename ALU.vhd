library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( dato1Alu : in  STD_LOGIC_VECTOR (31 downto 0);
           dato2Alu : in  STD_LOGIC_VECTOR (31 downto 0);
           operacionAlu : in  STD_LOGIC_VECTOR (3 downto 0);
           salidaAlu : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process(dato1Alu,dato2Alu,operacionAlu)
	begin
	   case (operacionAlu) is 
			when "0001" => 
				salidaAlu <= dato1Alu + dato2Alu;
			when "0010" => 
				salidaAlu <= dato1Alu - dato2Alu;
			when "0011" => 
				salidaAlu <= dato1Alu and dato2Alu;
			when "0100" => 
				salidaAlu <= dato1Alu and not (dato2Alu);
			when "0101" => 
				salidaAlu <= dato1Alu or dato2Alu;
			when "0110" =>
				salidaAlu <= dato1Alu or not (dato2Alu);
			when "0111" =>
				salidaAlu <= dato1Alu xor dato2Alu;
			when "1000" =>
				salidaAlu <= dato1Alu xnor dato2Alu;
			when others => 
				salidaAlu <= (others=>'0');
		end case;
	end process;

end Behavioral;

