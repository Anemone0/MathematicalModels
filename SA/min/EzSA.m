function res=EzSA(X,ObjFun,ArriseNew)
    [ra,co]=size(X);
    RES=[ObjFun(X)];  %ÿ�ε�����Ľ�� 
    temperature=100*co;      %��ʼ�¶�
    iter=5e2;               %�ڲ����ؿ���ѭ����������

    h=waitbar(0,'SAing....');
    while temperature>1e-2    %ֹͣ�����¶�
        
        for i=1:iter     %��ε����Ŷ���һ�����ؿ��巽�����¶Ƚ���֮ǰ���ʵ��
            len1=ObjFun(X);         %����ԭ·���ܾ���
            tmpX=ArriseNew(X);      %��������Ŷ�
            len2=ObjFun(tmpX);     %������·���ܾ���
            
            delta_e=len2-len1;  %���Ͼ���Ĳ�ֵ���൱������
            if delta_e<0        %��·�ߺ��ھ�·�ߣ�����·�ߴ����·��
                X=tmpX;
            else                        %�¶�Խ�ͣ�Խ��̫���ܽ����½⣻���Ͼ����ֵԽ��Խ��̫���ܽ����½�
                if exp(-delta_e/temperature)>rand() %�Ը���ѡ���Ƿ�����½� p=exp(-��E/T)
                    X=tmpX;      %���ܵõ��ϲ�Ľ�
                end
            end        
        end
        RES=[RES ObjFun(X)];
        temperature=temperature*0.99;   %�¶Ȳ����½�
        waitbar((100*co-temperature)^4/(100*co)^4,h,sprintf('Now Temperature:%.2f',temperature));
    end  
    close(h)
    plot(RES);
    res={X,RES(end)};
end
