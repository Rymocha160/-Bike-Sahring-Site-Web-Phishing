clear ; close all; clc
%% Load Data
data = load('day.txt');
X = data(1:511, 2:15);
y = data(1:511, 16);
m = length(y);
[X muu sigma] = normaliser_Team02(X);
X = [ones(m, 1) X];
% Choisir la valeur d'alpha
alpha = 0.025;
% Choisir le nombre d'itérations
iters = 4000;
% Init Theta and Run Gradient Descent 
theta = zeros(15, 1);
[theta, J] = gradientDescent_Team02(X, y, theta, alpha, iters);
% Afficher le graphe de Cost Function
plot_Cost_Team02(J);
% Afficher la plus petite valeur de la fonction cost
minJ = min(J);
fprintf ('minJ = %f ', minJ);
Y_predict = X * theta;
X_restant = data(512:731, 2:15);
y_restant = data(512:731, 16);
% normalisation des valeurs restantes 
mtemp = repmat(muu, 220,1);
sigmatemp = repmat(sigma,220,1);
X_restant = (X_restant - mtemp)./sigmatemp;
X_restant = [ones(size(X_restant,1), 1), X_restant(:,:)];
% Pour voir les données sortantes prédicats
Y_new_predict = X_restant * theta;
% Pour voir le taux d'erreur pour chaque donnée
diff = Y_new_predict -  y_restant;