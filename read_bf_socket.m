function [t] = read_bf_socket()

while 1
%% Build a TCP Server and wait for connection
%% 建立TCP服务器并等待连接
    port = 8090;
    t = tcpip('0.0.0.0', port, 'NetworkRole', 'server');
    t.InputBufferSize = 1024;
    t.Timeout = 15;
    fprintf('Waiting for connection on port %d\n',port);
    fopen(t);
    fprintf('Accept connection from %s\n',t.RemoteHost);

%% Set plot parameters  设定绘图参数
    clf;
    axis([1,30,-10,30]);
    t1=0;
    m1=zeros(30,1);
%%  Starting in R2014b, the EraseMode property has been removed from all graphics objects. 
%%  https://mathworks.com/help/matlab/graphics_transition/how-do-i-replace-the-erasemode-property.html
    [~, DATESTR] = version();
    if datenum(DATESTR) > datenum('February 11, 2014')
       % p = plot(gui_handles.axes1,t1,m1,'MarkerSize',5);
       p = plot(t1,m1);
    else
        %p = plot(gui_handles.axes1,t1,m1,'EraseMode','Xor','MarkerSize',5);
        p = plot(m1,'EraseMode','Xor','MarkerSize',5);
    end

    xlabel('Subcarrier index');
    ylabel('SNR (dB)');

%% Initialize variables
    csi_entry = [];                 % 记录
    index = -1;                     % The index of the plots which need shadowing
    broken_perm = 0;                % Flag marking whether we've encountered a broken CSI yet
    triangle = [1 3 6];             % What perm should sum to for 1,2,3 antennas

%% Process all entries in socket    处理套接字中的所有条目
    % Need 3 bytes -- 2 byte size field and 1 byte code
    while 1
        % Read size and code from the received packets
        s = warning('error', 'instrument:fread:unsuccessfulRead');
        try
            field_len = fread(t, 1, 'uint16');  
            % t：文件句柄    1 ：是读入的元素个数   'uint16'： 格式
            % 读取 二进制文件
        catch
            warning(s);
            disp('Timeout, please restart the client and connect again.');
            break;
        end

        code = fread(t,1);    
        % If unhandled code, skip (seek over) the record and continue
        if (code == 187) % get beamforming or phy data
            bytes = fread(t, field_len-1, 'uint8');
            bytes = uint8(bytes);
            if (length(bytes) ~= field_len-1)
                fclose(t);
                return;
            end
        else if field_len <= t.InputBufferSize  % skip all other info
                fread(t, field_len-1, 'uint8');
                continue;
            else
                continue;
            end
        end

        if (code == 187) % (tips: 187 = hex2dec('bb')) Beamforming matrix -- output a record
            csi_entry = read_bfee(bytes);
        
            perm = csi_entry.perm;  % 接收天线的信号排列到处理测量的3个RF链
            Nrx = csi_entry.Nrx;    % 天线的数量
            
            if Nrx > 1 % No permuting needed for only 1 antenna
                if sum(perm) ~= triangle(Nrx) % matrix does not contain default values
                    if broken_perm == 0
                        broken_perm = 1;
                        fprintf('WARN ONCE: Found CSI (%s) with Nrx=%d and invalid perm=[%s]\n', filename, Nrx, int2str(perm));
                    end
                else
                    csi_entry.csi(:,perm(1:Nrx),:) = csi_entry.csi(:,1:Nrx,:);
                end
            end
        end
    
        index = mod(index+1, 10);
        
        csi = get_scaled_csi(csi_entry);%CSI data
	%You can use the CSI data here.

	%This plot will show graphics about recent 10 csi packets
        set(p(index*3 + 1),'XData', [1:30], 'YData', db(abs(squeeze(csi(1,1,:)).')), 'color', 'b', 'linestyle', '-');
        
        if Nrx > 1
            set(p(index*3 + 2),'XData', [1:30], 'YData', db(abs(squeeze(csi(1,2,:)).')), 'color', 'g', 'linestyle', '-');
        end
        
        if Nrx > 2
            set(p(index*3 + 3),'XData', [1:30], 'YData', db(abs(squeeze(csi(1,3,:)).')), 'color', 'r', 'linestyle', '-');
        end
        
        axis([1,30,-10,40]);
        drawnow;
 
        csi_entry = [];
    end
%% Close file
    fclose(t);
    delete(t);
end

end