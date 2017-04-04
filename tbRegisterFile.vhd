LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbRegisterFile IS
END tbRegisterFile;
 
ARCHITECTURE behavior OF tbRegisterFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         datoEscribir : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal datoEscribir : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          datoEscribir => datoEscribir,
          reset => reset,
          crs1 => crs1,
          crs2 => crs2
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
		reset <= '0';
		rs1 <= "10000";
		rs2 <= "10001";
		rd <= "00001";
		datoEscribir <= x"00000010";
		wait for 100 ns;
		reset <= '0';
		rs1 <= "10000";
		rs2 <= "10001";
		rd <= "00000";
		datoEscribir <= x"00000011";
		wait for 100 ns;
		reset <= '1';
		rs1 <= "10000";
		rs2 <= "10001";
		rd <= "00011";
		datoEscribir <= x"00000001";
		wait for 100 ns;
   end process;

END;
