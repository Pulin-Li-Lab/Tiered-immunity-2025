%% Plot figure 2C + D 

% find mean of cell type frequency per region 
mean_all = mean(freq_all, 2);
mean_infect = mean(freq_infect, 2);
mean_infect = mean(freq_ifn, 2);
std_infect = std(freq_all, [], 2); 
std_ifn = std(freq_ifn, [], 2); 

color_hex = ["#DB5F57", "#db8557", "#dbaa57", "#dbd057", "#c0db57",...
    "#9bdb57", "#75db57", "#57db5f", "#57db85", "#57dbaa", "#57dbd0",...
    "#57c0db", "#579bdb", "#5775db", "#5f57db", "#8557db", "#aa57db", ...
    "#d057db", "#db57c0", "#db579b", "#db5775"];
figure
errorbar(mean_all(:),mean_infect(:),std_infect/sqrt(10),'k')
hold on
for k = 1:size(mean_infect)
    plot(mean_all(k,:),  mean_infect(k,:),'.', 'Color',color_hex(k), 'MarkerSize', 45)
    hold on
end

xlim([0 15])
ylim([0 15])