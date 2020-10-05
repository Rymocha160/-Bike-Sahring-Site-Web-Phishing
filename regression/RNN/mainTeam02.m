clear; close all; clc;
file=importdata('day.csv',';');
x=file(:,2:15);%colonne 1 contient le ID et sans cosédere y

y=zeros(size(x,1),1);#output
nb_couche_cache=13;
layer1 = zeros(1,nb_couche_cache); #hidden layer array

 for i=2:size(y,1) 
    y(i,1)=x(i,14);
  end
  
%x(:,13:14) = [];#enlever la colonne de y de la matrice des input

for k=1:size(x,2)
  
x(:,k)=(x(:,k) - min(x(:,k))) / ( max(x(:,k)) - min(x(:,k)) );
end

y(:)=(y(:) - min(y(:))) / ( max(y(:)) - min(y(:)) );
%random weight pour layer1 et 2
weight1= rand(size(x,2)+1,nb_couche_cache); 
weight2 = rand(nb_couche_cache+1,1); 
coste=[];

x=[ones(size(x,1),1),x];

for k=1:200 #nombre iterration
  c =[];
for j=1:700 #nombre dechantillon a parcourir 
  [layer1,output]= feedforward_Team02(x(j,:),weight1,weight2); #'hypothese' est calculer avec les poids en entrer
  [weight1,weight2]=backProbagation_Team02(x(j,:), layer1,weight1,weight2,y(j,:),output); #modifier les poids en fonctions du output 
  c= [c; (sum(y(j,:)-output)^2)];
  
end
coste=[coste;sum(c)];
end
coste=coste/(size(x,1)*2)

