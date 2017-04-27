library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UnidadControl is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           salidaUnidadControl : out  STD_LOGIC_VECTOR (5 downto 0));
end UnidadControl;

architecture Behavioral of UnidadControl is

begin

process (op, op3)	
	begin
	
		if(op = "10") then
			case (Op3) is
				when("000000") =>
					salidaUnidadControl <= "000001"; -- Add
				when("000100") =>
					salidaUnidadControl <= "000010"; -- Sub
				when("000001") =>
					salidaUnidadControl<= "000011"; -- And
				when("000101") =>
					salidaUnidadControl <= "000100"; -- andN
				when("000010") =>
					salidaUnidadControl <= "000101"; -- Or	
				when("000110") =>
					salidaUnidadControl <= "000110"; -- orN
				when("000011") =>
					salidaUnidadControl <= "000111"; -- Xor
				when("000111") =>
					salidaUnidadControl <= "001000"; -- Xnor	
				when("010000") =>
					salidaUnidadControl <= "001001"; -- Addcc
				when("001000") =>
					salidaUnidadControl <= "001010"; -- Addx
				when("011000") =>
					salidaUnidadControl <= "001011"; -- Addxcc
				when("010100") =>
					salidaUnidadControl <= "001100"; -- Subcc
				when("001100") =>
					salidaUnidadControl <= "001101"; -- Subx
				when("011100") =>
					salidaUnidadControl <= "001110"; -- Subxcc
				when("010001") =>
					salidaUnidadControl <= "001111"; -- Andcc
				when("010101") =>
					salidaUnidadControl <= "010000"; -- andNcc
				when("010010") =>
					salidaUnidadControl <= "010001"; -- Orcc
				when("010110") =>
					salidaUnidadControl <= "010010"; -- orNcc
				when("010011") =>
					salidaUnidadControl <= "010011"; -- Xorcc
				when("010111") =>
					salidaUnidadControl <= "010100"; -- Xnorcc
				when("111100") =>
					salidaUnidadControl <= "010101"; -- save
				when("111101") =>
					salidaUnidadControl <= "010110"; -- restore
				when("100101") =>
					salidaUnidadControl <= "010111"; --SLL
				when("100110") => 
					salidaUnidadControl <= "011000"; --SRL
				when others =>
					salidaUnidadControl <= "000000";
			end case;
		end if;
	end process;

end Behavioral;

