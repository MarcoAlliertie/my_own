SELECT �Ҽӹ�, COUNT(*)
FROM ����������
GROUP BY �Ҽӹ�;

SELECT * 
FROM ����ǥ;

SELECT �л�ID, COUNT(����)
FROM ����ǥ
GROUP BY �л�ID; --NULL���� 6�� �л��� 0���� �����

SELECT �л�ID, COUNT(*)
FROM ����ǥ
GROUP BY �л�ID; --NULL���� ������. *�� �÷� ���� ������ �ҹ��ϹǷ�. �� ���� ���迡 ���� ���´�!

--�������� 1

SELECT �л�ID, ROUND(AVG(����),1) AS ��ռ���
FROM ����ǥ
GROUP BY �л�ID ;

--�����Լ��� �Ϲ� �÷��� �Բ� ����� ���� ������ �׷�ȭ�� �� ���� �÷��� �����Լ��� �Բ� �� �� �ִ�.

--�������� 2

SELECT MAX(����) AS �ְ���, MIN(����)AS ��������
FROM ����;

--�������� 3

SELECT �Ҽӹ�, COUNT(�л�ID) AS �ݺ��ο���
FROM ����������
GROUP BY �Ҽӹ�;

--�������� 4

SELECT �л�ID, AVG(����) AS �������������
FROM ����ǥ
WHERE ���� IN ('����', '����') --������ ���� ���� WHERE �� -- IN ��� !=�������� �ᵵ �ȴ�. NOT IN ���е� ����
GROUP BY �л�ID
;

--�������� 5

SELECT A.�μ�ID, SUM(A.����) AS �μ��������հ�
FROM ���� A, �μ� B
WHERE A.�μ�ID = B.�μ�ID
GROUP BY A.�μ�ID
; 

--�������� 6

SELECT A.����ID, COUNT(B.����ó)AS ����ó����
FROM ���� A LEFT OUTER JOIN ��������ó B
ON (A.����ID = B.����ID)
GROUP BY A.����ID
;
---

SELECT �л�ID, ROUND(AVG(����),1) AS ��ռ���
FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) <= 75;

--HAVING ����

SELECT �Ҽӹ�, COUNT(�л�ID) AS �ο���
FROM ����������
GROUP BY �Ҽӹ�
HAVING COUNT(�л�ID)>2; --�� �� �ο����� 3�� �̻��̶�� ���� �� �� �ο������ �Ϳ� ������ �ִ� ���̹Ƿ� 
                        --WHERE���� �ƴ� HAVING ���� ���� ��� �Ѵ�
-- ���� 2

SELECT �μ�ID, MAX(����) 
FROM ����
GROUP BY �μ�ID
HAVING MAX(����)=7500; 

-- ���� 3

SELECT �л�ID, ROUND(AVG(����),1) AS ��ռ��� --����� �� : ����. �����Լ�(AVG)�� ��ǻ�Ͱ� ���� ���̶� �װ� �ν����� ���ϱ⿡ ��� �ִ� ��.
FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) IS NOT NULL
;
