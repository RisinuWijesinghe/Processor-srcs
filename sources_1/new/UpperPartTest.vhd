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
           overflow : in STD_LOGIC;
           zero : in STD_LOGIC;
           R_enable_out : in STD_LOGIC_VECTOR (2 downto 0);
           R1_out : in STD_LOGIC_VECTOR (3 downto 0);
           R2_out : in STD_LOGIC_VECTOR (3 downto 0);
           R3_out : in STD_LOGIC_VECTOR (3 downto 0);
           R4_out : in STD_LOGIC_VECTOR (3 downto 0);
           R5_out : in STD_LOGIC_VECTOR (3 downto 0);
           R6_out : in STD_LOGIC_VECTOR (3 downto 0);
           R7_out : in STD_LOGIC_VECTOR (3 downto 0);
           MUX1_out : in STD_LOGIC_VECTOR (3 downto 0);
           Mux2_out : in STD_LOGIC_VECTOR (3 downto 0);
           addSubOut : in STD_LOGIC_VECTOR (3 downto 0));
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

signal Mux_1_out,R1_sel,R2_sel : std_logic_vector(3 downto 0); 
signal Add_Sub_Sel:std_logic;
begin

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
    


end Behavioral;
