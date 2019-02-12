function image2bin(infile,outfile)
if(nargin==1)
    outfile=[infile(1:max(strfind(infile,'.'))),'bin'];
end
x=imread(infile);
fprintf('Input file = %s\n',infile);
fprintf('Output file = %s\n',outfile);

fid=fopen(outfile,'wb');
[m,n,c]=size(x);
fwrite(fid,[2 c m n 0],'int');%ndim nchan dim0 dim1 dim2

for i=1:m
    for j=1:n
        for k=1:c
            fwrite(fid,x(i,j,k),'float');
        end
    end
end

fclose(fid);
return;