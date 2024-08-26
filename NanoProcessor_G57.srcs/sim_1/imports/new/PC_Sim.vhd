----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 10:12:27 AM
-- Design Name: 
-- Module Name: PC_Sim - Behavioral
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

entity PC_Sim is
--  Port ( );
end PC_Sim;

architecture Behavioral of PC_Sim is
component Programme_Counter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q: out STD_LOGIC_VECTOR (2 downto 0));
end component;


signal clock,clear : std_logic:='0';
signal d,mem_select: std_logic_vector(2 downto 0);

begin
UUT: Programme_Counter
    port map(
        D => d,
        Clk =>clock,
        res => clear,
        q => mem_select);
        
 
process
        begin
            clock <= NOT(clock);
            wait for 2ns;
        end process;
   
process
begin
    D <= "001";
    wait for 100 ns;
    D <= "011";
    wait for 100 ns;
    D <= "101";
    wait for 100 ns;
    D <= "111";
    wait for 100 ns;
    
    wait;
end process;
    

end Behavioral;
