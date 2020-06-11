entity mwe is
  port (clk : bit;
        reset : bit;
        enable : bit;
        counter_out : out bit_vector (3 downto 0));
end mwe;

library ieee;
use ieee.numeric_bit.all;

architecture arch of mwe is
begin
  process (clk)
    variable count : unsigned (3 downto 0);
  begin
    if clk = '1' then
      if reset = '1' then
        count := "0000";
      elsif enable = '1' then
        count := count + 1;
      end if;
      counter_out <= bit_vector (count);
    end if;
  end process;
end arch;
