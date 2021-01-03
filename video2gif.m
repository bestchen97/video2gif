file_name='VID.mp4';
obj = VideoReader(file_name);
numFrames = obj.NumFrames;% ֡������
frame = read(obj,1);% ȡ��һ֡Ϊ��ʼ֡
frame = imresize(frame,0.5);% �ı��С����ѹ��gif�Ĵ�С

[I,map] = rgb2ind(frame,128);
dt = 1/32; %�ò������õ�Ӱ���д���̽��
imwrite(I,map,'test1.gif','LoopCount',Inf,'DelayTime',dt);
for k = 2 : numFrames
    frame = read(obj,k);%��ȡ�ڼ�֡
    frame = imresize(frame,0.5);
    [I,map] = rgb2ind(frame,128);
    imwrite(I,map,'test1.gif','WriteMode','append','DelayTime',dt);% ����֡
%     imshow(frame);%��ʾ֡
end