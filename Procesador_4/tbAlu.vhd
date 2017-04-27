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
         operacionAlu : IN  std_logic_vector(5 downto 0);
         salidaAlu : OUT  std_logic_vector(31 downto 0);
			carry : in  STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal dato1Alu : std_logic_vector(31 downto 0) := (others => '0');
   signal dato2Alu : std_logic_vector(31 downto 0) := (others => '0');
   signal operacionAlu : std_logic_vector(5 downto 0) := (others => '0');
	signal carry : std_logic;
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
          salidaAlu => salidaAlu,
			 carry => carry
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
     	
		
		dato1Alu <= x"000000AA";
		dato2Alu <= x"00000099";
		carry <= '1'; 
      -- insert stimulus here 
		operacionAlu <= "000001";
		wait for 100 ns;
	
		operacionAlu <= "000010";
		wait for 100 ns;
		
		operacionAlu <= "000011";
		wait for 100 ns;
		
		operacionAlu <= "000100";
		wait for 100 ns;
		
		operacionAlu <= "000101";
		wait for 100 ns;
		
		operacionAlu <= "000110";
		wait for 100 ns;
		
		operacionAlu <= "000111";
		wait for 100 ns;
		
		operacionAlu <= "001000";
      wait;
   end process;

END;
