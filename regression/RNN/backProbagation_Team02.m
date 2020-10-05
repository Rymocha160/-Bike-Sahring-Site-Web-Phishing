function [weight21,weight22] = backProbagation_Team02(input, layer1,weight1,weight2,y,output)
    d_weight2=[1,layer1]'*(2*(y(1,:)-output).*sigmoid_deriv_Team02(output))  ;
    d_weight1=input'*(((2*(y(1,:)-output).*sigmoid_deriv_Team02(output))
    *weight2').*sigmoid_deriv_Team02([1,layer1]));
   
    
    weight22=weight2+d_weight2*0.01;
    weight21=weight1+d_weight1(:,2:size(d_weight1,2))*0.01;
endfunction
