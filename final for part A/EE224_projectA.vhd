--Team members:
--1. Aneesh Bapat, roll no: 190260006
--2. Drishti Baruah, roll no: 190260019
--3. Mahadevan Subramanian, roll no: 190260027
--4. Sachin Teli, roll no: 190260042
-- Note: the subtraction is assumed as b-a 


entity EE224_projectA is
port(S0 : in bit;
	  S1 : in bit;
	  a : in bit_vector(15 downto 0);
	  b : in bit_vector(15 downto 0);
	  result : out bit_vector(15 downto 0);
	  c_out : out bit;
	  zero : out bit);
end entity EE224_projectA;

architecture structural of EE224_projectA is

signal nand_out : bit_vector(15 downto 0);
signal xor_out : bit_vector(15 downto 0);
signal sums : bit_vector(15 downto 0);
signal loop1: bit_vector(7 downto 0);
signal loop2: bit_vector(3 downto 0);
signal loop3: bit_vector(1 downto 0);
signal cout : bit;
signal z : bit_vector(15 downto 0);
signal zero_result : bit_vector(15 downto 0);

component XORgate15 
port( A : in bit_vector(15 downto 0);
		B : in bit_vector(15 downto 0);
		C : out bit_vector(15 downto 0));
end component;

component NANDgate15
port( A : in bit_vector(15 downto 0);
		B : in bit_vector(15 downto 0);
		C : out bit_vector(15 downto 0));
end component;


component mult15
port( I0 : in bit_vector(15 downto 0);
		I1: in bit_vector(15 downto 0);
		S: in bit;
		O: out bit_vector(15 downto 0));
end component;

component kogge_stone_16bit
port( S0: in bit;
		a : in bit_vector(15 downto 0);
		b : in bit_vector(15 downto 0);
		sums : out bit_vector(15 downto 0);
		cout : out bit);
end component kogge_stone_16bit;
begin

adder_and_subtra : kogge_stone_16bit port map(S0,a,b,sums,cout);

nandout: NANDgate15 port map (a,b,nand_out);
xorout: XORgate15 port map (a,b,xor_out);
	
nandxor : mult15 port map (nand_out,xor_out,S0,z);

final: mult15 port map (sums, z, S1, zero_result);

c_out <= cout;
result <= zero_result;

loop_1: 
for i in 0 to 7 generate
loop1(i) <= zero_result(2*i) or zero_result(2*i+1);
end generate;

loop_2: 
for i in 0 to 3 generate
loop2(i) <= loop1(2*i) or loop1(2*i+1);
end generate;

loop_3: 
for i in 0 to 1 generate
loop3(i) <= loop2(2*i) or loop2(2*i+1);
end generate;

zero <= loop3(0) nor loop3(1);
		
	
end structural;
