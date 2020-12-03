entity postprocess is
port( S0 : in bit;
		p: in bit_vector(15 downto 0);
		p_last: in bit_vector(15 downto 0);
		g_last: in bit_vector(15 downto 0);
		sums : out bit_vector(15 downto 0);
		cout : out bit);
end entity postprocess;

architecture postproc of postprocess is
signal carrys: bit_vector(15 downto 0);

begin
carry_loop:
	for i in 0 to 15 generate
		carrys(i) <= g_last(i) or (S0 and p_last(i));
	end generate;
cout <= carrys(15);
post:
	for i in 1 to 15 generate
		sums(i) <= carrys(i-1) xor p(i);
	end generate;
sums(0) <= S0 xor p(0);
end postproc; 