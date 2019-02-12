function video2bin(infile,outfile)
if(nargin==1)
    outfile=[infile(1:max(strfind(infile,'.'))),'bin'];
end
obj=VideoReader(infile);
f=obj.NumberOfFrames;

x=read(obj,1);
[m,n,c]=size(x);
fprintf('Input file = %s\n',infile);
fprintf('Output file = %s\n',outfile);

fid=fopen(outfile,'wb');

fwrite(fid,[2 c m n f],'int');%ndim nchan rows cols frames

for h=1:f
    x=read(obj,h);
   
    for i=1:m
        for j=1:n
            for k=1:c
                fwrite(fid,x(i,j,k),'float');
            end
        end
    end
end

fclose(fid);








return;