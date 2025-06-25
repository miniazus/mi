library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


package InOutput_Types is

    -- Define the struct-like record
    type DataInOutCrossBar is record
        valid : std_logic;                        -- 1 bit
        Data  : std_logic_vector(511 downto 0);   -- 512 bits
        Ready : std_logic_vector(1 downto 0);     -- 2 bits
    end record;
	 	 

end package InOutput_Types;



-- Ex:
-- DataIn  : in   DataInOutCrossBar;
-- DataIn.valid
-- DataIn.Data
-- DataIn.Ready