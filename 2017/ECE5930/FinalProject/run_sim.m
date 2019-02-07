%initial position
x0=-30;
y0=35;
%sfc('coder_options', 'forceDebugOff', 1);
%run simulation of hybrid vehicle controller
sim('AutomatedGuidedVehicleHybridControllerslx');
%radius of track
radius=50;
%import data from stateflow
y=y_out.Data;
x=x_out.Data;
d=d_out.Data;
hold on;
%plot track and bounds
viscircles([0 0],radius);
viscircles([0 0],radius+5);
viscircles([0 0],radius-5);
%plot car positions
plot(x,y);