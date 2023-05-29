entity and3 is 
port (a, b, c : in bit_vector(1 downto 0);
    z : out bit_vector(1 downto 0));
end and3;

architecture behave of and3 is 
begin
    z <= a and b and c;
end behave;