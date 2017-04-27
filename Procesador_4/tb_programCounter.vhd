
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_programCounter IS
END tb_programCounter;
 
ARCHITECTURE behavior OF tb_programCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProgramCounter
    PORT(
         clk : IN  std_logic;
         pc_entrada : IN  std_logic_vector(31 downto 0);
         pc_salida : OUT  std_logic_vector(31 downto 0);
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal pc_entrada : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal pc_salida : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          clk => clk,
          pc_entrada => pc_entrada,
          pc_salida => pc_salida,
          reset => reset
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
		pc_entrada <= x"00000001";       
		wait for 20 ns;
		pc_entrada <= x"0000000A";
		wait for 20 ns;
		pc_entrada <= x"00000010";
		wait for 20 ns;
		reset <= '0'; 
      wait;
   end process;

END;
