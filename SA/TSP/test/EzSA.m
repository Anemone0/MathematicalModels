function res=EzSA(X,ObjFun,ArriseNew)
    [ra,co]=size(X);
    RES=[ObjFun(X)];  %ÿ�ε�����Ľ�� 
    temperature=100;      %��ʼ�¶�
    iter=70;               %�ڲ����ؿ���ѭ���������� 
    while temperature>0.1    %ֹͣ�����¶�
        disp(temperature) 
        for i=1:iter     %��ε����Ŷ���һ�����ؿ��巽�����¶Ƚ���֮ǰ���ʵ��
            len1=ObjFun(X);         %����ԭ·���ܾ���
            tmpX=ArriseNew(X);      %��������Ŷ�
            len2=ObjFun(tmpX);     %������·���ܾ���
            
            delta_e=len2-len1;  %���Ͼ���Ĳ�ֵ���൱������
            if delta_e<0        %��·�ߺ��ھ�·�ߣ�����·�ߴ����·��
                X=tmpX;
                RES=[RES len2];
            else                        %�¶�Խ�ͣ�Խ��̫���ܽ����½⣻���Ͼ����ֵԽ��Խ��̫���ܽ����½�
                if exp(-delta_e/temperature)>rand() %�Ը���ѡ���Ƿ�����½� p=exp(-��E/T)
                    X=tmpX;      %���ܵõ��ϲ�Ľ�
                    RES=[RES len2];
                end
            end        
        end
        temperature=temperature*0.99;   %�¶Ȳ����½�
    end  
    plot(RES);
    res={X,RES(end)};
end
