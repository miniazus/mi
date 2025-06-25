library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.InOutput_Types.all; --custom types

entity Crossbar_Ip is
    port (
        clk  : in  std_logic;
		  rst  : in  std_logic;
		  
        DataIn1  : in  DataInOutCrossBar; -- Connected to LM
		  DataIn2  : in  DataInOutCrossBar; -- Connected to Channelizer
		  DataIn3  : in  DataInOutCrossBar; -- Connected to DM
		  DataIn4  : in  DataInOutCrossBar; -- Connected to DIFI
		  
		  DataOut1 : out  DataInOutCrossBar; -- Connected to LM-- Connected to LM
		  DataOut2 : out  DataInOutCrossBar; -- Connected to Chan
		  DataOut3 : out  DataInOutCrossBar; -- Connected to DM
		  DataOut4 : out  DataInOutCrossBar; -- Connected to DIFI
    );
end Crossbar_Ip;

architecture rtl of Crossbar_Ip is
begin
    DataOut3 <= DataIn1; --E.g., LM <--> DM
	 DataOut1 <= DataIn3; --E.g., LM <--> DM
	 DataOut2 <= DataIn2; --Dont care
	 DataOut4 <= DataIn4; --Dont care
end rtl;