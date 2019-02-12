#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define IOBUFFERSIZE 1024

//default header for files
typedef struct
{
    int ndim;
    int nchan;
    int d0;
    int d1;
    int d2;
} dsp_file_header;


int main(int argc, char *argv[]){
    printf("mono2stereo IOBUFFERSIZE=%d i0 i1 o\n",IOBUFFERSIZE);
    FILE *i0, *i1, *o;
    //check if user provided correct number of inputs
    if(argc != 4)
    {
        printf("*Error: provide two input files and 1 output file for mono2stereo conversion.");
        return 0; 
    }
    //check for errors opening input and output files
    if(NULL ==(i0=fopen(argv[1],"rb")))
    {
        printf("ERROR: Can't open %s for input.\n",argv[1]);
        return 0;
    }
    if(NULL ==(i1=fopen(argv[2],"rb")))
    {
        printf("ERROR: Can't open %s for input.\n",argv[2]);
        return 0;
    }
    if(NULL ==(o=fopen(argv[3],"wb")))
    {
        printf("ERROR: Can't open %s for output.\n",argv[3]);
        return 0;
    }
    printf("Start Processing\n");

    dsp_file_header h0, h1, hout;
    //read in headers of mono files
    fread(&h0,sizeof(dsp_file_header),1,i0);
    fread(&h1,sizeof(dsp_file_header),1,i1);
    printf("Finished reading headers\n");
    memcpy(&hout,&h0,sizeof(dsp_file_header));
    printf("Finished copying header\n");
    hout.nchan=2;
    fwrite(&hout,sizeof(dsp_file_header),1,o);
    printf("Finished writing header\n");
    float x0[IOBUFFERSIZE];
    float x1[IOBUFFERSIZE];
    float y[2*IOBUFFERSIZE];
    
    int n, m;
    int c0=fread(x0,sizeof(float),IOBUFFERSIZE,i0);
    int c1=fread(x1,sizeof(float),IOBUFFERSIZE,i1);
    int cin=(c0<c1?c0:c1);
    printf("Begin shuffling channels\n");
    while(cin>0)
    {
        for(m=0,n=0;n<cin;n++)
        {
            y[m]=x0[n];m++;
            y[m]=x1[n];m++;
        }
        fwrite(y,sizeof(float),m,o);
        c0=fread(x0,sizeof(float),IOBUFFERSIZE,i0);
        c1=fread(x1,sizeof(float),IOBUFFERSIZE,i1);
        cin=(c0<c1?c0:c1);
    }
    
    
    printf("Finished conversion\n");

    fclose(i0);
    fclose(i1);
    fclose(o);

    return 1;
}