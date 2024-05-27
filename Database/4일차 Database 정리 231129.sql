SELECT A.����ID, A.�μ�ID, A.�̸�, B.�μ���
FROM ���� A, �μ� B ;

SELECT ����.����ID, ����.�μ�ID, ����.�̸�, �μ�.�μ���
FROM ���� , �μ� ; -- �����ϰ� �򰥸���. ��Ī ���.
-- �� ���� īƼ���������� ���´�

SELECT A.����ID, A.�μ�ID, A.�̸�, B.�μ���
FROM ���� A, �μ� B
WHERE A.�μ�ID = B.�μ�ID;

--�ǽ����� 1
SELECT *
FROM ���� A, �μ� B
WHERE A.�μ�ID = B.�μ�ID;

--�ǽ����� 2
SELECT *
FROM ���� A, ��������ó B
WHERE A.����ID = B.����ID
AND B.����ó IS NOT NULL
;
--�ǽ����� 3
SELECT A.����ID, A.�̸�, B.�ּ�
FROM ���� A, �����ּ� B
WHERE A.����ID = B.����ID
;
-- 1. �������� �� NULL ������ ���°�? : INNER JOIN�̶� NULL�� ���ʿ� �������� ����. OUTER JOIN ���� ����
-- 2. �� ������ 5��ۿ� ���°�? : �����ּ� ���̺� 5��ۿ� ��ϵ��� ����. INNER JOIN�̹Ƿ� �ٸ� 5���� NULL�� �������� ����.

--OUTER JOIN
SELECT A.����ID, A.�μ�ID, B.�μ���
FROM ���� A, �μ� B
WHERE A.�μ�ID = B.�μ�ID(+); -- �̳����� ���� �ڿ� (+) ��ȣ�� ���̸� ����ö�� ����

SELECT A.����ID, A.�μ�ID, B.�μ���
FROM ���� A, �μ� B
WHERE A.�μ�ID(+) = B.�μ�ID; --�ٸ� �� ���� �ڿ� ��ȣ ���̸� �����󼭺񽺺� ����
-- ���� ��ο� (+)�� ���̸� ����.

--�ǽ����� 4

SELECT  A.����ID AS ����_����ID, A.����, A.����, A.����ID AS �ּ�_����ID, B.�����ڵ�, B.�ּ�
-- �ʹ� ��� �����ص� ��������� ��ǥ �� �ʿ��� ��ȣ�� ���߸��� �ʵ��� ����! 
FROM ���� A, �����ּ� B
WHERE A.����ID = B.����ID
;

--�ǽ����� 5

SELECT  A.����ID AS ����_����ID, A.����, A.����, A.����ID AS �ּ�_����ID, B.�����ڵ�, B.�ּ�
FROM ���� A, �����ּ� B
WHERE A.����ID = B.����ID
AND A.����ID = 'A0007';

--�ǽ����� 6

SELECT A.����ID AS ����_����ID, A. �̸�, A. ����, B.����ID AS �ּ�_����ID, B. �����ڵ�, B. �ּ�
FROM ���� A, �����ּ� B
WHERE A.����ID = B.����ID(+)
;

--�ǽ����� 7

SELECT A.����ID AS ����_����ID, A. �̸�, A. ����, B.����ID AS �ּ�_����ID, B. �����ڵ�, B. �ּ�
FROM ���� A, �����ּ� B
WHERE A.����ID = B.����ID(+)
AND B.����ID IS NULL
;

--�ǽ����� 8

SELECT A.����ID, A.�̸�, A.����, C.����ó, B.�ּ�
FROM ���� A, �����ּ� B, ��������ó C
WHERE A.����ID = B.����ID -- A=B=C �� ���� �����ϸ� 3�׿����ε� �����ͺ��̽��� ����X.
AND B.����ID = C.����ID  -- �׷��� A=B AND B=C�� ���·�
;

--�ǽ����� 9

SELECT A.����ID, A.�̸�, A.�Ի��Ͻ�, B.����ó
FROM  ���� A, ��������ó B
WHERE A.����ID = B.����ID
AND A.����ID IN('A0001', 'A0002', 'A0003')
--Ȥ�� �� �࿡�� BETWEEN 'A0001' AND 'A0003'�� �ᵵ �ȴ�.
AND B.�����ڵ� = '�޴���'
;

--�ǽ����� 10

SELECT A.����ID, A.�̸�, A.�μ�ID, B.�μ���
FROM ���� A, �μ� B
WHERE A.�μ�ID = B.�μ�ID(+)
;

--����Ŭ���� ANSI���� ��ȯ

--�̳������� ���

SELECT A.����ID, A.�̸�, B.�ּ�
FROM ���� A, �����ּ� B
WHERE A. ����ID = B.����ID
;

-- ��

SELECT A.����ID, A.�̸�, B.�ּ�
FROM ���� A INNER JOIN �����ּ� B
ON (A. ����ID = B.����ID)
;

-- ��ȯ�� ����� �ʴ�. 

-- �ƿ��� ������ ���

SELECT A.����ID, A.�̸�, B.�ּ�
FROM ���� A, �����ּ� B
WHERE A.����ID = B.����ID(+);

-- ��

SELECT A.����ID, A.�̸�, B.�ּ�
FROM ���� A LEFT OUTER JOIN �����ּ� B --���� ���̺��� �����̹Ƿ� LEFT OUTER JOIN
ON (A.����ID = B.����ID)
;

--���� ���̺��� ��� OUTER JOIN�� �ϰ� �ʹٸ� FULL OUTER JOIN �̿�(����Ŭ �������� ����X)

SELECT A.����ID, A.�μ�ID, B.�μ���
FROM ���� A FULL OUTER JOIN �μ� B
ON (A.�μ�ID=B.�μ�ID);

--���� 1

SELECT A.����ID, A.�̸�, B.�ּ�
FROM ���� A, �����ּ� B
WHERE A.����ID = B.����ID(+)
AND A.����ID IN ('A0005', 'A0008');

SELECT A.����ID, A.�̸�, B.�ּ�
FROM ���� A LEFT OUTER JOIN �����ּ� B
ON (A.����ID = B.����ID)
WHERE A.����ID IN ('A0005', 'A0008')
;

--���� 2

SELECT B.����ID, B.�̸�, A.�ּ�
FROM �����ּ� A, ���� B
WHERE A.����ID(+) = B.����ID;


SELECT B.����ID, B.�̸�, A.�ּ�
FROM �����ּ� A RIGHT OUTER JOIN ���� B
ON (A.����ID = B.����ID)
;
-- SELECT ������ ���� �ݴ�� �� ���� : ���̺��� ������� ���� � JOIN���� �������� ����� �ǹ�

-- ���� 3

SELECT A.����ID, A.�̸�, A.����, B.����ó
FROM ���� A, ��������ó B
WHERE A.����ID = B.����ID
;

SELECT A.����ID, A.�̸�, A.����, B.����ó
FROM ���� A INNER JOIN ��������ó B
ON (A.����ID = B.����ID)
;

-- TIP���� TIP 3�׿����� �����ͺ��̽����� �������� ����

SELECT A.����ID, A.�̸�, A.����, C.����ó, B.�ּ� 
FROM ���� A INNER JOIN �����ּ� B
ON (A.����ID = B.����ID)
INNER JOIN ��������ó C
ON (B.����ID = C.����ID);

--�� ��° INNER JOIN ���� �� �ٽ� �ٸ� ���̺��� ������ �� INNER JOIN�ؾ� �ϴ� �� �˰� ����������. 
--�� ����� ����.
