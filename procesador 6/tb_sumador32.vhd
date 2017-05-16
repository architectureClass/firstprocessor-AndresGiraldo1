LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_sumador32 IS
END tb_sumador32;
 
ARCHITECTURE behavior OF tb_sumador32 IS 
 
    
    COMPONENT sumador32
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         salidaSumador : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salidaSumador : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador32 PORT MAP (
          a => a,
          b => b,
          salidaSumador => salidaSumador
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		a <= "00000000000000000000000000000000";
		b <= "00000000000000000000000000000001";
      wait for 100 ns;
		a <= "00000000000000000000000000000010";
		b <= "00000000000000000000000000000011";
      wait for 100 ns;	
		a <= "00000000000000000000000000010000";
		b <= "00000000000000000000000000010001";
      wait for 100 ns;		

      
      wait;
   end process;

END;
