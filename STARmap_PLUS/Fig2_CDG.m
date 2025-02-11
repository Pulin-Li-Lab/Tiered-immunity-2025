%% plot Fig 2C + D
% freq_all = AllRegions_AllCellTypeFreq.csv
% freq_infect = AllRegions_InfectedCellTypeFreq.csv
% freq_ifn = AllRegions_IFNCellTypeFreq.csv

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

%% Plot Fig 2G
% comp_foci = 250211_AllFoci_CellTypeFreq.csv
% frac = 250211_AllFoci_FracIFN.csv

% separate airway and alveolar foci based on the frequency of airway epi 
alv_ind = find(comp_foci(:,1) < 0.05);
epi_ind = find(comp_foci(:,1)>=0.05);

%plot all data using scatter plot
alv_foci = frac(alv_ind,:);
figure; scatter([1:21], frac(alv_ind,:), 'ko')
hold on
scatter([1:21], frac(epi_ind,:), 'kx')

% plot error bars
mean_frac = nanmean(frac);
stderr = nanstd(frac)/sqrt(97);
hold on; errorbar( mean_frac, stderr)