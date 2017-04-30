function disp = Disparity(Lc, Rc)
    [number, ax] = size(Lc);
    %level 1:
%     disp = zeros(number);
%     for i = 1:number
%         disp(i) =  sqrt((Lc(i,1)-Rc(i,1))^2+(Lc(i,2)-Rc(i,2))^2);
%     end
    %level 2: Assume the two center in two view have the same v value
    disp = zeros(number - 1, 1);
    for i = 1:number-1
        Lu = Lc(i,1);
        Lv = Lc(i,2);
        %fix right camera
        RuNew = Rc(i,1)+(Rc(i+1,1)-Rc(i,1))/(Rc(i+1,2)-Rc(i,2))*(Lv-Rc(i,2));
        disp(i) = RuNew - Lu;
    end
end