library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UnidadControl is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           salidaUnidadControl : out  STD_LOGIC_VECTOR (3 downto 0));
end UnidadControl;

architecture Behavioral of UnidadControl is

begin

process (op, op3)	
	begin
	
		if(op = "10") then
			case (op3) is
				when("000000") =>
					salidaUnidadControl <= "0001"; -- Add
				when("000100") =>
					salidaUnidadControl <= "0010"; -- Sub
				when("000001") =>
					salidaUnidadControl <= "0011"; -- And
				when("000101") =>
					salidaUnidadControl <= "0100"; -- Andn
				when("000010") =>
					salidaUnidadControl <= "0101"; -- Or	
				when("000110") =>
					salidaUnidadControl <= "0110"; -- Orn
				when("000011") =>
					salidaUnidadControl <= "0111"; -- Xor
				when("000111") =>
					salidaUnidadControl <= "1000"; -- Xnor				
				when others =>
					salidaUnidadControl <= "0000";
			end case;
		end if;
	end process;


end Behavioral;

