within AixLib.Systems.EONERC_MainBuilding;
model HeatpumpSystem "Heatpump system of the E.ON ERC main building"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium in the system" annotation (choicesAllMatching=true);

  HydraulicModules.Pump pump_hot(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dIns=0.01,
    kIns=0.028,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    length=3,
    redeclare HydraulicModules.BaseClasses.PumpInterface_SpeedControlledNrpm
      PumpInterface(pump(energyDynamics=pump_hot.energyDynamics, redeclare
          AixLib.Fluid.Movers.Data.Pumps.Wilo.VeroLine50slash150dash4slash2
          per)),
    d=0.125,
    T_amb=293.15,
    pipe3(length=6))
                  annotation (Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=0,
        origin={-60,0})));

  HydraulicModules.Pump pump_cold(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dIns=0.01,
    kIns=0.028,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare HydraulicModules.BaseClasses.PumpInterface_SpeedControlledNrpm
      PumpInterface(pump(energyDynamics=pump_hot.energyDynamics, redeclare
          AixLib.Fluid.Movers.Data.Pumps.Wilo.VeroLine50slash150dash4slash2
          per)),
    d=0.100,
    length=4,
    pipe3(length=8),
    T_amb=293.15) annotation (Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=180,
        origin={60,0})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=293.15)
                annotation (Placement(transformation(extent={{84,-4},{92,4}})));
  Fluid.Storage.BufferStorage coldStorage(
    n=4,
    redeclare package Medium = Medium,
    data=DataBase.Storage.Generic_5000l(),
    useHeatingCoil1=false,
    useHeatingCoil2=false,
    upToDownHC1=false,
    upToDownHC2=false,
    useHeatingRod=false,
    redeclare model HeatTransfer =
        Fluid.Storage.BaseClasses.HeatTransferLambdaEff,
    redeclare package MediumHC1 = Medium,
    redeclare package MediumHC2 = Medium,
    TStart=281.15)
    annotation (Placement(transformation(extent={{124,-16},{100,14}})));
  Fluid.Storage.BufferStorage heatStorage(
    n=4,
    redeclare package Medium = Medium,
    data=DataBase.Storage.Generic_4000l(),
    useHeatingCoil1=false,
    useHeatingCoil2=false,
    upToDownHC1=false,
    upToDownHC2=false,
    useHeatingRod=false,
    redeclare model HeatTransfer =
        Fluid.Storage.BaseClasses.HeatTransferLambdaEff,
    redeclare package MediumHC1 = Medium,
    redeclare package MediumHC2 = Medium,
    TStart=303.15) annotation (Placement(transformation(
        extent={{12,-15},{-12,15}},
        rotation=0,
        origin={-188,-1})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T=293.15)
    annotation (Placement(transformation(extent={{-212,-2},{-204,6}})));
  HydraulicModules.Throttle throttle_recool(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dIns=0.01,
    kIns=0.028,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    d=0.125,
    length=6,
    Kv=160,
    pipe3(length=12),
    T_amb=293.15) annotation (Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=0,
        origin={-60,-80})));
  HydraulicModules.Throttle throttle_HS(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dIns=0.01,
    kIns=0.028,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    length=3,
    pipe3(length=6),
    d=0.100,
    Kv=100,
    T_amb=293.15) annotation (Placement(transformation(
        extent={{20,-20},{-20,20}},
        rotation=0,
        origin={-140,0})));
  HydraulicModules.Throttle throttle_CS(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dIns=0.01,
    kIns=0.028,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    length=2,
    pipe3(length=4),
    d=0.125,
    Kv=160,
    T_amb=293.15) annotation (Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=180,
        origin={160,0})));
  HydraulicModules.Throttle throttle_freecool(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dIns=0.01,
    kIns=0.028,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    length=6,
    pipe3(length=12),
    d=0.100,
    Kv=100,
    T_amb=293.15) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={140,-80})));
  Fluid.MixingVolumes.MixingVolume vol(
    redeclare package Medium = Medium,
    m_flow_nominal=10,
    V=0.04,
    nPorts=2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-20,-80})));
  Fluid.MixingVolumes.MixingVolume vol1(
    redeclare package Medium = Medium,
    m_flow_nominal=10,
    V=0.04,
    nPorts=2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={100,-80})));
  HydraulicModules.BaseClasses.HydraulicBus bus_throttle_HS annotation (
      Placement(transformation(extent={{-150,28},{-130,48}}),
        iconTransformation(extent={{-150,52},{-130,72}})));
  HydraulicModules.BaseClasses.HydraulicBus bus_throttle_recool annotation (
      Placement(transformation(extent={{-70,-126},{-50,-106}}),
        iconTransformation(extent={{-48,52},{-28,72}})));
  HydraulicModules.BaseClasses.HydraulicBus bus_throttle_freecool annotation (
      Placement(transformation(extent={{130,-128},{150,-108}}),
        iconTransformation(extent={{110,52},{130,72}})));
  HydraulicModules.BaseClasses.HydraulicBus bus_throttle_CS annotation (
      Placement(transformation(extent={{150,24},{170,44}}), iconTransformation(
          extent={{170,52},{190,72}})));
  Modelica.Fluid.Interfaces.FluidPort_a fluidportBottom1
    "Fluid connector a (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{-230,-30},{-210,-10}}),
        iconTransformation(extent={{-230,-50},{-210,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_b fluidportTop1
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{-230,10},{-210,30}}),
        iconTransformation(extent={{-230,-10},{-210,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1
    "Fluid connector b2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{210,-30},{230,-10}}),
        iconTransformation(extent={{210,-50},{230,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1
    "Fluid connector a1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{210,10},{230,30}}),
        iconTransformation(extent={{210,-10},{230,10}})));
  Fluid.HeatPumps.HeatPump        heatPump(
    refIneFre_constant=1,
    scalingFactor=1,
    useBusConnectorOnly=true,
    VEva=0.1,
    CEva=100,
    GEvaOut=5,
    CCon=100,
    GConOut=5,
    dpEva_nominal=42000,
    dpCon_nominal=44000,
    mFlow_conNominal=10,
    mFlow_evaNominal=10,
    VCon=0.176,
    use_conCap=false,
    use_evaCap=false,
    redeclare package Medium_con = Medium,
    redeclare package Medium_eva = Medium,
    use_revHP=true,
    redeclare model PerDataHea =
        Fluid.HeatPumps.BaseClasses.PerformanceData.LookUpTable2D (dataTable=
            AixLib.DataBase.HeatPump.EN14511.Vitocal200AWO201(tableQdot_con=[0,
            12.5,15; 26.5,300000,288000; 44.2,250000,254000], tableP_ele=[0,
            12.5,15; 26.5,51000,51000; 44.2,51000,51000])),
    redeclare model PerDataChi =
        Fluid.HeatPumps.BaseClasses.PerformanceData.LookUpTable2D (smoothness=
            Modelica.Blocks.Types.Smoothness.LinearSegments, dataTable=
            AixLib.DataBase.Chiller.EN14511.Vitocal200AWO201(tableQdot_con=[0,
            20,25,27,30,35; 7,203000,203000,203000,223000,203000; 18,203000,
            203000,203000,203000,203000], tableP_ele=[0,20,25,27,30,35; 7,51000,
            51000,51000,51000,51000; 18,51000,51000,51000,51000,51000])),
    use_refIne=false,
    TAmbCon_nominal=288.15,
    TAmbEva_nominal=273.15,
    TCon_start=303.15,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
                       annotation (Placement(transformation(
        extent={{-18,-22},{18,22}},
        rotation=90,
        origin={0,0})));
  HydraulicModules.BaseClasses.HydraulicBus bus_pump_hot annotation (Placement(
        transformation(extent={{-68,-40},{-48,-20}}), iconTransformation(extent={{-92,52},
            {-72,72}})));
  HydraulicModules.BaseClasses.HydraulicBus bus_pump_cold annotation (Placement(
        transformation(extent={{50,22},{70,42}}), iconTransformation(extent={{50,50},
            {70,70}})));
  Controls.Interfaces.HeatPumpControlBus bus_HP annotation (Placement(
        transformation(extent={{-2,-48},{18,-28}}), iconTransformation(extent={{-6,52},
            {8,70}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection
    annotation (Placement(transformation(extent={{-8,-100},{12,-80}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={76,-90})));
  Modelica.Blocks.Sources.Constant const1(k=8340)
    annotation (Placement(transformation(extent={{30,-66},{40,-56}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b fluid1 annotation (
      Placement(transformation(extent={{28,-100},{48,-80}}), iconTransformation(
          extent={{-10,-120},{10,-100}})));
equation
  connect(pump_cold.port_a1, coldStorage.fluidportTop2) annotation (Line(
        points={{80,12},{88,12},{88,20},{108,20},{108,14.15},{108.25,14.15}},
        color={0,127,255}));
  connect(pump_cold.port_b2, coldStorage.fluidportBottom2) annotation (Line(
        points={{80,-12},{90,-12},{90,-20},{108,-20},{108,-16},{108.55,-16},{
          108.55,-16.15}}, color={0,127,255}));
  connect(fixedTemperature.port, coldStorage.heatportOutside) annotation (
      Line(points={{92,0},{100.3,0},{100.3,-0.1}}, color={191,0,0}));
  connect(heatStorage.heatportOutside, fixedTemperature1.port) annotation (
      Line(points={{-199.7,-0.1},{-200,-0.1},{-200,2},{-204,2}}, color={191,0,
          0}));
  connect(throttle_HS.port_a1, pump_hot.port_b2)
    annotation (Line(points={{-120,12},{-80,12}}, color={0,127,255}));
  connect(throttle_HS.port_b2, pump_hot.port_a1)
    annotation (Line(points={{-120,-12},{-80,-12}}, color={0,127,255}));
  connect(throttle_HS.port_a2, heatStorage.fluidportBottom1) annotation (Line(
        points={{-160,-12},{-166,-12},{-166,-20},{-183.95,-20},{-183.95,-16.3}},
        color={0,127,255}));
  connect(throttle_HS.port_b1, heatStorage.fluidportTop1) annotation (Line(
        points={{-160,12},{-160,20},{-184,20},{-184,14.15},{-183.8,14.15}},
        color={0,127,255}));
  connect(throttle_CS.port_a2, coldStorage.fluidportBottom1) annotation (Line(
        points={{140,-12},{134,-12},{134,-20},{116.05,-20},{116.05,-16.3}},
        color={0,127,255}));
  connect(throttle_CS.port_b1, coldStorage.fluidportTop1) annotation (Line(
        points={{140,12},{136,12},{136,20},{116.2,20},{116.2,14.15}}, color={
          0,127,255}));
  connect(throttle_freecool.port_a1, throttle_CS.port_a1) annotation (Line(
        points={{160,-92},{202,-92},{202,12},{180,12}}, color={0,127,255}));
  connect(throttle_freecool.port_b2, throttle_CS.port_b2) annotation (Line(
        points={{160,-68},{188,-68},{188,-12},{180,-12}}, color={0,127,255}));
  connect(throttle_HS.hydraulicBus, bus_throttle_HS) annotation (Line(
      points={{-140,20},{-142,20},{-142,38},{-140,38}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(throttle_recool.hydraulicBus, bus_throttle_recool) annotation (Line(
      points={{-60,-100},{-60,-116}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(throttle_freecool.hydraulicBus, bus_throttle_freecool) annotation (
      Line(
      points={{140,-100},{140,-118}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(throttle_CS.hydraulicBus, bus_throttle_CS) annotation (Line(
      points={{160,20},{160,34}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(heatStorage.fluidportBottom2, fluidportBottom1) annotation (Line(
        points={{-191.45,-16.15},{-192,-16.15},{-192,-20},{-220,-20}}, color=
          {0,127,255}));
  connect(heatStorage.fluidportTop2, fluidportTop1) annotation (Line(points={
          {-191.75,14.15},{-191.75,20},{-220,20}}, color={0,127,255}));
  connect(throttle_CS.port_b2, port_b1) annotation (Line(points={{180,-12},{
          220,-12},{220,-20}}, color={0,127,255}));
  connect(throttle_CS.port_a1, port_a1) annotation (Line(points={{180,12},{
          220,12},{220,20}}, color={0,127,255}));
  connect(pump_hot.port_b1, heatPump.port_a1) annotation (Line(points={{-40,-12},
          {-26,-12},{-26,-18},{-11,-18}}, color={0,127,255}));
  connect(pump_hot.port_a2, heatPump.port_b1) annotation (Line(points={{-40,12},
          {-25,12},{-25,18},{-11,18}}, color={0,127,255}));
  connect(heatPump.port_b2, pump_cold.port_a2) annotation (Line(points={{11,-18},
          {18,-18},{18,-22},{40,-22},{40,-12}}, color={0,127,255}));
  connect(heatPump.port_a2, pump_cold.port_b1) annotation (Line(points={{11,18},
          {26,18},{26,12},{40,12}}, color={0,127,255}));
  connect(pump_hot.hydraulicBus, bus_pump_hot) annotation (Line(
      points={{-60,-20},{-60,-30},{-58,-30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(pump_cold.hydraulicBus, bus_pump_cold) annotation (Line(
      points={{60,20},{60,32}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(heatPump.sigBusHP, bus_HP) annotation (Line(
      points={{7.15,-17.82},{7.15,-24.91},{8,-24.91},{8,-38}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(vol.heatPort, convection.solid)
    annotation (Line(points={{-20,-90},{-8,-90}}, color={191,0,0}));
  connect(convection1.solid, vol1.heatPort) annotation (Line(points={{86,-90},{
          100,-90}},                   color={191,0,0}));
  connect(const1.y, convection1.Gc) annotation (Line(points={{40.5,-61},{76,-61},
          {76,-80}},        color={0,0,127}));
  connect(throttle_recool.port_a2, vol.ports[1]) annotation (Line(points={{-40,
          -68},{-30,-68},{-30,-82}}, color={0,127,255}));
  connect(throttle_recool.port_b1, vol.ports[2]) annotation (Line(points={{-40,
          -92},{-30,-92},{-30,-78}}, color={0,127,255}));
  connect(throttle_recool.port_a1, pump_hot.port_b2) annotation (Line(points={{
          -80,-92},{-106,-92},{-106,12},{-80,12}}, color={0,127,255}));
  connect(throttle_recool.port_b2, pump_hot.port_a1) annotation (Line(points={{
          -80,-68},{-92,-68},{-92,-12},{-80,-12}}, color={0,127,255}));
  connect(convection.fluid, fluid1)
    annotation (Line(points={{12,-90},{38,-90}}, color={191,0,0}));
  connect(convection1.fluid, fluid1)
    annotation (Line(points={{66,-90},{38,-90}}, color={191,0,0}));
  connect(throttle_freecool.port_a2, vol1.ports[1]) annotation (Line(points={{
          120,-68},{110,-68},{110,-82}}, color={0,127,255}));
  connect(throttle_freecool.port_b1, vol1.ports[2]) annotation (Line(points={{
          120,-92},{110,-92},{110,-78}}, color={0,127,255}));
  connect(convection.Gc, convection1.Gc) annotation (Line(points={{2,-80},{2,
          -74},{76,-74},{76,-80}}, color={0,0,127}));
  connect(fluid1, fluid1) annotation (Line(points={{38,-90},{5,-90},{5,-90},{38,
          -90}}, color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-220,
            -120},{220,60}}), graphics={
        Rectangle(
          extent={{-192,40},{-132,-60}},
          lineColor={238,46,47},
          fillColor={238,46,47},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{100,40},{160,-60}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{20,20},{40,-40}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-40,20},{-20,-40}},
          lineColor={238,46,47},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-40,20},{40,-40}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Rectangle(
          extent={{-40,-74},{40,-106}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Ellipse(
          extent={{0,-86},{28,-92}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Ellipse(
          extent={{-28,-86},{0,-92}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Ellipse(
          extent={{-4,-78},{4,-88}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Line(
          points={{-40,-20},{-132,-20}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-40,0},{-132,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-100,0},{-100,-100},{-40,-100}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-80,-20},{-80,-80},{-40,-80}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-192,0},{-220,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-192,-40},{-220,-40}},
          color={28,108,200},
          thickness=0.5),
        Ellipse(
          extent={{-68,-12},{-52,-28}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-52,-20},{-60,-12}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-52,-20},{-60,-28}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{40,0},{120,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{40,-20},{120,-20}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{160,0},{220,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{160,-40},{220,-40}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{200,0},{200,-100},{40,-100}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{180,0},{180,-80},{40,-80}},
          color={28,108,200},
          thickness=0.5),
        Ellipse(
          extent={{52,8},{68,-8}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{60,28}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{60,8},{52,0},{60,-8}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-102,-20}},
          color={238,46,47},
          thickness=0.5),
        Polygon(
          points={{-104,-74},{-96,-74},{-104,-88},{-96,-88},{-104,-74}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-4,7},{4,7},{-4,-7},{4,-7},{-4,7}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          origin={-114,0},
          rotation=90),
        Polygon(
          points={{-4,7},{4,7},{-4,-7},{4,-7},{-4,7}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          origin={76,-100},
          rotation=90),
        Rectangle(
          extent={{-220,60},{220,-120}},
          lineColor={0,0,0},
          lineThickness=0.5,
          pattern=LinePattern.Dash),
        Line(
          points={{-22,-110}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-28,-64},{-28,-100}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-10,-64},{-10,-100}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{10,-64},{10,-100}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{28,-64},{28,-100}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Filled})}),
                          Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-220,-120},{220,60}})));
end HeatpumpSystem;
