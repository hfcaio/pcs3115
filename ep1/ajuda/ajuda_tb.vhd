entity ajuda_tb is 
end ajuda_tb;

architecture behave of ajuda_tb is 

component Ajuda is 
port (
    dica, jogador : in bit;
    a1 , a2 , a3 : in bit_vector (1 downto 0);
    b1 , b2 , b3 : in bit_vector (1 downto 0);
    c1 , c2 , c3 : in bit_vector (1 downto 0);
    La1 , La2 , La3 : out bit;
    Lb1 , Lb2 , Lb3 : out bit;
    Lc1 , Lc2 , Lc3 : out bit
);
end component;

signal a1, a2, a3, b1, b2, b3, c1, c2, c3: bit_vector (1 downto 0);
signal La1, La2, La3, Lb1, Lb2, Lb3, Lc1, Lc2, Lc3: bit;
signal dica, jogador : bit;

begin
    test_bench: Ajuda port map (dica, jogador, a1, a2, a3, b1, b2, b3, c1, c2, c3, La1, La2, La3, Lb1, Lb2, Lb3, Lc1, Lc2, Lc3);

    process
    begin
        dica <= '1';
        jogador <= '1';
        a1 <= "10";
        a2 <= "10";
        a3 <= "01";
        b1 <= "10";
        b2 <= "01";
        b3 <= "00";
        c1 <= "00";
        c2 <= "00";
        c3 <= "01";
        wait for 1 ns;
        assert (Lc1 = '1') report ("fail 1st test") severity error;

       
        dica <= '1';
        jogador <= '0';
        a1 <= "10";
        a2 <= "10";
        a3 <= "01";
        b1 <= "10";
        b2 <= "01";
        b3 <= "00";
        c1 <= "00";
        c2 <= "00";
        c3 <= "01";
        wait for 1 ns;
        assert (Lb3 & Lc1 = "11") report ("fail 2st test") severity error;

        dica <= '1';
        jogador <= '0';
        a1 <= "10";
        a2 <= "10";
        a3 <= "10";
        b1 <= "10";
        b2 <= "01";
        b3 <= "00";
        c1 <= "00";
        c2 <= "00";
        c3 <= "01";
        wait for 1 ns;
        assert (Lb3 & Lc1 & Lc2 = "000") report ("fail 3st test") severity error;

        dica <= '1';
        jogador <= '1';
        a1 <= "10";
        a2 <= "10";
        a3 <= "10";
        b1 <= "10";
        b2 <= "01";
        b3 <= "00";
        c1 <= "00";
        c2 <= "00";
        c3 <= "01";
        wait for 1 ns;
        assert (Lb3 & Lc1 & Lc2 = "000") report ("fail 4st test") severity error;

        dica <= '0';
        jogador <= '0';
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