----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 03:06:47 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           B: in STD_LOGIC_VECTOR(3 DOWNTO 0);
           Sub: in STD_LOGIC;
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           Overflow:out STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end RCA_4;

architecture Behavioral of RCA_4 is
component FA
 port (
 A: in std_logic;
 B: in std_logic;
 C_in: in std_logic;
 S: out std_logic;
 C_out: out std_logic);
 end component;

 SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C  : std_logic; 
 SIGNAL intB : std_logic_vector(3 downto 0);
 
begin

intB(0) <= B(0) XOR Sub;
intB(1) <= B(1) XOR Sub;
intB(2) <= B(2) XOR Sub;
intB(3) <= B(3) XOR Sub;

FA_0 : FA
 port map (
    A => A(0),
    B => intB(0),
    C_in => Sub,
-- C_in => C_in,
    S => S(0),
    C_Out => FA0_C);
 
 FA_1 : FA
 port map (
    A => A(1),
    B => intB(1),
    C_in => FA0_C,
    S => S(1),
    C_Out => FA1_C);

 FA_2 : FA
 port map (
    A => A(2),
    B => intB(2),
    C_in => FA1_C,
    S => S(2),
    C_Out => FA2_C);
 
 FA_3 : FA
 port map (
    A => A(3),
    B => intB(3),
    C_in => FA2_C,
    S => S(3),
    C_Out => FA3_C);
 
 C_out <= FA3_C;
 Overflow <= FA2_C XOR FA3_C;


end Behavioral;
