LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbAlu IS
END tbAlu;
 
ARCHITECTURE behavior OF tbAlu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         dato1Alu : IN  std_logic_vector(31 downto 0);
         dato2Alu : IN  std_logic_vector(31 downto 0);
         operacionAlu : IN  std_logic_vector(3 downto 0);
         salidaAlu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dato1Alu : std_logic_vector(31 downto 0) := (others => '0');
   signal dato2Alu : std_logic_vector(31 downto 0) := (others => '0');
   signal operacionAlu : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal salidaAlu : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          dato1Alu => dato1Alu,
          dato2Alu => dato2Alu,
          operacionAlu => operacionAlu,
          salidaAlu => salidaAlu
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
     	
		
		dato1Alu <= x"000000AA";
		dato2Alu <= x"00000099";
		 
      -- insert stimulus here 
		operacionAlu <= "0001";
		wait for 100 ns;
	
		operacionAlu <= "0010";
		wait for 100 ns;
		
		operacionAlu <= "0011";
		wait for 100 ns;
		
		operacionAlu <= "0100";
		wait for 100 ns;
		
		operacionAlu <= "0101";
		wait for 100 ns;
		
		operacionAlu <= "0110";
		wait for 100 ns;
		
		operacionAlu <= "0111";
		wait for 100 ns;
		
		operacionAlu <= "1000";
      wait;
   end process;

END;
