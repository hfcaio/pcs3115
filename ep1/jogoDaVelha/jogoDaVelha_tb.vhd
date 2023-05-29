entity jogoDaVelha_tb is 
end jogoDaVelha_tb;

architecture behave of jogoDaVelha_tb is 

component JogoDaVelha is
port (
    a1 , a2 , a3 : in bit_vector (1 downto 0) ;
    b1 , b2 , b3 : in bit_vector (1 downto 0) ;
    c1 , c2 , c3 : in bit_vector (1 downto 0) ;
        z : out bit_vector (1 downto 0)
);
end component;

signal a1, a2, a3, b1, b2, b3, c1, c2, c3, z : bit_vector (1 downto 0);

begin
    test_bench: jogoDaVelha port map (a1, a2, a3, b1, b2, b3, c1, c2, c3, z);

    process
    begin
        a1 <= "00";
        a2 <= "01";
        a3 <= "10";
        b1 <= "00";
        b2 <= "10";
        b3 <= "00";
        c1 <= "10";
        c2 <= "00";
        c3 <= "01";
        wait for 1 ns;
        assert (z = "10") report ("fail 1st test") severity error;

        a1 <= "01";
        a2 <= "01";
        a3 <= "01";
        b1 <= "00";
        b2 <= "10";
        b3 <= "00";
        c1 <= "10";
        c2 <= "00";
        c3 <= "01";
        wait for 1 ns;
        assert (z = "01") report ("fail 2st test") severity error;

        a1 <= "01";
        a2 <= "01";
        a3 <= "01";
        b1 <= "10";
        b2 <= "10";
        b3 <= "10";
        c1 <= "00";
        c2 <= "00";
        c3 <= "00";
        wait for 1 ns;
        assert (z = "11") report ("fail 3st test") severity error;


        a1 <= "00";
        a2 <= "00";
        a3 <= "00";
        b1 <= "00";
        b2 <= "00";
        b3 <= "00";
        c1 <= "00";
        c2 <= "00";
        c3 <= "00";
        wait for 1 ns;
        assert (false) report ("test done") severity note;
        wait;
    end process;

end behave;