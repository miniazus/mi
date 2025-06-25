library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.InOutput_Types.all; -- Add file common/inOutput_types.hdl

entity top is
    port (
        clk_pin   : in  std_logic;
        rst_pin   : in  std_logic;
    );
end top;

architecture rtl of top is

	 -- LM IP
    component Lm_Ip
        port (
            clk     : in  std_logic;
            rst     : in  std_logic;
            DataIn  : in  DataInOutBundle;
            DataOut : out DataInOutBundle
        );
    end component;
	 
	 -- Channelizer IP
    component Channelizer_Ip
        port (
            clk     : in  std_logic;
            rst     : in  std_logic;
            DataIn  : in  DataInOutBundle;
            DataOut : out DataInOutBundle
        );
    end component;
	 
	 -- DM IP
    component Dm_Ip
        port (
            clk     : in  std_logic;
            rst     : in  std_logic;
            DataIn  : in  DataInOutBundle;
            DataOut : out DataInOutBundle
        );
    end component;
	 
    -- DIFI IP
    component Difi_Ip
        port (
            clk     : in  std_logic;
            rst     : in  std_logic;
            DataIn  : in  DataInOutBundle;
            DataOut : out DataInOutBundle
        );
    end component;
	 
	 -- Cross Bar IP
    component Crossbar_Ip
        port (
            clk     : in  std_logic;
            rst     : in  std_logic;
            DataIn1 : in  DataInOutBundle;
				DataIn2 : in  DataInOutBundle;
				DataIn3 : in  DataInOutBundle;
				DataIn4 : in  DataInOutBundle;
            DataOut1: out DataInOutBundle;
				DataOut2: out DataInOutBundle;
				DataOut3: out DataInOutBundle;
				DataOut4: out DataInOutBundle;
        );
    end component;
	 
	 
	 
	signal crossbar_to_lm   : DataInOutBundle;
	signal crossbar_to_chan : DataInOutBundle;
	signal crossbar_to_dm   : DataInOutBundle;
	signal crossbar_to_difi : DataInOutBundle;
	signal lm_to_crossbar   : DataInOutBundle;
	signal chan_to_crossbar : DataInOutBundle;
	signal dm_to_crossbar   : DataInOutBundle;
	signal difi_to_crossbar : DataInOutBundle;
	
	-- Instantiate Crossbar IP
	u_crossbar : Crossbar_Ip
		 port map (
			  clk       => clk_pin,
			  rst       => rst_pin,
			  DataIn1   => lm_to_crossbar,   -- connect to LM
			  DataIn2   => chan_to_crossbar, -- connect to Channelizer
			  DataIn3   => dm_to_crossbar,   -- connect to DM
			  DataIn4   => difi_to_crossbar, -- connect to DIFI
			  
			  DataOut1  => crossbar_to_lm,   -- connect to LM
			  DataOut2  => crossbar_to_chan, -- connect to Channelizer
			  DataOut3  => crossbar_to_dm,   -- connect to DM
			  DataOut4  => crossbar_to_difi  -- connect to DIFI
		 );

		 
	-- Instantiate LM IP
	u_lm : Lm_Ip
		 port map (
			  clk     => clk_pin,
			  rst     => rst_pin,
			  DataIn  => crossbar_to_lm,   -- input from crossbar
			  DataOut => lm_to_crossbar    -- output to crossbar
		 );
		 
	-- Instantiate Channelizer IP
	u_chan : Channelizer_Ip
		 port map (
			  clk     => clk_pin,
			  rst     => rst_pin,
			  DataIn  => crossbar_to_chan,   -- input from crossbar
			  DataOut => chan_to_crossbar    -- output to crossbar
		 );
	
	-- Instantiate DM IP
	u_dm : Dm_Ip
		 port map (
			  clk     => clk_pin,
			  rst     => rst_pin,
			  DataIn  => crossbar_to_dm,   -- input from crossbar
			  DataOut => dm_to_crossbar    -- output to crossbar
		 );
		 
	-- Instantiate DIFI IP
	u_difi : Difi_Ip
		 port map (
			  clk     => clk_pin,
			  rst     => rst_pin,
			  DataIn  => crossbar_to_difi,   -- input from crossbar
			  DataOut => difi_to_crossbar    -- output to crossbar
		 );
		
end rtl;
