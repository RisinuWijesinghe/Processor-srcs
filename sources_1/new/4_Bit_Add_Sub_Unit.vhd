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
           addsubOut : out STD_LOGIC_VECTOR (3 downto 0));
end Add_Sub_Unit;


architecture Behavioral of Add_Sub_Unit is
component RCA_4
    Port ( A : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           B : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 DOWNTO 0);
           C_out : out STD_LOGIC);
end component;
   
signal A,B,Input_B,S :  STD_LOGIC_VECTOR(3 DOWNTO 0);
signal C_in,C_out,intOverflow :  STD_LOGIC;

begin
--convert B  into 2s complement if sel=1(subtract) the selis also gives to the C_in 
input_B(0)  <= secNo(0) xor sel;
input_B(1)  <= secNo(1) xor sel;
input_B(2)  <= secNo(2) xor sel;
input_B(3)  <= secNo(3) xor sel;

 RCA_4_0: RCA_4
     PORT MAP(
         A => firstNo,
         B => input_B,
         C_in => Sel,
         S => addsubOut,
         C_out => intOverflow
         );
         
OverFlow <=  intOverFlow;
Zero <= not (S(0) or S(1) or S(2) or S(3) or intOverFlow);


end Behavioral;
