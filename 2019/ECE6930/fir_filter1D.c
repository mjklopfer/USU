#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define IOBUFFERSIZE 1024
//default header for files
typedef struct
{
    int ndim; 
    int nchan;
    int d0; //M
    int d1; //N
    int d2;
} dsp_file_header;



int main(int argc, char *argv[]){
    printf("1D fir filter: impulse, fin, fout\n");
    FILE *fh,*fx,*fy;
    //check if user provided correct number of inputs
    if(argc != 4)
    {
        printf("*Error: provide 1 impulse file, 1 input file and 1 output file for 1D Convolution.");
        return 0; 
    }
    //check for errors opening input and output files
     if(NULL ==(fh=fopen(argv[1],"rb")))
    {
        printf("ERROR: Can't open %s for impulse.\n",argv[1]);
        return 0;
    }
    if(NULL ==(fx=fopen(argv[2],"rb")))
    {
        printf("ERROR: Can't open %s for input.\n",argv[2]);
        return 0;
    }
    if(NULL ==(fy=fopen(argv[3],"wb")))
    {
        printf("ERROR: Can't open %s for output.\n",argv[3]);
        return 0;
    }
    printf("Start Processing\n");

    dsp_file_header hh, hx, hy;
    //read in headers of input files
    fread(&hx,sizeof(dsp_file_header),1,fx);
    fread(&hh,sizeof(dsp_file_header),1,fh);
    if(hx.nchan>1){
        printf("Input file must be single channel signal.\n");
        return 0;
    }

    printf("Finished reading input header\n");
    memcpy(&hy,&hx,sizeof(dsp_file_header));
    printf("Finished copying header\n");
    int Lh,Lx, Ly,Lz;
    Lh=hh.d0; //Length of impulse response
    Lx=hx.d0; //Length of input
    Ly=Lx; //Length of convolution
    hy.d0=Ly;
    fwrite(&hy,sizeof(dsp_file_header),1,fy);
    printf("Finished writing header\n");
    printf("Starting Fir filtering\n");
    float *b=(float*)calloc(sizeof(float),Lx); //circular buffer
    float *y=(float*)calloc(sizeof(float),Ly); //output file
    float *h=(float*)calloc(sizeof(float),Lh); //impulse response
    float x[IOBUFFERSIZE],y[IOBUFFERSIZE];
    float acc;
    int num, k=Lh-1;
    num=fread(x,sizeof(float),IOBUFFERSIZE,fx); //read in samples

    while(num>0){
        for(int i=0;i<num; i++){
            b[k]=x[i]; //copy sample into circular buffer
            acc=0.0; //initialize accumulator
            for(int n=0;n<Lh;n++){
                acc+=h[n]*g[(n+k)%Lh];
            }
            y[i]=acc;
            k--;
            k=(k+Lh)%Lh;
        }
        fwrite(y,sizeof(float),num,fy);
        num=fread(x,sizeof(float),IOBUFFERSIZE,fx);
    }
  
    printf("Finished fir filtering\n");
    printf("Length of output signal %d\n",Ly);
    printf("Number of transient output samples %d\n",);
    printf("Number of valid output samples %d\n",);
    
    fclose(fh);
    fclose(fx);
    fclose(fy);

    return 1;
}