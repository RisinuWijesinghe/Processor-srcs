----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 08:24:22 PM
-- Design Name: 
-- Module Name: 4_Bit_Add_Sub_Unit - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Add_Sub_Unit is
    Port ( sel : in STD_LOGIC;
           firstNo : in STD_LOGIC_VECTOR (3 downto 0);
           secNo : in STD_LOGIC_VECTOR (3 downto 0);
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           addsubOut : out STD_LOGIC_VECTOR (3 downto 0);
           C_out: out STD_LOGIC
           );
end Add_Sub_Unit;


architecture Behavioral of Add_Sub_Unit is
component FA
    port (
        A: in std_logic;
        B: in std_logic;
        C_in: in std_logic;
        S: out std_logic;
        C_out: out std_logic);
 end component;
   
signal Input_A, S:  STD_LOGIC_VECTOR(3 DOWNTO 0);
signal FA0_C, FA1_C, FA2_C, FA3_C, intOverflow  : std_logic; 

begin
--convert B  into 2s complement if sel=1(subtract) the sel is also gives to the C_in 
Input_A(0)  <= firstNo(0) xor sel;
Input_A(1)  <= firstNo(1) xor sel;
Input_A(2)  <= firstNo(2) xor sel;
Input_A(3)  <= firstNo(3) xor sel;


FA_0 : FA
 port map (
    A => Input_A(0),
    B => secNo(0),
    C_in => Sel,
    S => S(0),
    C_Out => FA0_C);
 
 FA_1 : FA
 port map (
    A => Input_A(1),
     B => secNo(1),
     C_in => FA0_C,
     S => S(1),
     C_Out => FA1_C);

 FA_2 : FA
 port map (
    A => Input_A(2),
     B => secNo(2),
     C_in => FA1_C,
     S => S(2),
     C_Out => FA2_C);
 
 FA_3 : FA
 port map (
    A => Input_A(3),
     B => secNo(3),
     C_in => FA2_C,
     S => S(3),
     C_Out => FA3_C);
 
C_out <= FA3_C;
intOverFlow <= FA2_C XOR FA3_C;
OverFlow <= intOverFlow;
addsubOut <= S;
Zero <= not (S(0) or S(1) or S(2) or S(3) or intOverFlow);


end Behavioral;
