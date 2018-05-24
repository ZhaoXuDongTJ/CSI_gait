function [ vid, vid_res, n_bands ] = open_camera(~)
%开启摄像头
try
    vid=videoinput('winvideo',1,'YUY2_640x480');
    % save('globalvariables.mat','vid', '-mat');
    set(vid,'TriggerRepeat',Inf);
    set(vid,'FramesPerTrigger',1);
    set(vid,'FrameGrabInterval',2);
    set(vid,'ReturnedColorSpace','rgb'); %'rgb'即返回为彩色的图像
    vid_res=get(vid,'VideoResolution');
    n_bands=get(vid,'NumberOfBands');
catch
    msgbox('摄像头开启失败','错误','error');
    vid = -1;
end

end


