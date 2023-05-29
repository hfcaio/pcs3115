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

entity Ajuda is 
port (
    dica, jogador : in bit;
    a1 , a2 , a3 : in bit_vector (1 downto 0);
    b1 , b2 , b3 : in bit_vector (1 downto 0);
    c1 , c2 , c3 : in bit_vector (1 downto 0);
    La1 , La2 , La3 : out bit;
    Lb1 , Lb2 , Lb3 : out bit;
    Lc1 , Lc2 , Lc3 : out bit
);
end Ajuda;


architecture behave of Ajuda is
component JogoDaVelha is
port (
    a1 , a2 , a3 : in bit_vector (1 downto 0) ;
    b1 , b2 , b3 : in bit_vector (1 downto 0) ;
    c1 , c2 , c3 : in bit_vector (1 downto 0) ;
        z : out bit_vector (1 downto 0)
);
end component;

signal za1, za2, za3, zb1, zb2, zb3, zc1, zc2, zc3: bit_vector (1 downto 0); --da esq->dir, cima->baixo
signal player: bit_vector (1 downto 0);

signal aux_a1, aux_a2, aux_a3, aux_b1, aux_b2, aux_b3, aux_c1, aux_c2, aux_c3: bit;
signal initial_z: bit_vector(1 downto 0);
begin
    player <= "10" when jogador = '1' else "01";  
    label_initial_z: JogoDaVelha port map (a1, a2, a3, b1, b2, b3, c1, c2, c3, initial_z);    
    label_za1: JogoDaVelha port map (player, a2, a3, b1, b2, b3, c1, c2, c3, za1);    
    label_za2: JogoDaVelha port map (a1, player, a3, b1, b2, b3, c1, c2, c3, za2);    
    label_za3: JogoDaVelha port map (a1, a2, player, b1, b2, b3, c1, c2, c3, za3);    
    label_zb1: JogoDaVelha port map (a1, a2, a3, player, b2, b3, c1, c2, c3, zb1);    
    label_zb2: JogoDaVelha port map (a1, a2, a3, b1, player, b3, c1, c2, c3, zb2);    
    label_zb3: JogoDaVelha port map (a1, a2, a3, b1, b2, player, c1, c2, c3, zb3);    
    label_zc1: JogoDaVelha port map (a1, a2, a3, b1, b2, b3, player, c2, c3, zc1);    
    label_zc2: JogoDaVelha port map (a1, a2, a3, b1, b2, b3, c1, player, c3, zc2);    
    label_zc3: JogoDaVelha port map (a1, a2, a3, b1, b2, b3, c1, c2, player, zc3);  
    
    aux_a1 <= '1' when (player = za1) and initial_z /= player else '0';
    aux_a2 <= '1' when (player = za2) and initial_z /= player else '0';
    aux_a3 <= '1' when (player = za3) and initial_z /= player else '0';

    aux_b1 <= '1' when (player = zb1) and initial_z /= player else '0';
    aux_b2 <= '1' when (player = zb2) and initial_z /= player else '0';
    aux_b3 <= '1' when (player = zb3) and initial_z /= player else '0';

    aux_c1 <= '1' when (player = zc1) and initial_z /= player else '0';
    aux_c2 <= '1' when (player = zc2) and initial_z /= player else '0';
    aux_c3 <= '1' when (player = zc3) and initial_z /= player else '0';

    La1 <= '1' when (dica & a1 & aux_a1 = "1001") else '0';
    La2 <= '1' when (dica & a2 & aux_a2 = "1001") else '0';
    La3 <= '1' when (dica & a3 & aux_a3 = "1001") else '0';
    
    Lb1 <= '1' when (dica & b1 & aux_b1 = "1001") else '0';
    Lb2 <= '1' when (dica & b2 & aux_b2 = "1001") else '0';
    Lb3 <= '1' when (dica & b3 & aux_b3 = "1001") else '0';
    
    Lc1 <= '1' when (dica & c1 & aux_c1 = "1001") else '0';
    Lc2 <= '1' when (dica & c2 & aux_c2 = "1001") else '0';
    Lc3 <= '1' when (dica & c3 & aux_c3 = "1001") else '0';
end behave;