library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.InOutput_Types.all; --custom types

entity Channelizer_Ip is
    port (
        clk  : in  std_logic;
		  rst  : in  std_logic;
		  
		  DataIn  : in   DataInOutCrossBar; -- Connected to Cross Bar
		  DataOut : out  DataInOutCrossBar; -- Connected to Cross Bar
    );
end Channelizer_Ip;

architecture rtl of Channelizer_Ip is
begin
	 DataOut <= DataIn; --Dont care
end rtl;