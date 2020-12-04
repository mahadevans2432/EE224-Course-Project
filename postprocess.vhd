entity postprocess is
port( p: in bit_vector(15 downto 0);
		carry: in bit_vector(15 downto 0);
		sums : out bit_vector(15 downto 0);
		cout : out bit);
end entity postprocess;

architecture postproc of postprocess is
signal carryshift: bit_vector(15 downto 0);

component XORgate15 is
port( A : in bit_vector(15 downto 0);
		B : in bit_vector(15 downto 0);
		C : out bit_vector(15 downto 0));
end component;

begin
cout <= carry(15);
carryshift <= carry(14 downto 0)&'0';
post: XORgate15 port map (carryshift,p,sums);
end postproc; 