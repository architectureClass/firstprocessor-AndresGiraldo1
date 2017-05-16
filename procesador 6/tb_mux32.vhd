
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mux32 IS
END tb_mux32;
 
ARCHITECTURE behavior OF tb_mux32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexor32
    PORT(
         entrada1 : IN  std_logic_vector(31 downto 0);
         entrada2 : IN  std_logic_vector(31 downto 0);
         senalControl : IN  std_logic;
         salida_mux : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada1 : std_logic_vector(31 downto 0) := (others => '0');
   signal entrada2 : std_logic_vector(31 downto 0) := (others => '0');
   signal senalControl : std_logic := '0';

 	--Outputs
   signal salida_mux : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexor32 PORT MAP (
          entrada1 => entrada1,
          entrada2 => entrada2,
          senalControl => senalControl,
          salida_mux => salida_mux
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
    entrada1 <= x"00031201";
		entrada2 <= x"0120020A";
		senalControl <= '0';
      wait for 100 ns;	
		senalControl <= '1';
		wait for 100 ns;	
		entrada1 <= x"00001200";
		entrada2 <= x"0F20E20A";
		wait for 100 ns;
		senalControl <= '0';

      wait;
   end process;

END;
