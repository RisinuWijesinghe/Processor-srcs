----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 12:05:14 AM
-- Design Name: 
-- Module Name: Add_Sub_sim - Behavioral
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

entity Add_Sub_sim is
--  Port ( );
end Add_Sub_sim;

--this also comment
architecture Behavioral of Add_Sub_sim is
 component Add_Sub_Unit
    Port ( sel : in STD_LOGIC;
            firstNo : in STD_LOGIC_VECTOR (3 downto 0);
            secNo : in STD_LOGIC_VECTOR (3 downto 0);
            OverFlow : out STD_LOGIC;
            Zero : out STD_LOGIC;
            addsubOut : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

signal  firstNo,secNo,addsubOut : std_logic_vector(3 downto 0);
signal  OverFlow,Zero,sel : std_logic;

begin
UUT: Add_Sub_Unit
port map(
    sel=> sel,
    firstNo =>firstNo,
    secNo =>secNo,
    OverFlow => OverFlow,
    Zero => Zero,
    addSubOut =>addSubOut);

process
begin
    sel <= '0';
    firstNo <= "0001";
    secNo <= "0001";
    wait for 100ns;
    firstNo <= "0000";
    secNo <= "0101";
    wait for 100ns;
    firstNo <= "0101";
    secNo <= "0001";
    wait for 100ns;
    firstNo <= "1110";
    secNo <= "0001";
    wait for 100ns;
    sel <= '1';
    firstNo <= "0010";
    secNo <= "0001";
    wait for 100ns;
    firstNo <= "0100";
    secNo <= "0010";
    wait for 100ns;
    firstNo <= "0111";
    secNo <= "0101";
    wait;
end process;
    
    

end Behavioral;
