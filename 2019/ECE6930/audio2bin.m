function audio2bin(infile,outfile)
if(nargin == 1)
    outfile=[infile(1:max(strfind(infile,'.'))),'bin'];
end
fprintf('Input file = %s\n',infile);
fprintf('Output file = %s\n',outfile);

[x,fs]=audioread(infile);
x=x.';

fid=fopen(outfile,'wb');
fwrite(fid,[1 size(x) fs 0],'int');
fwrite(fid,x(:),'float');


fclose(fid);


return;