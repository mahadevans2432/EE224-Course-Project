entity ANDgate15 is 
port( a_in : in bit_vector(15 downto 0);
		b_in : in bit_vector(15 downto 0);
		outvec : out bit_vector(15 downto 0));
end entity ANDgate15;

architecture andbehaviour of ANDgate15 is 
begin
outvec <= a_in AND b_in ;
end andbehaviour;

entity XORgate15 is 
port( a_in : in bit_vector(15 downto 0);
		b_in : in bit_vector(15 downto 0);
		outvec : out bit_vector(15 downto 0));
end entity XORgate15;

architecture xorbehaviour of XORgate15 is 
begin
outvec <= a_in XOR b_in ;
end xorbehaviour;

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

cin_vec(0) <= S0 ;
cin_vec(1) <= S0 ;
cin_vec(2) <= S0 ;
cin_vec(3) <= S0 ;
cin_vec(4) <= S0 ;
cin_vec(5) <= S0 ;
cin_vec(6) <= S0 ;
cin_vec(7) <= S0 ;
cin_vec(8) <= S0 ;
cin_vec(9) <= S0 ;
cin_vec(10) <= S0 ;
cin_vec(11) <= S0 ;
cin_vec(12) <= S0 ;
cin_vec(13) <= S0 ;
cin_vec(14) <= S0 ;
cin_vec(15) <= S0 ;

u0: XORgate15 port map (a,cin_vec,corrected_a);
u1: ANDgate15 port map (corrected_a,b,g);
u2: XORgate15 port map (corrected_a,b,p);
end behavioural;