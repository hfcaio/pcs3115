entity hamming_tb is
end hamming_tb;

architecture behave of hamming_tb is
component hamming is
    port (
        entrada: in bit_vector(13 downto 1);
        dados: out bit_vector(8 downto 0)
    );
end component;

signal entrada: bit_vector(13 downto 1);
signal dados: bit_vector(8 downto 0);

begin
    test: hamming port map(entrada, dados);

    process
    begin    
        entrada <= "1000100111100";
        wait for 1 ns;
        assert(dados = "100010111") report ("fail 1st test") severity error;

        entrada <= "1000100111000";
        wait for 1 ns;
        assert(dados = "100010111") report ("fail 2st test") severity error;

        entrada <= "1001001110011";
        wait for 1 ns;
        assert(dados = "100101110") report ("fail 3st test") severity error;

        entrada <= "1101001110011";
        wait for 1 ns;
        assert(dados = "100101110") report ("fail 4st test") severity error;

        entrada <= "0000000000000";
        wait for 1 ns;
        assert (false) report ("test done") severity note;
        wait;    
    end process;
end behave;