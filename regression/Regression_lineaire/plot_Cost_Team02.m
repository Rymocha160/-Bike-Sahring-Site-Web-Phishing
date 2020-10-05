function plot_Cost_Team02 (J_history)
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Itérations');
ylabel('J');
end