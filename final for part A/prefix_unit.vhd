entity prefix_unit is
port(g_in1 : in bit;
	  p_in1 : in bit;
	  g_in2 : in bit;
	  p_in2 : in bit;
	  g_out : out bit;
	  p_out : out bit);
end entity prefix_unit;

architecture prefix_comp of prefix_unit is
begin
g_out <= g_in2 or (p_in2 and g_in1);
p_out <= p_in1 and p_in2;
end prefix_comp;