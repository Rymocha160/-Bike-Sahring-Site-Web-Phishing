function [layer1,output] = feedforward_Team02 (input , weight1,weight2)
    layer1 = sigmoid_Team02(input*weight1);
    output= sigmoid_Team02([1,layer1]*weight2);
    
endfunction
