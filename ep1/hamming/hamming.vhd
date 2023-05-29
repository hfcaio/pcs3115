entity hamming is
    port (
        entrada: in bit_vector(13 downto 1);
        dados: out bit_vector(8 downto 0)
    );
end hamming;

architecture behave of hamming is

signal aux: bit_vector(4 downto 1);

begin
    aux(4) <= (entrada(13) xor entrada(12) xor entrada(11) xor entrada(10) xor entrada(9)) xor entrada(8);
    aux(3) <= (entrada(13) xor entrada(12) xor entrada(7) xor entrada(6) xor entrada(5)) xor entrada(4);
    aux(2) <= (entrada(11) xor entrada(10) xor entrada(7) xor entrada(6) xor entrada(3)) xor entrada(2);
    aux(1) <= (entrada(13) xor entrada(11) xor entrada(9) xor entrada(7) xor entrada(5) xor entrada(3)) xor entrada(1);

    dados(8) <= not entrada(13) when (aux(1) & aux(2) & aux(3) & aux(4) = "1011") else entrada(13);
    dados(7) <= not entrada(12) when (aux(1) & aux(2) & aux(3) & aux(4) = "0011") else entrada(12);
    dados(6) <= not entrada(11) when (aux(1) & aux(2) & aux(3) & aux(4) = "1101") else entrada(11);
    dados(5) <= not entrada(10) when (aux(1) & aux(2) & aux(3) & aux(4) = "0101") else entrada(10);
    dados(4) <= not entrada(9) when (aux(1) & aux(2) & aux(3) & aux(4)  = "1001") else entrada(9);
    dados(3) <= not entrada(7) when (aux(1) & aux(2) & aux(3) & aux(4) = "1110") else entrada(7);
    dados(2) <= not entrada(6) when (aux(1) & aux(2) & aux(3) & aux(4) = "0110") else entrada(6);
    dados(1) <= not entrada(5) when (aux(1) & aux(2) & aux(3) & aux(4) = "1010") else entrada(5);
    dados(0) <= not entrada(3) when (aux(1) & aux(2) & aux(3) & aux(4) = "1100") else entrada(3);
end behave;