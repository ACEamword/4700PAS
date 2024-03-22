Is = 0.01e-12;
Ib = 0.1e-12;
Vb = 1.3;
Gp= 0.1;

V = linspace(-1.95,0.7,200);

I = Is*(exp(1.2/0.025*V)-1) + Gp*V - Ib*(exp(-1.2/0.025*(V+Vb))-1);

Inoise = I+0.2*I.*randn(size(V));
% part 3
% poly_4th_I = polyfit(V,I,4);
% poly_4th_Inoise = polyfit(V,Inoise,4);
% 
% poly_8th_I = polyfit(V,I,8);
% poly_8th_Inoise = polyfit(V,Inoise,8);
% 
% I_4th_polyval = polyval(poly_4th_I,V);
% Inoise_4th_polyval = polyval(poly_4th_Inoise,V);
% 
% I_8th_polyval = polyval(poly_8th_I,V);
% Inoise_8th_polyval = polyval(poly_8th_Inoise,V);
% subplot(1,2,1);
% plot(V, I, 'b', V, Inoise, 'r.',V,I_4th_polyval,'g--',V,Inoise_4th_polyval,'c--',V,I_8th_polyval,'g:',V,Inoise_8th_polyval,'b:');
% title('I-V Characteristics');
% xlabel('Voltage (V)');
% ylabel('Current (A)');
% legend('Ideal', 'Noisy', '4th order current poly', '4th order current noise poly','8th order current poly', '8th order current noise poly');
% 
% subplot(1,2,2);
% semilogy(V, abs(I), 'b', V, abs(Inoise), 'r.',V,abs(I_4th_polyval),'g--',V,abs(Inoise_4th_polyval),'c--',V,abs(I_8th_polyval),'g:',V,abs(Inoise_8th_polyval),'b:');
% title('Logarithmic I-V Characteristics');
% xlabel('Voltage (V)');
% ylabel('Current (A)');
% legend('Ideal', 'Noisy', '4th order current poly', '4th order current noise poly','8th order current poly', '8th order current noise poly');
% end

% part 4
foa = fittype('Is*(exp(1.2/0.025*x)-1) + 0.1*x - Ib*(exp(-1.2/0.025*(x+1.3))-1)');

fob = fittype('Is*(exp(1.2/0.025*x)-1) + Gp*x - Ib*(exp(-1.2/0.025*(x+1.3))-1)');

foc = fittype('Is*(exp(1.2/0.025*x)-1) + Gp*x - Ib*(exp(-1.2/0.025*(x+Vb))-1)');


fitI_foa = fit(V', I', foa)
fitInoise_foa = fit(V', Inoise', foa);

fitI_fob = fit(V', I', fob);
fitInoise_fob = fit(V', Inoise', fob);

fitI_foc = fit(V', I', foc);
fitInoise_foc = fit(V', Inoise', foc);

subplot(1,2,1);
plot(fitI_foa,V,I,'g--');
title('I-V Characteristics');
xlabel('Voltage (V)');
ylabel('Current (A)');
legend('Ideal', 'Noisy', '4th order current poly', '4th order current noise poly','8th order current poly', '8th order current noise poly');

% subplot(1,2,2);
% semilogy(V, abs(I), 'b', V, abs(Inoise), 'r.',V,abs(I_4th_polyval),'g--',V,abs(Inoise_4th_polyval),'c--',V,abs(I_8th_polyval),'g:',V,abs(Inoise_8th_polyval),'b:');
% title('Logarithmic I-V Characteristics');
% xlabel('Voltage (V)');
% ylabel('Current (A)');
% legend('Ideal', 'Noisy', '4th order current poly', '4th order current noise poly','8th order current poly', '8th order current noise poly');

% % part5
% inputs = V.';
% targets = I.';
% hiddenLayerSize = 10;
% net = fitnet(hiddenLayerSize);
% net.divideParam.trainRatio = 70/100;
% net.divideParam.valRatio = 15/100;
% net.divideParam.testRatio = 15/100;
% [net,tr] = train(net,inputs,targets);
% outputs = net(inputs);
% errors = gsubtract(outputs,targets);
% performance = perform(net,targets,outputs)
% view(net)
% Inn = outputs