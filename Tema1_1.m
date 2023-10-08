% Inicializar el vector x con un valor inicial de 0
x = zeros(1, 51);

% Inicializar el primer valor de la sucesión
x(1) = 0;

% Calcular las 50 primeras iteraciones y Erel
Erel = zeros(1, 51);
for n = 2:51
    x(n) = (1/2) * exp(-x(n-1));
    Erel(n) = abs((x(n) - x(n-1)) / x(n));
end

% Calcular Ncifras
Ncifras = floor(-log10(1.5e-10 * Erel));

% Calcular el límite s
s = x(end);

% Crear la figura con tres subplots
figure;

% Primer subplot: Círculos huecos
subplot(1, 3, 1);
plot(0:50, x, 'bo', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'none');
title('Sucesión x');
xlabel('n');
ylabel('x');

% Segundo subplot: Gráfica de errores relativos en escala logarítmica
subplot(1, 3, 2);
semilogy(2:51, Erel(2:end), 'bo', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'none'); % Excluimos el primer valor para evitar divisiones por cero
title('Errores Relativos (Escala logarítmica en el eje y)');
xlabel('n');
ylabel('Erel');

% Tercer subplot: Círculos huecos
subplot(1, 3, 3);
plot(2:51, Ncifras(2:end), 'bo', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'none'); % Excluimos el primer valor para evitar divisiones por cero
title('Número de Cifras Significativas');
xlabel('n');
ylabel('Ncifras');

% Respuestas a las preguntas (sin cambios)
reduccion_error_aproximado = Erel(2) / Erel(3); % Aproximadamente
precision_maquina = 1e-16; % Supongamos una precisión de la máquina típica en MATLAB
iteraciones_precision_maquina = ceil(-log10(precision_maquina) / log10(reduccion_error_aproximado));
cifras_precision_obtenidas = floor(-log10(Erel(end))); % Cifras de precisión obtenidas
iteraciones_para_una_cifra = iteraciones_precision_maquina / cifras_precision_obtenidas;

fprintf('En cada iteración, el error relativo se reduce aproximadamente %.2f veces.\n', reduccion_error_aproximado);
fprintf('La precisión de la máquina es de %.1e.\n', precision_maquina);
fprintf('Se necesitan aproximadamente %d iteraciones para alcanzar la precisión de la máquina.\n', iteraciones_precision_maquina);
fprintf('Se obtienen %d cifras de precisión.\n', cifras_precision_obtenidas);
fprintf('Se necesitan aproximadamente %.1f iteraciones para aumentar una cifra de precisión.\n', iteraciones_para_una_cifra);
