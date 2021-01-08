file_name='VID.mp4';
obj = VideoReader(file_name);
numFrames = obj.NumFrames;% number of frames
frame = read(obj,1);% set the first frame as the start frame
frame = imresize(frame,0.5);% change size to compress the file

[I,map] = rgb2ind(frame,128);
dt = 1/32; % the effect of this parameter still needs to be studied
imwrite(I,map,'test1.gif','LoopCount',Inf,'DelayTime',dt);
for k = 2 : numFrames
    frame = read(obj,k);% read the frame
    frame = imresize(frame,0.5);
    [I,map] = rgb2ind(frame,128);
    imwrite(I,map,'test1.gif','WriteMode','append','DelayTime',dt);% save the frame
%     imshow(frame);% display the frame
end
