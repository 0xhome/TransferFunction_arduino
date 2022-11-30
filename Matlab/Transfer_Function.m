
% s=tf('s');
% k = 1;
% w = 4;
% H = tf([k 0 0],[1 0 -w^2]);
% Hz = c2d(H,0.01,'tustin');
% Hz.variable = 'z^-1'


%Build time vector
dt = 0.01;
t = 0:dt:5;

%Build step input
u = ones(size(t));
u(1) = 0;

%Initialize variables
yk_1 = 0; %Output 1 time step in the past
yk_2 = 0; %Output 2 time step in the past
uk_1 = 0; %Input 1 time step in the past
uk_2 = 0; %Input 2 time step in the past

%Step through time and solve the difference equation

for i = 1:length(t)
    if i == 1
        uterms = 1*u(i) - 2.001*uk_1 + 1*uk_2;
        yterms = 2.002*yk_1 - 1*yk_2;
        y(i) = uterms + yterms;
    elseif i == 2
        uterms = 1*u(i) - 2.001*u(i-1) + 1*uk_1;
        yterms = 2.002*y(i-1) - 1*yk_1;
        y(i) = uterms + yterms;
    else
        uterms = 1*u(i) - 2.001*u(i-1) + 1*u(i-2);
        yterms = 2.002*y(i-1) - 1*y(i-2);
        y(i) = uterms + yterms;
    end
end

scatter(t,y,3);