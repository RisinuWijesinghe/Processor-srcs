----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2023 02:56:09 PM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0):= "0000";
           Res: in STD_LOGIC );
end Reg;

architecture Behavioral of Reg is
--component D_FF
--    Port ( D : in STD_LOGIC;
--           Res : in STD_LOGIC;
--           Clk : in STD_LOGIC;
--           Q : out STD_LOGIC;
--           Qbar : out STD_LOGIC);
--end component;

--signal D_val : std_logic_vector(3 downto 0);
--signal Q_out : std_logic_vector(3 downto 0);

begin

--D_val <= D;

--D_FF0 : D_FF
--port map (
--    D =>D_val(0),
--    Res => Res,
--    Clk => Clk,
--    Q => Q_out(0));
    
--D_FF1 : D_FF
-- port map (
--    D =>D_val(1),
--    Res => Res,
--    Clk => Clk,
--    Q => Q_out(1));

--D_FF2 : D_FF
-- port map (
--    D =>D_val(2),
--    Res => Res,
--    Clk => Clk,
--    Q => Q_out(2));

--D_FF3 : D_FF
-- port map (
--    D =>D_val(3),
--    Res => Res,
--    Clk => Clk,
--    Q => Q_out(3));
        

process (Clk)
begin
    if (rising_edge(Clk)) then
        if ( Res ='1') then
            Q <= "0000";
        else
            if (En ='1') then
                Q <= D;
            end if ;
        end if;
    end if;
    end process;
        


end Behavioral;
