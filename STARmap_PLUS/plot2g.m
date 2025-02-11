%% plot Fig 2G
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