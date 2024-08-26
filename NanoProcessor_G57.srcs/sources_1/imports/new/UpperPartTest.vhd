----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 11:05:46 AM
-- Design Name: 
-- Module Name: UpperPartTest - Behavioral
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

entity UpperPartTest is
    Port ( instructionBus : in STD_LOGIC_VECTOR (11 downto 0);
           zero : out STD_LOGIC;
           clock :in std_logic;
           res : in std_logic;
           overflow : out STD_LOGIC;
--           R_enable_out : out STD_LOGIC_VECTOR (2 downto 0);
--           R0_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R1_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R2_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R3_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R4_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R5_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R6_out : out STD_LOGIC_VECTOR (3 downto 0);
           R7_out : out STD_LOGIC_VECTOR (3 downto 0);
--           MUX1_out : out STD_LOGIC_VECTOR (3 downto 0);
--           Mux2_out : out STD_LOGIC_VECTOR (3 downto 0);
--           addSubOut : out STD_LOGIC_VECTOR (3 downto 0);
           DisplayOut : out STD_LOGIC_VECTOR(6 downto 0);
           JumpFlag: out STD_LOGIC;
           JumpVal: out STD_LOGIC_VECTOR(2 downto 0));
end UpperPartTest;

architecture Behavioral of UpperPartTest is

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

component MUX_2_4
    Port ( Sel : in STD_LOGIC;
           IM_VAL : in STD_LOGIC_VECTOR (3 downto 0);
           AD_VAL : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

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

component LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal Mux_1_out,ImmediateValue,reg_val,Mux_2_out,addSubunitOut: std_logic_vector(3 downto 0); 
signal R_En,J_Addr,R1_sel,R2_sel : std_logic_vector(2 downto 0);
signal Add_Sub_Sel,Load_Select,J_flag:std_logic;
type d_bus is array (0 to 7) of std_logic_vector(3 downto 0);
signal Data_bus : d_bus;
signal seg_out : std_logic_vector(6 downto 0);

begin

segment_7_display_lut : LUT_16_7
    port map (
    address => Data_bus(7),
    data => seg_out
    );

insDec : Instruction_Decoder
    port map (
        INS => instructionBus ,
        Jump_Check => Mux_1_out,
        Add_Sub_Sel => Add_Sub_Sel,
        R_SEL_1 => R1_sel,    
        R_SEL_2 => R2_sel,
        L_SEL => Load_Select,
        IM_VAL => ImmediateValue,
        R_EN => R_En,
        J_FL => J_flag,
        J_ADR => J_Addr
        );

mux_2_4_0: MUX_2_4
    Port map  ( 
           Sel =>Load_Select,
           IM_VAL =>ImmediateValue,
           AD_VAL => addSubunitOut,
           O => reg_val);
           
 Register_bank : Reg_Bank
              port map (
                  Clock => clock,
                  Reg_En => R_En,
                  Val_Store => reg_val,
                  Clear => Res,
                  Reg_0_out => Data_Bus(0),
                  Reg_1_out => Data_Bus(1),
                  Reg_2_out => Data_Bus(2),
                  Reg_3_out => Data_Bus(3),
                  Reg_4_out => Data_Bus(4),
                  Reg_5_out => Data_Bus(5),
                  Reg_6_out => Data_Bus(6),
                  Reg_7_out => Data_Bus(7));
                  

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
        Ctrl => R1_sel,
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
        Ctrl => R2_sel,
        O => Mux_2_out);
        

Add_Sub : Add_Sub_Unit
    port map (
        sel => Add_Sub_Sel,
        firstNo => Mux_1_out,
        secNo => Mux_2_out,
        OverFlow => overflow,
        Zero => Zero,
        addsubOut => addSubunitOut);

--R_enable_out <= R_En;        
--R0_out <= Data_Bus(0);
--R1_out <= Data_Bus(1);
--R2_out <= Data_Bus(2);
--R3_out <= Data_Bus(3);
--R4_out <= Data_Bus(4);
--R5_out <= Data_Bus(5);
--R6_out <= Data_Bus(6);
R7_out <= Data_Bus(7);
--MUX1_out <=Mux_1_out;
--Mux2_out <=Mux_2_out;
--addSubOut<= addSubunitOut;
DisplayOut <= seg_out;
JumpFlag <= J_flag;
JumpVal <= J_Addr;
        
        


end Behavioral;
