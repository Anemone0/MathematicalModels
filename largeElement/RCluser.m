function z=RCluser(gj)
    [r c]=size(gj);
    r=corrcoef(gj); %�������ϵ������
    d=tril(r); %ȡ�����ϵ�������������Ԫ��
    for i=1:c %�Խ���Ԫ�ػ�����
        d(i,i)=0;
    end
    d=d(:);
    d=nonzeros(d); %ȡ������Ԫ��
    d=d';d=1-d;
    z=linkage(d)
    dendrogram(z)
end
