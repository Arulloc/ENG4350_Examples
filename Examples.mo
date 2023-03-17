package Examples
  model SwitchedRLC
    parameter Real Vb=24 "Battery voltage";
    parameter Real L = 250.e-6 "Inductance (H)";
    parameter Real R = 50e3 "Resistance (Ohms) gives underdamped response. for reg use 50 ohms";
    parameter Real C = 100.e-12 "Capacitance (F)";
    Real Vs;
    Real V;
    Real i_L;
    Real i_R;
    Real i_C;
  
  initial equation
    i_L = 0.;
    i_R = 0.;
  
  equation
    L*der(i_L) = (Vs-V);
    i_C = C*der(V);
    i_R = V/R;
    i_L = i_R+i_C;
    Vs = if time>10e-6 then Vb else 0;
    
  annotation(Documentation(info = "<html><head></head><body>Open Modelica Examlples - Switched RLC model - based on model from&nbsp;<a href='https://mbe.modelica.university/behavior/discrete/switching/#switched-rlc'>Open Modelica by Example</a>&nbsp;</body></html>"),
      experiment(StartTime = 0, StopTime = 100e-6, Tolerance = 1e-6, Interval = 2e-07));
  end SwitchedRLC;
end Examples;
