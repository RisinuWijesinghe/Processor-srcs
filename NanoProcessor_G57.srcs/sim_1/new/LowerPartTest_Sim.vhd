----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:23:14 PM
-- Design Name: 
-- Module Name: LowerPartTest_Sim - Behavioral
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

entity LowerPartTest_Sim is
--  Port ( );
end LowerPartTest_Sim;

architecture Behavioral of LowerPartTest_Sim is

component LowerPartTest 
               Port ( Clk_in : in STD_LOGIC;
                      Res : in STD_LOGIC;
                      J_Fl: in STD_LOGIC;
                      J_Val: In STD_LOGIC_VECTOR(2 DOWNTO 0);
                      
                      Ins : out STD_LOGIC_VECTOR (11 downto 0);
                      Ad_3_O : out STD_LOGIC_VECTOR(2 downto 0);
                      M_23_O : out STD_LOGIC_VECTOR(2 downto 0);
                      P_O : out STD_LOGIC_VECTOR(2 downto 0)
                      );
                      
end component;

signal clock, reset : STD_LOGIC := '0';
signal jump_flag: STD_LOGIC;
signal adder_o, mux_23_o, pc_o, jump_val : STD_LOGIC_VECTOR(2 downto 0);
signal instruction : STD_LOGIC_VECTOR(11 downto 0);

begin

UUT: LowerPartTest
    Port map (
    Clk_in => clock,
    Res => reset,
    J_Fl=> jump_flag,
    J_Val => jump_val,
    Ins => instruction,
    Ad_3_O => adder_o,
    M_23_O => mux_23_o,
    P_O => pc_o
    );
    
process
begin
           
    Clock <= not(clock);
    wait for 10ns;
           
end process;

process
begin
    jump_val <= "010";
    jump_flag <= '0';
    reset <= '1';
    wait for 100 ns;
    
    reset <= '0';
    wait for 100 ns;
    
    jump_flag <= '1';

    wait for 100 ns;
    
    jump_val <= "000";
    
    wait for 100 ns;
    
    jump_flag <= '0';

    wait;
    
end process;   


end Behavioral;
