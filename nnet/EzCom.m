function net=EzCom(p,n)
    % Author:         Anemone
    % Filename:       EzCom.m
    % Last modified:  2015-08-29 22:13
    % E-mail:         x565178035@126.com
    % ��ȡ���:
    % t_sim_compet_1 = sim(net,P_train);
    % T_sim_compet_1 = vec2ind(t_sim_compet_1);
    p=p';
    P_train = mapminmax(p);
    % ѵ��������35������

    %% ���������紴����ѵ�����������
    %
    % ��������
    net = newc(minmax(P_train),4,0.01,0.01);
    % ����ѵ������
    %
    if nargin<2
        net.trainParam.epochs = 500;
    end
    % ѵ������
    net = train(net,P_train);
end

