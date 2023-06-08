----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 02:25:15 PM
-- Design Name: 
-- Module Name: ROM_3_T0_12 - Behavioral
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

entity ROM_3_TO_12 is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end ROM_3_TO_12;

architecture Behavioral of ROM_3_TO_12 is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

signal instruction_ROM : rom_type := (
                        "100010001010",
                        "100110000001",
                        "010110000000",
                        "000010110000",
                        "110010000111",
                        "110000000011",
                        "000000000000",
                        "000000000000"
     );


begin

data <= instruction_ROM(to_integer(unsigned(address)));

end Behavioral;
