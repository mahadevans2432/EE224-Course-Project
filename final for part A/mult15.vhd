entity mult15 is
port (I0: in bit_vector(15 downto 0);
		I1: in bit_vector(15 downto 0);
		S: in bit;
		O: out bit_vector(15 downto 0));
end mult15;

architecture struct of mult15 is

component ANDgate15
port(A,B:in bit_vector(15 downto 0);
	  C: out bit_vector(15 downto 0));
end component;

component ORgate15
port(A,B:in bit_vector(15 downto 0);
	  C: out bit_vector(15 downto 0));
end component;

component NOTgate15
port(A:in bit_vector(15 downto 0);
	  B: out bit_vector(15 downto 0));
end component;

signal S_vec,P,Q,R: bit_vector(15 downto 0);

begin
 
make_s:
	for i in 0 to 15 generate
		S_vec(i) <= S;
	end generate;

notcomp: NOTgate15 port map (S_vec,P);
andcomp1: ANDgate15 port map (I0,P,Q);
andcomp2: ANDgate15 port map (I1,S_vec,R);
orcomp: ORgate15 port map (Q,R,O);
end struct;