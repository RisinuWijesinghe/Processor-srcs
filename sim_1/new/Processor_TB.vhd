----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 05:26:22 PM
-- Design Name: 
-- Module Name: Processor_TB - Behavioral
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

entity Processor_TB is
--  Port ( );
end Processor_TB;

architecture Behavioral of Processor_TB is

component Processor is
    Port ( Clk_in : in STD_LOGIC;
           Res : in STD_LOGIC;
           data_bus0_Output: out STD_LOGIC_VECTOR(3 downto 0);
           data_bus1_Output: out STD_LOGIC_VECTOR(3 downto 0);
           data_bus2_Output: out STD_LOGIC_VECTOR(3 downto 0);
           data_bus3_Output: out STD_LOGIC_VECTOR(3 downto 0);
           data_bus4_Output: out STD_LOGIC_VECTOR(3 downto 0);
           data_bus5_Output: out STD_LOGIC_VECTOR(3 downto 0);
           data_bus6_Output: out STD_LOGIC_VECTOR(3 downto 0);
           data_bus7_Output: out STD_LOGIC_VECTOR(3 downto 0);
           Adder_output: out Std_logic_vector(2 downto 0);
           instructionBus_Output :out std_logic_vector(11  downto 0)
           );
end component;

signal clock,reset : std_logic:='0';
signal data_bus0_Output,data_bus1_Output,data_bus2_Output,data_bus3_Output,data_bus4_Output,data_bus5_Output,data_bus6_Output,data_bus7_Output : std_logic_vector(3 downto 0);
signal Adder_output: std_logic_vector(2 downto 0);
signal instructionBus_Output: std_logic_vector(11 downto 0);
begin

UUT: Processor 
    port map(
    Clk_in => clock,
    Res => reset,
    data_bus0_Output => data_bus0_Output,
    data_bus1_Output => data_bus1_Output,
    data_bus2_Output => data_bus2_Output,
    data_bus3_Output => data_bus3_Output,
    data_bus4_Output => data_bus4_Output,
    data_bus5_Output => data_bus5_Output,
    data_bus6_Output => data_bus6_Output,
    data_bus7_Output => data_bus7_Output
    );
    
    process 
    begin
               
        Clock <= not(clock);
        wait for 10ns;
               
    end process;
                 
    process 
        begin
        reset <= '1';
        wait for 100ns;
        reset <= '0';
        wait;  
    end process;


end Behavioral;
