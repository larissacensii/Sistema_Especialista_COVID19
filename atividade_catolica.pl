% Fatos
temperatura(joao, 36).
freq_cardiaca(joao, 120).
freq_respiratoria(joao, 18).
pa(joao, 120).
sa_o2(joao, 100).
dispineia(joao, false).
idade(joao, 45).
comorbidades(joao, 0).


temperatura(carlos, 37.2).	% médio
freq_cardiaca(carlos, 90).	% médio
freq_respiratoria(carlos, 15).	% sem risco
pa(carlos, 95).	% grave
sa_o2(carlos, 95).	% sem risco
dispineia(carlos, false).	% sem risco
idade(carlos, 45).	% sem risco
comorbidades(carlos, 1).	% médio





% Fatos "estáticos"
temperatura_anormal(37).
temperatura_grave(39). % >=
pressao_grave(100). % =<
saturacao_grave(95). % menor que
dispineia_grave(true).
idade_grave(80). % =< - maior ou igual
comorbidade(2). % maior ou =



% Regras
func_febre(X):- temperatura(X, Y), Y > 37.
func_febre_grave(X):-temperatura(X, Y), Y > 39.
func_pa_grave(X):-pa(X, Y), Y < 100.
func_sao2_grave(X):-pessao_grave(X,Y), Y < 100.
