clc; clear; close all;
function [p_normalized, q_normalized] = normalize_polynomials (p, q) 
% check if both polynomials are empty
if isempty(p) || isempty(q) 
    error('Error: Ambos polinomios deben contener coeficiente.'); 
    Break; 
end
    % Maximum length between the two polynomials
max_length = max (length (p), length (q)) ;
% Fill with zeros at the beginning (to align terms of equal degree)
p_normalized = [zeros(1,max_length -  length(p)),p];
q_normalized = [zeros(1,max_length - length(q)),q];
end 

%Suma polynomial
function sumar = sumar_polynomial(p,q)
    [p_norm, q_norm] =  normalize_polynomials(p,q);% use the function normalize_polynomials
  [resulter] = p_norm + q_norm; 
  disp('Suma de polinomio: '); 
  disp(resulter); 
end 
% division polynomial
function division = division_polynomial (p,q)
[p_norm, q_norm] = normalize_polynomials(p, q);% use the function normalize_polynomials
[cociente, residuo]= deconv(p, q);
disp( 'Cociente: ');
disp(cociente);
disp( 'Residuo:');
disp(residuo); 
end 

%product polynomial 
function producto = producto_polynomial (p,q)
[p_norm, q_norm] = normalize_polynomials(p, q);% use the function normalize_polynomials
product = conv(p_norm, q_norm); 
disp('Producto de polinomios'); 
disp(product); 
end 

% Define
p = [1 -3 2]; % equal to x^2 - 3x + 2
q = [1 1];% equal to x + 1
 
%llamar a la función suma
sumar_polynomial(p,q)

%llamar a la funcion producto
producto_polynomial (p,q)

%llamar a la funcion division
division_polynomial(p,q)
 