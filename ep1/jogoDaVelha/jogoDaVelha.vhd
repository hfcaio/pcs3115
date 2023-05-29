entity JogoDaVelha is
port (
    a1 , a2 , a3 : in bit_vector (1 downto 0) ;
    b1 , b2 , b3 : in bit_vector (1 downto 0) ;
    c1 , c2 , c3 : in bit_vector (1 downto 0) ;
        z : out bit_vector (1 downto 0)
);
end JogoDaVelha;

architecture behave of JogoDaVelha is
    signal l1, l2, l3 : bit_vector (1 downto 0); --linhas de baixo para cima
    signal col1, col2, col3 : bit_vector (1 downto 0); --colunas da esquerda para direita
    signal dp, ds : bit_vector (1 downto 0); --diagonal principal e secundaria
begin
    l1 <= a1 and b1 and c1;
    l2 <= a2 and b2 and c2;
    l3 <= a3 and b3 and c3;

    col1 <= a1 and a2 and a3;
    col2 <= b1 and b2 and b3;
    col3 <= c1 and c2 and c3;

    dp <= c1 and b2 and a3;
    ds <= a1 and b2 and c3;

    z <= l1 or l2 or l3 or col1 or col2 or col3 or dp or ds;

end behave;