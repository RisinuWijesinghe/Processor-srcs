----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 05:47:28 AM
-- Design Name: 
-- Module Name: PC_Add3Bit_Test - Behavioral
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

entity PC_Add3Bit_Test is
    Port ( Clock : in STD_LOGIC;
           res : in std_logic;
           Output_3bit : out STD_LOGIC_VECTOR (2 downto 0);
           Output_mem_sel : out STD_LOGIC_VECTOR (2 downto 0));
end PC_Add3Bit_Test;

architecture Behavioral of PC_Add3Bit_Test is
component Programme_Counter
    Port ( D : inout STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q: out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Adder_3_bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
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

signal clear : std_logic:='0';
signal d,mem_select: std_logic_vector(2 downto 0):="000";

begin
programme_counter_0: programme_counter
    port map(
        D=>d,
        clk=>clock,
        res =>res,
        q =>mem_select);
        

Adder_3_bit_0: Adder_3_bit
    port map (
        A=>mem_select,
        S=>d);
        


Output_3bit <=d;
Output_mem_sel <= mem_select;



end Behavioral;
