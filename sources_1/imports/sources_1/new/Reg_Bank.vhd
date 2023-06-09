----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 03:16:09 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( Clock : in STD_LOGIC;
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           Val_Store : in STD_LOGIC_VECTOR (3 downto 0);
           Clear : in STD_LOGIC;
           Reg_0_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_1_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_2_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_3_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_4_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_5_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_6_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_7_out : out STD_LOGIC_VECTOR (3 downto 0));
end Reg_Bank;

architecture Behavioral of Reg_Bank is

component LUT_8_3
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Reg 
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           Res: in STD_LOGIC );
end component;

signal regsel : std_logic_vector(7 downto 0);
begin


LUT_8_3_0 : LUT_8_3
    port map (
        I => Reg_En,
        EN => '1',
        O => regSel);
        
Reg0 : Reg
    port map(
        D => Val_Store,
        En => regsel(0),
        Clk => Clock,
        Res => Clear,
        Q =>Reg_0_out);

Reg1 : Reg
    port map(
        D => Val_Store,
        En => regsel(1),
        Clk => Clock,
        Res => Clear,
        Q =>Reg_1_out);

Reg2 : Reg
    port map(
        D => Val_Store,
        En => regsel(2),
        Clk => Clock,
        Res => Clear,
        Q =>Reg_2_out);       

Reg3 : Reg
    port map(
        D => Val_Store,
        En => regsel(3),
        Clk => Clock,
        Res => Clear,
        Q =>Reg_3_out);
 
  
Reg4 : Reg
     port map(
          D => Val_Store,
          En => regsel(4),
          Clk => Clock,
          Res => Clear,
          Q =>Reg_4_out);      

Reg5 : Reg
     port map(
          D => Val_Store,
          En => regsel(5),
          Clk => Clock,
          Res => Clear,
          Q =>Reg_5_out); 

Reg6 : Reg
     port map(
          D => Val_Store,
          En => regsel(6),
          Clk => Clock,
          Res => Clear,
          Q =>Reg_6_out);      
                  
Reg7 : Reg
     port map(
          D => Val_Store,
          En => regsel(7),
          Clk => Clock,
          Res => Clear,
          Q =>Reg_7_out);    
                     



end Behavioral;
