function [siPoMech, siPoElec, siSpd, siFlow, Flow_h, siP_Out, siP_In, DelHi, siPoHydr, EtaOut, siTemp, siP_Vapor, Npsh, DevPower, MinTolPower, MaxTolPower, RelPower, DevDelHi, MinTolDelHi, MaxTolDelHi, MaxTolEta, MaxTolNpsh, MinTolEta, RelDelHi, RelEta, RelNpsh, DevEta, DevNpsh, LoadTime, Load0, Load1, Load2, Load3, Load4, Load5, Load6, Load7, Load8, Load9, Load10, DevNpsh0, DevNpsh1, DevNpsh2, DevNpsh3, DevNpsh4, DevNpsh5, DevNpsh6, DevNpsh7, DevNpsh8, DevNpsh9, DevNpsh10] = fcn(PoRate, ConvAct, ConstSpd, PoMech, PoMechFact, PoMechOffs, PolyAct, PoElec, PoElecFact, PoElecOffs, PolyDataK0, PolyDataK1, PolyDataK2, PolyDataK3, PolyDataK4, Eta, SlipCorr, LineFreq, PolePairs, SpdRate, Spd, SpdFact, SpdOffs, PoMechCorr, Bypass, Flow1, Flow2, Flow3, Flow4, Flow5, Flow6, Flow7, Flow8, Flow9, Flow10, Flow11, Flow12, Flow13, Flow14, Flow15, FlowFact, FlowOffs, TimeBase, Flow, Power1, Power2, Power3, Power4, Power5, Power6, Power7, Power8, Power9, Power10, Power11, Power12, Power13, Power14, Power15, Density, P_Atmos, P_In, P_InFact, P_InOffs, P_Out, P_OutFact, P_OutOffs, InSocket, PresSocket, DelHiCorr, H_Geo, PoHydrCorr, EtaCorr, Antoine, AntA, AntB, AntC, Temp, TempFact, TempOffs, NpshCorr, AntFact, P_Vapor, PowerTol, PowerMax, DelHiTol, DelHi1, DelHi2, DelHi3, DelHi4, DelHi5, DelHi6, DelHi7, DelHi8, DelHi9, DelHi10, DelHi11, DelHi12, DelHi13, DelHi14, DelHi15, DelHiMax, Eta1, Eta2, Eta3, Eta4, Eta5, Eta6, Eta7, Eta8, Eta9, Eta10, Eta11, Eta12, Eta13, Eta14, Eta15, EtaMax, EtaTol, FlowNp1, FlowNp2, FlowNp3, FlowNp4, FlowNp5, FlowNp6, FlowNp7, FlowNp8, FlowNp9, FlowNp10, FlowNp11, FlowNp12, FlowNp13, FlowNp14, FlowNp15, Npsh1, Npsh2, Npsh3, Npsh4, Npsh5, Npsh6, Npsh7, Npsh8, Npsh9, Npsh10, Npsh11, Npsh12, Npsh13, Npsh14, Npsh15, NpshMax, NpshTol, LoadRstOp, FlowMax, SampleTime, Running)
%#codegen

%% Интерфейс блока
%{
<tia>
Antoine;        true;   1 = Antoine calculation is active
AntA;           8.07131;    A value of the Antoine equation
AntB;           1730.63;    B value of the Antoine equation
AntC;           233.426;    C value of the Antoine equation
AntFact;        0.0013332;  Normalization factor of the vapor pressure in bar
ConstSpd;       true;   1 = Motor is running at constant speed
ConvAct;        false;  1= Mechanical power is passed to PoMech
Bypass;         false;  1 = Bypass calculation is active
DelHi1;         0.0;    y value 1, delivery height [m]
DelHi2;         0.0;    y value 2, delivery height [m]
DelHi3;         126.0;  y value 3, delivery height [m]
DelHi4;         126.0;  y value 4, delivery height [m]
DelHi5;         125.5;  y value 5, delivery height [m]
DelHi6;         124.5;  y value 6, delivery height [m]
DelHi7;         123.0;  y value 7, delivery height [m]
DelHi8;         121.0;  y value 8, delivery height [m]
DelHi9;         118.0;  y value 9, delivery height [m]
DelHi10;        114.0;  y value 10, delivery height [m]
DelHi11;        109.0;  y value 11, delivery height [m]
DelHi12;        103.0;  y value 12, delivery height [m]
DelHi13;        96.0;   y value 13, delivery height [m]
DelHi14;        88.0;   y value 14, delivery height [m]
DelHi15;        79.0;   y value 15, delivery height [m]
DelHiCorr;      1.0;    Delivery height correction factor
DelHiMax;       140.0;  Maximum delivery height value [m]
DelHiTol;       3.0;    Tolerance for deviation from the delivery height characteristic [%]
Density;        1000.0; Density of the pumped medium [kg/m3]
Eta;            80.0;   Efficiency of the motor (cos ) [%]
Eta1;           0.0;    y value 1, efficiency [%]
Eta2;           0.0;    y value 2, efficiency [%]
Eta3;           33.0;   y value 3, efficiency [%]
Eta4;           41.0;   y value 4, efficiency [%]
Eta5;           48.5;   y value 5, efficiency [%]
Eta6;           54.5;   y value 6, efficiency [%]
Eta7;           60.0;   y value 7, efficiency [%]
Eta8;           64.5;   y value 8, efficiency [%]
Eta9;           68.0;   y value 9, efficiency [%]
Eta10;          70.5;   y value 10, efficiency [%]
Eta11;          71.5;   y value 11, efficiency [%]
Eta12;          71.5;   y value 12, efficiency [%]
Eta13;          70.0;   y value 13, efficiency [%]
Eta14;          67.0;   y value 14, efficiency [%]
Eta15;          63.0;   y value 15, efficiency [%]
EtaCorr;        1.0;    Efficiency correction factor
EtaMax;         100.0;  Maximum value of efficiency [%]
EtaTol;         3.0;    Tolerance for deviation from the efficiency characteristic [%]
Flow;           ;       Interconnectable process value for the flow rate
Flow1;          100.0;  x value 1, flow [m3/h]
Flow2;          200.0;  x value 2, flow [m3/h]
Flow3;          300.0;  x value 3, flow [m3/h]
Flow4;          400.0;  x value 4, flow [m3/h]
Flow5;          500.0;  x value 5, flow [m3/h]
Flow6;          600.0;  x value 6, flow [m3/h]
Flow7;          700.0;  x value 7, flow [m3/h]
Flow8;          800.0;  x value 8, flow [m3/h]
Flow9;          900.0;  x value 9, flow [m3/h]
Flow10;         1000.0;  x value 10, flow [m3/h]
Flow11;         1100.0;  x value 11, flow [m3/h]
Flow12;         1200.0;  x value 12, flow [m3/h]
Flow13;         1300.0;  x value 13, flow [m3/h]
Flow14;         1400.0;  x value 14, flow [m3/h]
Flow15;         1500.0;  x value 15, flow [m3/h]
FlowFact;       2.7777e-4;  Normalization factor for the flow rate in m3/s
FlowMax;        1500.0; Maximum value of the flow rate [m3/h]
FlowNp1;        100.0;  x value 1, NPSH flow [m3/h]
FlowNp2;        200.0;  x value 2, NPSH flow [m3/h]
FlowNp3;        300.0;  x value 3, NPSH flow [m3/h]
FlowNp4;        400.0;  x value 4, NPSH flow [m3/h]
FlowNp5;        500.0;  x value 5, NPSH flow [m3/h]
FlowNp6;        600.0;  x value 6, NPSH flow [m3/h]
FlowNp7;        700.0;  x value 7, NPSH flow [m3/h]
FlowNp8;        800.0;  x value 8, NPSH flow [m3/h]
FlowNp9;        900.0;  x value 9, NPSH flow [m3/h]
FlowNp10;       1000.0;  x value 10, NPSH flow [m3/h]
FlowNp11;       1100.0;  x value 11, NPSH flow [m3/h]
FlowNp12;       1200.0;  x value 12, NPSH flow [m3/h]
FlowNp13;       1300.0;  x value 13, NPSH flow [m3/h]
FlowNp14;       1400.0;  x value 14, NPSH flow [m3/h]
FlowNp15;       1500.0;  x value 15, NPSH flow [m3/h]
FlowOffs;       0.0;    Normalization offset of the flow rate in m3/s
H_Geo;          0.0;    Geometric delivery height in [m]. Provides the difference in height between the intake and discharge stubs.
InSocket;       300.0;  Discharge stub diameter [mm]
LineFreq;       50.0;   Line frequency [Hz]. Required for slip correction.
LoadRstOp;      false;  1 = Reset histogram data
Npsh1;          0.0;    y value 1, NPSH [m]
Npsh2;          0.0;    y value 2, NPSH [m]
Npsh3;          0.95;   y value 3, NPSH [m]
Npsh4;          1.0;    y value 4, NPSH [m]
Npsh5;          1.07;   y value 5, NPSH [m]
Npsh6;          1.17;   y value 6, NPSH [m]
Npsh7;          1.29;   y value 7, NPSH [m]
Npsh8;          1.44;   y value 8, NPSH [m]
Npsh9;          1.62;   y value 9, NPSH [m]
Npsh10;         1.83;   y value 10, NPSH [m]
Npsh11;         2.07;   y value 11, NPSH [m]
Npsh12;         2.34;   y value 12, NPSH [m]
Npsh13;         2.64;   y value 13, NPSH [m]
Npsh14;         2.96;   y value 14, NPSH [m]
Npsh15;         3.3;    y value 15, NPSH [m]
NpshCorr;       1.0;    NPSH correction factor
NpshMax;        3.5;    Maximum value of NPSH [m]
NpshTol;        0.5;    Tolerance for deviation from the NPSH characteristic [m]
P_Atmos;        1.0;    Air pressure [bar]
P_In;           ;       Interconnectable process value of the intake pressure
P_InFact;       1.0;    Normalization factor of the intake pressure in bar
P_InOffs;       0.0;    Normalization offset of the intake pressure in bar
P_Out;          ;       Interconnectable process value of the flow pressure
P_OutFact;      1.0;    Normalization factor of the flow pressure in bar
P_OutOffs;      0.0;    Normalization offset of the flow pressure in bar
P_Vapor;        0.0;    Vapor pressure of the pumped medium [bar]
PolePairs;      1.0;    Number of motor pole pairs for slip correction
PolyAct;        false;  1 = Polynomial calculation active
PolyDataK0;     0.0;    Polynomial coefficient
PolyDataK1;     0.0;    Polynomial coefficient
PolyDataK2;     0.0;    Polynomial coefficient
PolyDataK3;     0.0;    Polynomial coefficient
PolyDataK4;     0.0;    Polynomial coefficient
PoElec;         ;       Interconnectable process value of the electrical power
PoElecFact;     1.0;    Normalization factor of the electrical power in kW
PoElecOffs;     0.0;    Normalization offset of the electrical power in kW
PoMech;         ;       Interconnectable process value of the mechanical power (e.g. from converter)
PoMechCorr;     1.0;    Mechanical power correction factor
PoMechFact;     1.0;    Mechanical power normalization factor in kW
PoMechOffs;     0.0;    Normalization offset of mechanical power in kW
PoRate;         100.0;  Rated power of the motor [kW];                      EW_RET_EV
PoHydrCorr;     1.0;    Hydraulic power correction factor
Power1;         0.0;    y value 1, power [kW]
Power2;         0.0;    y value 2, power [kW]
Power3;         318.0;  y value 3, power [kW]
Power4;         339.0;  y value 4, power [kW]
Power5;         360.0;  y value 5, power [kW]
Power6;         380.0;  y value 6, power [kW]
Power7;         399.0;  y value 7, power [kW]
Power8;         417.0;  y value 8, power [kW]
Power9;         434.0;  y value 9, power [kW]
Power10;        450.0;  y value 10, power [kW]
Power11;        465.0;  y value 11, power [kW]
Power12;        480.0;  y value 12, power [kW]
Power13;        495.0;  y value 13, power [kW]
Power14;        509.0;  y value 14, power [kW]
Power15;        522.0;  y value 15, power [kW]
PowerMax;       600.0;  Maximum value of power [kW]
PowerTol;       3.0;    Tolerance for deviation from the power characteristic [%]
PresSocket;     300.0;  Discharge stub diameter [mm]
Running;        ;       1 = Motor is running
SampleTime;     0.1;    Sampling time [s] (assigned automatically)
SlipCorr;       false;  1 = Slip correction active
Spd;            ;       Interconnectable process value for the speed
SpdFact;        1.0 ;   Normalization factor of speed in rpm
SpdOffs;        0.0;    Normalization offset of speed in rpm
SpdRate;        2900.0; Rated speed [rpm]
Temp;           ;       Interconnectable process value for the temperature of the pumped medium
TempFact;       1.0;    Normalization factor of the medium temperature in °C
TempOffs;       0.0;    Normalization offset of the medium temperature in °C
TimeBase;       3600.0; Time basis for the flow values of the characteristic (3600 = hour) [s]

DelHi;          ;       Output delivery height [m]
DevDelHi;       ;       Deviation from the delivery height characteristic curve [m]
DevEta;         ;       Deviation from the efficiency characteristic curve [%]
DevNpsh;        ;       Deviation from the NPSH characteristic curve [m]
DevNpsh0;       ;       Downtime for NPSH histogram (Not Running) [%]
DevNpsh1;       ;       Running time of the NPSH value in the range < -1 m [%]
DevNpsh2;       ;       Running time of the NPSH value in the range -1 to -0.5 m [%]
DevNpsh3;       ;       Running time of the NPSH value in the range -0.5 to 0 m [%]
DevNpsh4;       ;       Running time of the NPSH value in the range 0 to 0.5 m [%]
DevNpsh5;       ;       Running time of the NPSH value in the range 0.5 to 1 m [%]
DevNpsh6;       ;       Running time of the NPSH value in the range 1 to 1.5 m [%]
DevNpsh7;       ;       Running time of the NPSH value in the range 1.5 to 2 m [%]
DevNpsh8;       ;       Running time of the NPSH value in the range 2 to 2.5 m [%]
DevNpsh9;       ;       Running time of the NPSH value in the range 2.5 to 3.0 m [%]
DevNpsh10;      ;       Running time of the NPSH value in the range > 3.0 m [%]
DevPower;       ;       Deviation from the power characteristic [kW]
Flow_h;         ;       Normalized flow rate for display in the faceplate [m3/h]
EtaOut;         ;       Efficiency output [%]
Load0;          ;       Downtime for flow rate histogram (Not Running) [%]
Load1;          ;       Running time of the pump in the range 0-10% FlowMax [%]
Load2;          ;       Running time of the pump in the range 10-20% FlowMax [%]
Load3;          ;       Running time of the pump in the range 20-30% FlowMax [%]
Load4;          ;       Running time of the pump in the range 30-40% FlowMax [%]
Load5;          ;       Running time of the pump in the range 40-50% FlowMax [%]
Load6;          ;       Running time of the pump in the range 50-60% FlowMax [%]
Load7;          ;       Running time of the pump in the range 60-70% FlowMax [%]
Load8;          ;       Running time of the pump in the range 70-80% FlowMax [%]
Load9;          ;       Running time of the pump in the range 80-90% FlowMax [%]
Load10;         ;       Running time of the pump in the range 90-100% FlowMax [%]
LoadTime;       ;       Recording period of the histogram data [h]
MaxTolDelHi;    ;       Upper tolerance limit for deviation from the delivery height characteristic [m]
MaxTolEta;      ;       Upper tolerance limit for deviation from the efficiency characteristic [%]
MaxTolNpsh;     ;       Upper tolerance limit for approach to the NPSH characteristic [m]
MaxTolPower;    ;       Upper tolerance limit for deviation from the power characteristic [kW]
MinTolDelHi;    ;       Lower tolerance limit for deviation from the delivery height characteristic [m]
MinTolEta;      ;       Lower tolerance limit for deviation from the efficiency characteristic [%]
MinTolPower;    ;       Lower tolerance limit for deviation from the power characteristic [kW]
Npsh;           ;       NPSH value output [m]
RelDelHi;       ;       Relative deviation from the delivery height characteristic [%]
RelEta;         ;       Relative deviation from the efficiency characteristic [%]
RelNpsh;        ;       Relative deviation from the NPSH characteristic [%]
RelPower;       ;       Relative deviation from the power characteristic [%]
siFlow;         ;       Normalized flow rate output [m3/h]
siP_In;         ;       Normalized intake pressure output [bar]
siP_Out;        ;       Normalized flow pressure output [bar]
siP_Vapor;      ;       Vapor pressure of the pumped medium output [bar]
siPoElec;       ;       Normalized electrical power output [kW]
siPoHydr;       ;       Normalized hydraulic power output [kW]
siSpd;          ;       Normalized speed output [rpm]
siTemp;         ;       Normalized temperature output [°C]
</tia>
%}

persistent SrFlowMaxOld
persistent rangeCnt
persistent rangeCntNpsh
if isempty(SrFlowMaxOld)
    SrFlowMaxOld = 0.0;
end
if isempty(rangeCnt)
    rangeCnt = zeros(1, 12);
end
if isempty(rangeCntNpsh)
    rangeCntNpsh = zeros(1, 12);
end
curve = zeros(15, 2);

%% Перевод в СИ
siFlow.Value = FlowFact * Flow.Value + FlowOffs;
siFlow.QC = Flow.QC;
Flow_h = siFlow.Value * TimeBase;

siP_In.Value = P_Atmos + P_InOffs + P_InFact * P_In.Value;
siP_In.QC = P_In.QC;

siP_Out.Value = P_Atmos + P_OutOffs + P_OutFact * P_Out.Value;
siP_Out.QC = P_Out.QC;

siPoElec.Value = PoElecFact * PoElec.Value + PoElecOffs;
siPoElec.QC = PoElec.QC;

siSpd.Value = SpdFact * Spd.Value + SpdOffs;
siSpd.QC = Spd.QC;

siTemp.Value = TempFact * Temp.Value + TempOffs;
siTemp.QC = Temp.QC;

%% Расчет механической мощности
if PoRate <= 0
    % неправильна задана номинальная мощность двигателя
    rPoMech = 0.0;
elseif ConvAct
    % есть измеренное значение механической мощности (из частотного привода)
    rPoMech = PoMechFact * PoMech.Value + PoMechOffs;
elseif PolyAct
    % есть зависимость между мех. и электр. мощностью в виде полинома
    rPoMech = PolyDataK1 * siPoElec.Value + PolyDataK0;
    rPoMech = PolyDataK2 * siPoElec.Value * siPoElec.Value + rPoMech;
    rPoMech = PolyDataK3 * siPoElec.Value * siPoElec.Value * siPoElec.Value + rPoMech;
    rPoMech = PolyDataK4 * siPoElec.Value * siPoElec.Value * siPoElec.Value * siPoElec.Value + rPoMech;
else
    % расчет по модели двигателя
    A_0 = 1.1788;
    A_1 = -0.01208;
    A_2 = 0;
    B_0 = 0.49573;
    B_1 = 0.00517;
    B_2 = 0;
    C_0 = 2.2034;
    C_1 = -0.04223;
    C_2 = 0.000204;
    
    A = A_1 * Eta + A_0 + A_2 * Eta * Eta;
    B = B_1 * Eta + B_0 + B_2 * Eta * Eta;
    C = C_1 * Eta + C_0 + C_2 * Eta * Eta;
    D = C - siPoElec.Value / (abs(PoRate) + 1e-5);
    temp = B * B - 4.0 * A * D;
    if temp >= 0.0 && Eta > 30 && Eta <= 100
        rPoMech = ((-B + sqrt(temp)) * PoRate) / (2 * A + 1e-5);
    else
        rPoMech = -1.0;
    end
end

%% Компенсация скольжения
if ConstSpd
    SlipCorr = false;
end
if SlipCorr
    rTheoreticSpd = LineFreq * 60 / PolePairs;
    rSlip = 1 - ((rTheoreticSpd - SpdRate) / rTheoreticSpd) * (rPoMech / PoRate);
    siSpd.Value = rSlip * siSpd.Value;
    rPoMech = rPoMech * rSlip;
end

%% Расчет siPoMech
siPoMech.Value = rPoMech * PoMechCorr;
if siPoMech.Value < 0.0 || rPoMech < 0.0
    siPoMech.Value = 0.0;
end

stcInST = zeros(1, 16, 'int16');

if ConvAct
    stcInST(1) = PoMech.QC;
else
    stcInST(1) = PoElec.QC;
end

if ~ConstSpd
    stcInST(2) = Spd.QC;
else
    stcInST(2) = int16(QCcodes.Good);
end
% stcInST(3) = siPoMech.QC;     !!!

siPoMech.QC = Utils.SelST16(stcInST, 2, 0);

%% Байпас насоса
% Расчитываем поток не по датчику, а по мех. мощности
if Bypass
    curve(1, 1) = Flow1;
    curve(2, 1) = Flow2;
    curve(3, 1) = Flow3;
    curve(4, 1) = Flow4;
    curve(5, 1) = Flow5;
    curve(6, 1) = Flow6;
    curve(7, 1) = Flow7;
    curve(8, 1) = Flow8;
    curve(9, 1) = Flow9;
    curve(10, 1) = Flow10;
    curve(11, 1) = Flow11;
    curve(12, 1) = Flow12;
    curve(13, 1) = Flow13;
    curve(14, 1) = Flow14;
    curve(15, 1) = Flow15;
    curve(1, 2) = Power1;
    curve(2, 2) = Power2;
    curve(3, 2) = Power3;
    curve(4, 2) = Power4;
    curve(5, 2) = Power5;
    curve(6, 2) = Power6;
    curve(7, 2) = Power7;
    curve(8, 2) = Power8;
    curve(9, 2) = Power9;
    curve(10, 2) = Power10;
    curve(11, 2) = Power11;
    curve(12, 2) = Power12;
    curve(13, 2) = Power13;
    curve(14, 2) = Power14;
    curve(15, 2) = Power15;
    
    pos = 1;
    for i = 1:15
        if siPoMech.Value >= curve(i, 2)
            pos = i;
        end
    end
    
    for i = 8:14
        if curve(i + 1, 2) == 0.0
            curve(i + 1, 2) = curve(i, 2);
        end
    end
    
    for i = 8:2:-1
        if curve(i - 1, 2) == 0.0
            curve(i - 1, 2) = curve(i, 2);
        end
    end
    
    switch pos
        case 1
            Flow_h = curve(1, 1);
            
        case 15
            Flow_h = curve(15, 1);
            
        otherwise
            rTemp = curve(pos + 1, 2) - curve(pos, 2);
            if abs(rTemp) < 1e-5
                rTemp = 1e-5;
            end
            rTemp = (curve(pos + 1, 1) - curve(pos, 1)) / rTemp;
            Flow_h = curve(pos, 1) + (siPoMech.Value - curve(pos, 2)) * rTemp;
    end
    
    siFlow.Value = Flow_h / TimeBase;
end

%% Расчет напора
rDelHi = ((siP_Out.Value - siP_In.Value) * 1e5) / (Density * 9.81);
    
if InSocket > 1 && PresSocket > 1 && abs(PresSocket - InSocket) > 2
    rSpdInSocket = 1.273240e+6 / (InSocket * InSocket) * siFlow.Value;
    rSpdPresSocket = 1.273240e+6 / (PresSocket * PresSocket) * siFlow.Value;
    rDelHi = (rSpdPresSocket * rSpdPresSocket - rSpdInSocket * rSpdInSocket) / 19.62 + rDelHi;
end
    
DelHi.Value = rDelHi * DelHiCorr + H_Geo;
DelHi.Value = max(DelHi.Value, 0.0);


stcInST(:) = 0;
stcInST(1) = Flow.QC;
stcInST(2) = P_In.QC;
stcInST(3) = P_Out.QC;

if ~ConstSpd
    stcInST(4) = Spd.QC;
else
    stcInST(4) = int16(QCcodes.Good);
end

%     stcInST(5) = DelHi.ST;        !!!
DelHi.QC = Utils.SelST16(stcInST, 4, 0);

%% Расчет гидравлической мощности
rTemp = siFlow.Value * DelHi.Value * Density * 9.811e-3;
siPoHydr.Value = rTemp * PoHydrCorr;
siPoHydr.Value = max(siPoHydr.Value, 0.0);
stcInST(:) = 0;
stcInST(1) = Flow.QC;
stcInST(2) = P_In.QC;
stcInST(3) = P_Out.QC;
%     stcInST(4) = siPoHydr.QC;     !!!
siPoHydr.QC = Utils.SelST16(stcInST, 3, 0);

%% Расчет КПД
EtaOut.Value = (EtaCorr * 100 * siPoHydr.Value) / (siPoMech.Value + 1.0e-5);
if EtaOut.Value < 0.0
    EtaOut.Value = 0.0;
end
stcInST(:) = 0;
stcInST(1) = siPoMech.QC;
stcInST(2) = siPoHydr.QC;
% stcInST(3) = EtaOut.QC;    !!!
EtaOut.QC = Utils.SelST16(stcInST, 2, 0);

%% Расчет NPSH
if InSocket > 1
    rSpdInSocket = 1.27324e+6 / (InSocket * InSocket) * siFlow.Value;
else
    rSpdInSocket = 0.0;
end
   
if Antoine
    rTemp = AntA - AntB / (siTemp.Value + AntC);
    rTemp = exp(rTemp * 2.3025851);
    siP_Vapor = rTemp * AntFact;
else
    siP_Vapor = P_Vapor;
end
     
rNpsh = (siP_In.Value - siP_Vapor) * 1e+5 / (Density * 9.81) + rSpdInSocket * rSpdInSocket / 19.62;
Npsh.Value = rNpsh * NpshCorr;
if Npsh.Value < 0.0
    Npsh.Value = 0.0;
end

stcInST(:) = 0;
stcInST(1) = Flow.QC;
stcInST(2) = P_In.QC;
stcInST(3) = Temp.QC;
if ~ConstSpd
    stcInST(4) = Spd.QC;
else
    stcInST(4) = int16(QCcodes.Good);
end
%     stcInST.b4 := Npsh.ST;    !!!
Npsh.QC = Utils.SelST16(stcInST, 4, 0);

%% Сравнение факт. и теор. мощности
if ConstSpd
    rSpeedFact = 1;
elseif siSpd.Value < 1 || SpdRate < 1
    rSpeedFact = 1e-5;
else
    rSpeedFact = siSpd.Value / SpdRate;
end
    
curve(1, 1) = Flow1;
curve(2, 1) = Flow2;
curve(3, 1) = Flow3;
curve(4, 1) = Flow4;
curve(5, 1) = Flow5;
curve(6, 1) = Flow6;
curve(7, 1) = Flow7;
curve(8, 1) = Flow8;
curve(9, 1) = Flow9;
curve(10, 1) = Flow10;
curve(11, 1) = Flow11;
curve(12, 1) = Flow12;
curve(13, 1) = Flow13;
curve(14, 1) = Flow14;
curve(15, 1) = Flow15;
    
pos = 1;
rFlow = Flow_h / rSpeedFact;
for i = 1 : 15
    if rFlow >= curve(i, 1)
        pos = i;
    end
end
    
curve(1, 2) = Power1;
curve(2, 2) = Power2;
curve(3, 2) = Power3;
curve(4, 2) = Power4;
curve(5, 2) = Power5;
curve(6, 2) = Power6;
curve(7, 2) = Power7;
curve(8, 2) = Power8;
curve(9, 2) = Power9;
curve(10, 2) = Power10;
curve(11, 2) = Power11;
curve(12, 2) = Power12;
curve(13, 2) = Power13;
curve(14, 2) = Power14;
curve(15, 2) = Power15;
    
for i = 8:14
    if curve(i + 1, 2) == 0.0
        curve(i + 1, 2) = curve(i, 2);
    end
end

for i = 8:2:-1
    if curve(i - 1, 2) == 0.0
        curve(i - 1, 2) = curve(i, 2);
    end
end

switch pos
    case 1
        SrCurvePoiPower = curve(1, 2);
        
    case 15
        SrCurvePoiPower = curve(15, 2);
        
    otherwise
        rTemp = curve(pos + 1, 1) - curve(pos, 1);
        if abs(rTemp) < 1e-5
            rTemp = 1e-5;
        end
        rTemp = (curve(pos + 1, 2) - curve(pos, 2)) / rTemp;
        SrCurvePoiPower = curve(pos, 2) + (rFlow - curve(pos, 1)) * rTemp;
end
    
SrCurvePoiPower = SrCurvePoiPower * rSpeedFact * rSpeedFact * rSpeedFact;

if SrCurvePoiPower > PowerMax
    SrCurvePoiPower = PowerMax;
elseif SrCurvePoiPower < 0.0
    SrCurvePoiPower = 1e-5;
end
DevPower = siPoMech.Value - SrCurvePoiPower;
MinTolPower = (1 - 0.01 * PowerTol) * SrCurvePoiPower;
MaxTolPower = (0.01 * PowerTol + 1) * SrCurvePoiPower;
RelPower = (siPoMech.Value - SrCurvePoiPower) * 100 / SrCurvePoiPower;
if RelPower > 100
    RelPower = 100;
elseif RelPower < -100
    RelPower = -100;
end

%% Сравнение факт. и теор. напора
curve(1, 2) = DelHi1;
curve(2, 2) = DelHi2;
curve(3, 2) = DelHi3;
curve(4, 2) = DelHi4;
curve(5, 2) = DelHi5;
curve(6, 2) = DelHi6;
curve(7, 2) = DelHi7;
curve(8, 2) = DelHi8;
curve(9, 2) = DelHi9;
curve(10, 2) = DelHi10;
curve(11, 2) = DelHi11;
curve(12, 2) = DelHi12;
curve(13, 2) = DelHi13;
curve(14, 2) = DelHi14;
curve(15, 2) = DelHi15;
    
for i = 8:14
    if curve(i + 1, 2) == 0.0
        curve(i + 1, 2) = curve(i, 2);
    end
end

for i = 8:2:-1
    if curve(i - 1, 2) == 0.0
        curve(i - 1, 2) = curve(i, 2);
    end
end
    
switch pos
    case 1
        SrCurvePoiDelHi = curve(1, 2);
        
    case 15
        SrCurvePoiDelHi = curve(15, 2);
        
    otherwise
        rTemp = curve(pos + 1, 1) - curve(pos, 1);
        if abs(rTemp) < 1e-5
            rTemp = 1e-5;
        end
        rTemp = (curve(pos + 1, 2) - curve(pos, 2)) / rTemp;
        SrCurvePoiDelHi = curve(pos, 2) + (rFlow - curve(pos, 1)) * rTemp;
end
    
SrCurvePoiDelHi = SrCurvePoiDelHi * rSpeedFact * rSpeedFact;
if SrCurvePoiDelHi > DelHiMax
    SrCurvePoiDelHi = DelHiMax;
elseif SrCurvePoiDelHi < 0
    SrCurvePoiDelHi = 1e-5;
end
DevDelHi = DelHi.Value - SrCurvePoiDelHi;
MinTolDelHi = (1 - 0.01 * DelHiTol) * SrCurvePoiDelHi;
MaxTolDelHi = (0.01 * DelHiTol + 1) * SrCurvePoiDelHi;
RelDelHi = (DelHi.Value - SrCurvePoiDelHi) * 100 / SrCurvePoiDelHi;
if RelDelHi > 100
    RelDelHi = 100;
elseif RelDelHi < -100
    RelDelHi = -100;
end

%% Сравнение факт. и теор. КПД
curve(1, 2) = Eta1;
curve(2, 2) = Eta2;
curve(3, 2) = Eta3;
curve(4, 2) = Eta4;
curve(5, 2) = Eta5;
curve(6, 2) = Eta6;
curve(7, 2) = Eta7;
curve(8, 2) = Eta8;
curve(9, 2) = Eta9;
curve(10, 2) = Eta10;
curve(11, 2) = Eta11;
curve(12, 2) = Eta12;
curve(13, 2) = Eta13;
curve(14, 2) = Eta14;
curve(15, 2) = Eta15;
 
for i = 8:14
    if curve(i + 1, 2) == 0.0
        curve(i + 1, 2) = curve(i, 2);
    end
end

for i = 8:2:-1
    if curve(i - 1, 2) == 0.0
        curve(i - 1, 2) = curve(i, 2);
    end
end
    
switch pos
    case 1
        SrCurvePoiEta = curve(1, 2);
        
    case 15
        SrCurvePoiEta = curve(15, 2);
        
    otherwise
        rTemp = curve(pos + 1, 1) - curve(pos, 1);
        if abs(rTemp) < 1e-5
            rTemp = 1e-5;
        end
        rTemp = (curve(pos + 1, 2) - curve(pos, 2)) / rTemp;
        SrCurvePoiEta = curve(pos, 2) + (rFlow - curve(pos, 1)) * rTemp;
end
    
if SrCurvePoiEta > EtaMax
    SrCurvePoiEta = EtaMax;
elseif SrCurvePoiEta < 0
    SrCurvePoiEta = 1e-5;
end

DevEta = EtaOut.Value - SrCurvePoiEta;
MinTolEta = (1 - 0.01 * EtaTol) * SrCurvePoiEta;
MaxTolEta = (0.01 * EtaTol + 1) * SrCurvePoiEta;
RelEta = (EtaOut.Value - SrCurvePoiEta) * 100 / SrCurvePoiEta;
if RelEta > 100
    RelEta = 100;
elseif RelEta < -100
    RelEta = -100;
end

%% Сравнение факт. и теор. NPSH
curve(1, 1) = FlowNp1;
curve(2, 1) = FlowNp2;
curve(3, 1) = FlowNp3;
curve(4, 1) = FlowNp4;
curve(5, 1) = FlowNp5;
curve(6, 1) = FlowNp6;
curve(7, 1) = FlowNp7;
curve(8, 1) = FlowNp8;
curve(9, 1) = FlowNp9;
curve(10, 1) = FlowNp10;
curve(11, 1) = FlowNp11;
curve(12, 1) = FlowNp12;
curve(13, 1) = FlowNp13;
curve(14, 1) = FlowNp14;
curve(15, 1) = FlowNp15;
    
posNpsh = 1;
for i = 1 : 15
    if rFlow >= curve(i, 1)
        posNpsh = i;
    end
end
    
curve(1, 2) = Npsh1;
curve(2, 2) = Npsh2;
curve(3, 2) = Npsh3;
curve(4, 2) = Npsh4;
curve(5, 2) = Npsh5;
curve(6, 2) = Npsh6;
curve(7, 2) = Npsh7;
curve(8, 2) = Npsh8;
curve(9, 2) = Npsh9;
curve(10, 2) = Npsh10;
curve(11, 2) = Npsh11;
curve(12, 2) = Npsh12;
curve(13, 2) = Npsh13;
curve(14, 2) = Npsh14;
curve(15, 2) = Npsh15;
    
for i = 8:14
    if curve(i + 1, 2) == 0.0
        curve(i + 1, 2) = curve(i, 2);
    end
end

for i = 8:2:-1
    if curve(i - 1, 2) == 0.0
        curve(i - 1, 2) = curve(i, 2);
    end
end

switch posNpsh
    case 1
        SrCurvePoiNpsh = curve(1, 2);
        
    case 15
        SrCurvePoiNpsh = curve(15, 2);
        
    otherwise
        rTemp = curve(posNpsh + 1, 1) - curve(posNpsh, 1);
        if abs(rTemp) < 1e-5
            rTemp = 1e-5;
        end
        rTemp = (curve(posNpsh + 1, 2) - curve(posNpsh, 2)) / rTemp;
        SrCurvePoiNpsh = curve(posNpsh, 2) + (rFlow - curve(posNpsh, 1)) * rTemp;
end
    
SrCurvePoiNpsh = SrCurvePoiNpsh * rSpeedFact * rSpeedFact;
if SrCurvePoiNpsh > NpshMax
    SrCurvePoiNpsh = NpshMax;
elseif SrCurvePoiNpsh < 0
    SrCurvePoiNpsh = 1e-5;
end
DevNpsh = Npsh.Value - SrCurvePoiNpsh;
MaxTolNpsh = SrCurvePoiNpsh + NpshTol;
RelNpsh = (Npsh.Value - SrCurvePoiNpsh) / SrCurvePoiNpsh;
if RelNpsh > 100
    RelNpsh = 100;
elseif RelNpsh < -100
    RelNpsh = -100;
end

%% Расчет времени работы в разных интервалах расхода
if SrFlowMaxOld ~= FlowMax || LoadRstOp
        SrFlowMaxOld = FlowMax;
        LoadTime = 0;
        Load0 = 0;
        Load1 = 0;
        Load2 = 0;
        Load3 = 0;
        Load4 = 0;
        Load5 = 0;
        Load6 = 0;
        Load7 = 0;
        Load8 = 0;
        Load9 = 0;
        Load10 = 0;
        DevNpsh0 = 0;
        DevNpsh1 = 0;
        DevNpsh2 = 0;
        DevNpsh3 = 0;
        DevNpsh4 = 0;
        DevNpsh5 = 0;
        DevNpsh6 = 0;
        DevNpsh7 = 0;
        DevNpsh8 = 0;
        DevNpsh9 = 0;
        DevNpsh10 = 0;
        
        for i = 1:12
            rangeCnt(i) = 0.0;
            rangeCntNpsh(i) = 0.0;
        end
else
        rangeCnt(11) = rangeCnt(11) + 1.0;
        rTemp = 10.0 * siFlow.Value * TimeBase / (FlowMax + 1e-5);
        
        if ~Running.Value || PoElec.Value <= 1e-5
            nCount = 12;
        elseif rTemp <= 1.0
            nCount = 1;
        elseif rTemp <= 2.0
            nCount = 2;
        elseif rTemp <= 3.0
            nCount = 3;
        elseif rTemp <= 4.0
            nCount = 4;
        elseif rTemp <= 5.0
            nCount = 5;
        elseif rTemp <= 6.0
            nCount = 6;
        elseif rTemp <= 7.0
            nCount = 7;
        elseif rTemp <= 8.0
            nCount = 8;
        elseif rTemp <= 9.0
            nCount = 9;
        else
            nCount = 10;
        end
        rangeCnt(nCount) = rangeCnt(nCount) + 1.0;

        LoadTime = rangeCnt(11) * SampleTime / 3600;
        Load0 = rangeCnt(12) / rangeCnt(11);
        Load1 = rangeCnt(1) / rangeCnt(11);
        Load2 = rangeCnt(2) / rangeCnt(11);
        Load3 = rangeCnt(3) / rangeCnt(11);
        Load4 = rangeCnt(4) / rangeCnt(11);
        Load5 = rangeCnt(5) / rangeCnt(11);
        Load6 = rangeCnt(6) / rangeCnt(11);
        Load7 = rangeCnt(7) / rangeCnt(11);
        Load8 = rangeCnt(8) / rangeCnt(11);
        Load9 = rangeCnt(9) / rangeCnt(11);
        Load10 = rangeCnt(10) / rangeCnt(11);
        
        rangeCntNpsh(11) = rangeCntNpsh(11) + 1.0;
        if ~Running.Value || PoElec.Value <= 1e-5
            nCount = 0;
        elseif DevNpsh <= -1.0
            nCount = 1;
        elseif DevNpsh <= -0.5
            nCount = 2;
        elseif DevNpsh <= 0.0
            nCount = 3;
        elseif DevNpsh <= 0.5
            nCount = 4;
        elseif DevNpsh <= 1.0
            nCount = 5;
        elseif DevNpsh <= 1.5
            nCount = 6;
        elseif DevNpsh <= 2.0
            nCount = 7;
        elseif DevNpsh <= 2.5
            nCount = 8;
        elseif DevNpsh <= 3.0
            nCount = 9;
        else
            nCount = 10;
        end
        rangeCntNpsh(nCount) = rangeCntNpsh(nCount) + 1.0;
        
        DevNpsh0 = rangeCntNpsh(12) / rangeCntNpsh(11);
        DevNpsh1 = rangeCntNpsh(1) / rangeCntNpsh(11);
        DevNpsh2 = rangeCntNpsh(2) / rangeCntNpsh(11);
        DevNpsh3 = rangeCntNpsh(3) / rangeCntNpsh(11);
        DevNpsh4 = rangeCntNpsh(4) / rangeCntNpsh(11);
        DevNpsh5 = rangeCntNpsh(5) / rangeCntNpsh(11);
        DevNpsh6 = rangeCntNpsh(6) / rangeCntNpsh(11);
        DevNpsh7 = rangeCntNpsh(7) / rangeCntNpsh(11);
        DevNpsh8 = rangeCntNpsh(8) / rangeCntNpsh(11);
        DevNpsh9 = rangeCntNpsh(9) / rangeCntNpsh(11);
        DevNpsh10 = rangeCntNpsh(10) / rangeCntNpsh(11);
end