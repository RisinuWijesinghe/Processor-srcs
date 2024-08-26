----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2023 01:23:48 PM
-- Design Name: 
-- Module Name: upper_Part_sim - Behavioral
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

entity UpperPart_Sim is
--  Port ( );
end UpperPart_Sim;

architecture Behavioral of UpperPart_Sim is

component UpperPartTest
    Port ( instructionBus : in STD_LOGIC_VECTOR (11 downto 0);
           zero : out STD_LOGIC;
           clock :in std_logic;
           res : in std_logic;
           overflow : out STD_LOGIC;
           R_enable_out : out STD_LOGIC_VECTOR (2 downto 0);
           R0_out : out STD_LOGIC_VECTOR (3 downto 0);
           R1_out : out STD_LOGIC_VECTOR (3 downto 0);
           R2_out : out STD_LOGIC_VECTOR (3 downto 0);
           R3_out : out STD_LOGIC_VECTOR (3 downto 0);
           R4_out : out STD_LOGIC_VECTOR (3 downto 0);
           R5_out : out STD_LOGIC_VECTOR (3 downto 0);
           R6_out : out STD_LOGIC_VECTOR (3 downto 0);
           R7_out : out STD_LOGIC_VECTOR (3 downto 0);
           MUX1_out : out STD_LOGIC_VECTOR (3 downto 0);
           Mux2_out : out STD_LOGIC_VECTOR (3 downto 0);
           addSubOut : out STD_LOGIC_VECTOR (3 downto 0));
end component;


signal clock:std_logic:='0';
signal zero,res,overflow:std_logic;
signal instructionBus: std_logic_vector(11 downto 0);
signal R_enable_out: std_logic_vector(2 downto 0);
signal addSubOut,R0_out,R1_out,R2_out,R3_out,R4_out,R5_out,R6_out,R7_out,Mux2_out,MUX1_out:std_logic_vector(3 downto 0);

begin

UUT: UpperPartTest
port map(
    instructionBus => instructionBus,
    zero =>zero,
    clock =>clock,
    res => res,
    overflow =>overflow,
    R_enable_out=> R_enable_out,
    R0_out => R0_out,
    R1_out => R1_out,
    R2_out => R2_out,
    R3_out => R3_out,
    R4_out => R4_out,
    R5_out => R5_out,
    R6_out => R6_out,
    R7_out => R7_out,
    MUX1_out=> MUX1_out,
    Mux2_out => Mux2_out,
    addSubOut => addSubOut
    );
    

process 
begin
           
    Clock <= not(clock);
    wait for 10ns;
           
end process;

process 
begin  
    instructionBus <="100010000011";
    wait for 50ns;
    instructionBus <="100100000010";
    wait for 50ns;
    instructionBus <="100100000001";
    wait for 50ns;
    instructionBus <="101110000000";    
    wait for 50ns;
    instructionBus <="000000010000";
    wait for 50ns;
    instructionBus <="000000110000";
    wait for 50ns;
    instructionBus <="001110010000";
    wait ;   
           
end process;

process 
    begin
    res <= '1';
    wait for 10ns;
    res <= '0';
    wait;  
end process;

--process
--begin

    



end Behavioral;
