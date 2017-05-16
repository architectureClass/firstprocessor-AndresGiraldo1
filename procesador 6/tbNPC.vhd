LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbNPC IS
END tbNPC;
 
ARCHITECTURE behavior OF tbNPC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NProgramCounter
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         entradaNProgramCounter : IN  std_logic_vector(31 downto 0);
         salidaNProgramCounter : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal entradaNProgramCounter : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salidaNProgramCounter : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NProgramCounter PORT MAP (
          clk => clk,
          reset => reset,
          entradaNProgramCounter => entradaNProgramCounter,
          salidaNProgramCounter => salidaNProgramCounter
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '1';
      wait for 100 ns;	
		reset <= '0'; 
		entradaNProgramCounter <= x"00000001";       
		wait for 20 ns;
		entradaNProgramCounter <= x"0000000A";
		wait for 20 ns;
		entradaNProgramCounter <= x"00000010";
		wait for 20 ns;
		reset <= '0'; 
      wait;
   end process;

END;
