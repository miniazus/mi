library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.InOutput_Types.all; --custom types

entity Dm_Controller_Ip is
    port (
        clk  : in  std_logic;
		  rst  : in  std_logic;
		  
		  DataIn  : in   DataInOutCrossBar; -- Connected to Cross Bar
		  DataOut : out  DataInOutCrossBar; -- Connected to Cross Bar
    );
end Dm_Controller_Ip;

architecture rtl of Dm_Controller_Ip is
begin
	 DataOut <= DataIn; --Dont care
end rtl;