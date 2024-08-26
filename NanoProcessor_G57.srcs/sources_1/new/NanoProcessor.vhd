----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 04:25:51 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NanoProcessor is
  Port ( Clk_in : in STD_LOGIC;
           Res : in STD_LOGIC;
           zero : out STD_LOGIC;
           overflow : out STD_LOGIC;
           MUX1_out : out STD_LOGIC_VECTOR (3 downto 0);
           Mux2_out : out STD_LOGIC_VECTOR (3 downto 0);
           addSubOut : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_0_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_1_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_2_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_3_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_4_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_5_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_6_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_7_out : out STD_LOGIC_VECTOR (3 downto 0);
           M_24_O: out STD_LOGIC_VECTOR(3 downto 0);
           R_En : out STD_LOGIC_VECTOR(2 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           R_SEL_1 : out STD_LOGIC_VECTOR (2 downto 0);
           R_SEL_2 : out STD_LOGIC_VECTOR (2 downto 0);
           L_SEL : out STD_LOGIC;
           IM_VAL : out STD_LOGIC_VECTOR (3 downto 0);
           Ins : out STD_LOGIC_VECTOR (11 downto 0);
           Ad_3_O : out STD_LOGIC_VECTOR(2 downto 0);
           M_23_O : out STD_LOGIC_VECTOR(2 downto 0);
           P_O : out STD_LOGIC_VECTOR(2 downto 0)
  );
end NanoProcessor;

architecture Behavioral of NanoProcessor is


component Reg_Bank
    Port ( Clock : in STD_LOGIC;
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           Val_Store : in STD_LOGIC_VECTOR (3 downto 0);
           Clear : in STD_LOGIC;
           Reg_0_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_1_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_2_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_3_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_4_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_5_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_6_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_7_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component ROM_3_TO_12
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Programme_Counter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q: out STD_LOGIC_VECTOR (2 downto 0):="000");
end component;

component Adder_3_bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_2_3
    Port ( JUMP_F : in STD_LOGIC;
           JUMP_Val : in STD_LOGIC_VECTOR (2 downto 0);
           ADD : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Instruction_Decoder 
    Port ( INS : in STD_LOGIC_VECTOR (11 downto 0);
           Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           R_SEL_1 : out STD_LOGIC_VECTOR (2 downto 0);
           R_SEL_2 : out STD_LOGIC_VECTOR (2 downto 0);
           L_SEL : out STD_LOGIC;
           IM_VAL : out STD_LOGIC_VECTOR (3 downto 0);
           R_EN : out STD_LOGIC_VECTOR (2 downto 0);
           J_FL : out STD_LOGIC;
           J_ADR : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux_2_4
    port ( Sel : in STD_LOGIC;
           IM_VAL : in STD_LOGIC_VECTOR (3 downto 0);
           AD_VAL : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_8_4
    Port ( 
           R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           Ctrl : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Add_Sub_Unit
    Port ( sel : in STD_LOGIC;
           firstNo : in STD_LOGIC_VECTOR (3 downto 0);
           secNo : in STD_LOGIC_VECTOR (3 downto 0);
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           addsubOut : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal mux_23_out, pc_out, adder_3_bit_out, J_Adr, reg_enable, reg_sel_1, reg_sel_2 : STD_LOGIC_VECTOR(2 downto 0);
signal J_Flag, load_sel, clock, a_s_sel : STD_LOGIC;
signal instruction : STD_LOGIC_VECTOR(11 downto 0);
signal immediatevalue, mux_24_out, Mux_1_out, Mux_2_out, add_sub_out : STD_LOGIC_VECTOR(3 downto 0);
type d_bus is array (0 to 7) of std_logic_vector(3 downto 0);
signal Data_bus : d_bus;

begin

          
 Register_bank : Reg_Bank
              port map (
                  Clock => clock,
                  Reg_En => reg_enable,
                  Val_Store => mux_24_out,
                  Clear => Res,
                  Reg_0_out => Data_Bus(0),
                  Reg_1_out => Data_Bus(1),
                  Reg_2_out => Data_Bus(2),
                  Reg_3_out => Data_Bus(3),
                  Reg_4_out => Data_Bus(4),
                  Reg_5_out => Data_Bus(5),
                  Reg_6_out => Data_Bus(6),
                  Reg_7_out => Data_Bus(7));
                  
ID : Instruction_Decoder
    port map (
    INS => instruction,
    Jump_Check => Mux_1_out,
    Add_Sub_Sel => a_s_sel,
    R_SEL_1 => reg_sel_1,
    R_SEL_2 => reg_sel_2,
    L_SEL => load_sel,
    IM_VAL => immediatevalue,
    R_EN => reg_enable,
    J_FL => J_Flag,
    J_ADR => J_Adr
    );

 Mux_8_4_1: MUX_8_4
    port map (
        R0 => Data_Bus(0),
        R1 => Data_Bus(1),
        R2 => Data_Bus(2),
        R3 => Data_Bus(3),
        R4 => Data_Bus(4),
        R5 => Data_Bus(5),
        R6 => Data_Bus(6),
        R7 => Data_Bus(7),
        Ctrl => reg_sel_1,
        O => Mux_1_out);
        

 Mux_8_4_2: MUX_8_4
    port map (
        R0 => Data_Bus(0),
        R1 => Data_Bus(1),
        R2 => Data_Bus(2),
        R3 => Data_Bus(3),
        R4 => Data_Bus(4),
        R5 => Data_Bus(5),
        R6 => Data_Bus(6),
        R7 => Data_Bus(7),
        Ctrl => reg_sel_2,
        O => Mux_2_out);
        

Add_Sub : Add_Sub_Unit
    port map (
        sel => a_s_sel,
        firstNo => Mux_1_out,
        secNo => Mux_2_out,
        OverFlow => overflow,
        Zero => Zero,
        addsubOut => add_sub_out
        );


        

Mux_2_4_0: Mux_2_4
    port map (
    Sel => load_sel,
    IM_VAL => immediatevalue,
    AD_VAL => add_sub_out,
    O => mux_24_out
    );
    

PC : Programme_Counter
    port map (
    Clk => Clk_in,
    Res => Res,
    D => mux_23_out,
    Q => pc_out
    );

Rom : ROM_3_TO_12 
    port map (
    address => pc_out,
    data => instruction
    );

Adder_0 : Adder_3_bit 
    port map (
    A => pc_out,
    S => adder_3_bit_out
    );

Mux_0 : Mux_2_3 
    port map (
    JUMP_F => J_Flag,
    JUMP_Val => J_Adr,
    ADD => adder_3_bit_out,
    O => mux_23_out
    );
    
    


Ins <= instruction;
Ad_3_O <= adder_3_bit_out;
M_23_O <= mux_23_out;
P_O <= pc_out;
L_SEL <= load_sel;
IM_VAL <= immediatevalue;
M_24_O <= mux_24_out;
R_EN <= reg_enable;       
Reg_0_out <= Data_Bus(0);
Reg_1_out <= Data_Bus(1);
Reg_2_out <= Data_Bus(2);
Reg_3_out <= Data_Bus(3);
Reg_4_out <= Data_Bus(4);
Reg_5_out <= Data_Bus(5);
Reg_6_out <= Data_Bus(6);
Reg_7_out <= Data_Bus(7);
MUX1_out <=Mux_1_out;
Mux2_out <=Mux_2_out;
addSubOut<= add_sub_out;

end Behavioral;
