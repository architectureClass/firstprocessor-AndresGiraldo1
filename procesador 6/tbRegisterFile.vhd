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
         nrs1 : IN  std_logic_vector(5 downto 0);
         nrs2 : IN  std_logic_vector(5 downto 0);
         nrd : IN  std_logic_vector(5 downto 0);
         datoEscribir : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal nrs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal nrs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal nrd : std_logic_vector(5 downto 0) := (others => '0');
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
          nrs1 => nrs1,
          nrs2 => nrs2,
          nrd => nrd,
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
		nrs1 <= "010000";
		nrs2 <= "010001";
		nrd <= "000001";
		datoEscribir <= x"00001000";
		wait for 100 ns;
   end process;

END;
