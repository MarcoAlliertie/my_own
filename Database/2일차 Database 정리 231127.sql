SELECT ����ID, �н�����, �̸�, ����,����
FROM ����
WHERE ���� = '��'
;

SELECT *
FROM ����;

SELECT ����ID, �Ի��Ͻ�,�ֹε�Ϲ�ȣ, ����, �μ�ID
FROM ����;

SELECT �μ�ID, �μ���, �ٹ���
FROM �μ�;

SELECT ����ID, �����ڵ�, ����ó
FROM ��������ó;

SELECT *
FROM ����;

SELECT *
FROM �����ּ�;

SELECT *
FROM ��������ó;

SELECT DISTINCT ����ID
FROM ��������ó;

SELECT ����ID AS EMP_ID
FROM ����;

SELECT ����ID EMP_ID
FROM ����;

SELECT * FROM ���� WHERE ���� IS NULL;

SELECT ����ID, ����, NVL(����, 7) FROM ����;

SELECT ����ID, ����, DECODE(����,NULL,0,����) FROM ����;

SELECT * FROM ���� WHERE ���� IS NOT NULL;  

SELECT * FROM ���� WHERE �Ի��Ͻ� IS NULL;

SELECT  ����ID, �н�����, NVL(����, 20)AS ���� FROM ����; 

SELECT ����ID, ����, ����, DECODE(����, '��', '�����Դϴ�', '�����Դϴ�')AS ����Ȯ�� FROM ����;
