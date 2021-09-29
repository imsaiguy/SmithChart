%draw smith chart 
%modified by IMSAI Guy 2021
%GNU Octave m file

    Z0=50;
    bluecolor=[0.6 .6 1];
    redcolor=[1 0.6 0.6];
    fsize=20;
%resistance coarse
    for k=[1e-9  0.2 0.5 1 2 5 1e9]
        z=Z0*k + [ -10.^(-4:0.01:4) 10.^(-4:0.01:4) ]*Z0*1i;
        gamma_ZL=(Z0-z)./(Z0+z);
        plot(-real(gamma_ZL),imag(gamma_ZL),'LineWidth',1,'Color',redcolor);
        if k<100
            text(min(-real(gamma_ZL)),0,sprintf('%.0f',Z0*k),'FontSize',fsize);
        else
            text(min(-real(gamma_ZL)),0,sprintf('Inf'),'FontSize',fsize);
        end
        hold on;
    end
%resistance fine 
    for k=[0.1 0.3 0.4 0.6 0.7 0.8 0.9 3 4 6 7 8 9]
        z=Z0*k + [-10.^(-4:0.01:4) 10.^(-4:0.01:4) ]*Z0*1i;
        gamma_ZL=(Z0-z)./(Z0+z);
        plot(-real(gamma_ZL),imag(gamma_ZL),'Color',redcolor,'LineWidth',0.5);
    end
%conductance coarse
    for k=[1e-9 0.2 0.5 1 2 5 1e9]
        z=Z0*k + [-10.^(-4:0.01:4) 10.^(-4:0.01:4) ]*Z0*1i;
        gamma_ZL=(Z0-z)./(Z0+z);
        plot(real(gamma_ZL),imag(gamma_ZL),'LineWidth',1,'Color',bluecolor);
        hold on;
    end
%conductance fine
    for k=[0.1 0.3 0.4 0.6 0.7 0.8 0.9 3 4 6 7 8 9]
        z=Z0*k + [-10.^(-4:0.01:4) 10.^(-4:0.01:4) ]*Z0*1i;
        gamma_ZL=(Z0-z)./(Z0+z);
        plot(real(gamma_ZL),imag(gamma_ZL),'Color',bluecolor,'LineWidth',0.1);
    end
%reactance coarse
    for k=[1e-30  0.2 0.5  1 2  5  1e3]
        z=10.^(-4:0.01:4)*Z0 + Z0*1i*k;
        gamma_ZL=(Z0-z)./(Z0+z);
        r=abs(-gamma_ZL);
        plot(-real(gamma_ZL), imag(gamma_ZL),'Color',redcolor,'LineWidth',1);
        plot(-real(gamma_ZL),-imag(gamma_ZL),'Color',redcolor,'LineWidth',1);
        hold on;
        if k<100 && k>0.01
            text(min(-real(gamma_ZL))*1.15,min( imag(gamma_ZL))*1.05,sprintf('%.0fj',-k*Z0),'FontSize',fsize);
            text(min(-real(gamma_ZL))*1.15,max(-imag(gamma_ZL))*1.05,sprintf('%.0fj',k*Z0),'FontSize',fsize);
        end
     end
%reactance fine
    for k=[.1  0.3 0.4 0.6 0.7  0.8 0.9  3 4  6 7 8 9]
        z=10.^(-4:0.01:4)*Z0 + Z0*1i*k;
        gamma_ZL=(Z0-z)./(Z0+z);
        r=abs(-gamma_ZL);
        plot(-real(gamma_ZL), imag(gamma_ZL),'Color',redcolor,'LineWidth',0.5);
        plot(-real(gamma_ZL),-imag(gamma_ZL),'Color',redcolor,'LineWidth',0.5);
        hold on;
    end
%susceptance coarse
    for k=[1e-30  0.2 0.5  1 2  5  1e3]
        z=10.^(-4:0.01:4)*Z0 + Z0*1i*k;
        gamma_ZL=(Z0-z)./(Z0+z);
        r=abs(-gamma_ZL);
        plot(real(gamma_ZL), imag(gamma_ZL),'Color',bluecolor,'LineWidth',1);
        plot(real(gamma_ZL),-imag(gamma_ZL),'Color',bluecolor,'LineWidth',1);
        hold on;
        
     end
%susceptance fine
    for k=[.1  0.3 0.4 0.6 0.7  0.8 0.9  3 4  6 7 8 9]
        z=10.^(-4:0.01:4) *Z0 + Z0*1i*k;
        gamma_ZL=(Z0-z)./(Z0+z);
        r=abs(-gamma_ZL);
        plot(real(gamma_ZL), imag(gamma_ZL),'Color',bluecolor,'LineWidth',0.5);
        plot(real(gamma_ZL),-imag(gamma_ZL),'Color',bluecolor,'LineWidth',0.5);
        hold on;
    end
      
    xlim([-1 1])
    ylim([-1 1])
    hold off
    axis square
    set(gca,'Visible','off')
    shg
    