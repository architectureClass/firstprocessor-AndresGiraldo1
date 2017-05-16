library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.ALL;

entity ALU is
    Port ( dato1Alu : in  STD_LOGIC_VECTOR (31 downto 0);
           dato2Alu : in  STD_LOGIC_VECTOR (31 downto 0);
           operacionAlu : in  STD_LOGIC_VECTOR (5 downto 0);
           salidaAlu : out  STD_LOGIC_VECTOR (31 downto 0);
			  carry : in  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

begin

process(dato1Alu,dato2Alu,operacionAlu,carry)
	begin
	   case (operacionAlu) is 
			when "000000" => -- add,addcc
				salidaAlu <= dato1Alu + dato2Alu;
			when "000001" => -- sub,subcc
				salidaAlu <= dato1Alu - dato2Alu;
			when "000010" => --and,andcc
				salidaAlu <= dato1Alu and dato2Alu;
			when "100010" => --andn,andncc
				salidaAlu <= dato1Alu and not (dato2Alu);
			when "000011" => -- or,orcc
				salidaAlu <= dato1Alu or dato2Alu;
			when "100011" => -- orn,orncc
				salidaAlu <= dato1Alu or not(dato2Alu);
			when "000100" => -- xor,xorcc
				salidaAlu <= dato1Alu xor dato2Alu;
			when "100100" => -- xnor,xnorcc
				salidaAlu <= dato1Alu xnor dato2Alu;
			when "000101" => -- addX,addXcc
				salidaAlu <= dato1Alu + dato2Alu + carry;
			when "000110" => --subX,subXcc
				salidaAlu <= dato1Alu - dato2Alu - carry;
			when others =>
				salidaAlu <= (others=>'0');--hola
		end case;
	end process;

end Behavioral;

