entity ANDgate is
port( A, B: in bit; C: out bit);
end ANDgate;

architecture andarc of ANDgate is
begin
C <= A and B;
end andarc;

entity NOTgate is
port( A: in bit; B: out bit);
end NOTgate;

architecture notarc of NOTgate is
begin
B <= not A;
end notarc;

entity ORgate is
port( A, B: in bit;
 C: out bit);
end ORgate;

architecture orarc of ORgate is
begin
C <= A or B;
end orarc;


entity mult is
port (
		I0: in bit;
		I1: in bit;
		S: in bit;
		O: out bit);
end mult;

architecture struct of mult is
component ANDgate
		port(A,B:in bit;
				C: out bit);
	end component;
component ORgate
		port(A,B:in bit;
				C: out bit);
	end component;
component NOTgate
		port(A:in bit;
				B: out bit);
	end component;
signal P,Q,R: bit;
begin
		notcomp: NOTgate port map (S,P);
		andcomp1: ANDgate port map (I0,P,Q);
		andcomp2: ANDgate port map (I1,S,R);
		orcomp: ORgate port map (Q,R,O);
end struct;