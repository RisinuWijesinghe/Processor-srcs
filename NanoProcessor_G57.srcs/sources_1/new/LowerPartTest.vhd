----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:07:07 PM
-- Design Name: 
-- Module Name: LowerPartTest - Behavioral
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

entity LowerPartTest is
    Port ( Clk_in : in STD_LOGIC;
           Res : in STD_LOGIC;
           J_Fl: in STD_LOGIC;
           J_Val: In STD_LOGIC_VECTOR(2 DOWNTO 0);
           
           Ins : out STD_LOGIC_VECTOR (11 downto 0)
--           Ad_3_O : out STD_LOGIC_VECTOR(2 downto 0);
--           M_23_O : out STD_LOGIC_VECTOR(2 downto 0);
--           P_O : out STD_LOGIC_VECTOR(2 downto 0)
           );
           
end LowerPartTest;

architecture Behavioral of LowerPartTest is


component ROM_3_TO_12
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Programme_Counter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q: out STD_LOGIC_VECTOR (2 downto 0):="000");
end component;

component Adder_3_bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_2_3
    Port ( JUMP_F : in STD_LOGIC;
           JUMP_Val : in STD_LOGIC_VECTOR (2 downto 0);
           ADD : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (2 downto 0));
end component;



signal mux_23_out, pc_out, adder_3_bit_out : STD_LOGIC_VECTOR(2 downto 0);

begin



PC : Programme_Counter
    port map (
    Clk => Clk_in,
    Res => Res,
    D => mux_23_out,
    Q => pc_out
    );

Rom : ROM_3_TO_12 
    port map (
    address => pc_out,
    data => Ins
    );

Adder_0 : Adder_3_bit 
    port map (
    A => pc_out,
    S => adder_3_bit_out
    );

Mux_0 : Mux_2_3 
    port map (
    JUMP_F => J_Fl,
    JUMP_Val => J_Val,
    ADD => adder_3_bit_out,
    O => mux_23_out
    );
    
    


--Ad_3_O <= adder_3_bit_out;
--M_23_O <= mux_23_out;
--P_O <= pc_out;


end Behavioral;
