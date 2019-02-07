#include "frameio.h"
#include "util.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>

frameio net;             // gives us access to the raw network

struct ether_frame       // handy template for 802.3/DIX frames
{
   octet dst_mac[6];     // destination MAC address
   octet src_mac[6];     // source MAC address
   octet prot[2];        // protocol (or length)
   octet data[1500];     // payload
};

//
// This thread sits around and receives frames from the network.
// When it gets one, it dispatches it to the proper protocol stack.
//
void *protocol_loop(void *arg)
{
   ether_frame buf;
   while(1)
   {
      int n = net.recv_frame(&buf,sizeof(buf));
      if ( n < 42 ) continue; // bad frame!

      for (int i = 0; i < 6; i++)
        printf("%02X ", buf.dst_mac[i]);
      for (int i = 0; i < 6; i++)
        printf("%02X ", buf.src_mac[i]);
      for (int i = 0; i < 2; i++)
        printf("%02X ", buf.prot[i]);
      for (int i = 0; i < 8; i++)
        printf("%02X ", buf.data[i]);
      printf("\n");
      for (int i = 8; i < 28; i++)
        printf("%02X ", buf.data[i]);
      printf("\n\n");

   }
}

//
// if you're going to have pthreads, you'll need some thread descriptors
//
pthread_t loop_thread;

//
// start all the threads then step back and watch (actually, the timer
// thread will be started later, but that is invisible to us.)
//
int main()
{
   net.open_net("enp3s0");
   pthread_create(&loop_thread,NULL,protocol_loop,NULL);
   for ( ; ; )
      sleep(1);
}

