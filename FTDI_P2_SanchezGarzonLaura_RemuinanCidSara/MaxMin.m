
function [maximo, minimo] = MaxMin(f)
    maximo = max(max(f(:)));
    minimo = min(min(f(:)));
end