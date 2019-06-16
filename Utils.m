classdef Utils
    methods (Static)
        function out = SelST16(InST, Num, SelPrio)
            if Num < 1 || Num > 16
                out = int16(QCcodes.Bad);
                return;
            end
            
            switch SelPrio
                case 0
                    if ismember(QCcodes.Simulation, InST(1:Num))
                        out = int16(QCcodes.Simulation);
                        return;
                    elseif ismember(QCcodes.Bad, InST(1:Num))
                        out = int16(QCcodes.Bad);
                        return;
                    elseif ismember(QCcodes.BadProcess, InST(1:Num))
                        out = int16(QCcodes.BadProcess);
                        return;
                    elseif ismember(QCcodes.Uncertain, InST(1:Num))
                        out = int16(QCcodes.Uncertain);
                        return;
                    elseif ismember(QCcodes.UncertainProcess, InST(1:Num))
                        out = int16(QCcodes.UncertainProcess);
                        return;
                    elseif ismember(QCcodes.Maintenance, InST(1:Num))
                        out = int16(QCcodes.Maintenance);
                        return;
                    elseif ismember(QCcodes.Good, InST(1:Num))
                        out = int16(QCcodes.Good);
                        return;
                    end
                    
                case 1
                    if ismember(QCcodes.Good, InST(1:Num))
                        out = int16(QCcodes.Good);
                        return;
                    elseif ismember(QCcodes.Bad, InST(1:Num))
                        out = int16(QCcodes.Bad);
                        return;
                    elseif ismember(QCcodes.BadProcess, InST(1:Num))
                        out = int16(QCcodes.BadProcess);
                        return;
                    elseif ismember(QCcodes.Uncertain, InST(1:Num))
                        out = int16(QCcodes.Uncertain);
                        return;
                    elseif ismember(QCcodes.UncertainProcess, InST(1:Num))
                        out = int16(QCcodes.UncertainProcess);
                        return;
                    elseif ismember(QCcodes.Simulation, InST(1:Num))
                        out = int16(QCcodes.Simulation);
                        return;
                    elseif ismember(QCcodes.Maintenance, InST(1:Num))
                        out = int16(QCcodes.Maintenance);
                        return;
                    end
                    
                case 2
                    if ismember(QCcodes.Maintenance, InST(1:Num))
                        out = int16(QCcodes.Maintenance);
                        return;
                    elseif ismember(QCcodes.Bad, InST(1:Num))
                        out = int16(QCcodes.Bad);
                        return;
                    elseif ismember(QCcodes.BadProcess, InST(1:Num))
                        out = int16(QCcodes.BadProcess);
                        return;
                    elseif ismember(QCcodes.Uncertain, InST(1:Num))
                        out = int16(QCcodes.Uncertain);
                        return;
                    elseif ismember(QCcodes.UncertainProcess, InST(1:Num))
                        out = int16(QCcodes.UncertainProcess);
                        return;
                    elseif ismember(QCcodes.Simulation, InST(1:Num))
                        out = int16(QCcodes.Simulation);
                        return;
                    elseif ismember(QCcodes.Good, InST(1:Num))
                        out = int16(QCcodes.Good);
                        return;
                    end
                    
                case 3
                    if ismember(QCcodes.Good, InST(1:Num))
                        out = int16(QCcodes.Good);
                        return;
                    elseif ismember(QCcodes.Maintenance, InST(1:Num))
                        out = int16(QCcodes.Maintenance);
                        return;
                    elseif ismember(QCcodes.Simulation, InST(1:Num))
                        out = int16(QCcodes.Simulation);
                        return;
                    elseif ismember(QCcodes.Bad, InST(1:Num))
                        out = int16(QCcodes.Bad);
                        return;
                    elseif ismember(QCcodes.BadProcess, InST(1:Num))
                        out = int16(QCcodes.BadProcess);
                        return;
                    elseif ismember(QCcodes.Uncertain, InST(1:Num))
                        out = int16(QCcodes.Uncertain);
                        return;
                    elseif ismember(QCcodes.UncertainProcess, InST(1:Num))
                        out = int16(QCcodes.UncertainProcess);
                        return;
                    end
                    
                case 4
                    if ismember(QCcodes.Maintenance, InST(1:Num))
                        out = int16(QCcodes.Maintenance);
                        return;
                    elseif ismember(QCcodes.Good, InST(1:Num))
                        out = int16(QCcodes.Good);
                        return;
                    elseif ismember(QCcodes.Simulation, InST(1:Num))
                        out = int16(QCcodes.Simulation);
                        return;
                    elseif ismember(QCcodes.Bad, InST(1:Num))
                        out = int16(QCcodes.Bad);
                        return;
                    elseif ismember(QCcodes.BadProcess, InST(1:Num))
                        out = int16(QCcodes.BadProcess);
                        return;
                    elseif ismember(QCcodes.Uncertain, InST(1:Num))
                        out = int16(QCcodes.Uncertain);
                        return;
                    elseif ismember(QCcodes.UncertainProcess, InST(1:Num))
                        out = int16(QCcodes.UncertainProcess);
                        return;
                    end
                    
                case 5
                    if ismember(QCcodes.Simulation, InST(1:Num))
                        out = int16(QCcodes.Simulation);
                        return;
                    elseif ismember(QCcodes.Good, InST(1:Num))
                        out = int16(QCcodes.Good);
                        return;
                    elseif ismember(QCcodes.Maintenance, InST(1:Num))
                        out = int16(QCcodes.Maintenance);
                        return;
                    elseif ismember(QCcodes.Bad, InST(1:Num))
                        out = int16(QCcodes.Bad);
                        return;
                    elseif ismember(QCcodes.BadProcess, InST(1:Num))
                        out = int16(QCcodes.BadProcess);
                        return;
                    elseif ismember(QCcodes.Uncertain, InST(1:Num))
                        out = int16(QCcodes.Uncertain);
                        return;
                    elseif ismember(QCcodes.UncertainProcess, InST(1:Num))
                        out = int16(QCcodes.UncertainProcess);
                        return;
                    end
                    
                case 6
                    if ismember(QCcodes.Good, InST(1:Num))
                        out = int16(QCcodes.Good);
                        return;
                    elseif ismember(QCcodes.Maintenance, InST(1:Num))
                        out = int16(QCcodes.Maintenance);
                        return;
                    elseif ismember(QCcodes.UncertainProcess, InST(1:Num))
                        out = int16(QCcodes.UncertainProcess);
                        return;
                    elseif ismember(QCcodes.Uncertain, InST(1:Num))
                        out = int16(QCcodes.Uncertain);
                        return;
                    elseif ismember(QCcodes.BadProcess, InST(1:Num))
                        out = int16(QCcodes.BadProcess);
                        return;
                    elseif ismember(QCcodes.Bad, InST(1:Num))
                        out = int16(QCcodes.Bad);
                        return;
                    elseif ismember(QCcodes.Simulation, InST(1:Num))
                        out = int16(QCcodes.Simulation);
                        return;
                    end
                    
                case 7
                    if ismember(QCcodes.Simulation, InST(1:Num))
                        out = int16(QCcodes.Simulation);
                        return;
                    elseif ismember(QCcodes.Good, InST(1:Num))
                        out = int16(QCcodes.Good);
                        return;
                    elseif ismember(QCcodes.Maintenance, InST(1:Num))
                        out = int16(QCcodes.Maintenance);
                        return;
                    elseif ismember(QCcodes.UncertainProcess, InST(1:Num))
                        out = int16(QCcodes.UncertainProcess);
                        return;
                    elseif ismember(QCcodes.Uncertain, InST(1:Num))
                        out = int16(QCcodes.Uncertain);
                        return;
                    elseif ismember(QCcodes.BadProcess, InST(1:Num))
                        out = int16(QCcodes.BadProcess);
                        return;
                    elseif ismember(QCcodes.Bad, InST(1:Num))
                        out = int16(QCcodes.Bad);
                        return;
                    end
            end
            
            out = int16(QCcodes.Bad);
        end
        
    end
end