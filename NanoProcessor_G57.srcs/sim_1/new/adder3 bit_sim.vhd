----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 09:49:11 PM
-- Design Name: 
-- Module Name: adder3 bit_sim - Behavioral
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

entity adder3bit_sim is
--  Port ( );
end adder3bit_sim;

architecture Behavioral of adder3bit_sim is
component Adder_3_bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal a,s: std_logic_vector(2 downto 0);

begin
UUT: Adder_3_bit
port map (
    A=>a,
    S=>s
    );
    
process 
begin 
    a <= "010";
    wait for 100ns;
    a <= "011";
    wait for 100ns;
    a <= "010";
    wait for 100ns;
    a <= "111";
    wait for 100ns;
    wait;
end process;    
     


end Behavioral;
