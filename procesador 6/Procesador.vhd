library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salidaAlu : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end Procesador;

architecture Behavioral of Procesador is

COMPONENT PSRM 
    Port ( reset : in  STD_LOGIC;
           operador2 : in  STD_LOGIC;
           registro1 : in  STD_LOGIC;
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0);
           ResultadoAlu : in  STD_LOGIC_VECTOR (31 downto 0);
			  OP: in STD_LOGIC_VECTOR(1 downto 0);
           AluOpcion : in  STD_LOGIC_VECTOR (5 downto 0));
end COMPONENT;

COMPONENT PSR 
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  ncwp : in  STD_LOGIC;
			  icc: out STD_LOGIC_VECTOR (3 downto 0);
			  carry : out  STD_LOGIC;
           cwp : out  STD_LOGIC
			  );
end COMPONENT;

COMPONENT WindowsManager
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           ncwp : out  STD_LOGIC;
			  RO7 : out STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC
			  );
end COMPONENT;


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
		op2 : in STD_LOGIC_VECTOR (2 downto 0);
		icc : in STD_LOGIC_VECTOR (3 downto 0);
		cond: in STD_LOGIC_VECTOR (3 downto 0);
      aluOP : out  STD_LOGIC_VECTOR (5 downto 0);
		enableDM: out STD_LOGIC;
		wrenDM: out STD_LOGIC;
		selectorDM: out STD_LOGIC_VECTOR(1 downto 0);
		PCSource: out STD_LOGIC_VECTOR(1 downto 0);
		RFdest: out STD_LOGIC;
		write_enable : out STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT RegisterFile
	PORT(
		nrs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           nrd : in  STD_LOGIC_VECTOR (5 downto 0);
           datoEscribir : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  write_enable: in STD_LOGIC;
			  CRd : out STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;

	COMPONENT ALU
	PORT(
		dato1Alu : in  STD_LOGIC_VECTOR (31 downto 0);
      dato2Alu : in  STD_LOGIC_VECTOR (31 downto 0);
      operacionAlu : in  STD_LOGIC_VECTOR (5 downto 0);
      salidaAlu : out  STD_LOGIC_VECTOR (31 downto 0);
		carry : in  STD_LOGIC
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
	
	COMPONENT DataMemory
	PORT(
		clk : in  STD_LOGIC;
      reset : in  STD_LOGIC;
      enableMem : in  STD_LOGIC;
      writeEnable : in  STD_LOGIC;
      aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
      CRD : in  STD_LOGIC_VECTOR (31 downto 0);
      salidaDM : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT MuxPC
	PORT(
		disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
      disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
      pc : in  STD_LOGIC_VECTOR (31 downto 0);
      pcSource : in  STD_LOGIC_VECTOR (1 downto 0);
      pcSalidaMux : out  STD_LOGIC_VECTOR (31 downto 0);
      pcDireccion : in  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU22
	PORT(
		disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
      seu22 : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU30
	PORT(
		disp30 : in  STD_LOGIC_VECTOR (29 downto 0);
      seu30 : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Sumador22
	PORT(
		pc : in  STD_LOGIC_VECTOR (31 downto 0);
      disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
      salida22 : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT muxDataManager
	PORT(
		selector : in  STD_LOGIC_VECTOR (1 downto 0);
      data : in  STD_LOGIC_VECTOR (31 downto 0);
      alu_result : in  STD_LOGIC_VECTOR (31 downto 0);
      PC : in  STD_LOGIC_VECTOR (31 downto 0);
      dataToWrite : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT muxRF_WM
	PORT(
		RDWM : in  STD_LOGIC_VECTOR (5 downto 0);
      ro7 : in  STD_LOGIC_VECTOR (5 downto 0);
      rfDest : in  STD_LOGIC;
      nrd : out  STD_LOGIC_VECTOR (5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT sumador30
	PORT(
		pc : in  STD_LOGIC_VECTOR (31 downto 0);
      disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
      salida30 : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
signal npcOut,pcOut,muxPCout,sumadorMux,outIMsignal,outSEU22,outSEU30,outSum22,outSum30,aluOutSignal,alu_operando1,alu_operando2,data_to_write,crd_signal,CR_in_mux,imm_in_mux,data_signal: STD_LOGIC_VECTOR(31 downto 0);	
signal pcsource_signal,selectorDM_signal: STD_LOGIC_VECTOR(1 downto 0);
signal icc_signal,nzvc_signal: STD_LOGIC_VECTOR(3 downto 0);
signal outopcionAlu,nrs1_signal,nrs2_signal,wmnrd_signal,RO7_signal,nrd_signal: STD_LOGIC_VECTOR(5 downto 0);
signal enM_signal,wrM_signal,rfdest_signal,writeenable,carry_signal,ncwp_signal,cwp_signal: STD_LOGIC;--Habilitar DM
begin

    Inst_PSRM: PSRM Port Map( 
		reset => reset,--########
      operador2 => alu_operando2(31),--####
      registro1 => alu_operando1(31),--#########
      nzvc => nzvc_signal,--#########
      ResultadoAlu => aluOutSignal,--##########
		OP =>outIMsignal(31 downto 30),--########
      AluOpcion =>outIMsignal(24 downto 19)--##########
	);
	
	Inst_PSR: PSR Port Map( 
		reset => reset,--############
		clk => clk,--##############
      carry => carry_signal,--###########
      nzvc => nzvc_signal,--#####
      ncwp => ncwp_signal,--######
		icc => icc_signal,--########
      cwp => cwp_signal--#########
	);
	
	
	Inst_WM: WindowsManager Port Map( 
		rs1 => outIMsignal(18 downto 14),--##########
		rs2 => outIMsignal(4 downto 0),--##########
      rd => outIMsignal(29 downto 25),--##########
      op => outIMsignal(31 downto 30),--##########
		op3 => outIMsignal(24 downto 19),--##########
		nrs1 => nrs1_signal,--##########
      nrs2 => nrs2_signal,--#########
      nrd => wmnrd_signal,--#########
      ncwp => ncwp_signal,--##########
		RO7 => RO7_signal,--###########
      cwp => cwp_signal--#########
	);

	Inst_nPC: NProgramCounter PORT MAP(
		entradaNProgramCounter => muxPCout,--##########
		reset => reset,--##########
		clk => clk,--########
		salidaNProgramCounter => npcOut--############
	);
	
	Inst_PC: ProgramCounter PORT MAP(
		pc_entrada => npcOut,--############
		reset => reset,--########
		clk => clk,--#########
		pc_salida => pcOut--#############
	);
	
	Inst_suma: sumador32 PORT MAP(
		a => x"00000001",--###########
		b => npcOut,--############## 
		salidaSumador => sumadorMux--###########
	);
	
	Inst_IM: InstructionMemory PORT MAP(
		address => pcOut,--###########
		reset => reset,--###########
		outInstruction => outIMsignal--############
	);
	
	Inst_CU: UnidadControl PORT MAP(
		op => outIMsignal(31 downto 30),--###########
		op3 => outIMsignal(24 downto 19),--##########
		op2 => outIMsignal(24 downto 22),--##########
	   icc => icc_signal,--########
		cond => outIMsignal(28 downto 25),--##########
      aluOP => outopcionAlu,--##########
		enableDM =>enM_signal,--########
		wrenDM =>wrM_signal,--#######
		selectorDM => selectorDM_signal,--########
		PCSource => pcsource_signal,--############
		RFdest => rfdest_signal,--#########
		write_enable => writeenable--#############
	);
	
	Inst_RF: RegisterFile PORT MAP(
		reset => reset,--###########
		nrs1 => nrs1_signal,--##########
		nrs2 => nrs2_signal,--#########
		nrd => nrd_signal,--##########
		datoEscribir => data_to_write,--#######
		crs1 => alu_operando1,--##########
		write_enable =>writeenable,--###########
		CRd => crd_signal,--##########
		crs2 => CR_in_mux--############
	);
	
	Inst_SEU: extensionSigno PORT MAP(
		inmediato => outIMsignal(12 downto 0),--###########
		salida_ext => imm_in_mux--##########
	);
	
	Inst_MUX: multiplexor32 PORT MAP(
		entrada1 => CR_in_mux,--##########
		entrada2 => imm_in_mux,--###########
		salida_mux => alu_operando2,--##########
		senalControl => outIMsignal(13)--#############
	);	
	
	Inst_ALU: ALU PORT MAP(
		dato1Alu => alu_operando1,--########
		dato2Alu => alu_operando2,--########
		operacionAlu => outopcionAlu,--##########
		salidaAlu => aluOutSignal,--###############
		carry => carry_signal--#############
	);
	
	Inst_DM: DataMemory PORT MAP(
		clk => clk,--###########
      reset => reset,--##########
      enableMem => enM_signal,--########
      writeEnable =>wrM_signal,--######
      aluResult => aluOutSignal,--####
      CRD => crd_signal,--##########
      salidaDM => data_signal--#########
	);
	
	Inst_MuxPC: MuxPC PORT MAP(
		disp30 => outSum30,--########
      disp22 => outSum22,--##########
      pc => sumadorMux,--########
      pcSource => pcsource_signal,--######
      pcSalidaMux => muxPCout,--################
      pcDireccion => aluOutSignal--##########
	);
	
	
	Inst_SEU22: SEU22 PORT MAP(
		disp22 => outIMsignal(21 downto 0),--##########
      seu22 => outSEU22--########
	);
	
	Inst_SEU30: SEU30 PORT MAP(
		disp30 => outIMsignal(29 downto 0),--#############
      seu30 => outSEU30--###########
	);
	
	
	Inst_Sumador22: Sumador22 PORT MAP(
		pc => pcOut,--#############
      disp22 => outSEU22,--#######
      salida22 => outSum22--######
	);
	
	Inst_muxDataManager: muxDataManager PORT MAP(
		selector => selectorDM_signal,--###########
      data => data_signal,--##########
      alu_result => aluOutSignal,--###########
      PC => pcOut,--#############
      dataToWrite => data_to_write--#######
	);
	
	Inst_muxRF_WM: muxRF_WM PORT MAP(
		RDWM =>wmnrd_signal,--##########
      ro7 => RO7_signal,--#########
      rfDest => rfdest_signal,--###########
      nrd => nrd_signal--#######
	);
	
	Inst_sumador30: sumador30 PORT MAP(
		pc => pcOut,--#############
      disp30 => outSEU30,--#########
      salida30 => outSum30--###########
	);
	
	salidaAlu <= aluOutSignal;


end Behavioral;

