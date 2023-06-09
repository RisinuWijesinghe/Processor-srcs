----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 11:45:59 AM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin

R_EN <= INS(9 downto 7);
J_ADR <= INS(2 downto 0);
IM_VAL <= INS(3 downto 0);

--process (INS, Jump_Check)
--begin
--if (Jump_Check = "000") then
--    J_FL <= INS(11) and INS(10);
--else
--    J_FL <= '0';
--end if;
--end process;
J_FL <= INS(11) and INS(10);

--selctors
R_SEL_1 <= INS(9 downto 7);
R_SEL_2 <= INS(6 downto 4);

L_SEL <= INS(11);

--add sub
Add_Sub_Sel <= Ins(10);

end Behavioral;
