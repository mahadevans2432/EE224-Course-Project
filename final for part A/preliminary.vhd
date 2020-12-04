entity ANDgate15 is 
port( A : in bit_vector(15 downto 0);
		B : in bit_vector(15 downto 0);
		C : out bit_vector(15 downto 0));
end entity ANDgate15;

architecture andbehaviour of ANDgate15 is 
begin
C <= A AND B ;
end andbehaviour;

entity NANDgate15 is 
port( A : in bit_vector(15 downto 0);
		B : in bit_vector(15 downto 0);
		C : out bit_vector(15 downto 0));
end entity NANDgate15;

architecture nandbehaviour of NANDgate15 is 
begin
C <= A NAND B ;
end nandbehaviour;

entity XORgate15 is 
port( A : in bit_vector(15 downto 0);
		B: in bit_vector(15 downto 0);
		C : out bit_vector(15 downto 0));
end entity XORgate15;

architecture xorbehaviour of XORgate15 is 
begin
C <= A XOR B ;
end xorbehaviour;

entity NOTgate15 is
port( A: in bit_vector(15 downto 0);
		B: out bit_vector(15 downto 0));
end NOTgate15;

architecture notarc of NOTgate15 is
begin
B <= not A;
end notarc;

entity ORgate15 is
port( A, B: in bit_vector(15 downto 0);
		C: out bit_vector(15 downto 0));
end ORgate15;

architecture orarc of ORgate15 is
begin
C <= A or B;
end orarc;



entity preliminary is
port( S0: in bit;
		a : in bit_vector(15 downto 0);
		b : in bit_vector(15 downto 0);
		g : out bit_vector(15 downto 0);
		p : out bit_vector(15 downto 0));
end entity preliminary;

architecture behavioural of preliminary is

component ANDgate15 is
port( A : in bit_vector(15 downto 0);
		B : in bit_vector(15 downto 0);
		C : out bit_vector(15 downto 0));
end component;
component XORgate15 is
port( A : in bit_vector(15 downto 0);
		B : in bit_vector(15 downto 0);
		C : out bit_vector(15 downto 0));
end component;

signal cin_vec : bit_vector(15 downto 0);
signal corrected_a : bit_vector(15 downto 0);
begin

cin_assign:
	for i in 0 to 15 generate
		cin_vec(i) <= S0;
	end generate;

u0: XORgate15 port map (a,cin_vec,corrected_a);
u1: ANDgate15 port map (corrected_a,b,g);
u2: XORgate15 port map (corrected_a,b,p);
end behavioural;