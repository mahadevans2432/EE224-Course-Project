entity EE224_projectA_dummy is
port(S0 : in bit;
	  S1 : in bit;
	  a : in bit_vector(15 downto 0);
	  b : in bit_vector(15 downto 0);
	  sums : out bit_vector(15 downto 0);
	  cout : out bit;
	  zero : out bit);
end EE224_projectA_dummy;

architecture behaviour of EE224_projectA_dummy is
begin
sums <= a or b;
cout <= S0 and S1 ;
zero <= '0';
end architecture behaviour;
