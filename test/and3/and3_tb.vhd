entity and3_tb is
end and3_tb;

architecture behave of and3_tb is
        
    component and3 is 
    port (a, b, c : in bit_vector(1 downto 0);
        z : out bit_vector(1 downto 0));
    end component;

    signal a, b, c, z: bit_vector(1 downto 0);
begin
    test_bench: and3 port map (a, b, c ,z);

    process
    begin 
        a <= "10";
        b <= "10";
        c <= "10";
        wait for 1 ns;
        assert (z = "10") report ("fail 10/10/10") severity error;

        a <= "01";
        b <= "01";
        c <= "01";
        wait for 1 ns;
        assert (z = "01") report ("fail 01/01/01") severity error;

        a <= "01";
        b <= "01";
        c <= "10";
        wait for 1 ns;
        assert (z = "10") report ("fail 10/01/10") severity error;

        a <= "00";
        b <= "00";
        c <= "00";
        assert false report ("test done") severity note;
        wait;
    end process;

end behave;