LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_extensionSigno IS
END tb_extensionSigno;
 
ARCHITECTURE behavior OF tb_extensionSigno IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT extensionSigno
    PORT(
         inmediato : IN  std_logic_vector(12 downto 0);
         salida_ext : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inmediato : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal salida_ext : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: extensionSigno PORT MAP (
          inmediato => inmediato,
          salida_ext => salida_ext
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		inmediato <= "0111111111111";
      wait for 100 ns;
		inmediato <= "1001111111111";
      wait for 100 ns;		
		inmediato <= "0000011111111";
      wait for 100 ns;
		inmediato <= "1000011111111";
      wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
