% Dados que devem ser coletados do paciente:

%Temperatura: Sem risco(verde) = Entre 35 e 37 °C
%Temperatura: Baixo risco(amarelo) = < que 35 ou entre 37 e 39 °C
%Temperatura: Alto risco (laranja) = > que 39 °C

%Frequencia Cardiaca: Sem risco(verde) = < 100 batimentos por minuto
%Frequencia Cardiaca: Baixo risco(amarelo) = > 100 batimentos por minuto

%Frequencia respiratória: Sem risco(verde) = < 18 ipm
%Frequencia respiratória: Baixo risco(amarelo) = Entre 19 a 30 ipm
%Frequencia respiratória: Altissimo risco(vermelho) = > 30 ipm

%Pressão arterial: Sem risco(verde) = > 100 mmHg 
%Pressão arterial: Alto risco (laranja) = Entre 90 e 100 mmHg
%Pressão arterial: Altissimo risco(vermelho) = < 90 mmHg

%Saturação de Oxigênio: Sem risco(verde) = >= 95% 
%Saturação de Oxigênio: Altissimo risco(vermelho) = < 95%

%Dispnéia: Sem risco(verde) = False 
%Dispnéia: Altissimo risco(vermelho) = True

%Idade: Sem risco(verde) = < 60 anos
%Idade: Baixo risco(amarelo) = 60 a 79 anos
%Idade: Alto risco (laranja) = > 80 anos

%Comorbidades: Sem risco(verde) = 0
%Comorbidades: Baixo risco(amarelo) = 1
%Comorbidades: Alto risco (laranja) = 2 ou +

% Fatos
% paciente(nome, idade, temp, Freq. Cardiaca, Freq. respiratória, P_arterial, Sat_Oxigênio, Dispnéia, Comorbidades)
paciente(larissa, 22, 36, 100, 80, 90, 95, true, 0).
paciente(rafael, 21, 36, 150, 80, 90, 100, true, 2).
paciente(willyam, 75, 39, 100, 25, 60, 150, false, 1).
paciente(maia, 95, 37, 100, 80, 90, 100, false, 2).


% Regras

% OR = ;
% AND = ,
 
%Temperatura: Alto risco (laranja) = > que 39 °C
febre_Alta(N):-paciente(N,_,T,_,_,_,_,_,_), T > 39.  

%Temperatura: Baixo risco(amarelo) = < que 35 ou entre 37 e 39 °C
febre(N):-paciente(N,_,T,_,_,_,_,_,_), T < 35 ; paciente(N,_,T,_,_,_,_,_,_), T >= 37, paciente(N,_,T,_,_,_,_,_,_), T =< 39.

%Frequencia Cardiaca: Baixo risco(amarelo) = > 100 batimentos por minuto
freq_cardiaca(N):-paciente(N,_,_,FC,_,_,_,_,_), FC > 100.

%Frequencia respiratória: Baixo risco(amarelo) = Entre 19 a 30 ipm
freq_respiratoria(N):-paciente(N,_,_,_,FR,_,_,_,_), FR >= 19, paciente(N,_,_,_,FR,_,_,_,_), FR =< 30.

%Frequencia respiratória: Altissimo risco(vermelho) = > 30 ipm
freq_respiratoria_Altissima(N):-paciente(N,_,_,_,FR,_,_,_,_), FR > 30.

%Pressão arterial: Alto risco (laranja) = > Entre 90 e 100 mmHg
p_arterial_Alta(N):-paciente(N,_,_,_,_,PA,_,_,_), PA >= 90, paciente(N,_,_,_,_,PA,_,_,_), PA =< 100.

%Pressão arterial: Altissimo risco(vermelho) = < 90 mmHg
p_arterial_Altissima(N):-paciente(N,_,_,_,_,PA,_,_,_), PA < 90.

%Saturação de Oxigênio: Altissimo risco(vermelho) = < 95%
sat_oxigenio_Altissima(N):-paciente(N,_,_,_,_,_,SO,_,_), SO < 95.

%Dispnéia: Altissimo risco(vermelho) = True
dispneia(N):-paciente(N,_,_,_,_,_,_,D,_), D = true.

%Idade: Baixo risco(amarelo) = 60 a 79 anos 
idade(N):-paciente(N,I,_,_,_,_,_,_,_), I >= 60, paciente(N,I,_,_,_,_,_,_,_), I =< 79.

%Idade: Alto risco (laranja) = > 80 anos
idade_Alta(N):-paciente(N,I,_,_,_,_,_,_,_), I > 80.

%Comorbidades: Baixo risco(amarelo) = 1
comorbidade(N):-paciente(N,_,_,_,_,_,_,_,C), C = 1.

%Comorbidades: Alto risco (laranja) = 2 ou +

comorbidade_Alta(N):-paciente(N,_,_,_,_,_,_,_,C), C >= 2.

