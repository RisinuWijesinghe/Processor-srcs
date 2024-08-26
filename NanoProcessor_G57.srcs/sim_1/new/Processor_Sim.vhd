----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/10/2023 07:01:00 PM
-- Design Name: 
-- Module Name: Processor_Sim - Behavioral
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

entity Processor_Sim is
--  Port ( );
end Processor_Sim;

architecture Behavioral of Processor_Sim is

component Processor
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           zero: out STD_LOGIC;
           overflow: out STD_LOGIC;
           Display: out STD_LOGIC_VECTOR(3 downto 0) := "0111";
--           R_enable_out : out STD_LOGIC_VECTOR (2 downto 0);
--           R0_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R1_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R2_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R3_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R4_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R5_out : out STD_LOGIC_VECTOR (3 downto 0);
--           R6_out : out STD_LOGIC_VECTOR (3 downto 0);
           R7_out : out STD_LOGIC_VECTOR (3 downto 0);
--           J_Fl: out STD_LOGIC;
--           J_Adr: out STD_LOGIC_VECTOR (2 downto 0);
--           MUX1_out : out STD_LOGIC_VECTOR (3 downto 0);
--           Mux2_out : out STD_LOGIC_VECTOR (3 downto 0);
--           addSubOut : out STD_LOGIC_VECTOR (3 downto 0);
--           Ins : out STD_LOGIC_VECTOR (11 downto 0);
           DisplayOut : out STD_LOGIC_VECTOR(6 downto 0);
--           Ad_3_O : out STD_LOGIC_VECTOR(2 downto 0);
--           M_23_O : out STD_LOGIC_VECTOR(2 downto 0);
--           P_O : out STD_LOGIC_VECTOR(2 downto 0);
           Cl_O: out STD_LOGIC
           );
end component;

signal clock, res: STD_LOGIC:='0';
signal zer, overf: STD_LOGIC;
signal clock_out: STD_LOGIC;
--signal r_en, J_Adr : STD_LOGIC_VECTOR(2 downto 0);
--signal R0_out,R1_out,R2_out,R3_out,R4_out,R5_out,R6_out, addSubOut : std_logic_vector(3 downto 0);
--Mux2_out,MUX1_out: std_logic_vector(3 downto 0);
signal R7_out, dis:std_logic_vector(3 downto 0);
signal DisplayOut: STD_LOGIC_VECTOR(6 downto 0);
--signal adder_o, mux_23_o, pc_o : STD_LOGIC_VECTOR(2 downto 0);
--signal instruction : STD_LOGIC_VECTOR(11 downto 0);

begin

UUT: Processor
port map(
    Clk => clock,
           Reset => res,
           zero => zer,
           overflow => overf,
           Display => dis,
--           R_enable_out => r_en,
--           R0_out => R0_out,
--               R1_out => R1_out,
--               R2_out => R2_out,
--               R3_out => R3_out,
--               R4_out => R4_out,
--               R5_out => R5_out,
--               R6_out => R6_out,
               R7_out => R7_out,
--               J_Fl => J_Fl,
--               J_Adr => J_Adr,
--               MUX1_out=> MUX1_out,
--               Mux2_out => Mux2_out,
--               addSubOut => addSubOut,
--               Ins => instruction,
               DisplayOut => DisplayOut,
--                   Ad_3_O => adder_o,
--                   M_23_O => mux_23_o,
--                   P_O => pc_o,
                   Cl_O => clock_out
    );

process 
begin
           
    Clock <= not(clock);
    wait for 1 ns;
           
end process;

process 
    begin
    res <= '1';
    wait for 50 ns;
    res <= '0';
    wait for 350 ns;
    res <= '1';
    wait for 50 ns;
    res <='0';
    wait;  
end process;


end Behavioral;
