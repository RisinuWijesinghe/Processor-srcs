----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 05:01:03 PM
-- Design Name: 
-- Module Name: NanoProcessor_Sim - Behavioral
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

entity NanoProcessor_Sim is
--  Port ( );
end NanoProcessor_Sim;

architecture Behavioral of NanoProcessor_Sim is

component NanoProcessor
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
end component;

signal clock, reset : STD_LOGIC := '0';
signal adder_o, mux_23_o, pc_o, reg_en, reg1, reg2 : STD_LOGIC_VECTOR(2 downto 0);
signal jump_check, ImmediateVal, adderVal, mux_24_o : STD_LOGIC_VECTOR(3 downto 0);
signal add_sub_select, load_sel, zero, overflow : STD_LOGIC;
signal instruction : STD_LOGIC_VECTOR(11 downto 0);
signal r0_o, r1_o, r2_o, r3_o, r4_o, r5_o, r6_o, r7_o : STD_LOGIC_VECTOR(3 downto 0);

signal mux_23_out, pc_out, adder_3_bit_out, J_Adr, reg_enable, reg_sel_1, reg_sel_2 : STD_LOGIC_VECTOR(2 downto 0);
signal immediatevalue, mux_24_out, Mux_1_out, Mux_2_out, add_sub_out : STD_LOGIC_VECTOR(3 downto 0);


begin

UUT: NanoProcessor
    Port map (
    Clk_in => clock,
    Res => reset,
    zero => zero,
    overflow => overflow,
    Mux1_out => Mux_1_out,
    Mux2_out => Mux_2_out,
    addSubOut => add_sub_out,
    Reg_0_out => r0_o,
    Reg_1_out => r1_o,
    Reg_2_out => r2_o,
    Reg_3_out => r3_o,
    Reg_4_out => r4_o,
    Reg_5_out => r5_o,
    Reg_6_out => r6_o,
    Reg_7_out => r7_o,
    M_24_O => mux_24_o,
    R_En => reg_en, 
    Add_Sub_Sel => add_sub_select,
    R_SEL_1 => reg1,
    R_SEL_2 => reg2,
    L_SEL => load_sel,
    IM_VAL => ImmediateVal,
    Ins => instruction,
    Ad_3_O => adder_o,
    M_23_O => mux_23_o,
    P_O => pc_o
    );

process
begin
           
    Clock <= not(clock);
    wait for 100ns;
           
end process;

process
begin
    
    reset <= '1';
    wait for 109 ns;
    
    reset <= '0';
    

    wait;
    
end process;
end Behavioral;
