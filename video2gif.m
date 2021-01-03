file_name='VID.mp4';
obj = VideoReader(file_name);
numFrames = obj.NumFrames;% 帧的总数
frame = read(obj,1);% 取第一帧为起始帧
frame = imresize(frame,0.5);% 改变大小可以压缩gif的大小

[I,map] = rgb2ind(frame,128);
dt = 1/32; %该参数设置的影响有待于探究
imwrite(I,map,'test1.gif','LoopCount',Inf,'DelayTime',dt);
for k = 2 : numFrames
    frame = read(obj,k);%读取第几帧
    frame = imresize(frame,0.5);
    [I,map] = rgb2ind(frame,128);
    imwrite(I,map,'test1.gif','WriteMode','append','DelayTime',dt);% 保存帧
%     imshow(frame);%显示帧
end