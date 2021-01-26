function [ output_args ] = save_all_figures_to_directory(dir_name)
%Saves all the currently open .fig files into a user-specified directory.
%   Detailed explanation goes here
figlist=findobj('type','figure');
for i=1:numel(figlist)
    saveas(figlist(i),fullfile(dir_name,['figure' num2str(figlist(i).Number) '.fig']));
end
end

