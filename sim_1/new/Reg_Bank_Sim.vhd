----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 12:50:09 PM
-- Design Name: 
-- Module Name: Reg_Bank_Sim - Behavioral
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

entity Reg_Bank_Sim is
--  Port ( );
end Reg_Bank_Sim;

architecture Behavioral of Reg_Bank_Sim is
component Reg_Bank
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
end component;

signal clock,clear:std_logic:='0';
signal reg_en : std_logic_vector(2 downto 0);
signal val_store,reg_0_out,reg_1_out,reg_2_out,reg_3_out,reg_4_out,reg_5_out,reg_6_out,reg_7_out : std_logic_vector(3 downto 0):= "0000";



begin

UUT: Reg_Bank
    port map(
        Clock => clock,
        Reg_En => reg_en,
        Val_Store => val_store,
        Clear => clear,
        Reg_0_out => Reg_0_out,
        Reg_1_out => Reg_1_out,
        Reg_2_out => Reg_2_out,
        Reg_3_out => Reg_3_out,
        Reg_4_out => Reg_4_out,
        Reg_5_out => Reg_5_out,
        Reg_6_out => Reg_6_out,
        Reg_7_out => Reg_7_out);

process
begin
    clock <= NOT(clock);
    wait for 2ns;
end process;
    
process
begin
    Reg_En <= "001";
    Val_store <= "0010";
    wait for 100 ns;
    Reg_En <= "010";
    Val_store <= "1010";
    wait for 100 ns;    
    Reg_En <= "101";
    Val_store <= "0110";
    wait for 100 ns;
    Reg_En <= "001";
    Val_store <= "0010";
    wait for 100 ns;
    clear <= '1';
    wait;
end process;  
    

        


end Behavioral;
