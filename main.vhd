entity main is
port(S0 : in bit;
	  x : in bit_vector(15 downto 0);
	  y : in bit_vector(15 downto 0);
	  z : out bit_vector(15 downto 0);
end main;

architecture struct of main is

signal nand_out : bit_vector(15 downto 0);
signal xor_out : bit_vector(15 downto 0);

component mult
port( I0: in bit;
		I1: in bit;
		S0: in bit;
		O: out bit);
end component;

begin
for i in 0 to 15 generate
	nand_out(i) <= x(i) nand y(i);
	xor_out(i) <= x(i) xor y(i);
end generate;
	
for i in 0 to 15 generate
	nandxor : mult port map (nand_out(i),xor_out(i),S0,z(i))
end generate;		
	

end struct;