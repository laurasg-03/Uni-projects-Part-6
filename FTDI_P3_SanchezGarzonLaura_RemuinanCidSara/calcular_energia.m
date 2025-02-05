function energia=calcular_energia(f)
energia=sum(sum(double(f).*double(f)));
end