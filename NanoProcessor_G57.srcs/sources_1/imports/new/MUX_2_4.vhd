----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 09:30:12 AM
-- Design Name: 
-- Module Name: MUX_2_4 - Behavioral
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

entity MUX_2_4 is
    Port ( Sel : in STD_LOGIC;
           IM_VAL : in STD_LOGIC_VECTOR (3 downto 0);
           AD_VAL : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2_4;

architecture Behavioral of MUX_2_4 is

begin

process(Sel, IM_VAL, AD_VAL)

    begin
    if (Sel = '0') then
        O <= AD_VAL;
    else
        O <= IM_VAL;
    end if;
    end process;

--O(0) <= (AD_VAL(0) and not(Sel)) or (IM_VAL(0) and Sel);
--O(1) <= (AD_VAL(1) and not(Sel)) or (IM_VAL(1) and Sel);
--O(2) <= (AD_VAL(2) and not(Sel)) or (IM_VAL(2) and Sel);
--O(3) <= (AD_VAL(3) and not(Sel)) or (IM_VAL(3) and Sel);

end Behavioral;
