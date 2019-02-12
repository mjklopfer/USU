function bin2image(infile,outfile)
if(nargin==1)
    outfile=[infile(1:max(strfind(infile,'.'))),'png'];
end
fprintf('Input file = %s\n',infile);
fprintf('Output file = %s\n',outfile);

fid=fopen(infile,'rb');
ndim=fread(fid,1,'int');
nchan=fread(fid,1,'int');
dim0=fread(fid,1,'int');
dim1=fread(fid,1,'int');
dim2=fread(fid,1,'int');
x=zeros(dim0,dim1,nchan);
for i=1:dim0
    for j=1:dim1
        for k=1:nchan
            x(i,j,k)=fread(fid,1,'float');
        end
    end
end
fclose(fid);
image(uint8(x));
axis image;
imwrite(uint8(x),outfile,'PNG');




return;