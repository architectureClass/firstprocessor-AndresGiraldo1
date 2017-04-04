library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salidaAlu : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador;

architecture Behavioral of Procesador is

COMPONENT NProgramCounter
	PORT(
		clk : in  STD_LOGIC;
      reset : in  STD_LOGIC;
      entradaNProgramCounter : in  STD_LOGIC_VECTOR (31 downto 0);
      salidaNProgramCounter : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;

	COMPONENT ProgramCounter
	PORT(
		clk : in  STD_LOGIC;
      pc_entrada : in  STD_LOGIC_VECTOR (31 downto 0);
      pc_salida : out  STD_LOGIC_VECTOR (31 downto 0);
      reset : in  STD_LOGIC
		);
	END COMPONENT;

	COMPONENT sumador32
	PORT(
		a : in  STD_LOGIC_VECTOR (31 downto 0);
      b : in  STD_LOGIC_VECTOR (31 downto 0);
      salidaSumador : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;

	COMPONENT InstructionMemory
	PORT(
		address : in  STD_LOGIC_VECTOR (31 downto 0);
      reset : in  STD_LOGIC;
      outInstruction : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT UnidadControl
	PORT(
		op : in  STD_LOGIC_VECTOR (1 downto 0);
      op3 : in  STD_LOGIC_VECTOR (5 downto 0);
      salidaUnidadControl : out  STD_LOGIC_VECTOR (3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RegisterFile
	PORT(
		rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
      rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
      rd : in  STD_LOGIC_VECTOR (4 downto 0);
      datoEscribir : in  STD_LOGIC_VECTOR (31 downto 0);
      reset : in  STD_LOGIC;
      crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
      crs2 : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;

	COMPONENT ALU
	PORT(
		dato1Alu : in  STD_LOGIC_VECTOR (31 downto 0);
      dato2Alu : in  STD_LOGIC_VECTOR (31 downto 0);
      operacionAlu : in  STD_LOGIC_VECTOR (3 downto 0);
      salidaAlu : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT extensionSigno
	PORT(
		inmediato : in  STD_LOGIC_VECTOR (12 downto 0);
      salida_ext : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;

	COMPONENT multiplexor32
	PORT(
		entrada1 : in  STD_LOGIC_VECTOR (31 downto 0);
      entrada2 : in  STD_LOGIC_VECTOR (31 downto 0);
      senalControl : in  STD_LOGIC;
      salida_mux : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	signal suma_out, nPC_out, PC_out, IM_out, CRs1, CRs2, ALUResult, SEU_out, MUX_out : std_logic_vector(31 downto 0);
	signal CU_out : std_logic_vector(3 downto 0);

begin

	Inst_nPC: NProgramCounter PORT MAP(
		entradaNProgramCounter => suma_out,
		reset => reset,
		clk => clk,
		salidaNProgramCounter => nPC_out
	);
	
	Inst_PC: ProgramCounter PORT MAP(
		pc_entrada => nPC_out,
		reset => reset,
		clk => clk,
		pc_salida => PC_out 
	);
	
	Inst_suma: sumador32 PORT MAP(
		a => x"00000001",
		b => nPC_out,
		salidaSumador => suma_out
	);
	
	Inst_IM: InstructionMemory PORT MAP(
		address => PC_out,
		reset => reset,
		outInstruction => IM_out
	);
	
	Inst_CU: UnidadControl PORT MAP(
		op => IM_out(31 downto 30),
		op3 => IM_out(24 downto 19),
		salidaUnidadControl => CU_out
	);
	
	Inst_RF: RegisterFile PORT MAP(
		reset => reset,
		rs1 => IM_out(18 downto 14),
		rs2 => IM_out(4 downto 0),
		rd => IM_out(29 downto 25),
		datoEscribir => ALUResult,
		crs1 => CRs1,
		crs2 => CRs2
	);
	
	Inst_SEU: extensionSigno PORT MAP(
		inmediato => IM_out(12 downto 0),
		salida_ext => SEU_out
	);
	
	Inst_MUX: multiplexor32 PORT MAP(
		entrada1 => CRs2,
		entrada2 => SEU_out,
		salida_mux => MUX_out,
		senalControl => IM_out(13) 
	);	
	
	Inst_ALU: ALU PORT MAP(
		dato1Alu => CRs1,
		dato2Alu => MUX_out,
		operacionAlu => CU_out,
		salidaAlu => ALUResult
	);
	
	salidaAlu <= ALUResult;


end Behavioral;

