----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2023 08:59:07 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0));
end Mux_8_to_1; 

architecture Behavioral of Mux_8_to_1 is
    component Decoder_3_to_8 
    Port ( I : in STD_LOGIC_VECTOR(2 downto 0) ;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal I :std_logic_vector(2 downto 0);
    signal ED : std_logic;
    signal YD: std_logic_vector(7 downto 0);
    
begin
Decode_3_to_8 :Decoder_3_to_8
port map(
I => I,
EN => ED,
Y => YD);

    I <= S;
    ED <=EN;
    Y <= (D(0) and YD(0))  or (D(1)and YD(1)) or (D(2)and YD(2)) or (D(3)and YD(3)) or (D(4)and YD(4)) or (D(5)and YD(5)) or (D(6)and YD(6)) or (D(7)and YD(7));
    
end Behavioral;
