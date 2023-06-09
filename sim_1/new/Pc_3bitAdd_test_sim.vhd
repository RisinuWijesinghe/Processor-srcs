----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 06:06:00 AM
-- Design Name: 
-- Module Name: Pc_3bitAdd_test_sim - Behavioral
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

entity Pc_3bitAdd_test_sim is
--  Port ( );
end Pc_3bitAdd_test_sim;

architecture Behavioral of Pc_3bitAdd_test_sim is
component PC_Add3Bit_Test is
    Port ( Clock : in STD_LOGIC;
           Output_3bit : out STD_LOGIC_VECTOR (2 downto 0);
           Output_mem_sel : out STD_LOGIC_VECTOR (2 downto 0);
           res : in std_logic);
end component;

signal res: std_logic;
signal clock :std_logic:='0';
signal Output_3bit,Output_mem_sel: std_logic_vector(2 downto 0);
begin

UUT: PC_Add3Bit_Test
    port map(
        clock =>clock,
        Output_3bit => Output_3bit,
        Output_mem_sel=>Output_mem_sel,
        res=> res);
       
        
process 
begin
           
    Clock <= not(clock);
    wait for 10ns;
           
end process;
             
process 
    begin
    res <= '1';
    wait for 100ns;
    res <= '0';
    wait;  
end process;
       



    

end Behavioral;
