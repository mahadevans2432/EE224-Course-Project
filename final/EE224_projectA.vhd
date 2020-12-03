entity EE224_projectA is
port(S0 : in bit;
	  S1 : in bit;
	  a : in bit_vector(15 downto 0);
	  b : in bit_vector(15 downto 0);
	  sums : out bit_vector(15 downto 0);
	  cout : out bit;
	  zero : out bit);
end entity EE224_projectA;
--This is a dummy architecture to be fixed when S1 related part is made
architecture structural of EE224_projectA is
signal sums_pre : bit_vector(15 downto 0);
component kogge_stone_16bit
port( S0: in bit;
		a : in bit_vector(15 downto 0);
		b : in bit_vector(15 downto 0);
		sums : out bit_vector(15 downto 0);
		cout : out bit);
end component kogge_stone_16bit;
begin
adder_and_subtra : kogge_stone_16bit port map(S0,a,b,sums_pre,cout);
sums <= sums_pre;
end structural;
