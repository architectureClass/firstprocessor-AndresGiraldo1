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

process(dato1Alu,dato2Alu,operacionAlu ,carry)
	begin
		if (operacionAlu  = "000001") or (operacionAlu  = "001001") or (operacionAlu  = "010110") or (operacionAlu  = "010101") then      -- Add or Addcc
			salidaAlu <= dato1Alu + dato2Alu;
		elsif (operacionAlu  = "000010") or (operacionAlu  = "001100") then   -- Sub or Subcc
			salidaAlu <= dato1Alu - dato2Alu;			
		elsif (operacionAlu  = "000011") or (operacionAlu  = "001111") then	-- And or Andcc 
			salidaAlu <= dato1Alu and dato2Alu;		
		elsif (operacionAlu  = "000100") or (operacionAlu  = "010000") then	-- andN or andNcc
			salidaAlu <= dato1Alu and  not (dato2Alu);			
		elsif (operacionAlu  = "000101") or (operacionAlu  = "010001") then	-- Or or Orcc 
			salidaAlu <= dato1Alu or dato2Alu;
		elsif (operacionAlu  = "000110") or (operacionAlu  = "010010") then	-- orN or orNcc 
			salidaAlu <= dato1Alu or not (dato2Alu);
		elsif (operacionAlu  = "000111") or (operacionAlu  = "010010") then	-- Xor or Xorcc
			salidaAlu <= dato1Alu xor dato2Alu;
		elsif (operacionAlu  = "001000") or (operacionAlu  = "010100") then	-- Xnor or Xnorcc
			salidaAlu <= dato1Alu xnor dato2Alu;
		elsif (operacionAlu  = "001010") or (operacionAlu  = "001011") then	-- Addx or Addxcc
			salidaAlu <= dato1Alu + dato2Alu + carry;
		elsif (operacionAlu  = "001101") or (operacionAlu  = "001110") then	-- Subx or Subxcc
			salidaAlu <= dato1Alu - dato2Alu - carry;
		elsif (operacionAlu = "010111") then --SLL
			salidaAlu <= to_stdlogicvector(to_bitvector(dato1Alu) sll conv_integer(dato2Alu));
		elsif (operacionAlu = "011000") then-- SRL
			salidaAlu <= to_stdlogicvector(to_bitvector(dato1Alu) srl conv_integer(dato2Alu));
		else salidaAlu <= (others=>'0');
		end if;
	end process;

end Behavioral;

