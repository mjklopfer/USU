function bin2video(infile, outfile)
if(nargin==1)
    outfile=[infile(1:max(strfind(infile,'.'))),'mp4'];
end
fprintf('Input file = %s\n',infile);
fprintf('Output file = %s\n',outfile);

fid=fopen(infile,'rb');
ndim=fread(fid,1,'int');
nchan=fread(fid,1,'int');
dim0=fread(fid,1,'int'); %rows
dim1=fread(fid,1,'int'); %cols
dim2=fread(fid,1,'int'); %frames
obj=VideoWriter(outfile,'MPEG-4');
open(obj);

for h=1:dim2
x=zeros(dim0,dim1,nchan);
    for i=1:dim0
        for j=1:dim1
            for k=1:nchan
                x(i,j,k)=fread(fid,1,'float');
            end
        end
    end
writeVideo(obj,x);
end
close(obj)






return;