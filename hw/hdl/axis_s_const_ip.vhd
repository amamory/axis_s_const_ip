-- module used to connect to the unused master Hermes router ports so that they are not optmized 
library IEEE;
use IEEE.std_logic_1164.all;

entity axis_s_const is
Port ( 
	clock   : in  std_logic;
	-- axi slave streaming interface
	valid_i : in  std_logic;
	ready_o : out std_logic;
	data_i  : in  std_logic_vector(31 downto 0)
);
end axis_s_const;

architecture Behavioral of axis_s_const is

signal data_s : std_logic_vector(31 downto 0);
signal valid_s : std_logic;
signal ready_s : std_logic;

attribute dont_touch : string;
attribute dont_touch of data_s : signal is "true";
attribute dont_touch of valid_s : signal is "true";
attribute dont_touch of ready_s : signal is "true";

begin

process(clock)
begin
	if rising_edge(clock) then
		data_s <= data_i;
		valid_s <= valid_i;
		ready_s <= '0';
	end if;
end process;

ready_o <= '0' when valid_s = '1' and ready_s = '1' and data_s = x"00000000" else '1';

end architecture;