----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/10/2023 06:19:35 PM
-- Design Name: 
-- Module Name: Processor - Behavioral
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

entity Processor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Zero: out STD_LOGIC;
           Overflow: out STD_LOGIC;
           Display: out STD_LOGIC_VECTOR(3 downto 0) := "0111";
--           R_enable_out : out STD_LOGIC_VECTOR (2 downto 0);
--           R0_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R1_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R2_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R3_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R4_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R5_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R6_out : out STD_LOGIC_VECTOR (3 downto 0);
           R7_out : out STD_LOGIC_VECTOR (3 downto 0);
--           J_Fl: out STD_LOGIC;
--           J_Adr: out STD_LOGIC_VECTOR (2 downto 0);
--           MUX1_out : out STD_LOGIC_VECTOR (3 downto 0);
--           Mux2_out : out STD_LOGIC_VECTOR (3 downto 0);
--           addSubOut : out STD_LOGIC_VECTOR (3 downto 0);
--           Ins : out STD_LOGIC_VECTOR (11 downto 0);
           DisplayOut : out STD_LOGIC_VECTOR(6 downto 0);
--           Ad_3_O : out STD_LOGIC_VECTOR(2 downto 0);
--           M_23_O : out STD_LOGIC_VECTOR(2 downto 0);
--           P_O : out STD_LOGIC_VECTOR(2 downto 0);
           Cl_O: out STD_LOGIC
           );
end Processor;

architecture Behavioral of Processor is

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component UpperPartTest
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
end component;

component LowerPartTest
    Port ( Clk_in : in STD_LOGIC;
           Res : in STD_LOGIC;
           J_Fl: in STD_LOGIC;
           J_Val: In STD_LOGIC_VECTOR(2 DOWNTO 0);
           
           Ins : out STD_LOGIC_VECTOR (11 downto 0)
--           Ad_3_O : out STD_LOGIC_VECTOR(2 downto 0);
--           M_23_O : out STD_LOGIC_VECTOR(2 downto 0);
--           P_O : out STD_LOGIC_VECTOR(2 downto 0)
           );
           
end component;

signal slow_clk_out, jump_flag: STD_LOGIC;
signal jump_val: STD_LOGIC_VECTOR(2 downto 0);
--adder_o, mux_23_o, pc_o: STD_LOGIC_VECTOR(2 downto 0);
signal instruction: STD_LOGIC_VECTOR(11 downto 0);


begin

Slow_Clock : Slow_Clk
    port map (
    Clk_in => Clk,
    Clk_out => slow_clk_out
    );
    
lower_part : LowerPartTest
    port map (
    Clk_in => slow_clk_out,
        Res => Reset,
        J_Fl=> jump_flag,
        J_Val => jump_val,
        Ins => instruction
--        Ad_3_O => adder_o,
--        M_23_O => mux_23_o,
--        P_O => pc_o
        );
        
upper_part : UpperPartTest 
    port map (
    instructionBus => instruction,
        zero =>Zero,
        clock =>slow_clk_out,
        res => Reset,
        overflow =>Overflow,
--        R_enable_out=> R_enable_out,
--        R0_out => R0_out,
--        R1_out => R1_out,
--        R2_out => R2_out,
--        R3_out => R3_out,
--        R4_out => R4_out,
--        R5_out => R5_out,
--        R6_out => R6_out,
        R7_out => R7_out,
--        MUX1_out=> MUX1_out,
--        Mux2_out => Mux2_out,
--        addSubOut => addSubOut,
        DisplayOut => DisplayOut,
        JumpVal => jump_val,
        JumpFlag => jump_flag
        );
        
-- Ins <= instruction;
-- J_Fl <= jump_flag;
-- J_Adr <= jump_val;
-- Ad_3_O <= adder_o;
-- M_23_O <= mux_23_o;
--P_O <= pc_o;
Cl_O <= slow_clk_out;

    

end Behavioral;
