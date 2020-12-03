entity testbench is
end testbench;

architecture tb of testbench is 

signal Select0 : bit; -- selection input
signal Select1 : bit; -- selection input
signal a_in : bit_vector(15 downto 0); -- input
signal b_in : bit_vector(15 downto 0); -- input
signal sum : bit_vector(15 downto 0); -- main output
signal c_out : bit; -- carry output
signal z : bit; -- zero bit output

component EE224_projectA is
port(S0 : in bit;
	  S1 : in bit;
	  a : in bit_vector(15 downto 0);
	  b : in bit_vector(15 downto 0);
	  sums : out bit_vector(15 downto 0);
	  cout : out bit;
	  zero : out bit);
end component;

begin 
duty_instance : EE224_projectA port map (Select0,Select1,a_in,b_in,sum,c_out,z);
process -- apply inputs
begin

a_in<= "0000000000000000";
b_in<= "1000000000000001";
Select0<= '0';
Select1<= '0';
wait for 2 ns;

a_in<= "0000000000000000";
b_in<= "1000000000000001";
Select0<= '0';
Select1<= '1';
wait for 2 ns;

a_in<= "0000000000000000";
b_in<= "1000000000000001";
Select0<= '1';
Select1<= '0';
wait for 2 ns;

a_in<= "0000000000000000";
b_in<= "1000000000000001";
Select0<= '1';
Select1<= '1';
wait for 2 ns;
end process;
end tb;


