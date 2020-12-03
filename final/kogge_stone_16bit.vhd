entity kogge_stone_16bit is
port( S0: in bit;
		a : in bit_vector(15 downto 0);
		b : in bit_vector(15 downto 0);
		sums : out bit_vector(15 downto 0);
		cout : out bit);
end entity kogge_stone_16bit;

architecture adder_subtracter of kogge_stone_16bit is
signal layer0g : bit_vector(15 downto 0);
signal layer1g : bit_vector(15 downto 0);
signal layer2g : bit_vector(15 downto 0);
signal layer3g : bit_vector(15 downto 0);
signal layer4g : bit_vector(15 downto 0);

signal layer0p : bit_vector(15 downto 0);
signal layer1p : bit_vector(15 downto 0);
signal layer2p : bit_vector(15 downto 0);
signal layer3p : bit_vector(15 downto 0);
signal layer4p : bit_vector(15 downto 0);

component preliminary
port( S0: in bit;
		a : in bit_vector(15 downto 0);
		b : in bit_vector(15 downto 0);
		g : out bit_vector(15 downto 0);
		p : out bit_vector(15 downto 0));
end component;
component prefix_unit
port(g_in1 : in bit;
	  p_in1 : in bit;
	  g_in2 : in bit;
	  p_in2 : in bit;
	  g_out : out bit;
	  p_out : out bit);
end component;
component postprocess
port( S0 : in bit;
		p : in bit_vector(15 downto 0);
		p_last: in bit_vector(15 downto 0);
		g_last: in bit_vector(15 downto 0);
		sums : out bit_vector(15 downto 0);
		cout : out bit);
end component;

begin
preprocess_layer : preliminary port map(S0,a,b,layer0g,layer0p);

stage1:
	for i in 1 to 15 generate
		prefix_layer1 : prefix_unit port map(layer0g(i-1),layer0p(i-1),layer0g(i),layer0p(i),layer1g(i),layer1p(i));
	end generate;
buff1:
	layer1g(0) <= layer0g(0);
	layer1p(0) <= layer0p(0);

stage2:
	for i in 2 to 15 generate
		prefix_layer2 : prefix_unit port map(layer1g(i-2),layer1p(i-2),layer1g(i),layer1p(i),layer2g(i),layer2p(i));
	end generate;
buff2:
	for i in 0 to 1 generate
		layer2g(i) <= layer1g(i);
		layer2p(i) <= layer1p(i);
	end generate;

stage3:
	for i in 4 to 15 generate
		prefix_layer3 : prefix_unit port map(layer2g(i-4),layer2p(i-4),layer2g(i),layer2p(i),layer3g(i),layer3p(i));
	end generate;
buff3:
	for i in 0 to 3 generate
		layer3g(i) <= layer2g(i);
		layer3p(i) <= layer2p(i);
	end generate;

stage4:
	for i in 8 to 15 generate
		prefix_layer4 : prefix_unit port map(layer3g(i-8),layer3p(i-8),layer3g(i),layer3p(i),layer4g(i),layer4p(i));
	end generate;
buff4:
	for i in 0 to 7 generate
		layer4g(i) <= layer3g(i);
		layer4p(i) <= layer3p(i);
	end generate;

final_post : postprocess port map(S0,layer0p,layer4p,layer4g,sums,cout);
end adder_subtracter;