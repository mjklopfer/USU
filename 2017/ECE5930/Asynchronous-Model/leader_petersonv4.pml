/*Peterson leader election protocol
Nathan Tipton A01207112


*/
#define N	6	/* nr of processes */
#define I	3	/* node given the smallest number    */
#define L	12	/* size of buffer  (>= 2*N) */
#define X	38	/* 2*N*(Log2(N))+6*/
ltl p1 {<>[] (nr_leaders==1)};
ltl p2 {[] (messages<X)};
ltl p3 {[] (nr_leaders <= 1)};
ltl p4 {[] (leader_id==N)};


chan q[N] = [L] of {byte};

//counter for total leaders elected
byte nr_leaders = 0;

//counter for total messages sent
byte messages=0;
//used to check if leader has the largest ID which should be N
byte leader_id=N;

proctype node (chan in, out; byte ident)
{      byte d,e,f;

//Set exclusive read and write access for chan for this process
	xr in;
	xs out;

//	printf("MSC: %d\n", ident);
//Initially output my identity which I assume is the max until told otherwise

 activ:
        d=ident;
        do :: true -> out!d;
                messages++;
                in?e;
                if :: (e==ident) ->
                        //process is the leader
                        goto stop
                   :: else -> skip
                fi;
                if::d>e->out!d;
                  ::else-> out!e;
                fi
                messages++;
                in?f;
                if :: (f==ident) ->
                //process is the leader
                        goto stop
                   ::else ->skip
                fi
                if::(e>=d)&&(e>=f) -> d =e
                  ::else -> goto relay //put process into passive mode
                fi
        od;

relay:
//relay mode
end:
    do :: in?d->
            if::(d != ident)->
            //process is not the leader
                out!d
                messages++;
              ::else -> goto stop //process is the leader
            fi
    od;

stop:
printf("Leader: %d",ident);
nr_leaders++;
leader_id=ident;
    skip
}
		

/* initialize N processes with IDs*/
init {
	byte proc;
	atomic {
		proc = 1;
		do
		:: proc <= N ->
			run node (q[proc-1], q[proc%N], (N+I-proc)%N+1);
			proc++
		:: proc > N ->
			break
		od
	}
}


