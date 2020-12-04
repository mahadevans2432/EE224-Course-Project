entity preliminary is
port( S0: in bit;
		a : in bit_vector(15 downto 0);
		b : in bit_vector(15 downto 0);
		g : out bit_vector(15 downto 0);
		p : out bit_vector(15 downto 0));
end entity preliminary;

architecture behavioural of preliminary is

component ANDgate15 is
port( a_in : in bit_vector(15 downto 0);
		b_in : in bit_vector(15 downto 0);
		outvec : out bit_vector(15 downto 0));
end component;
component XORgate15 is
port( a_in : in bit_vector(15 downto 0);
		b_in : in bit_vector(15 downto 0);
		outvec : out bit_vector(15 downto 0));
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