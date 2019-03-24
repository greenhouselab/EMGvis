function [trials]=pulldata(diode,i,f1,num_channels,trials)
if ~diode
    chan_plot_number = 1;
    for m = num_channels:-1:1
        FileName1=f1.Children(m).Children;
        FileName2 = get(FileName1, 'YData');
        channel_data=[];
        r = [1:(size(FileName2,1)-2)];
        for n = r(end:-1:1) % the last chunk of data is plotted first (order matters!!!)
            exdata1 = FileName2{n,1};
            channel_data = [channel_data, exdata1];
            trials.(['ch', num2str(chan_plot_number)]){i} = channel_data;
        end
        chan_plot_number = chan_plot_number+1;
    end
end

if diode
    chan_plot_number = 1;
    %save channels
    for m = num_channels+1:-1:2
        FileName1=f1.Children(m).Children;
        FileName2 = get(FileName1, 'YData');
        channel_data=[];
        r = [1:(size(FileName2,1)-2)];
        for n = r(end:-1:1) % the last chunk of data is plotted first (order matters!!!)
            exdata1 = FileName2{n,1};
            channel_data = [channel_data, exdata1];
            trials.(['ch', num2str(chan_plot_number)]){i} = channel_data;
        end
        chan_plot_number = chan_plot_number+1;
    end
    %save photodiode
    m = 1;
    FileName1=f1.Children(m).Children;
    FileName2 = get(FileName1, 'YData');
    channel_data=[];
    r = 1:(size(FileName2,1));
    for n = r(end:-1:1) % the last chunk of data is plotted first (order matters!!!)
        exdata1 = FileName2{n,1};
        channel_data = [channel_data, exdata1];
        trials.photodiode{i,1} = channel_data;
    end
end
end