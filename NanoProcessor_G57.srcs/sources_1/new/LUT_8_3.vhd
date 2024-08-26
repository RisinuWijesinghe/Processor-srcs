----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 11:01:28 PM
-- Design Name: 
-- Module Name: LUT_8_3 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_8_3 is
    Port ( EN : in STD_LOGIC;
           I : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (7 downto 0));
end LUT_8_3;

architecture Behavioral of LUT_8_3 is

type rom_type is array (0 to 7) of std_logic_vector(7 downto 0);

signal register_lut : rom_type := (
                        "00000001",
                        "00000010",
                        "00000100",
                        "00001000",
                        "00010000",
                        "00100000",
                        "01000000",
                        "10000000"
    );

begin

O <= register_lut(to_integer(unsigned(I)));


end Behavioral;
