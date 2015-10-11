function R=FuzzyMatrix(datin)
    % Author:         Anemone
    % Filename:       FuzzyMatrix.m
    % Last modified:  2015-09-04 17:15
    % E-mail:         x565178035@126.com
    R=example(datin);
end



function R = coesim1(datin,m)
% ����������ϵ�����㹫ʽ1����������
% R = coesim1(datin��C)
% m �ǳ˻������ֵ��һ��������ȡ������������datin
error(nargchk(2,2, nargin))

[N M] = size(datin);
R=zeros(N,N);
for i = 1:N
   for j = 1:N
       for k=1:M
           R(i,j) = R(i,j) + (datin(i,k)*datin(j,k))/m;
      end
   end
   R(i,i)=1;
end
end
%==========================================================================

function R = coesim2(datin)
% ����������ϵ�����㹫ʽ2�����н�����
% R = coesim2(datin)
error(nargchk(1,1, nargin))

[N M] = size(datin);
R=zeros(N,N);
t=zeros(1,3);
for i = 1:N
   for j = 1:N
       for k=1:M
           t(1)=t(1)+datin(i,k)*datin(j,k);
           t(2)=t(2)+datin(i,k)^2;
           t(3)=t(3)+datin(j,k)^2;
       end
       R(i,j) = abs(t(1))/sqrt(t(2)*t(3));
       t=zeros(1,3);
   end
end
end
%==========================================================================
function R = coesim3(datin)
% ����������ϵ�����㹫ʽ3�������ϵ��
% R = coesim3(datin)
error(nargchk(1,1, nargin))

[N M] = size(datin);
R=zeros(N,N);
datinmean = mean(datin');
t=zeros(1,3);
for i = 1:N
   for j = 1:N
       for k=1:M
           t(1)=t(1)+abs((datin(i,k)-datinmean(i))*(datin(j,k)-datinmean(j)));
           t(2)=t(2)+(datin(i,k)-datinmean(i))^2;
           t(3)=t(3)+(datin(j,k)-datinmean(j))^2;
       end
       R(i,j) = t(1)/sqrt(t(2)*t(3));
       t=zeros(1,3);
   end
end
end

%==========================================================================
function R = coesim5(datin)
% ����������ϵ�����㹫ʽ5�����ǲ�����
% R = coesim5(datin)
error(nargchk(1,1, nargin))

[N M] = size(datin);
R=zeros(N,N);
datinmean = mean(datin');
t=zeros(1,2);
for i = 1:N
   for j = 1:N
       Ti = zeros(1,M);
       Tj = zeros(1,M);
       Ti=datin(i,:) - datinmean(i)';
       Tj=datin(j,:) - datinmean(j)';
       t(1)=length(find(Ti.*Tj>0));
       t(2)=length(find(Ti.*Tj<0));
       R(i,j)=abs(t(1)-t(2))/(t(1)+t(2));
   end
end
end

%==========================================================================
function R = coesim6(datin)
% ����������ϵ�����㹫ʽ6���������С��
% R = coesim6(datin)
error(nargchk(1,1, nargin))

[N M] = size(datin);
R=zeros(N,N);
for i = 1:N
   for j = 1:N
       R(i,j)=sum(min(datin(i,:),datin(j,:))')/...
           sum(max(datin(i,:),datin(j,:))');
   end
end
end

%==========================================================================
function R = coesim7(datin)
% ����������ϵ�����㹫ʽ7��������ƽ����С��
% R = coesim7(datin)
error(nargchk(1,1, nargin))

[N M] = size(datin);
R=zeros(N,N);
for i = 1:N
   for j = 1:N
       R(i,j)=sum(min(datin(i,:),datin(j,:))')/...
               (sum(sum([datin(i,:);datin(j,:)]))/2);
   end
end
end

%==========================================================================
function R = coesim9(datin)
% ����������ϵ�����㹫ʽ9��������ֵָ����
% R = coesim9(datin)
error(nargchk(1,1, nargin))

[N M] = size(datin);
R=zeros(N,N);
for i = 1:N
   for j = 1:N
       R(i,j)=exp(-sum(abs(datin(i,:)-datin(j,:))));
   end
end
end

%==========================================================================
function R = coesim11(datin,C)
% ����������ϵ�����㹫ʽ11��������ֵ������
% R = coesim11(datin)
% r(i,j) = 1 , when i=j;
%        = 1-C*(M/k=1)|Xik - Xjk| , when j != i;
error(nargchk(2,2, nargin))

if(C<=0 | C>1),error('C must between 0 and 1');end
[N M] = size(datin);
R=ones(N,N);
for i = 1:N
   for j = 1:N
       for k=1:M
           R(i,j) = R(i,j) - C*abs(datin(i,k)-datin(j,k));
      end
   end
end
end

%==========================================================================
function R = coesimhm(datin)
% ����������ϵ�����㹫ʽ����Hamming���뷨
% R = coesimhm(datin)
error(nargchk(1,1, nargin))

[N M] = size(datin);
R=zeros(N,N);
max=0;
for i = 1:N
   for j = 1:N
       R(i,j)=sum(abs(datin(i,:)-datin(j,:)));
       if max<R(i,j)
           max=R(i,j);
       end
   end
end
for i = 1:N
   for j = 1:N
       R(i,j)=1-R(i,j)/max;
   end
end
end
%=========================================================================
function R = coesimeu(datin)
% ����������ϵ�����㹫ʽ����Euclidŷ�Ͼ��뷨
% R = coesimeu(datin)
error(nargchk(1,1, nargin))

[N M] = size(datin);
R=zeros(N,N);
max=0;
for i = 1:N
   for j = 1:N
       R(i,j)=sqrt(sum((datin(i,:)-datin(j,:)).^2));
       if max<R(i,j)
           max=R(i,j);
       end
   end
end
for i = 1:N
   for j = 1:N
       R(i,j)=1-R(i,j)/max;
   end
end
end

%==========================================================================
function R = coesimntv(datin)
% ����������ϵ�����㹫ʽ����NTV��
% R = coesimntv(datin)
error(nargchk(1,1, nargin))

[N M] = size(datin);
R=zeros(N,N);
for i = 1:N
   for j = 1:N
       R(i,j)=1-sum(abs(datin(i,:)-datin(j,:)))/sum(max([datin(i,:);datin(j,:)]));
   end
end
end
%==========================================================================
function RP = rpower(datin,P)
% ģ����ϵ�˷�
% RP = rpower(R,P)
% R Ϊģ����ϵ��P ΪR�Գ˵Ĵ���
    error(nargchk(2,2, nargin))

    if(P~=floor(P)),error('P must be an integer.');end
    [N M] = size(datin);
    if(N ~= M),error('Matrix length of each demension must agree.');end
    RP = datin;
    while P>1
        for i = 1:N
             for j = 1:N
                 RP(i,j) = max(min([RP(i,:);datin(:,j)']));
             end
        end
        P=P-1;
    end
end
%==========================================================================
function [RK K] = fuzequmat(R)
% Fuzzy equivalent matrix ��ģ���ȼ۾���
% [RK K] = fuzequmat(R)
% RK����õĵȼ۾���KΪ�Գ˵Ĵ�����RΪ���ƾ���
error(nargchk(1,1, nargin));
K = 0;
RK = R;
while ~all(all(RK == rpower(RK,2)))
    RK = rpower(RK,2);
    K = K + 1;
end
K = 2*K;
end
%==========================================================================
function R=example(datin)
    mu=mean(datin);sigma=std(datin);
    dataL=length(datin);
    for i=1:dataL
        for j=1:dataL
            R(i,j)=exp(-(mu(j)-mu(i))^2/(sigma(i)+sigma(j))^2);
        end
    end
end
